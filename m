Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA10626
	for <parisc-linux@puffin.external.hp.com>; Fri, 1 Oct 1999 12:44:40 -0600
Received: (from pschwan@localhost)
	by burrow.puffingroup.com (8.8.7/8.8.7) id PAA21059
	for parisc-linux@thepuffingroup.com; Fri, 1 Oct 1999 15:12:07 -0400
Message-ID: <19991001151206.H17134@thepuffingroup.com>
Date: Fri, 1 Oct 1999 15:12:06 -0400
From: Phil Schwan <pschwan@thepuffingroup.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="5Mfx4RzfBqgnTE/w"
Subject: [parisc-linux] [grundler@puffin.external.hp.com: commit FP coproc enable code?]
List-ID: <linux-parisc.vger.kernel.org>


--5Mfx4RzfBqgnTE/w
Content-Type: text/plain; charset=us-ascii

[ I think I've fixed the mailing list; here's the mails from Grant
  that it was dropping --phil ]

--5Mfx4RzfBqgnTE/w
Content-Type: message/rfc822
Content-Description: Forwarded message from grundler@puffin.external.hp.com

Return-Path: <parisc-linux-request@thepuffingroup.com>
Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by burrow.puffingroup.com (8.8.7/8.8.7) with SMTP id NAA20917
	for <pschwan@off.net>; Fri, 1 Oct 1999 13:53:24 -0400
Received: (qmail 2301 invoked by uid 15267); 1 Oct 1999 17:26:19 -0000
Delivered-To: thepuffi-pschwan@thepuffingroup.com
Received: (qmail 2289 invoked from network); 1 Oct 1999 17:26:18 -0000
Received: from puffin.external.hp.com (listserv@192.25.206.4)
  by mailserv2.iuinc.com with SMTP; 1 Oct 1999 17:26:18 -0000
Received: (from listserv@localhost)
	by puffin.external.hp.com (8.8.7/8.8.7) id LAA10008
	for pschwan@thepuffingroup.com; Fri, 1 Oct 1999 11:25:50 -0600
Date: Fri, 1 Oct 1999 11:25:50 -0600
X-Authentication-Warning: puffin.external.hp.com: listserv set sender to parisc-linux-request@thepuffingroup.com using -f
X-Envelope-From: grundler@puffin.external.hp.com  Fri Oct  1 11:25:46 1999
Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA09989
	for <parisc-linux@puffin.external.hp.com>; Fri, 1 Oct 1999 11:25:45 -0600
Received: (qmail 2256 invoked by uid 15267); 1 Oct 1999 17:26:11 -0000
Delivered-To: thepuffi-parisc-linux@thepuffingroup.com
Received: (qmail 2248 invoked from network); 1 Oct 1999 17:26:11 -0000
Received: from puffin.external.hp.com (grundler@192.25.206.4)
  by mailserv2.iuinc.com with SMTP; 1 Oct 1999 17:26:11 -0000
Received: (from grundler@localhost)
	by puffin.external.hp.com (8.8.7/8.8.7) id LAA09983
	for parisc-linux@thepuffingroup.com; Fri, 1 Oct 1999 11:24:10 -0600
Old-Date: Fri, 1 Oct 1999 11:24:10 -0600
From: grundler@puffin.external.hp.com
Message-Id: <199910011724.LAA09983@puffin.external.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: commit FP coproc enable code?
X-Diagnostic: Submission size exceeds 5120 bytes
X-Envelope-To: parisc-linux

[ 4th try...I'm not getting a copy back from the reflector...]

Hi all,
I'd like to commit changes to enable FP coproc for PA 1.1 arch.
Any objections?

o FP enable via writing cr10 (CCR) register. Not doing this the "right"
  way - which is to use PDC_COPROC but it will work for all PA1.1
  platforms.

o remove extraneous console output. I want to post console output
  for my next problem: kernel panic when trying to kill idle_task.

thanks,
grant

Index: linux/arch/parisc/kernel/head.S
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/head.S,v
retrieving revision 1.32
diff -u -r1.32 head.S
--- head.S      1999/08/31 19:25:23     1.32
+++ head.S      1999/09/30 22:43:03
@@ -295,9 +295,20 @@
        ldil            L%KERNEL_PSW,%r10
        ldo             R%KERNEL_PSW(%r10),%r10
        mtctl           %r10,%ipsw
-       
-       mtctl           %r0,%cr17               ; Clear two-level IIA Space Queue
-       mtctl           %r0,%cr17               ;    effectively setting kernel space.
+
+       ; Just assume we have an FP coprocessor and assume firmware
+       ; did not enable it.
+       ; Pass what firmware set CCR (cr10) to start_parisc() and print it.
+       mfctl           %cr10, %arg2
+
+#define FP_COPROC_ENABLE 0xc0
+       ldil            L%FP_COPROC_ENABLE,%r10
+       ldo             R%FP_COPROC_ENABLE(%r10),%r10
+       mtctl           %r10,%cr10      ; CCR
+
+
+       mtctl           %r0,%cr17       ; Clear two-level IIA Space Queue
+       mtctl           %r0,%cr17       ;    effectively setting kernel space.
        ldil            L%start_parisc,%r10
        ldo             R%start_parisc(%r10),%r10
 
Index: linux/arch/parisc/kernel/setup.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/setup.c,v
retrieving revision 1.59
diff -u -r1.59 setup.c
--- setup.c     1999/09/28 22:34:57     1.59
+++ setup.c     1999/09/30 22:43:15
@@ -587,13 +587,16 @@
 #define PA(x) (void *)((unsigned long)(x)&~0xc0000000)
 extern int pdc_call_x(void *,...);
 
+#if 0
 static char iodc_tbuf[4096] __attribute__((aligned(4096))) = "Hallo\n";
 static char iodc_rbuf[4096] __attribute__((aligned(4096))) = "Hallo\n";
+#endif
 
 __initfunc(void start_parisc(unsigned long new_memory_start, 
-                            char *bootloader_command_line))
+                            char *bootloader_command_line,
+                            unsigned long ccr))
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
+       printk("FP CCR was set to: 0x%x\n", (int) ccr);
        parisc_memstart = new_memory_start;
        
        pdc = PAGE0->mem_pdc;
 
-       printk("You are running a %dMHz PA-RISC-Machine with %dMB of RAM.\n",
-               ((int)PAGE0->mem_10msec/10000), PAGE0->imm_max_mem>>20);
-
        if (bootloader_command_line)
            strcpy(saved_command_line,__va(bootloader_command_line));
        else
            saved_command_line[0] = 0;
 
-       printk("You are running a %dMHz PA-RISC-Machine with %dMB of RAM.\n",
-               ((int)PAGE0->mem_10msec/10000), PAGE0->imm_max_mem>>20);
-
        printk("Free memory was at 0x%08lX (=stackbase, stacksize=0x%08lX).\n",
                new_memory_start,(unsigned long)KERNEL_STACKSIZE );
 
@@ -659,7 +658,7 @@
 #endif
        initrd_below_start_ok = 1;
        
-       printk("initrd: %08x-%08x\n", initrd_start, initrd_end);
+       printk("initrd: %08x-%08x\n", (int) initrd_start, (int) initrd_end);
        *memory_start_p = parisc_memstart;
        *memory_end_p   = 0xc2000000;
 
Index: linux/drivers/block/rd.c
===================================================================
RCS file: /home/cvs/parisc/linux/drivers/block/rd.c,v
retrieving revision 1.3
diff -u -r1.3 rd.c
--- rd.c        1999/09/22 18:10:17     1.3
+++ rd.c        1999/09/30 22:43:26
@@ -219,7 +219,6 @@
 {
        int left;
 
-       printk("initrd_read\n");
        left = initrd_end - initrd_start - *ppos;
        if (count > left) count = left;
        if (count == 0) return 0;

Index: linux/fs/buffer.c
===================================================================
RCS file: /home/cvs/parisc/linux/fs/buffer.c,v
retrieving revision 1.3
diff -u -r1.3 buffer.c
--- buffer.c    1999/09/22 18:10:35     1.3
+++ buffer.c    1999/09/30 22:44:21
@@ -840,8 +840,6 @@
 
        struct buffer_head * bh;
 
-       printk("bread bh=%08x\n", bh);
-//     printk("%08x\n", &buffer_page(bh)->flags);
        bh = getblk(dev, block, size);
        if (buffer_uptodate(bh))
                return bh;

--5Mfx4RzfBqgnTE/w--
