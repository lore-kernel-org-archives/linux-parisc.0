From: "Joel Soete" <soete.joel@scarlet.be>
Subject: [parisc-linux] tulip de2104c warning build cleanup
Date: Mon, 25 Sep 2006 13:36:46 +0200
Message-ID: <J65C9A$807CC8EE6E6E93979D00084910013AEB@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
To: "parisc-linux" <parisc-linux@lists.parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello,

this was just a warning at build time:
  hppa64-linux-gnu-gcc -Wp,-MD,drivers/net/tulip/.de2104x.o.d  -nostdinc
-isystem /usr/lib/gcc/hppa64-linux-gnu/4.1.2/include -D__KE
RNEL__ -Iinclude -Iinclude2 -I/CAD/linux-2.6.18-pa0-20060925/include -inc=
lude
include/linux/autoconf.h -I/CAD/linux-2.6.18-pa0-20060
925/drivers/net/tulip -Idrivers/net/tulip -Wall -Wundef -Wstrict-prototyp=
es
-Wno-trigraphs -fno-strict-aliasing -fno-common -O2 -pip
e -mno-space-regs -mfast-indirect-calls -mdisable-fpregs -ffunction-secti=
ons
-march=3D2.0 -mschedule=3D8000 -fomit-frame-pointer -fno-st
ack-protector -Wdeclaration-after-statement -Wno-pointer-sign 
-D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(de2104x)"  -D"KBUI=

LD_MODNAME=3DKBUILD_STR(de2104x)" -c -o drivers/net/tulip/de2104x.o
/CAD/linux-2.6.18-pa0-20060925/drivers/net/tulip/de2104x.c
/CAD/linux-2.6.18-pa0-20060925/drivers/net/tulip/de2104x.c:2086: warning:=

'de_remove_one' defined but not used

which seems to be clean with:
--- drivers/net/tulip/de2104x.c 2006-09-18 10:45:14.000000000 +0200
+++ drivers/net/tulip/de2104x.c.New     2006-09-25 12:20:36.000000000 +02=
00
@@ -2160,7 +2160,7 @@
        .name           =3D DRV_NAME,
        .id_table       =3D de_pci_tbl,
        .probe          =3D de_init_one,
-       .remove         =3D __exit_p(de_remove_one),
+       .remove         =3D __devexit_p(de_remove_one),
 #ifdef CONFIG_PM
        .suspend        =3D de_suspend,
        .resume         =3D de_resume,

hth,
    Joel=0A=0A----------=0AClub Scarlet : Tout le monde gagne! Si vous de=
venez aujourd'hui Scarlet One grace a un client existant de Scarlet, vous=
 recevez tous les deux un cadeau d'une valeur de 50 euros! Surfez vite su=
r http://www.clubscarlet.be

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
