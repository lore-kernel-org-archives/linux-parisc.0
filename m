From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH] parisc: migrate exception table users off module.h and onto extable.h
Date: Mon, 19 Sep 2016 18:04:51 -0400
Message-ID: <20160919220451.6074-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>,
        "James E.J. Bottomley" <jejb@parisc-linux.org>,
        Helge Deller <deller@gmx.de>, <linux-parisc@vger.kernel.org>
To: <linux-kernel@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This file was only including module.h for exception table related
functions.  We've now separated that content out into its own file
"extable.h" so now move over to that and avoid all the extra header
content in module.h that we don't really need to compile this file.

Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-parisc@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---

[see: https://lkml.org/lkml/2016/7/24/224 for additional context if needed]

 arch/parisc/mm/fault.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
index 163af2c31d76..a67519b79504 100644
--- a/arch/parisc/mm/fault.c
+++ b/arch/parisc/mm/fault.c
@@ -14,7 +14,7 @@
 #include <linux/ptrace.h>
 #include <linux/sched.h>
 #include <linux/interrupt.h>
-#include <linux/module.h>
+#include <linux/extable.h>
 #include <linux/uaccess.h>
 
 #include <asm/traps.h>
-- 
2.8.4

