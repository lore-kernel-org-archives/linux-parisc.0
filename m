Return-Path: <pinotj@club-internet.fr>
Received: from relay-2v.club-internet.fr (relay-2v.club-internet.fr
	[194.158.96.113])
	by dsl2.external.hp.com (Postfix) with ESMTP id A80B848A2
	for <parisc-linux@parisc-linux.org>;
	Mon, 15 Mar 2004 06:53:06 -0700 (MST)
Received: from club-internet.fr (flashmail-5v.cs.clubint.net [172.16.0.156])
	by relay-2v.club-internet.fr (Postfix) with SMTP id 36D28168A
	for <parisc-linux@parisc-linux.org>;
	Mon, 15 Mar 2004 14:53:05 +0100 (CET)
From: pinotj@club-internet.fr
To: parisc-linux@parisc-linux.org
Date: Mon, 15 Mar 2004 14:53:05 CET
Mime-Version: 1.0
Message-Id: <mnet8.1079358785.20900.pinotj@club-internet.fr>
Content-Type: text/plain; charset=ISO-8859-1
Cc: 
Subject: [parisc-linux] [DOC] Linux 2.6.4
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi, =


I wrote this week-end a document to sum up all the arch that Linux 2.6.4 s=
upport. I extracted the informations from the source and I would like to h=
ave comments/changes/advice from you about the PA-RISC part. I have maybe =
make some mistake and/or things are little bit different so I would like y=
ou to take a look at this (I removed the non-PARISC parts, the complete fi=
le is around 11ko) before suggesting a patch. =


Thanks, =

(Please cc me) =


Jerome Pinot

diff -Nru -U 2 linux-2.6.4.orig/Documentation/ARCH linux-2.6.4/Documentati=
on/ARCH
--- linux-2.6.4.orig/Documentation/ARCH	1970-01-01 09:00:00.000000000 +090=
0
+++ linux-2.6.4/Documentation/ARCH	2004-03-15 16:20:06.000000000 +0900
=40=40 -0,0 +1,425 =40=40
+
+March 2004		Supported arch for Linux		v2.6.4
+			=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E
+
+
+The following is a quite complete list of all the arch supported by Linux=
=2E
+Of course, you will find here Alpha, ARM, ARM26, CRIS, H8300, i386, IA-64=
,
+M68000, MIPS, PA-RISC, PPC, S390, SH, SPARC, v850 and x86-64. But you wil=
l
+find too a complete list of CPUs and board supported by the kernel. For =

+each part, first list means =22board=22 and second one means =22CPU=22.
+
+
+ Content:
+ =7E=7E=7E=7E=7E=7E=7E=7E
+	1. i386		7. IA-64		13. S390
+	2. Alpha	8. M68K (w/o MMU)	14. SuperH
+	3. ARM		9. MIPS (32/64)		15. SPARC
+	4. ARM26	10. PA-RISC		16. UltraSPARC
+	5. CRIS		11. PPC			17. v850
+	6. H8300	12. PPC64		18. x86-64

=5Bsnip=5D

+ 10. PA-RISC
+ =7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E
+	PA7000/PA7100
+	PA7100LC/PA7300LC	(used in 712, 715/Mirage, A180, B132, C160L)
+	PA7200			(PCX-T' processor used in C110, D100 ...)
+	PA8000			(PCX-U to PCX-W2 processors)
+
+  (see Documentation/parisc)
+  <http://www.parisc-linux.org>

EOF
