Return-Path: <hppa-linux@puffingroup.com>
Date: Wed, 17 Feb 1999 23:01:45 -0500 (EST)
From: Alex deVries <adevries@redhat.com>
To: hppa-linux@puffingroup.com
Message-ID: <Pine.LNX.3.96.990217225921.22132p-100000@devserv.devel.redhat.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [hppa-linux] Problems with egcs building...
Resent-Message-ID: <"dkpNB2.0.qx6.75vos"@burrow.puffingroup.com>
Reply-To: hppa-linux@puffingroup.com
List-Id: linux-parisc.vger.kernel.org


So, I'm trying to fix egcs into building as a cross compiler so I can
package it as an rpm and people can get developing reasonably easily.

So far I've overcome a few hurdles, and now am stuck on:

rm -f tmplibgcc2.a
for name in _muldi3 _divdi3 _moddi3 _udivdi3 _umoddi3 _negdi2 _lshrdi3
_ashldi3 _ashrdi3 _ffsdi2 _udiv_w_sdiv _udivmoddi4 _cmpdi2 _ucmpdi2
_floatdidf _floatdisf _fixunsdfsi _fixunssfsi _fixunsdfdi _fixdfdi
_fixunssfdi _fixsfdi _fixxfdi _fixunsxfdi _floatdixf _fixunsxfsi _fixtfdi
_fixunstfdi _floatditf __gcc_bcmp _varargs __dummy _eprintf _bb _shtab
_clear_cache _trampoline __main _exit _ctors _pure; \
do \
  echo ${name}; \
  /usr/src/redhat/BUILD/egcs-x-hppa-1.1.1/egcs-1.1.1/gcc/xgcc
-B/usr/src/redhat/BUILD/egcs-x-hppa-1.1.1/egcs-1.1.1/gcc/ -O2
-DCROSS_COMPILE -Dinhibit_libc -DIN_GCC    -g -O2 -I./include  -fPIC -g1
-DIN_LIBGCC2 -D__GCC_FLOAT_NOT_NEEDED   -I. -I. -I./config -c -DL${name} \
      ./libgcc2.c -o ${name}.o; \
  if [ $? -eq 0 ] ; then true; else exit 1; fi; \
  hppa1.1-hp-linux-ar rc tmplibgcc2.a ${name}.o; \
  rm -f ${name}.o; \
done
_muldi3
_divdi3
/tmp/cc4aSGBg.s: Assembler messages:
/tmp/cc4aSGBg.s:377: Error: Unknown opcode: `bits'
/tmp/cc4aSGBg.s:378: Fatal error: Unknown opcode: `no. Shift down,skip
add.'
make[1]: *** [libgcc2.a] Error 1
make[1]: Leaving directory
`/usr/src/redhat/BUILD/egcs-x-hppa-1.1.1/egcs-1.1.1/gcc'
make: *** [cross] Error 2


Is this my version of binutils by chance?  I know it's running the
hppa1.1-hp-linux version of ar.

- Alex

-- 
Alex deVries <puffin@redhat.com>     
Red Hat Contrib Net maintainer          
Ottawa, Canada  
HPPA/Linux Porting Team


----------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
`unsubscribe' as the subject.
