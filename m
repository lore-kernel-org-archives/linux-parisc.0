Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smallone.fc.hp.com (smallone.fc.hp.com [192.25.206.249])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2EFFB4845
	for <parisc-linux@parisc-linux.org>; Thu,  2 Oct 2003 15:10:49 -0600 (MDT)
Date: Thu, 2 Oct 2003 15:10:48 -0600
To: parisc-linux@parisc-linux.org
Cc: lamont@hp.com
Message-ID: <20031002211048.GA819@smallone.fc.hp.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="YiEDa0DAkWCtVeE4"
From: lamont@smallone.fc.hp.com (LaMont Jones)
Subject: [parisc-linux] unaligned.c oops
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following patch should make the unaligned handler work better.
(float ops were miscoded...)

lamont

--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="unaligned.diff"

Index: unaligned.c
===================================================================
RCS file: /var/cvs/linux-2.4/arch/parisc/kernel/unaligned.c,v
retrieving revision 1.21
diff -u -r1.21 unaligned.c
--- unaligned.c	23 Sep 2003 20:15:33 -0000	1.21
+++ unaligned.c	2 Oct 2003 21:09:02 -0000
@@ -93,13 +93,17 @@
 #define OPCODE_STDA	OPCODE1(0x03,1,0xf)
 
 #define OPCODE_FLDWX	OPCODE1(0x09,0,0x0)
-#define OPCODE_FSTWX	OPCODE1(0x09,0,0x4)
+#define OPCODE_FLDWXR	OPCODE1(0x09,0,0x1)
+#define OPCODE_FSTWX	OPCODE1(0x09,0,0x8)
+#define OPCODE_FSTWXR	OPCODE1(0x09,0,0x9)
 #define OPCODE_FLDWS	OPCODE1(0x09,1,0x0)
-#define OPCODE_FSTWS	OPCODE1(0x09,1,0x4)
+#define OPCODE_FLDWSR	OPCODE1(0x09,1,0x1)
+#define OPCODE_FSTWS	OPCODE1(0x09,1,0x8)
+#define OPCODE_FSTWSR	OPCODE1(0x09,1,0x9)
 #define OPCODE_FLDDX	OPCODE1(0x0b,0,0x0)
-#define OPCODE_FSTDX	OPCODE1(0x0b,0,0x4)
+#define OPCODE_FSTDX	OPCODE1(0x0b,0,0x8)
 #define OPCODE_FLDDS	OPCODE1(0x0b,1,0x0)
-#define OPCODE_FSTDS	OPCODE1(0x0b,1,0x4)
+#define OPCODE_FSTDS	OPCODE1(0x0b,1,0x8)
 
 #define OPCODE_LDD_L	OPCODE2(0x14,0)
 #define OPCODE_FLDD_L	OPCODE2(0x14,1)
@@ -541,6 +545,8 @@
 
 	case OPCODE_FLDWX:
 	case OPCODE_FLDWS:
+	case OPCODE_FLDWXR:
+	case OPCODE_FLDWSR:
 		flop=1;
 		ret = emulate_ldw(regs,FR3(regs->iir),1);
 		break;
@@ -553,6 +559,8 @@
 
 	case OPCODE_FSTWX:
 	case OPCODE_FSTWS:
+	case OPCODE_FSTWXR:
+	case OPCODE_FSTWSR:
 		flop=1;
 		ret = emulate_stw(regs,FR3(regs->iir),1);
 		break;

--YiEDa0DAkWCtVeE4--
