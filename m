Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from irongate.swansea.linux.org.uk (pc2-cwma1-5-cust12.swa.cable.ntl.com [80.5.121.12])
	by dsl2.external.hp.com (Postfix) with ESMTP id 82E2348B0
	for <parisc-linux@parisc-linux.org>; Tue, 16 Jul 2002 08:01:08 -0600 (MDT)
Received: from irongate.swansea.linux.org.uk (localhost [127.0.0.1])
	by irongate.swansea.linux.org.uk (8.12.2/8.11.6) with ESMTP id g6GFBTu6002851
	for <parisc-linux@parisc-linux.org>; Tue, 16 Jul 2002 16:11:30 +0100
Received: (from alan@localhost)
	by irongate.swansea.linux.org.uk (8.12.2/8.12.2/Submit) id g6GFBTb2002849;
	Tue, 16 Jul 2002 16:11:29 +0100
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: HPPA List <parisc-linux@parisc-linux.org>
Content-Type: text/plain
Date: 16 Jul 2002 16:11:28 +0100
Message-Id: <1026832288.1687.57.camel@irongate.swansea.linux.org.uk>
Mime-Version: 1.0
Subject: [parisc-linux] Merge error in pa55 tree ??
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


diff -u --new-file --recursive --exclude-from /usr/src/exclude
linux.vanilla/ar
--- linux.vanilla/arch/ia64/kernel/perfmon.c    Fri Nov  9 22:26:17 2001
+++ linux-hppa/arch/ia64/kernel/perfmon.c       Wed Aug 15 18:07:26 2001
@@ -38,7 +38,7 @@  
 
 #ifdef CONFIG_PERFMON
 
-#define PFM_VERSION            "0.3"
+#define PFM_VERSION            "0.2"
 #define PFM_SMPL_HDR_VERSION   1
 
 #define PMU_FIRST_COUNTER      4       /* first generic counter */
@@ -52,7 +52,6 @@
 #define PFM_DISABLE            0xa6    /* freeze only */
 #define PFM_RESTART            0xcf
 #define PFM_CREATE_CONTEXT     0xa7
