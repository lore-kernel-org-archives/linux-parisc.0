From: "Joel Soete" <soete.joel@scarlet.be>
Subject: Re: [parisc-linux] Some warning: ... cleanup; realy no interest?
Date: Fri,  3 Aug 2007 15:16:14 +0200
Message-ID: <JM78V2$461E14034C9C293D572DFA91ADC72793__34105.2030482844$1416624425$gmane$org@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: "deller" <deller@gmx.de>,
 "parisc-linux" <parisc-linux@lists.parisc-linux.org>
To: "dave" <dave@hiauly1.hia.nrc.ca>
Return-Path: <soete.joel@scarlet.be>
List-ID: <linux-parisc.vger.kernel.org>

Dave, Helge,

> > /CAD/linux-2.6.22-pa/drivers/parisc/dino.c: In function ?dino_bridge_=
init?:
> > /CAD/linux-2.6.22-pa/drivers/parisc/dino.c:821: warning: format %lx
expects type long unsigned int, but argument 4 has type 
> > resource_size_t
> > /CAD/linux-2.6.22-pa/drivers/parisc/dino.c:821: warning: format %lx
expects type long unsigned int, but argument 5 has type 
> > resource_size_t
> 
> Are you sure you changed line 821?
> 
Ah yes I missed this, sorry?

Ok it seems that [Zz] fix this warning for 32bit kernel but not 64bit one=
.

For another b2k config, I tried this change:
drivers/parisc/sba_iommu.c:

   1912         printk(KERN_INFO "%s found %s at 0x%zx\n",
   1913                 MODULE_NAME, version, dev->hpa.start);

and to build 32bit kernel there isn't anymore warning:

  gcc -Wp,-MD,drivers/parisc/.sba_iommu.o.d  -nostdinc -isystem
/usr/lib/gcc/hppa-linux-gnu/4.1.3/include -D__KERNEL__ -Iinclude -Iinclud=
e2
-I/CAD/linux-2.6.22-pa/
include -include include/linux/autoconf.h
-I/CAD/linux-2.6.22-pa/drivers/parisc -Idrivers/parisc -Wall -Wundef
-Wstrict-prototypes -Wno-trigraphs -fno-strict-alias
ing -fno-common -O2 -pipe -mno-space-regs -mfast-indirect-calls
-mdisable-fpregs -ffunction-sections -march=3D1.1 -mschedule=3D7300
-fomit-frame-pointer -fno-stack-pro
tector -Wdeclaration-after-statement -Wno-pointer-sign  -D"KBUILD_STR(s)=3D=
#s"
-D"KBUILD_BASENAME=3DKBUILD_STR(sba_iommu)" 
-D"KBUILD_MODNAME=3DKBUILD_STR(sba_iommu)" -c
 -o drivers/parisc/.tmp_sba_iommu.o
/CAD/linux-2.6.22-pa/drivers/parisc/sba_iommu.c

but for the 64bit kernel build:

either with "z"
  hppa64-linux-gnu-gcc -Wp,-MD,drivers/parisc/.sba_iommu.o.d  -nostdinc
-isystem /usr/lib/gcc/hppa64-linux-gnu/4.1.3/include -D__KERNEL__ -Iinclu=
de
-Iinclude2 -I/C
AD/linux-2.6.22-pa/include -include include/linux/autoconf.h
-I/CAD/linux-2.6.22-pa/drivers/parisc -Idrivers/parisc -Wall -Wundef
-Wstrict-prototypes -Wno-trigraph
s -fno-strict-aliasing -fno-common -O2 -pipe -mno-space-regs
-mfast-indirect-calls -mdisable-fpregs -ffunction-sections -march=3D2.0
-mschedule=3D8000 -fomit-frame-poi
nter -fno-stack-protector -Wdeclaration-after-statement -Wno-pointer-sign=
 
-D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(sba_iommu)" 
-D"KBUILD_MODNAME=3DKBUILD
_STR(sba_iommu)" -c -o drivers/parisc/.tmp_sba_iommu.o
/CAD/linux-2.6.22-pa/drivers/parisc/sba_iommu.c
/CAD/linux-2.6.22-pa/drivers/parisc/sba_iommu.c: In function
'sba_driver_callback':
/CAD/linux-2.6.22-pa/drivers/parisc/sba_iommu.c:1913: warning: format '%z=
x'
expects type 'size_t', but argument 4 has type 'resource_size_t'

or with "Z":
  hppa64-linux-gnu-gcc -Wp,-MD,drivers/parisc/.sba_iommu.o.d  -nostdinc
-isystem /usr/lib/gcc/hppa64-linux-gnu/4.1.3/include -D__KERNEL__ -Iinclu=
de
-Iinclude2 -I/CAD/linux-2.6.22-pa/include -include include/linux/autoconf=
.h
-I/CAD/linux-2.6.22-pa/drivers/parisc -Idrivers/parisc -Wall -Wundef
-Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -O2 -=
pipe
-mno-space-regs -mfast-indirect-calls -mdisable-fpregs -ffunction-section=
s
-march=3D2.0 -mschedule=3D8000 -fomit-frame-pointer -fno-stack-protector
-Wdeclaration-after-statement -Wno-pointer-sign  -D"KBUILD_STR(s)=3D#s"
-D"KBUILD_BASENAME=3DKBUILD_STR(sba_iommu)" 
-D"KBUILD_MODNAME=3DKBUILD_STR(sba_iommu)" -c -o drivers/parisc/.tmp_sba_=
iommu.o
/CAD/linux-2.6.22-pa/drivers/parisc/sba_iommu.c
/CAD/linux-2.6.22-pa/drivers/parisc/sba_iommu.c: In function
'sba_driver_callback':
/CAD/linux-2.6.22-pa/drivers/parisc/sba_iommu.c:1913: warning: format '%Z=
x'
expects type 'size_t', but argument 4 has type 'resource_size_t'

Even thought compilers seems to be of the same release:
# dpkg -l binutils\*
Desired=3DUnknown/Install/Remove/Purge/Hold
| Status=3DNot/Installed/Config-files/Unpacked/Failed-config/Half-install=
ed
|/ Err?=3D(none)/Hold/Reinst-required/X=3Dboth-problems (Status,Err: uppe=
rcase=3Dbad)
||/ Name                               Version                           =

Description
+++-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D-=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
ii  binutils                           2.17cvs20070718-1                 =
 The
GNU assembler, linker and binary utilities
ii  binutils-doc                       2.17cvs20070718-1                 =

Documentation for the GNU assembler, linker and binary utilities
ii  binutils-hppa64                    2.17cvs20070718-1                 =
 The
GNU assembler, linker and binary utilities targeted for hppa64-linux

# dpkg -l gcc-4.1\*
Desired=3DUnknown/Install/Remove/Purge/Hold
| Status=3DNot/Installed/Config-files/Unpacked/Failed-config/Half-install=
ed
|/ Err?=3D(none)/Hold/Reinst-required/X=3Dboth-problems (Status,Err: uppe=
rcase=3Dbad)
||/ Name                               Version                           =

Description
+++-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D-=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
ii  gcc-4.1                            4.1.2-14                          =
 The
GNU C compiler
ii  gcc-4.1-base                       4.1.2-14                          =
 The
GNU Compiler Collection (base package)
ii  gcc-4.1-doc                        4.1.1.nf3-1                       =

documentation for the GNU compilers (gcc, gobjc, g++)
ii  gcc-4.1-hppa64                     4.1.2-14                          =
 The
GNU C compiler (cross compiler for hppa64)

Tx,
    J.=0A---=0APack Scarlet One, ADSL 6 Mbps + Telephonie, a partir de EU=
R 29,95...=0Ahttp://www.scarlet.be/
