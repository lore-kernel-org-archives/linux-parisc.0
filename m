Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA10688
	for <parisc-linux@puffin.external.hp.com>; Fri, 1 Oct 1999 12:44:51 -0600
Received: (from pschwan@localhost)
	by burrow.puffingroup.com (8.8.7/8.8.7) id PAA21065
	for parisc-linux@thepuffingroup.com; Fri, 1 Oct 1999 15:12:17 -0400
Message-ID: <19991001151217.I17134@thepuffingroup.com>
Date: Fri, 1 Oct 1999 15:12:17 -0400
From: Phil Schwan <pschwan@thepuffingroup.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=Z0mFw3+mXTC5ycVe
Subject: [parisc-linux] [grundler@cup.hp.com: permission to submit changes?]
List-ID: <linux-parisc.vger.kernel.org>


--Z0mFw3+mXTC5ycVe
Content-Type: text/plain; charset=us-ascii

[ I think I've fixed the mailing list; here's the mails from Grant
  that it was dropping --phil ]


--Z0mFw3+mXTC5ycVe
Content-Type: message/rfc822
Content-Description: Forwarded message from Grant Grundler <grundler@cup.hp.com>

Return-Path: <parisc-linux-request@thepuffingroup.com>
Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by burrow.puffingroup.com (8.8.7/8.8.7) with SMTP id CAA20380
	for <pschwan@off.net>; Fri, 1 Oct 1999 02:06:49 -0400
Received: (qmail 27436 invoked by uid 15267); 1 Oct 1999 05:40:04 -0000
Delivered-To: thepuffi-pschwan@thepuffingroup.com
Received: (qmail 27424 invoked from network); 1 Oct 1999 05:40:04 -0000
Received: from puffin.external.hp.com (listserv@192.25.206.4)
  by mailserv2.iuinc.com with SMTP; 1 Oct 1999 05:40:04 -0000
Received: (from listserv@localhost)
	by puffin.external.hp.com (8.8.7/8.8.7) id XAA09197
	for pschwan@thepuffingroup.com; Thu, 30 Sep 1999 23:39:37 -0600
Date: Thu, 30 Sep 1999 23:39:37 -0600
X-Envelope-From: grundler@cup.hp.com  Thu Sep 30 23:39:33 1999
Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id XAA09182
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Sep 1999 23:39:33 -0600
Received: (qmail 27401 invoked by uid 15267); 1 Oct 1999 05:39:58 -0000
Delivered-To: thepuffi-parisc-linux@thepuffingroup.com
Received: (qmail 27394 invoked from network); 1 Oct 1999 05:39:58 -0000
Received: from atlrel2.hp.com (156.153.255.202)
  by mailserv2.iuinc.com with SMTP; 1 Oct 1999 05:39:58 -0000
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.16.124.11])
	by atlrel2.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id BAA27206
	for <parisc-linux@thepuffingroup.com>; Fri, 1 Oct 1999 01:39:16 -0400 (EDT)
Received: from localhost (grundler@localhost [127.0.0.1]) by milano.cup.hp.com with SMTP (8.8.6 (PHNE_14041)/8.7.3 TIS Messaging 5.0) id WAA12384 for <parisc-linux@thepuffingroup.com>; Thu, 30 Sep 1999 22:38:57 -0700 (PDT)
Message-Id: <199910010538.WAA12384@milano.cup.hp.com>
X-Authentication-Warning: milano.cup.hp.com: grundler@localhost [127.0.0.1] didn't use HELO protocol
To: parisc-linux@thepuffingroup.com
Subject: permission to submit changes?
Old-Date: Thu, 30 Sep 1999 22:38:53 -0700
From: Grant Grundler <grundler@cup.hp.com>
X-Diagnostic: Submission size exceeds 5120 bytes
X-Envelope-To: parisc-linux


I'd like to submit the following minor changes. Any objections?

o enables FP coprocessor blindly - OK for PA 1.1 systems.
  Should be using PDC_PROC but I just wanted to try it out.

o clean up some of the excessive console output.
  More could be done here. But I just wanted to be able
  to cut/paste reasonable amounts of stuff.
  
Yes, my kernel panic'd when trying to kill the idle task.
That's an improvement over the "code 22 interrupt".
I'll post the output tomorrow.

(Lamont was feeling a bit guilty about not having hacked mkImage.c
despite volunteering for it...)

thanks,
grant

Index: linux/arch/parisc/kernel/head.S
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/head.S,v
retrieving revision 1.32
diff -u -r1.32 head.S
--- head.S	1999/08/31 19:25:23	1.32
+++ head.S	1999/09/30 22:43:03
@@ -295,9 +295,20 @@
 	ldil		L%KERNEL_PSW,%r10
 	ldo		R%KERNEL_PSW(%r10),%r10
 	mtctl		%r10,%ipsw
-	
-	mtctl		%r0,%cr17		; Clear two-level IIA Space Queue
-	mtctl		%r0,%cr17		;    effectively setting kernel space.
+
+	; Just assume we have an FP coprocessor and assume firmware
+	; did not enable it.
+	; Pass what firmware set CCR (cr10) to start_parisc() and print it.
+	mfctl		%cr10, %arg2
+
+#define FP_COPROC_ENABLE 0xc0
+	ldil		L%FP_COPROC_ENABLE,%r10
+	ldo		R%FP_COPROC_ENABLE(%r10),%r10
+	mtctl		%r10,%cr10	; CCR
+
+
+	mtctl		%r0,%cr17	; Clear two-level IIA Space Queue
+	mtctl		%r0,%cr17	;    effectively setting kernel space.
 	ldil		L%start_parisc,%r10
 	ldo		R%start_parisc(%r10),%r10
 
Index: linux/arch/parisc/kernel/setup.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/setup.c,v
retrieving revision 1.59
diff -u -r1.59 setup.c
--- setup.c	1999/09/28 22:34:57	1.59
+++ setup.c	1999/09/30 22:43:15
@@ -587,13 +587,16 @@
 #define PA(x) (void *)((unsigned long)(x)&~0xc0000000)
 extern int pdc_call_x(void *,...);
 
+#if 0
 static char iodc_tbuf[4096] __attribute__((aligned(4096))) = "Hallo\n";
 static char iodc_rbuf[4096] __attribute__((aligned(4096))) = "Hallo\n";
+#endif
 
 __initfunc(void start_parisc(unsigned long new_memory_start, 
-			     char *bootloader_command_line))
+			     char *bootloader_command_line,
+			     unsigned long ccr))
 {
-#if 1
+#if 0
 	pdc_call_x(
 		(void *)PAGE0->mem_cons.hpa, ENTRY_IO_COUT,
 		PAGE0->mem_cons.spa, PAGE0->mem_cons.dp.layers,
@@ -613,28 +616,24 @@
 	pdc_console_init();
 
 	printk("The Kernel has started...\n");
+#if 0
 	printk("Hmm\n");
 	printk("%d\n", 7);
 	printk("%d\n", *(unsigned *)0xc0000000);
-
+#endif
 	printk("%p\n", bootloader_command_line);
 	printk("You are running a %dMHz PA-RISC-Machine with %dMB of RAM.\n",
 		((int)PAGE0->mem_10msec/10000), PAGE0->imm_max_mem>>20);
+	printk("FP CCR was set to: 0x%x\n", (int) ccr);
 	parisc_memstart = new_memory_start;
 	
 	pdc = PAGE0->mem_pdc;
 
-	printk("You are running a %dMHz PA-RISC-Machine with %dMB of RAM.\n",
-		((int)PAGE0->mem_10msec/10000), PAGE0->imm_max_mem>>20);
-
 	if (bootloader_command_line)
 	    strcpy(saved_command_line,__va(bootloader_command_line));
 	else
 	    saved_command_line[0] = 0;
 
-	printk("You are running a %dMHz PA-RISC-Machine with %dMB of RAM.\n",
-		((int)PAGE0->mem_10msec/10000), PAGE0->imm_max_mem>>20);
-
 	printk("Free memory was at 0x%08lX (=stackbase, stacksize=0x%08lX).\n",
 		new_memory_start,(unsigned long)KERNEL_STACKSIZE );
 
@@ -659,7 +658,7 @@
 #endif
 	initrd_below_start_ok = 1;
 	
-	printk("initrd: %08x-%08x\n", initrd_start, initrd_end);
+	printk("initrd: %08x-%08x\n", (int) initrd_start, (int) initrd_end);
 	*memory_start_p = parisc_memstart;
 	*memory_end_p	= 0xc2000000;
 
Index: linux/drivers/block/rd.c
===================================================================
RCS file: /home/cvs/parisc/linux/drivers/block/rd.c,v
retrieving revision 1.3
diff -u -r1.3 rd.c
--- rd.c	1999/09/22 18:10:17	1.3
+++ rd.c	1999/09/30 22:43:26
@@ -219,7 +219,6 @@
 {
 	int left;
 
-	printk("initrd_read\n");
 	left = initrd_end - initrd_start - *ppos;
 	if (count > left) count = left;
 	if (count == 0) return 0;

Index: linux/fs/buffer.c
===================================================================
RCS file: /home/cvs/parisc/linux/fs/buffer.c,v
retrieving revision 1.3
diff -u -r1.3 buffer.c
--- buffer.c	1999/09/22 18:10:35	1.3
+++ buffer.c	1999/09/30 22:44:21
@@ -840,8 +840,6 @@
 
 	struct buffer_head * bh;
 
-	printk("bread bh=%08x\n", bh);
-//	printk("%08x\n", &buffer_page(bh)->flags);
 	bh = getblk(dev, block, size);
 	if (buffer_uptodate(bh))
 		return bh;

--Z0mFw3+mXTC5ycVe--
