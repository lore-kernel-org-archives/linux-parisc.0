Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from covert.brown-ring.iadfw.net (covert.black-ring.iadfw.net [209.196.123.142])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9EC2B48ED
	for <parisc-linux@parisc-linux.org>; Sat, 25 Oct 2003 09:51:14 -0600 (MDT)
Received: from pppte02-536.ght.iadfw.net ([66.94.130.28] helo=pcdebian)
	by covert.iadfw.net with esmtp (Exim 4.10)
	id 1ADQi6-0004lH-00
	for parisc-linux@parisc-linux.org; Sat, 25 Oct 2003 10:52:14 -0500
From: "Art Haas" <ahaas@airmail.net>
Date: Sat, 25 Oct 2003 10:51:07 -0500
To: parisc-linux@parisc-linux.org, Matthew Wilcox <matthew@wil.cx>,
	Grant Grundler <grundler@parisc-linux.org>
Cc: linux-kernel@vger.kernel.org
Message-ID: <20031025155107.GA2718@artsapartment.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [PATCH] C99 cleanup in kernel/sysctl.c
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

Hi.

Looking at the file kernel/sysctl.c I saw this HP-PA specfic block of
code. Here's an untested patch to format the code with C99 named
initializers.

Art Haas

===== kernel/sysctl.c 1.55 vs edited =====
--- 1.55/kernel/sysctl.c	Thu Oct  2 02:12:07 2003
+++ edited/kernel/sysctl.c	Sat Oct 25 10:45:03 2003
@@ -336,10 +336,22 @@
 	},
 #endif
 #ifdef __hppa__
-	{KERN_HPPA_PWRSW, "soft-power", &pwrsw_enabled, sizeof (int),
-	 0644, NULL, &proc_dointvec},
-	{KERN_HPPA_UNALIGNED, "unaligned-trap", &unaligned_enabled, sizeof (int),
-	 0644, NULL, &proc_dointvec},
+	{
+		.ctl_name	= KERN_HPPA_PWRSW,
+		.procname	= "soft-power",
+		.data		= &pwrsw_enabled,
+		.maxlen		= sizeof (int),
+	 	.mode		= 0644,
+		.proc_handler	= &proc_dointvec,
+	},
+	{
+		.ctl_name	= KERN_HPPA_UNALIGNED,
+		.procname	= "unaligned-trap",
+		.data		= &unaligned_enabled,
+		.maxlen		= sizeof (int),
+		.mode		= 0644,
+		.proc_handler	= &proc_dointvec,
+	},
 #endif
 #if defined(CONFIG_PPC32) && defined(CONFIG_6xx)
 	{
-- 
Man once surrendering his reason, has no remaining guard against absurdities
the most monstrous, and like a ship without rudder, is the sport of every wind.

-Thomas Jefferson to James Smith, 1822
