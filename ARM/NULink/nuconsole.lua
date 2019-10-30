-- Copyright (C) 2016 Nuvoton Technology Corp. All rights reserved.
-- Date: 18/06/07 0:00p

-- load module
local ext = require("ext")
local print = ext.redirect_print_wo_newline

-- global variable
_G["nuconsole_info_block_symbol"] = "NuConsole_InfoBlock"
_G["nuconsole_info_block_addr"] = 0x20000000

local _fifo = {buf_addr = 0,
			   size = 0,
			   head = 0,
			   tail = 0,
			   mode = 0}

function _fifo:new(object)
	object = object or {}
	setmetatable(object, self)
	self.__index = self
	return object
end

function _fifo:count()
	if self.head >= self.tail then
		return (self.head - self.tail) 
	else
		return (self.size - self.tail + self.head) 
	end
end

function _fifo:capacity()
	if self.size > 0 then
		return (self.size - 1)
	else
		return 0
	end
end

local _info_block = {magic_id = "",
					 tx_fifo = _fifo:new(),
					 rx_fifo = _fifo:new()}

function _info_block:new(object)
	object = object or {}
	setmetatable(object, self)
	self.__index = self
	return object
end

function _info_block:check_id()
	if self.magic_id == "NuConsole" then
		return true
	else
		return false
	end
end

-- convert functions
function _bytes_to_int(bytes, offset)
	local int = 0
	for index = 0, 3 do
		int = ext.bor(int, ext.lshift(bytes[offset + index + 1], index * 8))
	end
	return int
end

function _unserialize_to_fifo(bytes, offset)
	local fifo = _fifo:new()
	if (#bytes - offset) < 20 then
		return fifo, false
	else
		fifo.buf_addr = _bytes_to_int(bytes, offset)
		fifo.size = _bytes_to_int(bytes, offset + 4)
		fifo.head = _bytes_to_int(bytes, offset + 8)
		fifo.tail = _bytes_to_int(bytes, offset + 12)
		fifo.mode = _bytes_to_int(bytes, offset + 16)
		return fifo, true
	end
end

function _unserialize_to_info_block(bytes, offset)
	local info_block = _info_block:new()
	if (#bytes - offset) < 52 then
		return info_block, false
	else
		local magic_id = ""
		for index = 1, 12 do
			local ch = string.char(bytes[offset + index])
			if ch == '\0' then break end
			magic_id = magic_id..ch
		end
		info_block.magic_id = magic_id
		info_block.tx_fifo = _unserialize_to_fifo(bytes, offset + 12)
		info_block.rx_fifo = _unserialize_to_fifo(bytes, offset + 32)
		return info_block, true
	end
end

-- interface
function nuconsole_init(reset_after_connect)
	local status, result = pcall(function()
		local connected = true
		if _G["SCRIPT_APP_HOST"] == "NuConsole" then
			ice:OpenPort()
			connected = pcall(function()
				if reset_after_connect ~= 0 then
					ice:MCUConnect(ice.RESET_AUTO, ice.CONNECT_NORMAL)
				else
					ice:MCUConnect(ice.RESET_NONE, ice.CONNECT_NORMAL)
				end
				ice:MCUFreeRun()
			end) 
		end
		if connected then
			return ice:CheckLink()
		else
			return false
		end
	end)
	if not status then
		result:gsub("%w+[.]lua:%d+: (.*)$", print)
		print("\n")
	end
	return status and result or false
end

function nuconsole_uninit()
	local status, result = pcall(function()
		if _G["SCRIPT_APP_HOST"] == "NuConsole" then
			pcall(function()
				ice:MCUConnect(ice.RESET_NONE, ice.CONNECT_DISCONNECT)
			end)
			ice:ClosePort()
		end
	end)
	return status
end

function nuconsole_get_data()
	local status, result = pcall(function()
		local addr = _G["nuconsole_info_block_addr"]
		local bytes = ice:ReadMem(addr, 52)
		local info_block, result = _unserialize_to_info_block(bytes, 0)
		if result and info_block:check_id() then
			local fifo = info_block.tx_fifo
			if fifo:count() > 0 then
				local bytes = {}
				local num_bytes = 0
				if fifo.head > fifo.tail then
					num_bytes = fifo.head - fifo.tail
					bytes = ice:ReadMem(fifo.buf_addr + fifo.tail, num_bytes)
					fifo.tail = fifo.head
				else
					num_bytes = fifo.size - fifo.tail
					bytes = ice:ReadMem(fifo.buf_addr + fifo.tail, num_bytes)
					fifo.tail = 0
				end
				ice:WriteMem32(addr + 12 + 12, fifo.tail)
				local str = ""
				for index = 1, num_bytes do
					str = str..string.format("%c", bytes[index])
				end
				print(str)
			end
		end
		return true
	end)
	return status and result or false
end

function nuconsole_set_data(ch)
	local status, result = pcall(function()
		local addr = _G["nuconsole_info_block_addr"]
		local bytes = ice:ReadMem(addr, 52)
		local info_block, result = _unserialize_to_info_block(bytes, 0)
		if result and info_block:check_id() then
			local fifo = info_block.rx_fifo
			if (fifo:capacity() - fifo:count()) > 0 then
				ice:WriteMem(fifo.buf_addr + fifo.head, {string.byte(ch)})
				fifo.head = fifo.head + 1
				if fifo.head == fifo.size then
					fifo.head = 0
				end
				ice:WriteMem32(addr + 32 + 8, fifo.head)
				return true
			elseif fifo.mode == 1 then
				return true
			end
		end
		return false
	end)
	return status and result or false
end

