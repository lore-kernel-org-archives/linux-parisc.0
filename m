Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA18909
	for <parisc-linux@puffin.external.hp.com>; Sun, 10 Dec 2000 06:12:50 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 10 Dec 2000 13:15:21 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id AAA15071;
	Mon, 11 Dec 2000 00:02:57 +1100
Date: Mon, 11 Dec 2000 00:02:57 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Grant Grundler <grundler@cup.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 32-bit xc-20001206.tar.gz is foobar
In-Reply-To: <200012100523.VAA11343@milano.cup.hp.com>
Message-ID: <Pine.LNX.4.21.0012102347330.31734-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Sat, 9 Dec 2000, Grant Grundler wrote:

> Matt,
> xc-latest.tar.gz points to xc-20001206.tar.gz.
> Could latest be pointed to the previous version?
> 
> 32-bit 1206 build dies in the link phase with:
> ...
> hppa-linux-ld: fs/fs.o(.text.load_elf_interp+0x2b8): cannot handle R_PARISC_PCREL17F for __up
> hppa-linux-ld: fs/fs.o(.text.load_elf_interp+0x2dc): cannot reach 00000010___down+0, recompile with -ffunction-sections
> hppa-linux-ld: fs/fs.o(.text.load_elf_interp+0x2dc): cannot handle R_PARISC_PCREL17F for __down
> hppa-linux-ld: fs/fs.o(.text.load_aout_interp+0x11c): cannot reach 00000010_flush_instruction_cache+0, recompile with -ffunction-sections
> hppa-linux-ld: fs/fs.o(.text.load_aout_interp+0x11c): cannot handle R_PARISC_PCREL17F for flush_instruction_cache
> ...

This isn't necessarily a problem with Matt's latest compiler binary.  fs.o
is produced with a "ld -r" link stage, and it's text size is larger than
256k, so there is potential for branches to not be able to reach stubs.

ie. You may get these problems if
 a) You are using an older binutils (ie. not the latest pehc CVS version),
    and aren't using -ffunction-sections to compile the kernel
 b) You are using the very latest binutils, and aren't using
    -ffunction-sections, and I've goofed in my "ld -r" magic.

On a good fs.o, "hppa-linux-readelf -h fs.o" ought to show lots of .text.*
sections.

Alan
-- 
Linuxcare.  Support for the Revolution.
