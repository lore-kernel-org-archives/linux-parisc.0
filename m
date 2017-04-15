From: Helge Deller <deller@gmx.de>
Subject: __get_user() for 64-bit value broken on 32-bit kernel
Date: Sat, 15 Apr 2017 23:14:56 +0200
Message-ID: <ecb724ca-037e-ad90-ed66-6e8d587445ec@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

We have a problem on the 32bit kernel with __get_user()
for a 64bit value.

In arch/parisc/include/asm/uaccess.h we have
#define __get_user(x, ptr)                               \
({                                                       \
        register long __gu_err __asm__ ("r8") = 0;       \
        register long __gu_val;                          \
                                                         \
        load_sr2();                                      \
        switch (sizeof(*(ptr))) {                        \
            case 1: __get_user_asm("ldb", ptr); break;   \
            case 2: __get_user_asm("ldh", ptr); break;   \
            case 4: __get_user_asm("ldw", ptr); break;   \
            case 8: LDD_USER(ptr);  break;               \
            default: BUILD_BUG(); break;                 \
        }                                                \
                                                         \
        (x) = (__force __typeof__(*(ptr))) __gu_val;     \
        __gu_err;                                        \
})

The problem is, that on a 32bit kernel __gu_val is a 32bit ("long") variable,
but LDD_USER(ptr) returns a 64bit entity.
And since __gu_val is 32bit only, afterwards the (x) = __gu_val will
return a 32bit-truncated value too.

I'm not sure how this can be fixed. My latest approaches always ended
with lots of compiler warnings.

A testcase for this is the test_user_copy.ko kernel module (source
in lib/test_user_copy.c).

Any ideas?

Helge
