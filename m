Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA16373
	for <parisc-linux@puffin.external.hp.com>; Thu, 1 Jun 2000 10:02:42 -0600
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Binutils update 
In-reply-to: Your message of "Thu, 01 Jun 2000 17:08:29 +1000."
             <Pine.LNX.4.21.0006011600290.30171-100000@front.linuxcare.com.au>
Date: Thu, 01 Jun 2000 10:03:09 -0600
From: Paul Bame <bame@endor.fc.hp.com>
Message-Id: <E12xXR7-0006q9-00@endor.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


Oops, it would probably be helpful to see a little more context:

gcc -W -Wall -g -O2 -o as-new app.o as.o atof-generic.o bignum-copy.o cond.o depend.o dwarf2dbg.o ecoff.o ehopt.o expr.o flonum-copy.o flonum-konst.o flonum-mult.o frags.o hash.o input-file.o input-scrub.o listing.o literal.o macro.o messages.o output-file.o read.o sb.o stabs.o subsegs.o symbols.o write.o tc-hppa.o obj-elf.o atof-ieee.o ../opcodes/.libs/libopcodes.a ../bfd/.libs/libbfd.a ../libiberty/libiberty.a
read.o: In function `read_a_source_file':
/users/bame/palinux/binutils-2.10/gas/read.c:1107: undefined reference to `found_comment'
collect2: ld returned 1 exit status
