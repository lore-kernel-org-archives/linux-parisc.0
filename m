Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 96A52482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 19 May 2001 18:46:17 -0600 (MDT)
Received: (from grundler@localhost)
	by puffin.external.hp.com (8.9.3/8.9.3) id SAA07638
	for parisc-linux@lists.parisc-linux.org; Sat, 19 May 2001 18:39:19 -0600
Date: Sat, 19 May 2001 18:39:19 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
Message-Id: <200105200039.SAA07638@puffin.external.hp.com>
To: parisc-linux@lists.parisc-linux.org
Subject: [parisc-linux] [PATCH] IRQ cycle counts
List-ID: <linux-parisc.vger.kernel.org>

Hi!

The patch basically enables one to see min/avg/max cycle counts for the
256 most recent invocations for a given Interrupt handler. See the
sample output at the bottom.

The goal of dumping the min/avg/max cycle counts is two fold:
a) measure CPU IRQ load and later for IRQ "load" balancing.
   Unlike x86 or IA64, on SMP PARISC boxes the IRQ gets processed
   on the same CPU once the IRQ handling is initialized.
   More on this below.

b) Device Driver writers can precisely determine if changes are helping
  or hurting IRQ performance at a low level.  I.E. they can tune their
  code to have fewer branches, cachline misses, PIO (eg inb()) and see
  the results easily. This type of tuning helps all arches.

I'm posting this patch here (vs pairsc-linux-cvs) for discussion to
resolve several issues that I didn't feel I have good answers for:

1) Should this always be enabled? Or only via CONFIG_PARISC_IRQ_CYCLE_COUNTS?
   This is critical only because I have a change in an arch generic file.
   (include/linux/interrupt.h) I believe this instrumentation is very
   "light weight" - but it's optional and irrelevant to most users.
   And I don't know which other arches have similar cycle counting
   functionality.

2) How should CONFIG_SMP change the output?

   CONFIG_SMP changes the /proc/interrupts output to show "per CPU" IRQ
   counts (not cycle counts).  However, unlike x86 or IA64, PARISC arch
   always points the IRQ to the same CPU once it's initialized (under SW
   control, it could be moved later but we haven't implemented that yet).
   The IRQ load can *only* be distributed by assigning different "agents"
   (eg IO Sapic input IRQ line) to a different CPU (see bug #57).  In short,
   only one CPU will have a non-zero count.

   We could use the space for min/avg/max cycle counts. But I don't know
   if user tools consume /proc/interrupts directly for munging and if output
   is "architected".  Thoughts on that?

   Oh - and the CONFIG_SMP output format doesn't "scale" well beyond
   4 or so CPUs on an 80char wide xterm since it tries to put it all on
   one line. I could make the xterm wider but eventually we hit a limit.

2) How to display shared IRQ line data for both sym53c8xx handlers?
   Sample output below only shows the first one (I think) for IRQ #130.
   Data for both handlers is collected.

3) Format of /proc/interrupts : "%6d/%6d/%6d" for min/avg/max ok?
   I'm not too happy with "%6d/" stuff and looking for better ideas.

   Note that /proc/interrupt looks different for systems with
   Dino (GSCtoPCI) or GSC devices (eg Zalon SCSI). There are fewer
   entries in the "PA-CPU-00" "level".

   I made the exist format by modeling it after x86 as best I could.
   min/avg/max cycle counts really break that.


thanks,
grant

------------ Sample output (taken from A500 running my patch) -----------

[ The patch has a "bug" in that it counts *all* entrys in
the history buffer (256 entries) instead of just the non-zero ones.
I'll fix that. I just wanted to get the "output format" discussion
started. ]

grundler@gsyprf11:~$ cat /proc/interrupts 
            IRQ count 
 64:    5600708    660/   740/  6304       PA-CPU-00  timer
 65:     272044   3285/  5102/ 24355       PA-CPU-00  IO-SAPIC00-L0
 66:         30      0/   709/  6707       PA-CPU-00  IO-SAPIC00-L1
 67:          0      0/     0/     0       PA-CPU-00  IO-SAPIC00-L2
 68:         60      0/  1640/ 18089       PA-CPU-00  IO-SAPIC00-L2
 69:      19320   4114/  9050/ 33202       PA-CPU-00  IO-SAPIC00-L3
 70:         10      0/   439/ 14382       PA-CPU-00  IO-SAPIC00-L4
 71:          0      0/     0/     0       PA-CPU-00  IO-SAPIC00-L5
 72:          0      0/     0/     0       PA-CPU-00  IO-SAPIC01-L0
 73:        315   5957/  6768/ 12509       PA-CPU-00  IO-SAPIC02-L0
 74:          0      0/     0/     0       PA-CPU-00  IO-SAPIC02-L1
 75:          0      0/     0/     0       PA-CPU-00  IO-SAPIC02-L2
 76:          0      0/     0/     0       PA-CPU-00  IO-SAPIC02-L3
 77:         70      0/1924923/65678155       PA-CPU-00  IO-SAPIC03-L0
 78:         30      0/   693/  8152       PA-CPU-00  IO-SAPIC03-L1
128:     272044   3193/  4879/ 21878      IO-SAPIC00  eth0
129:         30      0/   698/  6517      IO-SAPIC00  sym53c8xx
130:         60      0/   824/ 16161      IO-SAPIC00  sym53c8xx, sym53c8xx
131:      19320   4030/  8649/ 30999      IO-SAPIC00  sym53c8xx
132:         10      0/   432/ 13772      IO-SAPIC00  serial
256:        315   5758/  6382/ 11331      IO-SAPIC02  eth1
320:         70      0/1924884/65678065      IO-SAPIC03  sym53c8xx
321:         30      0/   679/  7302      IO-SAPIC03  sym53c8xx



Index: include/linux/interrupt.h
===================================================================
RCS file: /home/cvs/parisc/linux/include/linux/interrupt.h,v
retrieving revision 1.5
diff -u -p -r1.5 interrupt.h
--- interrupt.h	2000/08/18 01:53:14	1.5
+++ interrupt.h	2001/05/19 07:12:33
@@ -18,6 +18,14 @@ struct irqaction {
 	const char *name;
 	void *dev_id;
 	struct irqaction *next;
+
+/* HACK: ggg PARISC_IRQ_CR16_COUNTS in arch/parisc/kernel/irq.c */
+#ifdef __hppa__
+#define PARISC_CR16_HIST_SIZE	256
+	/* Only store the delta here - would otherwise need to be long */
+	unsigned int cr16_hist[PARISC_CR16_HIST_SIZE];	/* for avging */
+	unsigned int cr16_idx;
+#endif
 };
 
 
Index: arch/parisc/kernel/irq.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/irq.c,v
retrieving revision 1.38
diff -u -p -r1.38 irq.c
--- irq.c	2001/03/31 07:40:10	1.38
+++ irq.c	2001/05/19 07:12:33
@@ -42,6 +42,7 @@
 #include <asm/cache.h>
 
 #undef DEBUG_IRQ
+#define PARISC_IRQ_CR16_COUNTS
 
 extern void timer_interrupt(int, void *, struct pt_regs *);
 #ifdef CONFIG_SMP
@@ -205,6 +206,24 @@ int get_irq_list(char *buf)
 		    p += sprintf(p, "%10u ",
 			    kstat.irqs[cpu_logical_map(j)][irq_no]);
 #endif
+
+#ifdef PARISC_IRQ_CR16_COUNTS
+		/* min/avg/max of cr16_hist[] */
+		{
+			unsigned int i = 0, avg = 0, min, max;
+
+		        min = max = action->cr16_hist[0];
+
+			for (i = 0; i < PARISC_CR16_HIST_SIZE; i++) {
+				avg += action->cr16_hist[i];
+				if (action->cr16_hist[i] > max) max = action->cr16_hist[i];
+				if (action->cr16_hist[i] < min) min = action->cr16_hist[i];
+			}
+
+			avg /= PARISC_CR16_HIST_SIZE;
+			p += sprintf(p, "%6d/%6d/%6d ", min,avg,max);
+		}
+#endif
 		p += sprintf(p, " %14s",
 			    region->data.name ? region->data.name : "N/A");
 		p += sprintf(p, "  %s", action->name);
@@ -330,7 +349,22 @@ void do_irq(struct irqaction *action, in
 		printk(KERN_ERR "IRQ:  CPU:%d No handler for IRQ %d !\n", cpu, irq);
 
 	for(; action && action->handler; action = action->next) {
+#ifdef PARISC_IRQ_CR16_COUNTS
+		unsigned long cr_start = mfctl(16);
+#endif
+
 		action->handler(irq, action->dev_id, regs);
+
+#ifdef PARISC_IRQ_CR16_COUNTS
+		{
+			unsigned long cr_end = mfctl(16);
+			unsigned long tmp = cr_end - cr_start;
+			/* check for roll over */
+			cr_start = (cr_end < cr_start) ?  -(tmp) : (tmp);
+		}
+		action->cr16_hist[action->cr16_idx++] = (int) cr_start;
+		action->cr16_idx &= PARISC_CR16_HIST_SIZE - 1;
+#endif
 	}
 
 	irq_exit(cpu, irq);
