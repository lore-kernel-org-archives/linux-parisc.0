Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.lokmail.net (MAIL.LOKMAIL.NET [209.48.2.38])
	by dsl2.external.hp.com (Postfix) with ESMTP id 66FA0482C
	for <parisc-linux@lists.parisc-linux.org>; Mon,  8 Oct 2001 02:15:53 -0600 (MDT)
Received: from mail.lokmail.net (localhost [127.0.0.1])
	by mail.lokmail.net (8.9.3/8.9.3) with ESMTP id EAA24881
	for <parisc-linux@lists.parisc-linux.org>; Mon, 8 Oct 2001 04:15:34 -0400
Message-Id: <200110080815.EAA24881@mail.lokmail.net>
From: Jurij Smakov <jurij@lokmail.net>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] A todo entry 
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Date: Mon, 08 Oct 2001 04:15:34 -0400
Sender: jurij@mail.lokmail.net
List-ID: <linux-parisc.vger.kernel.org>

Hi!
 
> Someone was asking for a job to do.  Here's one.

It was probably me.

> In include/asm-parisc/uaccess.h, we have a couple of functions which
> look like this:
> 
> #define __get_user(x,ptr)                               \
> ({                                                      \
>         register long __gu_err __asm__ ("r8") = 0;      \
>         register long __gu_val __asm__ ("r9") = 0;      \
>                                                         \
>         if (segment_eq(get_fs(),KERNEL_DS)) {           \
>             switch (sizeof(*(ptr))) {                   \
>             case 1: __get_kernel_asm("ldb",ptr); break; \
>             case 2: __get_kernel_asm("ldh",ptr); break; \
>             case 4: __get_kernel_asm("ldw",ptr); break; \
>             case 8: __get_kernel_asm("ldd",ptr); break; \
>             default: BUG(); break;                      \
>             }                                           \
>         }                                               \
>         else {                                          \
>             switch (sizeof(*(ptr))) {                   \
>             case 1: __get_user_asm("ldb",ptr); break;   \
>             case 2: __get_user_asm("ldh",ptr); break;   \
>             case 4: __get_user_asm("ldw",ptr); break;   \
>             case 8: __get_user_asm("ldd",ptr); break;   \
>             default: BUG(); break;                      \
>             }                                           \
>         }                                               \
>                                                         \
>         (x) = (__typeof__(*(ptr))) __gu_val;            \
>         __gu_err;                                       \
> })
> 
> This is rather suboptimal.  The way it should be done is to always
> access userspace through %sr2 (currently listed as unused).  Set sr2
> to the same value as sr3 normally.  Set it to 0 when someone does a
> set_fs(KERNEL_DS), and to sr3 when USER_DS.  get_fs() should return the
> value of sr2.  None of these functions are called frequently, so there's
> no need to cache the values outside the space registers.

This is slightly over my head, but that is my understanding of what needs
to be done: instead of checking with segment_eq we need a routine,
which just reads from memory, using space from sr2. With proposed
modifications to get_fs, get_ds and set_fs it will automagically contain
a correct value (0 for kernel memory and same as sr3 for userspace).

Is it the correct interpretation? Is it still possible to do in view
of John's comment?

Best regards,

Jurij.
