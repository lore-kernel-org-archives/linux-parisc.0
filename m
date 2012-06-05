From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: [PATCH 1/3] fix missing TAINT_WARN problem
Date: Tue, 05 Jun 2012 13:52:03 +0900
Message-ID: <1338871923.5176.9.camel@dabdike>
References: <1338871679.5176.7.camel@dabdike>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Al Viro <viro@zeniv.linux.org.uk>
To: Parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1338871679.5176.7.camel@dabdike>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

>From ad71a7070fd5912420c443b020c6cf796518f3e9 Mon Sep 17 00:00:00 2001
From: James Bottomley <James.Bottomley@HansenPartnership.com>
Date: Sun, 3 Jun 2012 01:49:32 -0700
Subject: fix missing TAINT_WARN problem

Al viro broke us with

commit edd63a2763bdae0daa4f0a4d4c5d61d1154352a5
Author: Al Viro <viro@zeniv.linux.org.uk>
Date:   Fri Apr 27 13:42:45 2012 -0400

    set_restore_sigmask() is never called without SIGPENDING (and never should be)

Although it's pretty much our fault since parisc's asm/bug.h uses
BUGWARN_TAINT but doesn't include the file that defines it.  Fix that.
---
 arch/parisc/include/asm/bug.h |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/parisc/include/asm/bug.h b/arch/parisc/include/asm/bug.h
index 72cfdb0..62a3333 100644
--- a/arch/parisc/include/asm/bug.h
+++ b/arch/parisc/include/asm/bug.h
@@ -1,6 +1,8 @@
 #ifndef _PARISC_BUG_H
 #define _PARISC_BUG_H
 
+#include <linux/kernel.h>	/* for BUGFLAG_TAINT */
+
 /*
  * Tell the user there is some problem.
  * The offending file and line are encoded in the __bug_table section.
-- 
1.7.4.1



