Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 627EA482A
	for <parisc-linux@parisc-linux.org>; Thu, 18 Oct 2001 16:03:10 -0600 (MDT)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id spaeiaaa for parisc-linux@parisc-linux.org; Thu, 18 Oct 2001 14:58:33 -0700
Date: Thu, 18 Oct 2001 15:02:56 -0700
From: Randolph Chung <randolph@tausq.org>
To: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>,
	parisc-linux@parisc-linux.org
Subject: Re: [randolph@tausq.org: [parisc-linux] glibc update]
Message-ID: <20011018150255.I4123@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20011017234038.C1060@megatonmonkey.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=unknown-8bit
In-Reply-To: <20011017234038.C1060@megatonmonkey.net>
List-ID: <linux-parisc.vger.kernel.org>

> >#3: http://people.debian.org/~tausq/glibc.build.log2
> >#2: http://people.debian.org/~tausq/glibc.build.log5
> 
> Have you tried running the tests by hand and seeing what the output is?
> What is the output of running:
> /home/randolph/gcc-3.0/glibc-2.2.4/hppa-linux/obj/math/test-fenv.out

eh? that's the output report file :)

i get a floating point exception when running the corresponding
executable.


Program received signal SIGFPE, Arithmetic exception.
0x4011b328 in vfprintf () from /lib/libc.so.6
(gdb) bt
#0  0x4011b328 in vfprintf () from /lib/libc.so.6
#1  0x40123490 in printf () from /lib/libc.so.6
#2  0x00010f8c in feenv_mask_test (
    flag_name=0x40210048 "@\036\177P@\036\177T@\036\177`@\036\177X@\036\177h@\036\177\220@\036\177Ð@\036\177Ô@\036\177Ø@\036\177à@\036\177è@\036\177ø@\036\177ð@\036\200", fe_exc=1) at test-fenv.c:332
#3  0x0001160c in fe_single_test (flag_name=0x11f98 "FE_INEXACT", fe_exc=1)
    at test-fenv.c:607
#4  0x00011664 in feenv_tests () at test-fenv.c:625
#5  0x000116e4 in main () at test-fenv.c:654


randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
