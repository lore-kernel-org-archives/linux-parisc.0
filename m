From: Rusty Russell <rusty@rustcorp.com.au>
Subject: [PATCH 5/12] arch/parisc: remove references to cpu_*_map.
Date: Wed, 15 Feb 2012 15:28:04 +1030
Message-ID: <1329281884.9242.rusty@rustcorp.com.au>
Cc: linux-kernel@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	linux-parisc@vger.kernel.org
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

From: Rusty Russell <rusty@rustcorp.com.au>

This has been obsolescent for a while; time for the final push.

Signed-off-by: Rusty Russell <rusty@rustcorp.com.au>
Cc: Kyle McMartin <kyle@mcmartin.ca>
Cc: Helge Deller <deller@gmx.de>
Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>
Cc: linux-parisc@vger.kernel.org
---
 arch/parisc/kernel/smp.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
--- a/arch/parisc/kernel/smp.c
+++ b/arch/parisc/kernel/smp.c
@@ -291,8 +291,7 @@ smp_cpu_init(int cpunum)
 	mb();
 
 	/* Well, support 2.4 linux scheme as well. */
-	if (cpu_isset(cpunum, cpu_online_map))
-	{
+	if (cpu_online(cpunum))	{
 		extern void machine_halt(void); /* arch/parisc.../process.c */
 
 		printk(KERN_CRIT "CPU#%d already initialized!\n", cpunum);
