Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id C63314A19
	for <parisc-linux@parisc-linux.org>; Sat, 10 Mar 2001 06:42:42 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id AAA25788;
	Sun, 11 Mar 2001 00:40:41 +1100
Date: Sun, 11 Mar 2001 00:40:41 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Matt Taggart <taggart@carmen.fc.hp.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] libpng test program causes page fault 
In-Reply-To: <20010308210436.4AEA537CB4@carmen.fc.hp.com>
Message-ID: <Pine.LNX.4.21.0103110024490.23407-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 8 Mar 2001, Matt Taggart wrote:

> I am still having the problem with the new fixed glibc and new compilers. The 
> page fault is different though,

I get:
Testing libpng version 1.0.8
   with zlib   version 1.1.3

 libpng version 1.0.8 - July 24, 2000
   Copyright (c) 1998-2000 Glenn Randers-Pehrson
   Copyright (c) 1996, 1997 Andreas Dilger
   Copyright (c) 1995, 1996 Guy Eric Schalnat, Group 42, Inc.
 library (10008): libpng version 1.0.8 - July 24, 2000 (header)
 pngtest (10008): libpng version 1.0.8 - July 24, 2000 (header)
 sizeof(png_struct)=808, sizeof(png_info)=288
Testing pngtest.png:
[snip]
libpng passes test

> IASQ: 00000616 00000616 IAOQ: 40057e93 40057e97
>  IIR: 48210228    ISR: 00000616  IOR: 401daa1c
> ORIG_R28: faf00001
> 
> The new pngtest is attached.

And the same with your binary (shared libs built from source locally)

ldd pngtest
        libpng.so.2 => /usr/lib/libpng.so.2 (0x40020000)
        libz.so.1 => /usr/lib/libz.so.1 (0x4004f000)
        libm.so.6 => /lib/libm.so.6 (0x4005f000)
        libc.so.6 => /lib/libc.so.6 (0x40091000)
        /lib/ld.so.1 => /lib/ld.so.1 (0x40000000)

Your IOAQ indicates the fault happened in libz.  48210228 occurs in my
libz in __do_global_ctors_aux, so it smells like your libz is bad,
ie. built with bad crt[in].o.

Alan Modra
-- 
Linuxcare
