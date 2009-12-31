From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: [PATCH] PARISC: Simplify param.h by including
 <asm-generic/param.h>
Date: Thu, 31 Dec 2009 15:43:55 -0500 (EST)
Message-ID: <alpine.LFD.2.00.0912311543170.7139@localhost>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/arch/parisc/include/asm/param.h b/arch/parisc/include/asm/param.h
index 32e03d8..965d454 100644
--- a/arch/parisc/include/asm/param.h
+++ b/arch/parisc/include/asm/param.h
@@ -1,22 +1 @@
-#ifndef _ASMPARISC_PARAM_H
-#define _ASMPARISC_PARAM_H
-
-#ifdef __KERNEL__
-#define HZ		CONFIG_HZ
-#define USER_HZ		100		/* some user API use "ticks" */
-#define CLOCKS_PER_SEC	(USER_HZ)	/* like times() */
-#endif
-
-#ifndef HZ
-#define HZ 100
-#endif
-
-#define EXEC_PAGESIZE	4096
-
-#ifndef NOGROUP
-#define NOGROUP		(-1)
-#endif
-
-#define MAXHOSTNAMELEN	64	/* max length of hostname */
