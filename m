Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA27209
	for <parisc-linux@puffin.external.hp.com>; Fri, 8 Sep 2000 11:23:55 -0600
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 8 Sep 2000 17:24:13 -0000
Received: from ottawa.linuxcare.com (HELO linuxcare.com) (216.208.98.2)
  by smtp.linuxcare.com with SMTP; 8 Sep 2000 17:24:12 -0000
Sender: adevries@mailserv2.iuinc.com
Message-ID: <39B92177.34B824C6@linuxcare.com>
Date: Fri, 08 Sep 2000 13:27:19 -0400
From: Alex deVries <adevries@linuxcare.com>
MIME-Version: 1.0
To: Andrew Park <apark@cdf.toronto.edu>
CC: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] gcc build failure
References: <Pine.SOL.4.21.0009081208040.22259-100000@misty.cdf>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Andrew Park wrote:
> I get the following error message when trying to build gcc.
> I've run the contrib/cvsupdate script to update the source as well.

You're trying to use the i386 assembler!  You can fix this by first
building and installing the cross binutils, making sure that's in your
path, before you build gcc.

- Alex

> make GCC_FOR_TARGET="/local/src/puffin/gcc-build/gcc/xgcc -B/local/src/puffin/gcc-build/gcc/ -B/junk/puffin/bin/hppa2.0-linux/bin/ -B/junk/puffin/bin/hppa2.0-linux/lib/ -isystem /junk/puffin/bin/hppa2.0-linux/include" \
>   HOST_PREFIX="" HOST_PREFIX_1="loser-" \
>   AR_FOR_TARGET="hppa2.0-linux-ar" \
>   AR_CREATE_FOR_TARGET="hppa2.0-linux-ar  rc" \
>   AR_FLAGS_FOR_TARGET="" \
>   OLDCC="cc" CCLIBFLAGS="-O" CFLAGS="-g -O2" \
>   RANLIB_FOR_TARGET="hppa2.0-linux-ranlib" \
>   RANLIB_TEST_FOR_TARGET="[ -f hppa2.0-linux-ranlib ] || ( [ "i386-pc-linux-gnu" = "hppa2.0-unknown-linux-gnu" ] && [ -f /usr/bin/ranlib -o -f /bin/ranlib ] )" \
>   LIBGCC2_CFLAGS="-O2  -DCROSS_COMPILE -DIN_GCC    `echo -g -O2|sed -e 's/-pedantic//g' -e 's/-Wtraditional//g'` -isystem ./include  -fPIC -g1  -DIN_LIBGCC2 -D__GCC_FLOAT_NOT_NEEDED " \
>   INCLUDES="-I. -I../../gcc/gcc -I../../gcc/gcc/config -I../../gcc/gcc/../include" MAYBE_USE_COLLECT2="" \
>   CONFIG_H="" MACHMODE_H="machmode.h machmode.def" \
>   LIB1ASMSRC='pa/lib1linux.asm' \
>   -f libgcc.mk all
> make[2]: Entering directory `/usr/local/src/puffin/gcc-build/gcc'
> for d in libgcc; do \
>   if [ -d $d ]; then true; else mkdir $d; fi \
> done
> if [ -f stmp-dirs ]; then true; else touch stmp-dirs; fi
> /local/src/puffin/gcc-build/gcc/xgcc -B/local/src/puffin/gcc-build/gcc/ -B/junk/puffin/bin/hppa2.0-linux/bin/ -B/junk/puffin/bin/hppa2.0-linux/lib/ -isystem /junk/puffin/bin/hppa2.0-linux/include -O2  -DCROSS_COMPILE -DIN_GCC    -g -O2 -isystem ./include  -fPIC -g1  -DIN_LIBGCC2 -D__GCC_FLOAT_NOT_NEEDED  -I. -I../../gcc/gcc -I../../gcc/gcc/config -I../../gcc/gcc/../include -DL_divI -xassembler-with-cpp -c ../../gcc/gcc/config/pa/lib1linux.asm -o libgcc/./_divI.o
> /tmp/ccfAaMYS.s: Assembler messages:
> /tmp/ccfAaMYS.s:27: Error: Unknown pseudo-op:  `.export'
> /tmp/ccfAaMYS.s:28: Error: ignoring unrecognized symbol type "millicode"
> /tmp/ccfAaMYS.s:30: Error: Unknown pseudo-op:  `.proc'
> /tmp/ccfAaMYS.s:31: Error: Unknown pseudo-op:  `.callinfo'
> /tmp/ccfAaMYS.s:32: Error: Unknown pseudo-op:  `.entry'
> /tmp/ccfAaMYS.s:33: Error: bad register name `%r26'

-- 
Alex deVries, Director of Professional Services, The Puffins at
Linuxcare
613.562.2759 tel
alex@linuxcare.com, http://www.linuxcare.com/
Linuxcare, Support for the revolution.
