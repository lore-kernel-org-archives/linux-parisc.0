Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id CDA0E4839
	for <parisc-linux@parisc-linux.org>; Mon, 11 Jun 2001 15:32:26 -0600 (MDT)
Received: from esiee.fr (pc211j.esiee.fr [147.215.80.169])
	by mail.esiee.fr (Postfix) with ESMTP id 4BD15D15B6
	for <parisc-linux@parisc-linux.org>; Mon, 11 Jun 2001 23:32:25 +0200 (CEST)
Sender: marteaut@esiee.fr
Message-ID: <3B253780.E2E2FC45@esiee.fr>
Date: Mon, 11 Jun 2001 23:26:24 +0200
From: Thomas Marteau <marteaut@esiee.fr>
MIME-Version: 1.0
To: "parisc-linux@parisc-linux.org" <parisc-linux@parisc-linux.org>
Content-Type: multipart/mixed;
 boundary="------------AA99F5639BE1355209CBE326"
Subject: [parisc-linux] The mouse patch
List-ID: <linux-parisc.vger.kernel.org>

This is a multi-part message in MIME format.
--------------AA99F5639BE1355209CBE326
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi all,

	I have produced a newer code for the mouse PS2 on HP box. I mean the
mouse you plug directly to your 712 for example. Of course, due to the
status of STI-console, it works with the STI frame buffer.

	If someone can be kind enough to build a kernel with this patch with
the following .config file and the latest CVS possible and give your
feedback...

The favorite modell will be 712.

Thanks, Thomas
ESIEE Team
--------------AA99F5639BE1355209CBE326
Content-Type: text/plain; charset=us-ascii;
 name="mouse.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="mouse.patch"

diff -Nru linux.old/drivers/char/hp_keyb.h linux.new/drivers/char/hp_keyb.h
--- linux.old/drivers/char/hp_keyb.h	Thu Jan  1 01:00:00 1970
+++ linux.new/drivers/char/hp_keyb.h	Mon Jun 11 21:14:32 2001
@@ -0,0 +1,51 @@
+/*  
+ *    LASI PS/2 keyboard/psaux header for HP-PARISC workstations
+ *
+ *    Copyright 2001    Marteau Thomas <marteaut@esiee.fr>
+ *
+ *    This file contains all the data needed by hp_keyb.c and hp_psaux.c
+ *
+ *    2001/05/10       Try to compact the code in the two files
+ *                  
+ */
+
+/* These defines are not used! */
+#define KBD_ECHO       0xEE            /* in/out */
+#define KBD_DEFAULT    0xF6            /* out */
+#define KBD_DIAGFAIL   0xFD            /* in */
+
+/* Only in hp_keyb.c */
+#define KBD_BREAK      0xF0            /* in */
+
+/* Standard mouse behaviour parameters */
+
+#define AUX_REPLY_ACK   0xFA            /* Command byte ACK. */
+#define AUX_RECONNECT   0xAA            /* scancode when ps2 device is plugged (back) in */
+
+/* PA-RISC define */
+#define LASI_OFFSET     0x0100
+
+#define        LASI_ID         0x00
+#define LASI_RESET     0x00
+#define LASI_RCVDATA   0x04
+#define LASI_XMTDATA   0x04
+#define LASI_CONTROL   0x08
+#define LASI_STATUS    0x0C
+
+/* Control register bits */
+
+#define LASI_CTRL_ENBL         0x01    /* enable interface */
+#define LASI_CTRL_LPBXR                0x02    /* loopback operation */
+#define LASI_CTRL_DIAG         0x20    /* directly control clock/data line */
+#define        LASI_CTRL_DATDIR        0x40    /* data line direct control */
+#define        LASI_CTRL_CLKDIR        0x80    /* clock line direct control */
+
+/* Status register bits */
+
+#define LASI_STAT_RBNE         0x01
+#define LASI_STAT_TBNE         0x02
+#define LASI_STAT_TERR         0x04
+#define LASI_STAT_PERR         0x08
+#define LASI_STAT_CMPINTR      0x10
+#define LASI_STAT_DATSHD       0x40
+#define LASI_STAT_CLKSHD       0x80
diff -Nru linux.old/drivers/char/hp_psaux.c linux.new/drivers/char/hp_psaux.c
--- linux.old/drivers/char/hp_psaux.c	Mon Jun 11 21:03:39 2001
+++ linux.new/drivers/char/hp_psaux.c	Mon Jun 11 21:35:32 2001
@@ -9,7 +9,9 @@
  *			Marteau Thomas (marteaut@esiee.fr)
  * 			Djoudi Malek (djoudim@esiee.fr)
  *	fixed leds control
+ *      implemented the psaux and controlled the mouse scancode based on pc_keyb.c
  */
+#include <linux/config.h>
 
 #include <asm/hardware.h>
 #include <asm/keyboard.h>
@@ -17,58 +19,40 @@
 
 #include <linux/types.h>
 #include <linux/ptrace.h>	/* interrupt.h wants struct pt_regs defined */
+#include <linux/interrupt.h>
 #include <linux/sched.h>	/* for request_irq/free_irq */
 #include <linux/ioport.h>
 #include <linux/kernel.h>
-#include <linux/interrupt.h>
 #include <linux/wait.h>
+#include <linux/delay.h>
 #include <linux/errno.h>
 #include <linux/init.h>
 #include <linux/pc_keyb.h>
 #include <linux/kbd_kern.h>
 
+/* mouse include */
+#include <linux/miscdevice.h>
+#include <linux/malloc.h>
+#include <linux/random.h>
+#include <linux/spinlock.h>
+#include <linux/smp_lock.h>
+#include <asm/uaccess.h>
+#include <linux/poll.h>
+
+/* hp include */
+#include "hp_keyb.h"
 
 static struct hp_device *lasi_psaux_keyb;
 static void *lasikbd_hpa;
+static void *lasips2_hpa;
 
-
-#define KBD_BAT		0xaa		/* in */
-#define KBD_SETLEDS	0xed		/* out */
-#define KBD_ECHO	0xee		/* in/out */
-#define KBD_BREAK	0xf0		/* in */
-#define KBD_TYPRATEDLY	0xf3		/* out */
-#define KBD_SCANENABLE	0xf4		/* out */
-#define KBD_DEFDISABLE	0xf5		/* out */
-#define KBD_DEFAULT	0xf6		/* out */
-#define KBD_ACK		0xfa		/* in */
-#define KBD_DIAGFAIL	0xfd		/* in */
-#define KBD_RESEND	0xfe		/* in/out */
-#define KBD_RESET	0xff		/* out */
-
-#define	LASI_ID		0x00
-#define LASI_RESET	0x00
-#define LASI_RCVDATA	0x04
-#define LASI_XMTDATA	0x04
-#define LASI_CONTROL	0x08
-#define LASI_STATUS	0x0c
-
-/* Control register bits */
-
-#define LASI_CTRL_ENBL		0x01	/* enable interface */
-#define LASI_CTRL_LPBXR		0x02	/* loopback operation */
-#define LASI_CTRL_DIAG		0x20	/* directly control clock/data line */
-#define	LASI_CTRL_DATDIR	0x40	/* data line direct control */
-#define	LASI_CTRL_CLKDIR	0x80	/* clock line direct control */
-
-/* Status register bits */
-
-#define LASI_STAT_RBNE		0x01
-#define LASI_STAT_TBNE		0x02
-#define LASI_STAT_TERR		0x04
-#define LASI_STAT_PERR		0x08
-#define LASI_STAT_CMPINTR	0x10
-#define LASI_STAT_DATSHD	0x40
-#define LASI_STAT_CLKSHD	0x80
+#ifdef CONFIG_PSMOUSE
+/* mouse section */
+static unsigned char mouse_reply_expected;
+static struct aux_queue *queue;        /* Mouse data buffer. */
+static int aux_count;
+static spinlock_t kbd_controller_lock = SPIN_LOCK_UNLOCKED;
+#endif
 
 
 static inline u8 read_input(void *hpa)
@@ -111,12 +95,18 @@
 	return;
 }
 
+/* This function is the PA-RISC adaptation of i386 source */
+
+static void aux_write_ack(u8 val)
+{
+      write_output(val,lasikbd_hpa+LASI_OFFSET);
+}
 
 static void lasikbd_leds(unsigned char leds)
 {
-	write_output(KBD_SETLEDS, lasikbd_hpa);
+	write_output(KBD_CMD_SET_LEDS, lasikbd_hpa);
 	write_output(leds, lasikbd_hpa);
-	write_output(KBD_SCANENABLE, lasikbd_hpa);
+	write_output(KBD_CMD_ENABLE, lasikbd_hpa);
 #if 0
 	printk("%s(%d)\n", __FUNCTION__, leds); 
 #endif
@@ -149,7 +139,7 @@
 }
 #endif 
 
-int lasi_ps2_reset(void *hpa)
+int lasi_ps2_reset(void *hpa, int id)
 {
 	u8 control;
 
@@ -161,6 +151,13 @@
 	control = read_control(hpa);
 	write_control(control | LASI_CTRL_ENBL, hpa);
 
+        /* initializes the leds at the default state */
+        if (id==0){
+           write_output(KBD_CMD_SET_LEDS, hpa);
+	   write_output(0, hpa);
+	   write_output(KBD_CMD_ENABLE, hpa);
+	}
+
 	return 0;
 }
 
@@ -171,34 +168,250 @@
 	++inited;
 }
 
-static u8 handle_lasikbd_event(void *hpa)
+
+/* Greatly inspired by pc_keyb.c */
+
+/*
+ * Wait for keyboard controller input buffer to drain.
+ *
+ * Don't use 'jiffies' so that we don't depend on
+ * interrupts..
+ *
+ * Quote from PS/2 System Reference Manual:
+ *
+ * "Address hex 0060 and address hex 0064 should be written only when
+ * the input-buffer-full bit and output-buffer-full bit in the
+ * Controller Status register are set 0."
+ */
+#ifdef CONFIG_PSMOUSE
+
+static int fasync_aux(int fd, struct file *filp, int on)
+{
+   
+	int retval;
+	
+	retval = fasync_helper(fd, filp, on, &queue->fasync);
+	if (retval < 0)
+		return retval;
+	
+	return 0;
+}
+
+
+static inline void handle_mouse_scancode(unsigned char scancode)
+{
+
+	if (mouse_reply_expected) {
+		if (scancode == AUX_REPLY_ACK) {
+			mouse_reply_expected--;
+			return;
+		}
+		mouse_reply_expected = 0;
+	}
+	else if(scancode == AUX_RECONNECT){
+		queue->head = queue->tail = 0;  /* Flush input queue */
+		return;
+	}
+
+	add_mouse_randomness(scancode);
+	if (aux_count) {
+		int head = queue->head;
+				
+		queue->buf[head] = scancode;
+		head = (head + 1) & (AUX_BUF_SIZE-1);
+		
+		if (head != queue->tail) {
+			queue->head = head;
+			kill_fasync(&queue->fasync, SIGIO, POLL_IN);
+			wake_up_interruptible(&queue->proc_list);
+		}
+	}
+}
+
+static inline int queue_empty(void)
 {
-	u8 status;
-	extern void handle_at_scancode(int); /* in drivers/char/keyb_at.c */
+	return queue->head == queue->tail;
+}
 
-	while ((status = read_status(hpa)) & LASI_STAT_RBNE) {
-		u8 scancode;
+static unsigned char get_from_queue(void)
+{
+	unsigned char result;
+	unsigned long flags;
 
-		scancode = read_input(hpa);
+	spin_lock_irqsave(&kbd_controller_lock, flags);
+	result = queue->buf[queue->tail];
+	queue->tail = (queue->tail + 1) & (AUX_BUF_SIZE-1);
+	spin_unlock_irqrestore(&kbd_controller_lock, flags);
+	return result;
+}
 
-		if (inited)
-			handle_at_scancode(scancode);
+
+/*
+ * Write to the aux device.
+ */
+
+static ssize_t write_aux(struct file * file, const char * buffer,
+			 size_t count, loff_t *ppos)
+{
+	ssize_t retval = 0;
+
+	if (count) {
+		ssize_t written = 0;
+
+		if (count > 32)
+			count = 32; /* Limit to 32 bytes. */
+		do {
+			char c;
+			get_user(c, buffer++);
+			written++;
+		} while (--count);
+		retval = -EIO;
+		if (written) {
+			retval = written;
+			file->f_dentry->d_inode->i_mtime = CURRENT_TIME;
+		}
 	}
 
-	tasklet_schedule(&keyboard_tasklet);
+	return retval;
+}
+
 
-	return status;
+
+static ssize_t read_aux(struct file * file, char * buffer,
+			size_t count, loff_t *ppos)
+{
+	DECLARE_WAITQUEUE(wait, current);
+	ssize_t i = count;
+	unsigned char c;
+
+	if (queue_empty()) {
+		if (file->f_flags & O_NONBLOCK)
+			return -EAGAIN;
+		add_wait_queue(&queue->proc_list, &wait);
+repeat:
+		set_current_state(TASK_INTERRUPTIBLE);
+		if (queue_empty() && !signal_pending(current)) {
+			schedule();
+			goto repeat;
+		}
+		current->state = TASK_RUNNING;
+		remove_wait_queue(&queue->proc_list, &wait);
+	}
+	while (i > 0 && !queue_empty()) {
+		c = get_from_queue();
+		put_user(c, buffer++);
+		i--;
+	}
+	if (count-i) {
+		file->f_dentry->d_inode->i_atime = CURRENT_TIME;
+		return count-i;
+	}
+	if (signal_pending(current))
+		return -ERESTARTSYS;
+	return 0;
 }
+
+
+static int open_aux(struct inode * inode, struct file * file)
+{
+	if (aux_count++) {
+	return 0;
+	}
+	queue->head = queue->tail = 0;		/* Flush input queue */
+	aux_count =1;
+	
+	aux_write_ack(AUX_ENABLE_DEV); /* Enable aux device */
+	
+	return 0;
+}
+
+
+/* No kernel lock held - fine */
+static unsigned int aux_poll(struct file *file, poll_table * wait)
+{
+
+	poll_wait(file, &queue->proc_list, wait);
+	if (!queue_empty())
+		return POLLIN | POLLRDNORM;
+	return 0;
+}
+
+
+static int release_aux(struct inode * inode, struct file * file)
+{
+	lock_kernel();
+	fasync_aux(-1, file, 0);
+	if (--aux_count) {
+	   unlock_kernel();
+		return 0;
+	}
+	unlock_kernel();
+	return 0;
+}
+#endif
+
+
+/* This function is looking at the PS2 controller and empty the two buffers */
+
+static u8 handle_lasikbd_event(void *hpa)
+{
+        u8 status_keyb,status_mouse,scancode,id;
+        extern void handle_at_scancode(int); /* in drivers/char/keyb_at.c */
+        
+        /* Mask to get the base address of the PS/2 controller */
+
+        id = gsc_readb(hpa+LASI_ID) & 0x0f;
+        
+        if (id==1) 
+           hpa=hpa-LASI_OFFSET; 
+        lasikbd_hpa=hpa;
+        
+
+        status_keyb = read_status(hpa);
+        status_mouse = read_status(hpa+LASI_OFFSET);
+
+        while ((status_keyb|status_mouse) & LASI_STAT_RBNE){
+           
+           while (status_keyb & LASI_STAT_RBNE) {
+	      
+              scancode = read_input(hpa);
+	      
+	      if (inited)
+	      {
+		 handle_at_scancode(scancode); 
+              }
+	      
+	      status_keyb =read_status(hpa);
+           }
+	   
+#ifdef CONFIG_PSMOUSE
+           while (status_mouse & LASI_STAT_RBNE) {
+             
+	      scancode = read_input(hpa+LASI_OFFSET);
+	      handle_mouse_scancode(scancode);
+              status_mouse=read_status(hpa+LASI_OFFSET);
+	   }
+           status_mouse=read_status(hpa+LASI_OFFSET);
+#endif
+           status_keyb =read_status(hpa);
+        }
+
+        tasklet_schedule(&keyboard_tasklet);
+        return (status_keyb|status_mouse);
+}
+
+
+
 	
 extern struct pt_regs *kbd_pt_regs;
 
 static void lasikbd_interrupt(int irq, void *dev, struct pt_regs *regs)
 {
-	lasikbd_hpa = dev; /* save "hpa" for lasikbd_leds() */
+	lasips2_hpa = dev; /* save "hpa" for lasikbd_leds() */
 
 	kbd_pt_regs = regs;
 
-	handle_lasikbd_event(lasikbd_hpa);
+	handle_lasikbd_event(lasips2_hpa);
 }
 
 
@@ -230,6 +443,21 @@
 #endif
 };
 
+#ifdef CONFIG_PSMOUSE
+struct file_operations psaux_fops = {
+	read:		read_aux,
+	write:		write_aux,
+	poll:		aux_poll,
+	open:		open_aux,
+	release:	release_aux,
+	fasync:		fasync_aux,
+};
+
+static struct miscdevice psaux_mouse = {
+	PSMOUSE_MINOR, "psaux", &psaux_fops
+};
+#endif
+
 static int __init
 lasi_ps2_register(struct hp_device *d, struct pa_iodc_driver *dri)
 {
@@ -247,21 +475,27 @@
 		name = "psaux"; /* "mouse" */;
 		break;
 	default:
-		printk(KERN_WARNING "unknown PS/2 port %d found!  Get famous now by reporting this to parisc-linux@parisc-linux.org!\n", id);
+		printk(KERN_WARNING "unknown PS/2 port %d found!  Get famous now by reporting this to parisc-linux@thepuffingroup.com!\n", id);
 		name = "unknown";
 	}
 
-	if (id==0) {
-		printk("Initializing Lasi PS/2-%s port at 0x%p...\n", name, hpa);
-	} else {
-		printk("Support for Lasi PS/2-%s not yet available !\n", name); /* FIXME */
-	}
+	if (id==0)
+	    printk("Initializing Lasi PS/2-%s port at 0x%p...\n", name, hpa);
+#ifdef CONFIG_PSMOUSE
+	else 
+	   if (id==1)
+	      printk("Initializing Lasi PS/2-%s port at 0x%p...\n", name, hpa);
+#endif
+	   else
+	      printk("Support for Lasi PS/2-%s not yet available !\n", name); /* FIXME */
 	    
 	if (id==0) {
 		int err;
 		unsigned int irq;
-
-		if ((err = lasi_ps2_reset(hpa)))
+		
+		lasikbd_hpa=hpa;
+		
+		if ((err = lasi_ps2_reset(hpa,id)))
 			printk("%s: lasi_ps2_reset() failed!\n", __FUNCTION__);
 
 		irq = busdevice_alloc_irq(d);
@@ -270,10 +504,38 @@
 		    
 		request_irq(irq, lasikbd_interrupt, 0, name, hpa);
 
-		request_mem_region((unsigned long)hpa, LASI_STATUS + 4, name);
+		request_region((unsigned long)hpa, LASI_STATUS + 4, name);
 		
 		register_kbd_ops(&gsc_ps2_kbd_ops);
 	}
+
+#ifdef CONFIG_PSMOUSE
+	if (id==1){
+		int err;
+		unsigned int irq;
+
+		if ((err = lasi_ps2_reset(hpa,id)))
+			printk("%s: lasi_ps2_reset() failed!\n", __FUNCTION__);
+
+		irq = busdevice_alloc_irq(d);
+		if (!irq)
+		    return -ENODEV;
+		    
+		request_irq(irq, lasikbd_interrupt, 0, name, hpa);
+
+		request_region((unsigned long)hpa, LASI_STATUS + 4, name);
+		
+		misc_register(&psaux_mouse);
+		queue = (struct aux_queue *) kmalloc(sizeof(*queue), GFP_KERNEL);
+		memset(queue, 0, sizeof(*queue));
+		queue->head = queue->tail = 0;
+		init_waitqueue_head(&queue->proc_list);
+
+		aux_write_ack(AUX_ENABLE_DEV);
+		
+	}
+#endif	   
+
 
 	return 0;
 }
diff -Nru linux.old/drivers/gsc/lasi.c linux.new/drivers/gsc/lasi.c
--- linux.old/drivers/gsc/lasi.c	Mon Jun 11 21:03:40 2001
+++ linux.new/drivers/gsc/lasi.c	Mon Jun 11 21:08:32 2001
@@ -48,7 +48,8 @@
 	case 0x5000:	irq = 26; break; /* RS232 */
 	case 0x6000:	irq = 22; break; /* SCSI */
 	case 0x7000:	irq = 23; break; /* LAN */
-	case 0x8000:	irq =  5; break; /* PS/2 Keyboard and Mouse */
+	case 0x8000:    irq =  5; break; /* PS/2 Keyboard */
+        case 0x8100:    irq =  5; break; /* PS/2 Mouse */
 	case 0xA000:	irq = 11; break; /* Floppy Disk Controller */
 	default: 	irq = -1; break; /* unknown */
 	}

--------------AA99F5639BE1355209CBE326
Content-Type: text/plain; charset=us-ascii;
 name="conf"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="conf"

#
# Automatically generated by make menuconfig: don't edit
#
CONFIG_PARISC=y
# CONFIG_UID16 is not set

#
# Code maturity level options
#
# CONFIG_EXPERIMENTAL is not set

#
# Loadable module support
#
# CONFIG_MODULES is not set

#
# Processor type
#
# CONFIG_PA7100 is not set
# CONFIG_PA7200 is not set
CONFIG_PA7100LC=y
# CONFIG_PA8X00 is not set
CONFIG_PA11=y

#
# General options
#
# CONFIG_SMP is not set
# CONFIG_KWDB is not set
CONFIG_GSC=y
CONFIG_IOMMU_CCIO=y
CONFIG_GSC_LASI=y
CONFIG_GSC_WAX=y
CONFIG_PCI=y
CONFIG_GSC_DINO=y
CONFIG_PCI_LBA=y
CONFIG_WAX_EISA=y
# CONFIG_SUPERIO is not set
CONFIG_IOSAPIC=y
CONFIG_IOMMU_SBA=y
CONFIG_PCI_NAMES=y
CONFIG_CHASSIS_LCD_LED=y

#
# General setup
#
# CONFIG_HOTPLUG is not set
CONFIG_NET=y
CONFIG_SYSVIPC=y
# CONFIG_BSD_PROCESS_ACCT is not set
CONFIG_SYSCTL=y
CONFIG_KCORE_ELF=y
CONFIG_BINFMT_ELF=y
CONFIG_BINFMT_SOM=y
# CONFIG_BINFMT_MISC is not set
# CONFIG_PM is not set

#
# Parallel port support
#
CONFIG_PARPORT=y
# CONFIG_PARPORT_PC is not set
# CONFIG_PARPORT_AMIGA is not set
# CONFIG_PARPORT_MFC3 is not set
# CONFIG_PARPORT_ATARI is not set
CONFIG_PARPORT_GSC=y
# CONFIG_PARPORT_SUNBPP is not set
# CONFIG_PARPORT_OTHER is not set
# CONFIG_PARPORT_1284 is not set

#
# Block devices
#
# CONFIG_BLK_DEV_FD is not set
# CONFIG_BLK_DEV_XD is not set
# CONFIG_PARIDE is not set
# CONFIG_BLK_CPQ_DA is not set
# CONFIG_BLK_CPQ_CISS_DA is not set
# CONFIG_BLK_DEV_DAC960 is not set
# CONFIG_BLK_DEV_LOOP is not set
# CONFIG_BLK_DEV_NBD is not set
CONFIG_BLK_DEV_RAM=y
CONFIG_BLK_DEV_RAM_SIZE=4096
CONFIG_BLK_DEV_INITRD=y

#
# Multi-device support (RAID and LVM)
#
# CONFIG_MD is not set
# CONFIG_BLK_DEV_MD is not set
# CONFIG_MD_LINEAR is not set
# CONFIG_MD_RAID0 is not set
# CONFIG_MD_RAID1 is not set
# CONFIG_MD_RAID5 is not set
# CONFIG_BLK_DEV_LVM is not set
# CONFIG_LVM_PROC_FS is not set

#
# Networking options
#
# CONFIG_PACKET is not set
# CONFIG_NETLINK is not set
# CONFIG_NETFILTER is not set
# CONFIG_FILTER is not set
CONFIG_UNIX=y
CONFIG_INET=y
# CONFIG_IP_MULTICAST is not set
# CONFIG_IP_ADVANCED_ROUTER is not set
CONFIG_IP_PNP=y
# CONFIG_IP_PNP_BOOTP is not set
# CONFIG_IP_PNP_RARP is not set
# CONFIG_NET_IPIP is not set
# CONFIG_NET_IPGRE is not set
# CONFIG_INET_ECN is not set
# CONFIG_SYN_COOKIES is not set
# CONFIG_IPX is not set
# CONFIG_ATALK is not set
# CONFIG_DECNET is not set
# CONFIG_BRIDGE is not set

#
# SCSI support
#
CONFIG_SCSI=y
CONFIG_BLK_DEV_SD=y
CONFIG_SD_EXTRA_DEVS=40
CONFIG_CHR_DEV_ST=y
# CONFIG_CHR_DEV_OSST is not set
CONFIG_BLK_DEV_SR=y
# CONFIG_BLK_DEV_SR_VENDOR is not set
CONFIG_SR_EXTRA_DEVS=2
CONFIG_CHR_DEV_SG=y
# CONFIG_SCSI_DEBUG_QUEUES is not set
# CONFIG_SCSI_MULTI_LUN is not set
# CONFIG_SCSI_CONSTANTS is not set
# CONFIG_SCSI_LOGGING is not set

#
# SCSI low-level drivers
#
# CONFIG_BLK_DEV_3W_XXXX_RAID is not set
# CONFIG_SCSI_7000FASST is not set
# CONFIG_SCSI_ACARD is not set
# CONFIG_SCSI_AHA152X is not set
# CONFIG_SCSI_AHA1542 is not set
# CONFIG_SCSI_AHA1740 is not set
# CONFIG_SCSI_AIC7XXX is not set
# CONFIG_SCSI_ADVANSYS is not set
# CONFIG_SCSI_IN2000 is not set
# CONFIG_SCSI_AM53C974 is not set
# CONFIG_SCSI_MEGARAID is not set
# CONFIG_SCSI_BUSLOGIC is not set
# CONFIG_SCSI_CPQFCTS is not set
# CONFIG_SCSI_DMX3191D is not set
# CONFIG_SCSI_DTC3280 is not set
# CONFIG_SCSI_EATA is not set
# CONFIG_SCSI_EATA_DMA is not set
# CONFIG_SCSI_EATA_PIO is not set
# CONFIG_SCSI_FUTURE_DOMAIN is not set
# CONFIG_SCSI_GDTH is not set
# CONFIG_SCSI_GENERIC_NCR5380 is not set
CONFIG_SCSI_LASI=y
CONFIG_SCSI_ZALON=y
# CONFIG_SCSI_INITIO is not set
# CONFIG_SCSI_INIA100 is not set
# CONFIG_SCSI_PPA is not set
# CONFIG_SCSI_IMM is not set
# CONFIG_SCSI_NCR53C406A is not set
# CONFIG_SCSI_NCR53C7xx is not set
# CONFIG_SCSI_NCR53C8XX is not set
CONFIG_SCSI_SYM53C8XX=y
CONFIG_SCSI_NCR53C8XX_DEFAULT_TAGS=8
CONFIG_SCSI_NCR53C8XX_MAX_TAGS=32
CONFIG_SCSI_NCR53C8XX_SYNC=20
# CONFIG_SCSI_NCR53C8XX_PROFILE is not set
# CONFIG_SCSI_NCR53C8XX_IOMAPPED is not set
# CONFIG_SCSI_NCR53C8XX_PQS_PDS is not set
# CONFIG_SCSI_PAS16 is not set
# CONFIG_SCSI_PCI2000 is not set
# CONFIG_SCSI_PCI2220I is not set
# CONFIG_SCSI_PSI240I is not set
# CONFIG_SCSI_QLOGIC_FAS is not set
# CONFIG_SCSI_QLOGIC_ISP is not set
# CONFIG_SCSI_QLOGIC_FC is not set
# CONFIG_SCSI_QLOGIC_1280 is not set
# CONFIG_SCSI_SIM710 is not set
# CONFIG_SCSI_SYM53C416 is not set
# CONFIG_SCSI_DC390T is not set
# CONFIG_SCSI_T128 is not set
# CONFIG_SCSI_U14_34F is not set

#
# Network device support
#
CONFIG_NETDEVICES=y

#
# ARCnet devices
#
# CONFIG_ARCNET is not set
# CONFIG_DUMMY is not set
# CONFIG_BONDING is not set
# CONFIG_EQUALIZER is not set
# CONFIG_TUN is not set
# CONFIG_NET_SB1000 is not set

#
# Ethernet (10 or 100Mbit)
#
CONFIG_NET_ETHERNET=y
CONFIG_LASI_82596=y
# CONFIG_NET_VENDOR_3COM is not set
# CONFIG_LANCE is not set
# CONFIG_NET_VENDOR_SMC is not set
# CONFIG_NET_VENDOR_RACAL is not set
# CONFIG_DEPCA is not set
# CONFIG_HP100 is not set
# CONFIG_NET_ISA is not set
CONFIG_NET_PCI=y
# CONFIG_PCNET32 is not set
# CONFIG_ADAPTEC_STARFIRE is not set
# CONFIG_APRICOT is not set
# CONFIG_CS89x0 is not set
CONFIG_TULIP=y
# CONFIG_DE4X5 is not set
# CONFIG_DGRS is not set
# CONFIG_DM9102 is not set
# CONFIG_EEPRO100 is not set
# CONFIG_EEPRO100_PM is not set
# CONFIG_LNE390 is not set
# CONFIG_NATSEMI is not set
# CONFIG_NE2K_PCI is not set
# CONFIG_NE3210 is not set
# CONFIG_ES3210 is not set
# CONFIG_8139TOO is not set
# CONFIG_RTL8129 is not set
# CONFIG_SIS900 is not set
# CONFIG_EPIC100 is not set
# CONFIG_SUNDANCE is not set
# CONFIG_TLAN is not set
# CONFIG_VIA_RHINE is not set
# CONFIG_WINBOND_840 is not set
# CONFIG_HAPPYMEAL is not set
# CONFIG_NET_POCKET is not set

#
# Ethernet (1000 Mbit)
#
# CONFIG_ACENIC is not set
# CONFIG_HAMACHI is not set
# CONFIG_SK98LIN is not set
# CONFIG_FDDI is not set
# CONFIG_PLIP is not set
# CONFIG_PPP is not set
# CONFIG_SLIP is not set

#
# Wireless LAN (non-hamradio)
#
# CONFIG_NET_RADIO is not set

#
# Token Ring devices
#
# CONFIG_TR is not set
# CONFIG_NET_FC is not set

#
# Wan interfaces
#
# CONFIG_WAN is not set

#
# Input core support
#
# CONFIG_INPUT is not set

#
# Character devices
#
CONFIG_VT=y
CONFIG_VT_CONSOLE=y
CONFIG_GSC_PS2=y
# CONFIG_HIL is not set
CONFIG_SERIAL=y
# CONFIG_SERIAL_CONSOLE is not set
CONFIG_SERIAL_GSC=y
# CONFIG_SERIAL_EXTENDED is not set
# CONFIG_SERIAL_NONSTANDARD is not set
CONFIG_UNIX98_PTYS=y
CONFIG_UNIX98_PTY_COUNT=256
CONFIG_PRINTER=y
# CONFIG_LP_CONSOLE is not set
# CONFIG_PPDEV is not set

#
# I2C support
#
# CONFIG_I2C is not set

#
# Mice
#
# CONFIG_BUSMOUSE is not set
CONFIG_MOUSE=y
CONFIG_PSMOUSE=y
# CONFIG_82C710_MOUSE is not set
# CONFIG_PC110_PAD is not set

#
# Joysticks
#
# CONFIG_JOYSTICK is not set
# CONFIG_QIC02_TAPE is not set

#
# Watchdog Cards
#
# CONFIG_WATCHDOG is not set
CONFIG_GENRTC=y
# CONFIG_INTEL_RNG is not set
# CONFIG_NVRAM is not set
# CONFIG_RTC is not set
# CONFIG_DTLK is not set
# CONFIG_R3964 is not set
# CONFIG_APPLICOM is not set

#
# Ftape, the floppy tape device driver
#
# CONFIG_FTAPE is not set
# CONFIG_AGP is not set
# CONFIG_DRM is not set

#
# Multimedia devices
#
# CONFIG_VIDEO_DEV is not set

#
# File systems
#
# CONFIG_QUOTA is not set
# CONFIG_AUTOFS_FS is not set
# CONFIG_AUTOFS4_FS is not set
# CONFIG_ADFS_FS is not set
# CONFIG_ADFS_FS_RW is not set
# CONFIG_AFFS_FS is not set
# CONFIG_HFS_FS is not set
# CONFIG_BFS_FS is not set
# CONFIG_FAT_FS is not set
# CONFIG_MSDOS_FS is not set
# CONFIG_UMSDOS_FS is not set
# CONFIG_VFAT_FS is not set
# CONFIG_EFS_FS is not set
# CONFIG_JFFS_FS is not set
# CONFIG_CRAMFS is not set
# CONFIG_RAMFS is not set
CONFIG_ISO9660_FS=y
# CONFIG_JOLIET is not set
# CONFIG_MINIX_FS is not set
# CONFIG_NTFS_FS is not set
# CONFIG_NTFS_RW is not set
# CONFIG_HPFS_FS is not set
CONFIG_PROC_FS=y
# CONFIG_DEVFS_FS is not set
# CONFIG_DEVFS_MOUNT is not set
# CONFIG_DEVFS_DEBUG is not set
# CONFIG_DEVPTS_FS is not set
# CONFIG_QNX4FS_FS is not set
# CONFIG_QNX4FS_RW is not set
# CONFIG_ROMFS_FS is not set
CONFIG_EXT2_FS=y
# CONFIG_SYSV_FS is not set
# CONFIG_SYSV_FS_WRITE is not set
# CONFIG_UDF_FS is not set
# CONFIG_UDF_RW is not set
# CONFIG_UFS_FS is not set
# CONFIG_UFS_FS_WRITE is not set

#
# Network File Systems
#
# CONFIG_CODA_FS is not set
CONFIG_NFS_FS=y
# CONFIG_NFS_V3 is not set
CONFIG_ROOT_NFS=y
# CONFIG_NFSD is not set
# CONFIG_NFSD_V3 is not set
CONFIG_SUNRPC=y
CONFIG_LOCKD=y
# CONFIG_SMB_FS is not set
# CONFIG_NCP_FS is not set
# CONFIG_NCPFS_PACKET_SIGNING is not set
# CONFIG_NCPFS_IOCTL_LOCKING is not set
# CONFIG_NCPFS_STRONG is not set
# CONFIG_NCPFS_NFS_NS is not set
# CONFIG_NCPFS_OS2_NS is not set
# CONFIG_NCPFS_SMALLDOS is not set
# CONFIG_NCPFS_NLS is not set
# CONFIG_NCPFS_EXTRAS is not set

#
# Partition Types
#
# CONFIG_PARTITION_ADVANCED is not set
CONFIG_MSDOS_PARTITION=y
# CONFIG_SMB_NLS is not set
# CONFIG_NLS is not set

#
# Console drivers
#

#
# Frame-buffer support
#
CONFIG_FB=y
CONFIG_DUMMY_CONSOLE=y
# CONFIG_FB_CYBER2000 is not set
CONFIG_FB_STI=y
# CONFIG_FBCON_ADVANCED is not set
CONFIG_FBCON_CFB2=y
CONFIG_FBCON_CFB4=y
CONFIG_FBCON_CFB8=y
CONFIG_FBCON_STI=y
# CONFIG_FBCON_FONTWIDTH8_ONLY is not set
# CONFIG_FBCON_FONTS is not set
CONFIG_FONT_8x8=y
CONFIG_FONT_8x16=y
CONFIG_STI_CONSOLE=y
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE=y
CONFIG_FBCON=y
CONFIG_FBCON_FONT=y
CONFIG_FONT_8x8=y
CONFIG_FONT_8x16=y
CONFIG_FONT_6x11=y
CONFIG_FONT_SUN12x22=y

#
# Sound
#
CONFIG_SOUND=y
CONFIG_SOUND_HARMONY=y
# CONFIG_SOUND_CMPCI is not set
# CONFIG_SOUND_EMU10K1 is not set
# CONFIG_SOUND_FUSION is not set
# CONFIG_SOUND_CS4281 is not set
# CONFIG_SOUND_ES1370 is not set
# CONFIG_SOUND_ES1371 is not set
# CONFIG_SOUND_ESSSOLO1 is not set
# CONFIG_SOUND_MAESTRO is not set
# CONFIG_SOUND_SONICVIBES is not set
# CONFIG_SOUND_TRIDENT is not set
# CONFIG_SOUND_MSNDCLAS is not set
# CONFIG_SOUND_MSNDPIN is not set
# CONFIG_SOUND_VIA82CXXX is not set
# CONFIG_SOUND_OSS is not set
# CONFIG_SOUND_TVMIXER is not set

#
# Kernel hacking
#
CONFIG_MAGIC_SYSRQ=y

--------------AA99F5639BE1355209CBE326--
