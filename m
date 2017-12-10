From: Pravin Shedge <pravin.shedge4linux@gmail.com>
Subject: [PATCH 37/45] arch/parisc: remove duplicate includes
Date: Sun, 10 Dec 2017 23:54:33 +0530
Message-ID: <1512930273-4711-1-git-send-email-pravin.shedge4linux@gmail.com>
Cc: linux-kernel@vger.kernel.org, pravin.shedge4linux@gmail.com
To: jejb@parisc-linux.org, deller@gmx.de, tglx@linutronix.de,
        gregkh@linuxfoundation.org, pombredanne@nexb.com,
        kstewart@linuxfoundation.org, linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

These duplicate includes have been found with scripts/checkincludes.pl but
they have been removed manually to avoid removing false positives.

Signed-off-by: Pravin Shedge <pravin.shedge4linux@gmail.com>
---
 arch/parisc/kernel/unwind.c | 1 -
 arch/parisc/lib/delay.c     | 2 --
 2 files changed, 3 deletions(-)

diff --git a/arch/parisc/kernel/unwind.c b/arch/parisc/kernel/unwind.c
index 5a65798..143f90e 100644
--- a/arch/parisc/kernel/unwind.c
+++ b/arch/parisc/kernel/unwind.c
@@ -15,7 +15,6 @@
 #include <linux/slab.h>
 #include <linux/kallsyms.h>
 #include <linux/sort.h>
-#include <linux/sched.h>
 
 #include <linux/uaccess.h>
 #include <asm/assembly.h>
diff --git a/arch/parisc/lib/delay.c b/arch/parisc/lib/delay.c
index 7eab4bb..66e5065 100644
--- a/arch/parisc/lib/delay.c
+++ b/arch/parisc/lib/delay.c
@@ -16,9 +16,7 @@
 #include <linux/preempt.h>
 #include <linux/init.h>
 
-#include <asm/processor.h>
 #include <asm/delay.h>
