Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA26748
	for <parisc-linux@puffin.external.hp.com>; Fri, 8 Sep 2000 10:13:04 -0600
Date: Fri, 8 Sep 2000 12:12:23 -0400 (EDT)
From: Andrew Park <apark@cdf.toronto.edu>
To: parisc-linux@thepuffingroup.com
In-Reply-To: <200009071853.LAA28084@milano.cup.hp.com>
Message-ID: <Pine.SOL.4.21.0009081208040.22259-100000@misty.cdf>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] gcc build failure
List-ID: <linux-parisc.vger.kernel.org>

I get the following error message when trying to build gcc.
I've run the contrib/cvsupdate script to update the source as well.
Thanks for any help.


blue <12:17pm> </local/src/puffin/gcc-build> make
make[1]: Entering directory `/usr/local/src/puffin/gcc-build/libiberty'
make[2]: Entering directory `/usr/local/src/puffin/gcc-build/libiberty/testsuite'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/usr/local/src/puffin/gcc-build/libiberty/testsuite'
make[1]: Leaving directory `/usr/local/src/puffin/gcc-build/libiberty'
make[1]: Entering directory `/usr/local/src/puffin/gcc-build/texinfo'
make all-recursive
make[2]: Entering directory `/usr/local/src/puffin/gcc-build/texinfo'
Making all in intl
make[3]: Entering directory `/usr/local/src/puffin/gcc-build/texinfo/intl'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/usr/local/src/puffin/gcc-build/texinfo/intl'
Making all in lib
make[3]: Entering directory `/usr/local/src/puffin/gcc-build/texinfo/lib'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/usr/local/src/puffin/gcc-build/texinfo/lib'
Making all in makeinfo
make[3]: Entering directory `/usr/local/src/puffin/gcc-build/texinfo/makeinfo'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/usr/local/src/puffin/gcc-build/texinfo/makeinfo'
Making all in util
make[3]: Entering directory `/usr/local/src/puffin/gcc-build/texinfo/util'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/usr/local/src/puffin/gcc-build/texinfo/util'
make[2]: Leaving directory `/usr/local/src/puffin/gcc-build/texinfo'
make[1]: Leaving directory `/usr/local/src/puffin/gcc-build/texinfo'
make[1]: Entering directory `/usr/local/src/puffin/gcc-build/etc'
make[1]: Nothing to be done for `all'.
make[1]: Leaving directory `/usr/local/src/puffin/gcc-build/etc'
make[1]: Entering directory `/usr/local/src/puffin/gcc-build/gcc'
(cd intl && make all)
make[2]: Entering directory `/usr/local/src/puffin/gcc-build/gcc/intl'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/usr/local/src/puffin/gcc-build/gcc/intl'
make GCC_FOR_TARGET="/local/src/puffin/gcc-build/gcc/xgcc -B/local/src/puffin/gcc-build/gcc/ -B/junk/puffin/bin/hppa2.0-linux/bin/ -B/junk/puffin/bin/hppa2.0-linux/lib/ -isystem /junk/puffin/bin/hppa2.0-linux/include" \
  HOST_PREFIX="" HOST_PREFIX_1="loser-" \
  AR_FOR_TARGET="hppa2.0-linux-ar" \
  AR_CREATE_FOR_TARGET="hppa2.0-linux-ar  rc" \
  AR_FLAGS_FOR_TARGET="" \
  OLDCC="cc" CCLIBFLAGS="-O" CFLAGS="-g -O2" \
  RANLIB_FOR_TARGET="hppa2.0-linux-ranlib" \
  RANLIB_TEST_FOR_TARGET="[ -f hppa2.0-linux-ranlib ] || ( [ "i386-pc-linux-gnu" = "hppa2.0-unknown-linux-gnu" ] && [ -f /usr/bin/ranlib -o -f /bin/ranlib ] )" \
  LIBGCC2_CFLAGS="-O2  -DCROSS_COMPILE -DIN_GCC    `echo -g -O2|sed -e 's/-pedantic//g' -e 's/-Wtraditional//g'` -isystem ./include  -fPIC -g1  -DIN_LIBGCC2 -D__GCC_FLOAT_NOT_NEEDED " \
  INCLUDES="-I. -I../../gcc/gcc -I../../gcc/gcc/config -I../../gcc/gcc/../include" MAYBE_USE_COLLECT2="" \
  CONFIG_H="" MACHMODE_H="machmode.h machmode.def" \
  LIB1ASMSRC='pa/lib1linux.asm' \
  -f libgcc.mk all
make[2]: Entering directory `/usr/local/src/puffin/gcc-build/gcc'
for d in libgcc; do \
  if [ -d $d ]; then true; else mkdir $d; fi \
done
if [ -f stmp-dirs ]; then true; else touch stmp-dirs; fi
/local/src/puffin/gcc-build/gcc/xgcc -B/local/src/puffin/gcc-build/gcc/ -B/junk/puffin/bin/hppa2.0-linux/bin/ -B/junk/puffin/bin/hppa2.0-linux/lib/ -isystem /junk/puffin/bin/hppa2.0-linux/include -O2  -DCROSS_COMPILE -DIN_GCC    -g -O2 -isystem ./include  -fPIC -g1  -DIN_LIBGCC2 -D__GCC_FLOAT_NOT_NEEDED  -I. -I../../gcc/gcc -I../../gcc/gcc/config -I../../gcc/gcc/../include -DL_divI -xassembler-with-cpp -c ../../gcc/gcc/config/pa/lib1linux.asm -o libgcc/./_divI.o
/tmp/ccfAaMYS.s: Assembler messages:
/tmp/ccfAaMYS.s:27: Error: Unknown pseudo-op:  `.export'
/tmp/ccfAaMYS.s:28: Error: ignoring unrecognized symbol type "millicode"
/tmp/ccfAaMYS.s:30: Error: Unknown pseudo-op:  `.proc'
/tmp/ccfAaMYS.s:31: Error: Unknown pseudo-op:  `.callinfo'
/tmp/ccfAaMYS.s:32: Error: Unknown pseudo-op:  `.entry'
/tmp/ccfAaMYS.s:33: Error: bad register name `%r26'
/tmp/ccfAaMYS.s:33: Error: Rest of line ignored. First ignored character is `!'.
/tmp/ccfAaMYS.s:34: Error: invalid character ',' in mnemonic
/tmp/ccfAaMYS.s:34: Error: Rest of line ignored. First ignored character is `!'.
/tmp/ccfAaMYS.s:35: Error: bad register name `%r0'
/tmp/ccfAaMYS.s:36: Error: invalid character ',' in mnemonic
/tmp/ccfAaMYS.s:37: Error: bad register name `%r0'
/tmp/ccfAaMYS.s:39: Error: invalid character ',' in mnemonic
/tmp/ccfAaMYS.s:40: Error: bad register name `%r0'
/tmp/ccfAaMYS.s:40: Error: Rest of line ignored. First ignored character is `!'.
/tmp/ccfAaMYS.s:41: Error: invalid character '%' in mnemonic
/tmp/ccfAaMYS.s:42: Error: no such 386 instruction: `addc %r26,%r26,%r26'
/tmp/ccfAaMYS.s:43: Error: invalid character '%' in mnemonic
/tmp/ccfAaMYS.s:44: Error: no such 386 instruction: `addc %r26,%r26,%r26'
/tmp/ccfAaMYS.s:45: Error: invalid character '%' in mnemonic
/tmp/ccfAaMYS.s:46: Error: no such 386 instruction: `addc %r26,%r26,%r26'
/tmp/ccfAaMYS.s:47: Error: invalid character '%' in mnemonic
/tmp/ccfAaMYS.s:48: Error: no such 386 instruction: `addc %r26,%r26,%r26'
/tmp/ccfAaMYS.s:49: Error: invalid character '%' in mnemonic
/tmp/ccfAaMYS.s:50: Error: no such 386 instruction: `addc %r26,%r26,%r26'
/tmp/ccfAaMYS.s:51: Error: invalid character '%' in mnemonic
/tmp/ccfAaMYS.s:52: Error: no such 386 instruction: `addc %r26,%r26,%r26'
/tmp/ccfAaMYS.s:53: Error: invalid character '%' in mnemonic
/tmp/ccfAaMYS.s:54: Error: no such 386 instruction: `addc %r26,%r26,%r26'
/tmp/ccfAaMYS.s:55: Error: invalid character '%' in mnemonic
/tmp/ccfAaMYS.s:56: Error: no such 386 instruction: `addc %r26,%r26,%r26'
/tmp/ccfAaMYS.s:57: Error: invalid character '%' in mnemonic
/tmp/ccfAaMYS.s:58: Error: no such 386 instruction: `addc %r26,%r26,%r26'
/tmp/ccfAaMYS.s:59: Error: invalid character '%' in mnemonic
/tmp/ccfAaMYS.s:60: Error: no such 386 instruction: `addc %r26,%r26,%r26'
/tmp/ccfAaMYS.s:61: Error: invalid character '%' in mnemonic
/tmp/ccfAaMYS.s:62: Error: no such 386 instruction: `addc %r26,%r26,%r26'
/tmp/ccfAaMYS.s:63: Error: invalid character '%' in mnemonic
/tmp/ccfAaMYS.s:64: Error: no such 386 instruction: `addc %r26,%r26,%r26'
/tmp/ccfAaMYS.s:65: Error: invalid character '%' in mnemonic
/tmp/ccfAaMYS.s:66: Error: no such 386 instruction: `addc %r26,%r26,%r26'
/tmp/ccfAaMYS.s:67: Error: invalid character '%' in mnemonic
/tmp/ccfAaMYS.s:68: Error: no such 386 instruction: `addc %r26,%r26,%r26'
/tmp/ccfAaMYS.s:69: Error: invalid character '%' in mnemonic
/tmp/ccfAaMYS.s:70: Error: no such 386 instruction: `addc %r26,%r26,%r26'
/tmp/ccfAaMYS.s:71: Error: invalid character '%' in mnemonic
/tmp/ccfAaMYS.s:72: Error: no such 386 instruction: `addc %r26,%r26,%r26'
/tmp/ccfAaMYS.s:73: Error: invalid character '%' in mnemonic
/tmp/ccfAaMYS.s:74: Error: no such 386 instruction: `addc %r26,%r26,%r26'
/tmp/ccfAaMYS.s:75: Error: invalid character '%' in mnemonic
/tmp/ccfAaMYS.s:76: Error: no such 386 instruction: `addc %r26,%r26,%r26'
/tmp/ccfAaMYS.s:77: Error: invalid character '%' in mnemonic
/tmp/ccfAaMYS.s:78: Error: no such 386 instruction: `addc %r26,%r26,%r26'
/tmp/ccfAaMYS.s:79: Error: invalid character '%' in mnemonic
/tmp/ccfAaMYS.s:80: Error: no such 386 instruction: `addc %r26,%r26,%r26'
/tmp/ccfAaMYS.s:81: Error: invalid character '%' in mnemonic
/tmp/ccfAaMYS.s:82: Error: no such 386 instruction: `addc %r26,%r26,%r26'
/tmp/ccfAaMYS.s:83: Error: invalid character '%' in mnemonic
/tmp/ccfAaMYS.s:84: Error: no such 386 instruction: `addc %r26,%r26,%r26'
/tmp/ccfAaMYS.s:85: Error: invalid character '%' in mnemonic
/tmp/ccfAaMYS.s:86: Error: no such 386 instruction: `addc %r26,%r26,%r26'
/tmp/ccfAaMYS.s:87: Error: invalid character '%' in mnemonic
/tmp/ccfAaMYS.s:88: Error: no such 386 instruction: `addc %r26,%r26,%r26'
/tmp/ccfAaMYS.s:89: Error: invalid character '%' in mnemonic
/tmp/ccfAaMYS.s:90: Error: no such 386 instruction: `addc %r26,%r26,%r26'
/tmp/ccfAaMYS.s:91: Error: invalid character '%' in mnemonic
/tmp/ccfAaMYS.s:92: Error: no such 386 instruction: `addc %r26,%r26,%r26'
/tmp/ccfAaMYS.s:93: Error: invalid character '%' in mnemonic
/tmp/ccfAaMYS.s:94: Error: no such 386 instruction: `addc %r26,%r26,%r26'
/tmp/ccfAaMYS.s:95: Error: invalid character '%' in mnemonic
/tmp/ccfAaMYS.s:96: Error: no such 386 instruction: `addc %r26,%r26,%r26'
/tmp/ccfAaMYS.s:97: Error: invalid character '%' in mnemonic
/tmp/ccfAaMYS.s:98: Error: no such 386 instruction: `addc %r26,%r26,%r26'
/tmp/ccfAaMYS.s:99: Error: invalid character '%' in mnemonic
/tmp/ccfAaMYS.s:100: Error: no such 386 instruction: `addc %r26,%r26,%r26'
/tmp/ccfAaMYS.s:101: Error: invalid character '%' in mnemonic
/tmp/ccfAaMYS.s:102: Error: no such 386 instruction: `addc %r26,%r26,%r26'
/tmp/ccfAaMYS.s:103: Error: invalid character '%' in mnemonic
/tmp/ccfAaMYS.s:104: Error: no such 386 instruction: `addc %r26,%r26,%r26'
/tmp/ccfAaMYS.s:105: Error: invalid character '%' in mnemonic
/tmp/ccfAaMYS.s:106: Error: no such 386 instruction: `addc %r26,%r26,%r26'
/tmp/ccfAaMYS.s:107: Error: invalid character ',' in mnemonic
/tmp/ccfAaMYS.s:108: Error: bad register name `%r1'
/tmp/ccfAaMYS.s:109: Error: invalid character ',' in mnemonic
/tmp/ccfAaMYS.s:109: Error: Rest of line ignored. First ignored character is `!'.
/tmp/ccfAaMYS.s:110: Error: bad register name `%r0'
/tmp/ccfAaMYS.s:111: Error: no such 386 instruction: `bv %r0(%r31)'
/tmp/ccfAaMYS.s:112: Error: no such 386 instruction: `copy %r26,%r29'
/tmp/ccfAaMYS.s:114: Error: invalid character ',' in mnemonic
/tmp/ccfAaMYS.s:115: Error: no such 386 instruction: `ldi 1,%r29'
/tmp/ccfAaMYS.s:116: Error: invalid character ',' in mnemonic
/tmp/ccfAaMYS.s:117: Error: Unknown pseudo-op:  `.exit'
/tmp/ccfAaMYS.s:118: Error: Unknown pseudo-op:  `.procend'
make[2]: *** [libgcc/./_divI.o] Error 1
make[2]: Leaving directory `/usr/local/src/puffin/gcc-build/gcc'
make[1]: *** [libgcc.a] Error 2
make[1]: Leaving directory `/usr/local/src/puffin/gcc-build/gcc'
make: *** [all-gcc] Error 2
blue <12:18pm> </local/src/puffin/gcc-build> 
 


Andrew Park
           
________________________________________________________________________ 
CDFlab Systems Administrator                       www.cdf.utoronto.ca |
GnuPG Signature              www.cdf.utoronto.ca/~apark/public_key.txt |
------------------------------------------------------------------------
