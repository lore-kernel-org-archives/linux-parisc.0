Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id OAA31121
	for <parisc-linux@puffin.external.hp.com>; Mon, 13 Sep 1999 14:32:45 -0600
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.16.124.11])
	by atlrel1.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id QAA25033
	for <parisc-linux@thepuffingroup.com>; Mon, 13 Sep 1999 16:34:14 -0400 (EDT)
Received: from localhost (grundler@localhost [127.0.0.1]) by milano.cup.hp.com with SMTP (8.8.6 (PHNE_14041)/8.7.3 TIS Messaging 5.0) id NAA18055 for <parisc-linux@thepuffingroup.com>; Mon, 13 Sep 1999 13:32:55 -0700 (PDT)
Message-Id: <199909132032.NAA18055@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Date: Mon, 13 Sep 1999 13:32:54 -0700
From: Grant Grundler <grundler@cup.hp.com>
Subject: [parisc-linux] building SOM tools
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:
...
> Sigh...I thought the object files were supposed to be SOM until I saw the
> following in the binutils/gas/configure:
>       parisc-*-linux*)         fmt=elf em=linux ;;
> 
> Should I change this to "som"?

I changed my local copy of configure as proposed above.
I removed /linux/parisc-linux/bin from my $PATH.
This doesn't build "out of the box" either...
Anyone have fixes for this not committed to the CVS tree?


grundler <429> ./configure --prefix=/linux --host=hppa1.1-hp-hpux11.00 --target=parisc-linux
grundler <430> make
...
cc -g -o as-new app.o as.o atof-generic.o bignum-copy.o cond.o depend.o ecoff.o ehopt.o expr.o flonum-copy.o flonum-konst.o flonum-mult.o frags.o hash.o input-file.o input-scrub.o listing.o literal.o macro.o messages.o output-file.o read.o sb.o stabs.o subsegs.o symbols.o write.o tc-hppa.o obj-som.o atof-ieee.o ../opcodes/.libs/libopcodes.a ../bfd/.libs/libbfd.a ../libiberty/libiberty.a
/usr/ccs/bin/ld: (Warning) At least one PA 2.0 object file (app.o) was detected. The linked output may not run on a PA 1.x system.
/usr/ccs/bin/ld: Unsatisfied symbols:
   bfd_som_set_subsection_attributes (code)
   bfd_som_set_section_attributes (code)
   hppa_som_gen_reloc_type (code)
   bfd_som_attach_aux_hdr (code)
   bfd_som_set_symbol_type (code)
make[1]: *** [as-new] Error 1
make[1]: Leaving directory `/linux/binutils/gas'
make: *** [all-gas] Error 2
grundler <431>
