Return-Path: <lamont@smallone.mmjgroup.com>
Received: from smallone.mmjgroup.com (smallone.mmjgroup.com [192.34.35.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id AD2DF487E
	for <parisc-linux@parisc-linux.org>;
	Sat, 13 Mar 2004 10:27:05 -0700 (MST)
Date: Sat, 13 Mar 2004 10:27:03 -0700
To: parisc-linux@parisc-linux.org
Message-ID: <20040313172703.GA22696@smallone.mmjgroup.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="huq684BweRXVnRxX"
From: lamont@smallone.mmjgroup.com (LaMont Jones)
Cc: lamont@mmjgroup.com
Subject: [parisc-linux] real2.S patch
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any objections to this patch?  It removes a duplicated calculation,
and has the added advantage of surviving my woody build environment...

lamont

--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=zz

Index: arch/parisc/kernel/real2.S
===================================================================
RCS file: /var/cvs/linux-2.4/arch/parisc/kernel/real2.S,v
retrieving revision 1.8
diff -u -r1.8 real2.S
--- a/arch/parisc/kernel/real2.S	18 Sep 2003 16:09:09 -0000	1.8
+++ b/arch/parisc/kernel/real2.S	13 Mar 2004 17:25:38 -0000
@@ -32,6 +32,7 @@
 
 save_cr_space:
 	.block	REG_SZ * N_SAVED_REGS
+save_cr_end:
 
 
 /************************ 32-bit real-mode calls ***********************/
@@ -129,7 +130,7 @@
 	nop
 
 restore_control_regs:
-	load32	PA(save_cr_space+(N_SAVED_REGS*REG_SZ)), %r26
+	load32	PA(save_cr_end), %r26
 	POP_CR(%cr15, %r26)
 	POP_CR(%cr31, %r26)
 	POP_CR(%cr30, %r26)

--huq684BweRXVnRxX--
