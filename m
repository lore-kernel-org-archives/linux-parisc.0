Return-Path: <Soete.joel@tiscali.be>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 67A0F48B5
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 14 Apr 2004 05:58:30 -0600 (MDT)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by cpout2.tiscali.be with esmtp (Tiscali) id 1BDj2C-0007Ln-00
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 14 Apr 2004 13:58:28 +0200
Date: Wed, 14 Apr 2004 13:58:28 +0200
Message-ID: <40711E5500005BF8@ocpmta2.freegates.net>
From: "Joel Soete" <Soete.joel@tiscali.be>
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] 2.6.5-pa7 failled to build?
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi all,

I just try to recompile 2.6.5-pa7 32bit on my b2k and it failled with following
ld message:
[snip]
  gcc -Wp,-MD,drivers/usb/host/.ohci-hcd.o.d -nostdinc -iwithprefix include
-D__KERNEL__ -Iinclude  -D__KERNEL__ -Iinclude  -Wall -Wstrict-prototypes
-Wno-trigraphs -fno-strict-aliasing -fno-common -pipe -mno-space-regs -mfast-indirect-calls
-mdisable-fpregs -ffunction-sections -march=2.0 -mschedule=8000 -O2 -fomit-frame-pointer
    -DKBUILD_BASENAME=ohci_hcd -DKBUILD_MODNAME=ohci_hcd -c -o drivers/usb/host/ohci-hcd.o
drivers/usb/host/ohci-hcd.c
In file included from drivers/usb/host/ohci-hcd.c:135:
drivers/usb/host/ohci-dbg.c: In function `ohci_dump_td':
drivers/usb/host/ohci-dbg.c:282: warning: passing arg 1 of `__swab32p' discards
qualifiers from pointer target type
drivers/usb/host/ohci-dbg.c:284: warning: passing arg 1 of `__swab32p' discards
qualifiers from pointer target type
drivers/usb/host/ohci-dbg.c:309: warning: passing arg 1 of `__swab32p' discards
qualifiers from pointer target type
drivers/usb/host/ohci-dbg.c:310: warning: passing arg 1 of `__swab32p' discards
qualifiers from pointer target type
drivers/usb/host/ohci-dbg.c:320: warning: passing arg 1 of `__swab32p' discards
qualifiers from pointer target type
drivers/usb/host/ohci-dbg.c:320: warning: passing arg 1 of `__swab32p' discards
qualifiers from pointer target type
drivers/usb/host/ohci-dbg.c:324: warning: passing arg 1 of `__swab16p' discards
qualifiers from pointer target type
In file included from drivers/usb/host/ohci-hcd.c:135:
drivers/usb/host/ohci-dbg.c: In function `ohci_dump_ed':
drivers/usb/host/ohci-dbg.c:342: warning: passing arg 1 of `__swab32p' discards
qualifiers from pointer target type
drivers/usb/host/ohci-dbg.c:361: warning: passing arg 1 of `__swab32p' discards
qualifiers from pointer target type
drivers/usb/host/ohci-dbg.c:361: warning: passing arg 1 of `__swab32p' discards
qualifiers from pointer target type
   ld   -r -o drivers/usb/host/built-in.o drivers/usb/host/ohci-hcd.o
make -f scripts/Makefile.build obj=drivers/usb/image
   rm -f drivers/usb/image/built-in.o; ar rcs drivers/usb/image/built-in.o
Inconsistency detected by ld.so: dynamic-link.h: 164: elf_get_dynamic_info:
Assertion `info[9]->d_un.d_val == sizeof (Elf32_Rela)' failed!
make[3]: *** [drivers/usb/image/built-in.o] Error 127
make[2]: *** [drivers/usb/image] Error 2
make[1]: *** [drivers/usb] Error 2
make: *** [drivers] Error 2

This b2k is running a sid debian install with mainly:
# dpkg -l gcc binutils libc6
Desired=Unknown/Install/Remove/Purge/Hold
| Status=Not/Installed/Config-files/Unpacked/Failed-config/Half-installed
|/ Err?=(none)/Hold/Reinst-required/X=both-problems (Status,Err: uppercase=bad)
||/ Name                       Version                    Description
+++-==========================-==========================-====================================================================
ii  gcc                        3.3.3-2                    The GNU C compiler
ii  binutils                   2.14.90.0.7-6              The GNU assembler,
linker and binary utilities
ii  libc6                      2.3.2.ds1-11               GNU C Library:
Shared libraries and Timezone data

And my config file is nearly the c3k one:
# diff -Nau .config arch/parisc/configs/c3000_defconfig 
--- .config	2004-04-14 13:29:41.874241120 +0200
+++ arch/parisc/configs/c3000_defconfig	2004-04-08 12:38:54.000000000 +0200
@@ -70,14 +70,14 @@
 CONFIG_IOSAPIC=y
 CONFIG_IOMMU_SBA=y
 CONFIG_SUPERIO=y
-CONFIG_CHASSIS_LCD_LED=y
+# CONFIG_CHASSIS_LCD_LED is not set
 # CONFIG_PDC_CHASSIS is not set
 
 #
 # PCMCIA/CardBus support
 #
 CONFIG_PCMCIA=m
-# CONFIG_PCMCIA_DEBUG is not set
+CONFIG_PCMCIA_DEBUG=y
 CONFIG_YENTA=m
 CONFIG_CARDBUS=y
 # CONFIG_I82092 is not set
@@ -520,7 +520,8 @@
 #
 # Ethernet (10000 Mbit)
 #
-# CONFIG_IXGB is not set
+CONFIG_IXGB=y
+CONFIG_IXGB_NAPI=y
 # CONFIG_FDDI is not set
 # CONFIG_HIPPI is not set
 CONFIG_PPP=m

Any idea?

Joel

----------------------------------------------------------------------------------------
Tiscali ADSL: 35 €/mois, la meilleure offre du marché!
http://reg.tiscali.be/default.asp?lg=fr
