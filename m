From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] 2.6.9-bk6-pa1 DISCONTIGMEM need help!
Date: Fri, 22 Oct 2004 18:38:15 +0200
Message-ID: <4161760000005B0B@mail-8-bnl.mail.tiscali.sys>
References: <20041021181110.GG16153@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
To: "Matthew Wilcox" <matthew@wil.cx>,
 parisc-linux@parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041021181110.GG16153@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Matthew,

This kernel 32bits :) boot fine on my b2k (btw did you have the opportuni=
ty
to find what went wrong on your c3k?)

I also want to build it for my n4k which need DISCONTIGMEM and I encounte=
r
following build pb:
  hppa64-linux-gcc -Wp,-MD,arch/parisc/mm/.init.o.d -nostdinc -iwithprefi=
x
include -D__KERNEL__ -Iinclude  -Wall -Wstrict-prototypes -Wno-trigraphs
-fno-strict-aliasing -fno-common -O2 -fomit-frame-pointer  -pipe -mno-spa=
ce-regs
-mfast-indirect-calls -ffunction-sections -march=3D2.0 -mschedule=3D8000 =
  
-DKBUILD_BASENAME=3Dinit -DKBUILD_MODNAME=3Dinit -c -o arch/parisc/mm/ini=
t.o
arch/parisc/mm/init.c
arch/parisc/mm/init.c: In function `setup_bootmem':
arch/parisc/mm/init.c:274: warning: implicit declaration of function `nod=
e_set_online'

it seems that it required the same change as for other arches; somthing
like:
--- arch/parisc/mm/init.c.orig	2004-10-22 18:14:39.651683442 +0200
+++ arch/parisc/mm/init.c	2004-10-22 18:13:15.553956857 +0200
@@ -13,6 +13,7 @@
 
 #include <linux/module.h>
 #include <linux/mm.h>
+#include <linux/nodemask.h>
 #include <linux/bootmem.h>
 #include <linux/delay.h>
 #include <linux/init.h>
=3D=3D=3D=3D=3D=3D><=3D=3D=3D=3D=3D=3D

Thanks in advance to ci (if ok for everybody obviously :) ),
    Joel


-------------------------------------------------------------------------=
--
Tiscali ADSL GO & Light, 2 mois gratuits, profitez-en...
http://reg.tiscali.be/adsl/welcome.asp?lg=3DFR




_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
