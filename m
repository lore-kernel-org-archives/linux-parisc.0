From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] small hw patch for n4k
Date: Thu, 18 Nov 2004 14:13:55 +0100
Message-ID: <418A8003000053BD@mail-1-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
To: parisc-linux@lists.parisc-linux.org
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

Hello pa*,

Is somebody could ci this small patch for n4k:
--- arch/parisc/kernel/hardware.c.ORIG	2004-06-07 08:18:42.000000000 +020=
0
+++ arch/parisc/kernel/hardware.c	2004-07-23 08:43:59.000000000 +0200
@@ -209,6 +209,7 @@
 	{HPHW_NPROC,0x5D0,0x4,0x81,"Kazoo W+"},
 	{HPHW_NPROC,0x5D1,0x4,0x91,"Forte W+ 2w"},
 	{HPHW_NPROC,0x5D2,0x4,0x91,"Forte W+ 4w"},
+	{HPHW_NPROC,0x5D3,0x0,0x91,"Prelude W+ 540"},
 	{HPHW_NPROC,0x5D3,0x4,0x91,"Prelude W+ 540"},
 	{HPHW_NPROC,0x5D4,0x4,0x91,"Duet W+"},
 	{HPHW_NPROC,0x5D5,0x4,0x91,"Crescendo 550"},
=3D=3D=3D=3D=3D=3D=3D=3D><=3D=3D=3D=3D=3D=3D=3D=3D

that help when 
# cat /proc/cpuinfo 
processor	: 0
cpu family	: PA-RISC 2.0
cpu		: PA8600 (PCX-W+)
cpu MHz		: 550.000000
model		: 9000/800/N4000-55
model name	: Unknown machine
hversion	: 0x00005d30
sversion	: 0x00000491
I-cache		: 512 KB
D-cache		: 1024 KB (WB, 0-way associative)
ITLB entries	: 160
DTLB entries	: 160 - shared with ITLB
bogomips	: 1093.63
software id	: 664309341

displayed "Unknown machine" as model name. will better (imo) display:
# cat /proc/cpuinfo 
processor	: 0
cpu family	: PA-RISC 2.0
cpu		: PA8600 (PCX-W+)
cpu MHz		: 550.000000
model		: 9000/800/N4000-55
model name	: Prelude W+ 540
hversion	: 0x00005d30
sversion	: 0x00000491
I-cache		: 512 KB
D-cache		: 1024 KB (WB, 0-way associative)
ITLB entries	: 160
DTLB entries	: 160 - shared with ITLB
bogomips	: 1093.63
software id	: 664309341

Thanks in advance,
    Joel


-------------------------------------------------------------------------=
--
Tiscali ADSL GO & Light, 2 mois gratuits, profitez-en...
http://reg.tiscali.be/adsl/welcome.asp?lg=3DFR




_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
