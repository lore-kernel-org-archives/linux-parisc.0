Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4407C4843
	for <parisc-linux@lists.parisc-linux.org>; Sat,  6 Oct 2001 22:47:21 -0600 (MDT)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.4d3e3a24) with ESMTP id uhmzhaaa for parisc-linux@lists.parisc-linux.org; Sat, 6 Oct 2001 21:42:50 -0700
Date: Sat, 6 Oct 2001 21:47:06 -0700
From: Randolph Chung <randolph@tausq.org>
To: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Glibc 2.2.4-2 Woes...
Message-ID: <20011006214706.D3218@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20011006135558.B8206@megatonmonkey.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011006135558.B8206@megatonmonkey.net>
List-ID: <linux-parisc.vger.kernel.org>

> The assertion fails.
> The address in r21/r25 is 0x15b78, which is clearly not a valid
> address, and thus dl's printf barfs.

I got the new gcc to build (3.0.2 cvs 20010922) and tried glibc again... it dies
similarly while trying to run ld.so ...

Program received signal SIGSEGV, Segmentation fault.
_dl_debug_vdprintf (fd=0, tag_p=0, 
    fmt=0x17cdc <Address 0x17cdc out of bounds>, arg=0xbff005d8)
    at dl-misc.c:101
101       while (*fmt != '\0')
(gdb) bt
#0  _dl_debug_vdprintf (fd=0, tag_p=0, 
    fmt=0x17cdc <Address 0x17cdc out of bounds>, arg=0xbff005d8)
    at dl-misc.c:101
#1  0x4100eb68 in _dl_dprintf (fd=2, 
    fmt=0x17cdc <Address 0x17cdc out of bounds>) at dl-misc.c:279
#2  0x41012b6c in __assert_fail (
    assertion=0x15bac <Address 0x15bac out of bounds>, file=0x0, line=62, 
    function=0xbff005d8 "") at dl-minimal.c:190
#3  0x410031d4 in _dl_start (arg=0xbff00224) at rtld.c:62
#4  0x41002af8 in _dl_start_user () at rtld.c:143

I'll try to debug it some more tomorrow.

BenC (debian's glibc maintainer) also claims that the hppa patch in
glibc breaks linuxthreads (runtime) on other architectures. Does anyone 
know anything about this?

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
