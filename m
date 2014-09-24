From: Nicholas Krause <yocto6@gmail.com>
Subject: [PATCH] parisc:Remove unnecessary FIXMES in init.c
Date: Tue, 23 Sep 2014 21:49:43 -0400
Message-ID: <1411523383-9820-1-git-send-email-yocto6@gmail.com>
Cc: deller@gmx.de, akpm@linux-foundation.org, mgorman@suse.de,
	julia.lawall@lip6.fr, himangi774@gmail.com,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: jejb@parisc-linux.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This removes the two fixmes in the file, init.c for compiler hints
for comments related to compiler hints in linux_gateway_page_addr
and map_hpux_gateway_page to change from FIXME to HINT in order
for people reading this code to understand that these are compiler
hints.

Signed-off-by: Nicholas Krause <yocto6@gmail.com>
---
 arch/parisc/mm/init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index 0bef864..668102e 100644
--- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -733,7 +733,7 @@ static void __init pagetable_init(void)
 static void __init gateway_init(void)
 {
 	unsigned long linux_gateway_page_addr;
-	/* FIXME: This is 'const' in order to trick the compiler
+	/* HINT: This is 'const' in order to trick the compiler
 	   into not treating it as DP-relative data. */
 	extern void * const linux_gateway_page;
 
@@ -761,7 +761,7 @@ map_hpux_gateway_page(struct task_struct *tsk, struct mm_struct *mm)
 	unsigned long start_pte;
 	unsigned long address;
 	unsigned long hpux_gw_page_addr;
-	/* FIXME: This is 'const' in order to trick the compiler
+	/* HINT: This is 'const' in order to trick the compiler
 	   into not treating it as DP-relative data. */
 	extern void * const hpux_gateway_page;
 
-- 
1.9.1

