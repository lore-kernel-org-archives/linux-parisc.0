Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id AAA32628
	for <parisc-linux@puffin.external.hp.com>; Sat, 19 Aug 2000 00:51:29 -0600
Date: Sat, 19 Aug 2000 02:51:03 -0400 (EDT)
From: Andrew Park <apark@cdf.toronto.edu>
To: parisc-linux@thepuffingroup.com
In-Reply-To: <20000818102446.A28421@vodka.thepuffingroup.com>
Message-ID: <Pine.LNX.4.21.0008190244530.18573-100000@kirin.cdf>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] gcc make failures
List-ID: <linux-parisc.vger.kernel.org>

Hi, all

Just wondering ... I'm trying to build gcc, but although I passed in

	make LIBGCC2_INCLUDES=-I$DEST/include

it seems that in later stages, it forgets to include -I$DEST/include flag.
Okay, so for now I manually edited Makefile to pass in that flag, but
then I ran into the following

/local/src/puffin/gcc-build/gcc/g++ -B/local/src/puffin/gcc-build/gcc/ -B/junk/puffin/hppa1.1-linux/bin/ -L/local/src/puffin/gcc-build/hppa1.1-linux/libstdc++ -c -g -O2 -fvtable-thunks -D_GNU_SOURCE -fno-implicit-templates -I../../../gcc/libstdc++ -I../../../gcc/libstdc++/stl -I../libio -I../../../gcc/libstdc++/../libio -nostdinc++ -I/junk/puffin/include  -DF `for N in MAIN ADDCC ADDCF ADDFC SUBCC SUBCF SUBFC MULCC MULCF MULFC DIVCC DIVCF DIVFC PLUS MINUS EQCC EQCF EQFC NECC
NECF NEFC ABS ARG POLAR CONJ NORM COS COSH EXP LOG POWCC POWCF POWCI POWFC SIN SINH SQRT; do echo " -D${N}"; done` \
  ../../../gcc/libstdc++/cinst.cc -o fcomplex.o
In file included from ../../../gcc/libstdc++/complex:8,
                 from ../../../gcc/libstdc++/std/complext.cc:29,
                 from ../../../gcc/libstdc++/cinst.cc:30:
../../../gcc/libstdc++/std/complext.h:314: declaration of `double hypot (double, double)' throws
different exceptions
/junk/puffin/include/bits/mathcalls.h:150: than previous declaration `double hypot (double, double)
throw ()'
make[1]: *** [bigstmp-complx] Error 1
make[1]: Leaving directory `/usr/local/src/puffin/gcc-build/hppa1.1-linux/libstdc++'

By this I figure I might be doing something wrong, hence the e-mail.
I'll appreciate any comment.
Thanks


Andrew Park
           
________________________________________________________________________ 
CDFlab Systems Administrator                       www.cdf.utoronto.ca |
Team BlueShirt Developer                             www.blueshirt.org |
GnuPG Signature              www.cdf.utoronto.ca/~apark/public_key.txt |
------------------------------------------------------------------------
