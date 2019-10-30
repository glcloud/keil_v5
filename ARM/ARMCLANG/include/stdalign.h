/*
 * stdalign.h: ISO/IEC 9899:2011 (C11), section 7.15
 * Copyright 2018 Arm Limited. All rights reserved.
 */

#ifndef __stdalign_h
#define __stdalign_h
#define __ARMCLIB_VERSION 6120001

#ifndef __cplusplus
#define alignas _Alignas
#define alignof _Alignof
#endif

#define __alignas_is_defined 1
#define __alignof_is_defined 1

#endif
