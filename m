Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 672004840
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 30 Dec 2003 13:15:07 -0700 (MST)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	hBUKF0a23497; Tue, 30 Dec 2003 15:15:01 -0500
From: James Bottomley <James.Bottomley@steeleye.com>
To: corbet@lwn.net, Andrew Morton <akpm@osdl.org>
Content-Type: text/plain
Date: 30 Dec 2003 14:14:59 -0600
Message-Id: <1072815300.2839.30.camel@mulgrave>
Mime-Version: 1.0
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
Subject: [parisc-linux] Fix for uninitialised variable in new seq_file code
	for arch/parisc/ikernel/rq.c
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

The compiler justly complains in this:

        unsigned int regnr = *(loff_t *) v, i;

        if (regnr == 0) {
                seq_puts(p, "     ");
#ifdef CONFIG_SMP
                for (i = 0; i < NR_CPUS; i++)
#endif
                        seq_printf(p, "      CPU%02d ", i);


That i is uninitialised if CONFIG_SMP is not set.

James

===== irq.c 1.20 vs edited =====
--- 1.20/arch/parisc/kernel/irq.c	Mon Dec 29 15:37:39 2003
+++ edited/irq.c	Tue Dec 30 14:12:43 2003
@@ -215,7 +215,7 @@
 int show_interrupts(struct seq_file *p, void *v)
 {
 #ifdef CONFIG_PROC_FS
-	unsigned int regnr = *(loff_t *) v, i;
+	unsigned int regnr = *(loff_t *) v, i = 0;
 
 	if (regnr == 0) {
 		seq_puts(p, "     ");
