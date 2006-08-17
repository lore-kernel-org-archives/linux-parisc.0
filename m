From: "Joel Soete" <soete.joel@scarlet.be>
Subject: [parisc-linux] A small patch about Serial Mux availability for D
	class remote control card.
Date: Thu, 17 Aug 2006 12:19:44 +0200
Message-ID: <J450OW$880D1F7554C9CF9EF935A4C7BB4ACCD6@scarlet.be>
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

Hi all,

May I suggest a small patch mentioning that the 'remote control card of D=

class also works thanks to this serial mux driver, something like:
--- ./drivers/serial/Kconfig.Orig       2006-08-17 12:09:06.000000000 +02=
00
+++ ./drivers/serial/Kconfig    2006-08-17 12:13:44.000000000 +0200
@@ -556,10 +556,11 @@
        default y
        ---help---
          Saying Y here will enable the hardware MUX serial driver for
-         the Nova and K class systems.  The hardware MUX is not 8250/165=
50
-         compatible therefore the /dev/ttyB0 device is shared between th=
e
-         Serial MUX and the PDC software console.  The following steps
-         need to be completed to use the Serial MUX:
+         the Nova, K class systems and D class with a 'remote control ca=
rd'.
+         The hardware MUX is not 8250/16550 compatible therefore
+         the /dev/ttyB0 device is shared between the Serial MUX and the =
PDC
+         software console.
+         The following steps need to be completed to use the Serial MUX:=


            1. create the device entry (mknod /dev/ttyB0 c 11 0)
            2. Edit the /etc/inittab to start a getty listening on /dev/t=
tyB0
=3D=3D=3D=3D<>=3D=3D=3D=3D

TIA,
    Joel=0A=0A----------=0AClub Scarlet : Tout le monde gagne! Si vous de=
venez aujourd'hui Scarlet One grace a un client existant de Scarlet, vous=
 recevez tous les deux un cadeau d'une valeur de 50 euros! Surfez vite su=
r http://www.clubscarlet.be

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
