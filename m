Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id CB2BA482A
	for <parisc-linux@parisc-linux.org>; Thu,  4 Oct 2001 23:38:43 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15pNgk-0005Fa-00
	for parisc-linux@parisc-linux.org; Fri, 05 Oct 2001 06:38:22 +0100
Date: Fri, 5 Oct 2001 06:38:22 +0100
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20011005063822.A19206@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] A todo entry
List-ID: <linux-parisc.vger.kernel.org>

Someone was asking for a job to do.  Here's one.

In include/asm-parisc/uaccess.h, we have a couple of functions which
look like this:

#define __get_user(x,ptr)                               \
({                                                      \
        register long __gu_err __asm__ ("r8") = 0;      \
        register long __gu_val __asm__ ("r9") = 0;      \
                                                        \
        if (segment_eq(get_fs(),KERNEL_DS)) {           \
            switch (sizeof(*(ptr))) {                   \
            case 1: __get_kernel_asm("ldb",ptr); break; \
            case 2: __get_kernel_asm("ldh",ptr); break; \
            case 4: __get_kernel_asm("ldw",ptr); break; \
            case 8: __get_kernel_asm("ldd",ptr); break; \
            default: BUG(); break;                      \
            }                                           \
        }                                               \
        else {                                          \
            switch (sizeof(*(ptr))) {                   \
            case 1: __get_user_asm("ldb",ptr); break;   \
            case 2: __get_user_asm("ldh",ptr); break;   \
            case 4: __get_user_asm("ldw",ptr); break;   \
            case 8: __get_user_asm("ldd",ptr); break;   \
            default: BUG(); break;                      \
            }                                           \
        }                                               \
                                                        \
        (x) = (__typeof__(*(ptr))) __gu_val;            \
        __gu_err;                                       \
})

This is rather suboptimal.  The way it should be done is to always
access userspace through %sr2 (currently listed as unused).  Set sr2
to the same value as sr3 normally.  Set it to 0 when someone does a
set_fs(KERNEL_DS), and to sr3 when USER_DS.  get_fs() should return the
value of sr2.  None of these functions are called frequently, so there's
no need to cache the values outside the space registers.

This probably isn't a big job, but there's probably some subtlety I've
overlooked.

-- 
Revolutions do not require corporate support.
