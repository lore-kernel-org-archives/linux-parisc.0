Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from megatonmonkey.net (cr821974-a.lndn1.on.wave.home.com [24.112.53.173])
	by dsl2.external.hp.com (Postfix) with ESMTP id 68846482A
	for <parisc-linux@parisc-linux.org>; Thu, 18 Oct 2001 23:15:50 -0600 (MDT)
Date: Fri, 19 Oct 2001 01:17:19 -0400
From: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>
To: Randolph Chung <randolph@tausq.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [randolph@tausq.org: [parisc-linux] glibc update]
Message-ID: <20011019011719.C12905@megatonmonkey.net>
References: <20011017234038.C1060@megatonmonkey.net> <20011018150255.I4123@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <20011018150255.I4123@tausq.org>; from randolph@tausq.org on Thu, Oct 18, 2001 at 03:02:56PM -0700
List-ID: <linux-parisc.vger.kernel.org>

> 
> eh? that's the output report file :)
> 
> i get a floating point exception when running the corresponding
> executable.
> 
> 
> Program received signal SIGFPE, Arithmetic exception.
> 0x4011b328 in vfprintf () from /lib/libc.so.6
> (gdb) bt
> #0  0x4011b328 in vfprintf () from /lib/libc.so.6
> #1  0x40123490 in printf () from /lib/libc.so.6
> #2  0x00010f8c in feenv_mask_test (
>     flag_name=0x40210048 "@\036\177P@\036\177T@\036\177`@\036\177X@\036\177h@\036\177\220@\036\177Ð@\036\177Ô@\036\177Ø@\036\177à@\036\177è@\036\177ø@\036\177ð@\036\200", fe_exc=1) at test-fenv.c:332
> #3  0x0001160c in fe_single_test (flag_name=0x11f98 "FE_INEXACT", fe_exc=1)
>     at test-fenv.c:607
> #4  0x00011664 in feenv_tests () at test-fenv.c:625
> #5  0x000116e4 in main () at test-fenv.c:654
> 
>

When running these tests, it gets a little complex.
I'm pretty sure the test needs to be run against the
libc.so.6 that you are building, and not the one in /lib
on your system.

You could set the LD_LIBRARY_PATH to the location of the
objects you are building and then run it...

However, if you do that, then gdb might act strangely
with this newly built libc (since ld trying to load gdb
will use the libc in the library path).

How do you load gdb with one libc and debug a program
that uses another?

When I run the test-fenv, I get a whole list of output
criteria, but it finally exist with $?=132
I'm running with LD_LIBRARY_PATH set to the new libc,
glibc 2.2.4-2, built with newer binutils.

c.
