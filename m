Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA02709
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Mar 2000 16:28:44 -0700
Date: Wed, 15 Mar 2000 17:30:03 -0500 (EST)
From: "Brian S. Julin" <bri@mojo.calyx.net>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Cross compiler -- on Alpha?
In-Reply-To: <Pine.LNX.4.10.10003151927530.21833-100000@bastion.hugo.vanderkooij.org>
Message-ID: <Pine.BSO.4.21.0003151719030.7474-100000@mojo.calyx.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>


> I know there is plenty of software out there that does not use proper
> handling of pointers and that will break on my Alpha while you can get
> away with it on intel based machines. The problem is due to bad coding but
> it could be a good case to try and see if the code is clean enough.

OK, well I gave it a spin -- the linker compiled, with a lot of
warnings about integers of different size than pointers.  The rest
of binutils built but I couldn't build gas, I don't think it was
architecture related though:

gcc -g -O2 -o .libs/as-new app.o as.o atof-generic.o bignum-copy.o cond.o
depend.o dwarf2dbg.o ecoff.o ehopt.o expr.o flonum-copy.o flonum-konst.o
flonum-mult.o frags.o hash.o input-file.o input-scrub.o listing.o
literal.o macro.o messages.o output-file.o
read.o sb.o stabs.o subsegs.o symbols.o write.o tc-hppa.o obj-elf.o
atof-ieee.o ../opcodes/.libs/libopcodes.so ../bfd/.libs/libbfd.so
../libiberty/libiberty.a -lm -Wl,--rpath -Wl,/usr/src/parisc/lib
tc-hppa.o: In function `tc_gen_reloc':
/usr/src/parisc/binutils/gas/./config/tc-hppa.c:3972: undefined reference
to `_bfd_elf64_hppa_gen_reloc_type'
/usr/src/parisc/binutils/gas/./config/tc-hppa.c:3972: undefined reference
to `_bfd_elf64_hppa_gen_reloc_type'
collect2: ld returned 1 exit status
make[3]: *** [as-new] Error 1

--
Brian
