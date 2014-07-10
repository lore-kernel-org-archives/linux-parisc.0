From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: drop unused defines and header includes
Date: Thu, 10 Jul 2014 18:08:11 +0200
Message-ID: <20140710160811.GA14195@ls3530.dhcp.wdf.sap.corp>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/sys_parisc32.c b/arch/parisc/kernel/sys_parisc32.c
index bb9f3b6..93c1963 100644
--- a/arch/parisc/kernel/sys_parisc32.c
+++ b/arch/parisc/kernel/sys_parisc32.c
@@ -11,44 +12,8 @@
 
 #include <linux/compat.h>
 #include <linux/kernel.h>
-#include <linux/sched.h>
-#include <linux/fs.h> 
-#include <linux/mm.h> 
-#include <linux/file.h> 
-#include <linux/signal.h>
-#include <linux/resource.h>
-#include <linux/times.h>
-#include <linux/time.h>
-#include <linux/smp.h>
-#include <linux/sem.h>
-#include <linux/shm.h>
-#include <linux/slab.h>
-#include <linux/uio.h>
-#include <linux/ncp_fs.h>
-#include <linux/poll.h>
-#include <linux/personality.h>
-#include <linux/stat.h>
-#include <linux/highmem.h>
-#include <linux/highuid.h>
-#include <linux/mman.h>
-#include <linux/binfmts.h>
-#include <linux/namei.h>
-#include <linux/vfs.h>
-#include <linux/ptrace.h>
-#include <linux/swap.h>
 #include <linux/syscalls.h>
 
-#include <asm/types.h>
-#include <asm/uaccess.h>
-#include <asm/mmu_context.h>
-
-#undef DEBUG
