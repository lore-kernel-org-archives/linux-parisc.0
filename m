Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA08395
	for <parisc-linux@puffin.external.hp.com>; Wed, 25 Oct 2000 15:05:08 -0600
Message-Id: <5.0.0.25.0.20001025135117.00a4beb0@mail.webcash.com>
Date: Wed, 25 Oct 2000 14:00:42 -0700
To: grundler@cup.hp.com
From: Kailashnath V Rampure <kailasr@webcash.com>
Cc: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Subject: [parisc-linux] 
List-ID: <linux-parisc.vger.kernel.org>

Hi,

I am building Linux for HP PA-RISC on Redhat linux. When I give " make 
LANGUAGES=c" for gcc I get the following error can any one help me. I need 
to install Linux on HP A class server. The server does not have a cdrom device.

  The error is as follows:


if [ -f stmp-dirs ]; then true; else touch stmp-dirs; fi
rm -rf ./libgcc.a
hppa-linux-ar  rc ./libgcc.a libgcc/./_muldi3.o libgcc/./_divdi3.o 
libgcc/./_moddi3.o libgcc/./_udivdi3.o libgcc/./_umoddi3.o 
libgcc/./_negdi2.o libgcc/./_lshrdi3.o libgcc/./_ashldi3.o 
libgcc/./_ashrdi3.o libgcc/./_ffsdi2.o libgcc/./_udiv_w_sdiv.o 
libgcc/./_udivmoddi4.o libgcc/./_cmpdi2.o libgcc/./_ucmpdi2.o 
libgcc/./_floatdidf.o libgcc/./_floatdisf.o libgcc/./_fixunsdfsi.o 
libgcc/./_fixunssfsi.o libgcc/./_fixunsdfdi.o libgcc/./_fixdfdi.o 
libgcc/./_fixunssfdi.o libgcc/./_fixsfdi.o libgcc/./_fixxfdi.o 
libgcc/./_fixunsxfdi.o libgcc/./_floatdixf.o libgcc/./_fixunsxfsi.o 
libgcc/./_fixtfdi.o libgcc/./_fixunstfdi.o libgcc/./_floatditf.o 
libgcc/./__gcc_bcmp.o libgcc/./_varargs.o libgcc/./__dummy.o 
libgcc/./_eprintf.o libgcc/./_bb.o libgcc/./_shtab.o 
libgcc/./_clear_cache.o libgcc/./_trampoline.o libgcc/./__main.o 
libgcc/./_exit.o libgcc/./_ctors.o libgcc/./_pure.o libgcc/./_eh.o 
libgcc/./frame-dwarf2.o libgcc/./_divI.o libgcc/./_divU.o libgcc/./_remI.o 
libgcc/./_remU.o libgcc/./_multiply.o libgcc/./_divI_15.o 
libgcc/./_divI_14.o libgcc/./_divI_12.o libgcc/./_divI_10.o 
libgcc/./_divI_9.o libgcc/./_divI_7.o libgcc/./_divI_6.o libgcc/./_divI_5.o 
libgcc/./_divI_3.o libgcc/./_divU_15.o libgcc/./_divU_14.o 
libgcc/./_divU_12.o libgcc/./_divU_10.o libgcc/./_divU_9.o 
libgcc/./_divU_7.o libgcc/./_divU_6.o libgcc/./_divU_5.o libgcc/./_divU_3.o 
libgcc/./_dyncall.o
make[2]: hppa-linux-ar: Command not found
make[2]: *** [libgcc.a] Error 127
make[2]: Leaving directory `/opt/hp/build/gcc/gcc'
make[1]: *** [libgcc.a] Error 2
make[1]: Leaving directory `/opt/hp/build/gcc/gcc'
make: *** [all-gcc] Error 2
