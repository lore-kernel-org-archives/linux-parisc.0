Return-Path: <soete.joel@tiscali.be>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0820D489E
	for <parisc-linux@lists.parisc-linux.org>;
	Mon,  2 Feb 2004 11:31:18 -0700 (MST)
Date: Mon, 2 Feb 2004 18:50:49 +0100
Message-ID: <400CB8A10000A96E@ocpmta3.freegates.net>
In-Reply-To: <401530610000500D@ocpmta1.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] RE: [parisc-linux-cvs] linux-2.6 carlos
To: "Randolph Chung" <randolph@tausq.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: James Bottomley <James.Bottomley@steeleye.com>,
	Carlos O'Donell <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi Randolph,

Very sorry but it doesn't works :( 
(Sorry also if I couldn't help more: my knowledge of kernel internals is
still too limited :( )

Thanks for your attention,
    Joel

PS: btw I try to compare the dump of two .o files:
palx2000:/usr/src/linux-2.6.2-rc2-pa3/arch/parisc/kernel# diff -Nau head64.working.dmp
head64.orig.dmp 
--- head64.working.dmp	2004-02-02 19:39:05.295417088 +0100
+++ head64.orig.dmp	2004-02-02 19:34:56.138294728 +0100
@@ -62,39 +62,43 @@
   cc:	f0 66 0c 00 	depd r6,31,32,r3
   d0:	68 00 00 20 	stw r0,10(r0)
   d4:	68 00 00 50 	stw r0,28(r0)
-  d8:	73 cb 38 31 	std r11,-3e8(sp)
-  dc:	00 00 14 a2 	mfia rp
-  e0:	34 42 00 28 	ldo 14(rp),rp
-  e4:	f4 40 0c 00 	depdi 0,31,32,rp
-  e8:	e8 40 c0 00 	bv r0(rp)
-  ec:	02 00 0d 60 	ssm 200,r0
-  f0:	34 1a 00 2a 	ldi 15,r26
-  f4:	34 19 00 04 	ldi 2,r25
-  f8:	34 18 00 04 	ldi 2,r24
-  fc:	20 40 00 00 	ldil 0,rp
- 100:	34 42 00 00 	ldo 0(rp),rp
- 104:	e8 60 c0 00 	bv r0(r3)
- 108:	08 00 02 57 	copy r0,r23
+  d8:	37 c1 3e 01 	ldo -100(sp),r1
+  dc:	0c 20 10 c1 	ldd 0(,r1),r1
+  e0:	70 2b 0b 30 	std r11,598(r1)
+  e4:	00 00 14 a2 	mfia rp
+  e8:	34 42 00 28 	ldo 14(rp),rp
+  ec:	f4 40 0c 00 	depdi 0,31,32,rp
+  f0:	e8 40 c0 00 	bv r0(rp)
+  f4:	02 00 0d 60 	ssm 200,r0
+  f8:	34 1a 00 2a 	ldi 15,r26
+  fc:	34 19 00 04 	ldi 2,r25
+ 100:	34 18 00 04 	ldi 2,r24
+ 104:	20 40 00 00 	ldil 0,rp
+ 108:	34 42 00 00 	ldo 0(rp),rp
+ 10c:	e8 60 c0 00 	bv r0(r3)
+ 110:	08 00 02 57 	copy r0,r23
 
-000000000000010c <stext_pdc_ret>:
- 10c:	53 cb 38 31 	ldd -3e8(sp),r11
- 110:	00 00 18 20 	mtsp r0,sr0
- 114:	00 00 58 20 	mtsp r0,sr1
- 118:	00 00 98 20 	mtsp r0,sr2
- 11c:	00 00 d8 20 	mtsp r0,sr3
- 120:	01 00 18 40 	mtctl r0,pidr1
- 124:	01 20 18 40 	mtctl r0,pidr2
- 128:	01 80 18 40 	mtctl r0,pidr3
- 12c:	01 a0 18 40 	mtctl r0,pidr4
- 130:	20 20 02 00 	ldil 10000000,r1
- 134:	08 3e 06 3e 	add sp,r1,sp
- 138:	23 60 00 00 	ldil 0,dp
- 13c:	37 7b 00 00 	ldo 0(dp),dp
- 140:	21 40 00 00 	ldil 0,r10
- 144:	35 4a 00 00 	ldo 0(r10),r10
- 148:	01 ca 18 40 	mtctl r10,iva
- 14c:	e8 00 01 58 	b,l 200 <aligned_rfi>,r0
- 150:	08 00 02 40 	nop
+0000000000000114 <stext_pdc_ret>:
+ 114:	37 c1 3e 01 	ldo -100(sp),r1
+ 118:	0c 20 10 c1 	ldd 0(,r1),r1
+ 11c:	50 2b 0b 30 	ldd 598(r1),r11
+ 120:	00 00 18 20 	mtsp r0,sr0
+ 124:	00 00 58 20 	mtsp r0,sr1
+ 128:	00 00 98 20 	mtsp r0,sr2
+ 12c:	00 00 d8 20 	mtsp r0,sr3
+ 130:	01 00 18 40 	mtctl r0,pidr1
+ 134:	01 20 18 40 	mtctl r0,pidr2
+ 138:	01 80 18 40 	mtctl r0,pidr3
+ 13c:	01 a0 18 40 	mtctl r0,pidr4
+ 140:	20 20 02 00 	ldil 10000000,r1
+ 144:	08 3e 06 3e 	add sp,r1,sp
+ 148:	23 60 00 00 	ldil 0,dp
+ 14c:	37 7b 00 00 	ldo 0(dp),dp
+ 150:	21 40 00 00 	ldil 0,r10
+ 154:	35 4a 00 00 	ldo 0(r10),r10
+ 158:	01 ca 18 40 	mtctl r10,iva
+ 15c:	e8 00 01 38 	b,l 200 <aligned_rfi>,r0
+ 160:	08 00 02 40 	nop
 	...
 
 0000000000000200 <aligned_rfi>:
=========><=========

head64.working.dmp being the one which working (ie with mentioned reverted
patch)

head64.orig.dmp being the cvs one.

Do you noticed compiler error?

hth,
    Joel


-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr
