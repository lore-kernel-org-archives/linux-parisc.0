Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA16792
	for <parisc-linux@puffin.external.hp.com>; Thu, 1 Jun 2000 10:29:42 -0600
Message-Id: <200006011630.JAA04314@milano.cup.hp.com>
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Binutils update 
In-reply-to: Your message of "Thu, 01 Jun 2000 17:08:29 PDT."
             <Pine.LNX.4.21.0006011600290.30171-100000@front.linuxcare.com.au>
Date: Thu, 01 Jun 2000 09:30:46 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Alan Modra wrote:
> I've just checked in the following:
> 
> Rewrite much of the stub handling code (still using r8)
> Fix expression parsing for `!' line separator. 
> Fix sizing of branches & other miscellaneous small fixes. 
> 
> Feedback appreciated.

Ok.  I get an error when building:
...
gcc -W -Wall -g -O2 -o as-new app.o as.o atof-generic.o bignum-copy.o cond.o depend.o dwarf2dbg.o ecoff.o ehopt.o expr.o flonum-copy.o flonum-konst.o flonum-mult.o frags.o hash.o input-file.o input-scrub.o listing.o literal.o macro.o messages.o output-file.o read.o sb.o stabs.o subsegs.o symbols.o write.o tc-hppa.o obj-elf.o atof-ieee.o ../opcodes/.libs/libopcodes.a ../bfd/.libs/libbfd.a ../libiberty/libiberty.a
read.o: In function `read_a_source_file':
/linux/grundler/build-2.10-32/gas/../../binutils-2.10/gas/read.c:1107: undefined reference to `found_comment'
collect2: ld returned 1 exit status
make[3]: *** [as-new] Error 1
make[3]: Leaving directory `/linux/grundler/build-2.10-32/gas'
make[2]: *** [all-recursive] Error 1
...

Any idea what's missing?

config.status contains:
../binutils-2.10/configure --host=i686-pc-linux-gnu --target=hppa1.1-linux --prefix=/opt/puffin --disable-nls --norecursion 

I assume that's the original config line plus some defaults.

thanks,
grant

Grant Grundler
Unix Development Lab
+1.408.447.7253
