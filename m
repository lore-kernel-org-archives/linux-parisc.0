Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA20685
	for <parisc-linux@puffin.external.hp.com>; Thu, 1 Jun 2000 18:20:13 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 2 Jun 2000 00:20:41 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id KAA19386;
	Fri, 2 Jun 2000 10:13:48 +1000
Date: Fri, 2 Jun 2000 10:13:48 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Paul Bame <bame@endor.fc.hp.com>, Grant Grundler <grundler@cup.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Binutils update 
In-Reply-To: <E12xXR7-0006q9-00@endor.fc.hp.com>
Message-ID: <Pine.LNX.4.21.0006021003220.18473-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 1 Jun 2000, Paul Bame wrote:

> gcc -W -Wall -g -O2 -o as-new app.o as.o atof-generic.o bignum-copy.o cond.o depend.o dwarf2dbg.o ecoff.o ehopt.o expr.o flonum-copy.o flonum-konst.o flonum-mult.o frags.o hash.o input-file.o input-scrub.o listing.o literal.o macro.o messages.o output-file.o read.o sb.o stabs.o subsegs.o symbols.o write.o tc-hppa.o obj-elf.o atof-ieee.o ../opcodes/.libs/libopcodes.a ../bfd/.libs/libbfd.a ../libiberty/libiberty.a
> read.o: In function `read_a_source_file':
> /users/bame/palinux/binutils-2.10/gas/read.c:1107: undefined reference to `found_comment'
> collect2: ld returned 1 exit status

Oops.  That leaked in from a patch I made to help find semicolons lurking
in C asm statements.  I've reverted the patch to gas/read.c

-- 
Linuxcare.  Support for the Revolution.
