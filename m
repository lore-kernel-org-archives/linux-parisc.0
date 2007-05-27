From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] [PATCH] [PARISC] fix section mismatch in smp.c
Date: Mon, 28 May 2007 00:26:02 +0200
Message-ID: <200705280026.03015.deller__8616.90736278451$1416624375$gmane$org@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

[PARISC] fix section mismatch for smp_boot_one_cpu:
WARNING: arch/parisc/kernel/built-in.o(.text.__cpu_up+0x20): Section mismatch: reference to .init.text:smp_boot_one_cpu (after '__cpu_up')

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
index 4bf7cd1..04c7e1d 100644
--- a/arch/parisc/kernel/smp.c
+++ b/arch/parisc/kernel/smp.c
@@ -461,7 +461,7 @@ void __init smp_callin(void)
 /*
  * Bring one cpu online.
  */
-int __init smp_boot_one_cpu(int cpuid)
+int __cpuinit smp_boot_one_cpu(int cpuid)
 {
 	struct task_struct *idle;
 	long timeout;
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
