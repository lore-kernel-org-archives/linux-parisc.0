Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 12D62482A
	for <parisc-linux@parisc-linux.org>; Thu, 10 May 2001 19:17:55 -0600 (MDT)
Received: from esiee.fr (pc5158a.esiee.fr [147.215.50.165])
	by mail.esiee.fr (Postfix) with ESMTP id 14214D15AC
	for <parisc-linux@parisc-linux.org>; Fri, 11 May 2001 03:17:13 +0200 (CEST)
Sender: marteaut@esiee.fr
Message-ID: <3AFB3F73.80405809@esiee.fr>
Date: Fri, 11 May 2001 03:25:07 +0200
From: Thomas Marteau <marteaut@esiee.fr>
MIME-Version: 1.0
To: "parisc-linux@parisc-linux.org" <parisc-linux@parisc-linux.org>
Content-Type: multipart/mixed;
 boundary="------------FE55E5BB576DF120F532BB7E"
Subject: [parisc-linux] PS2 Mouse support
List-ID: <linux-parisc.vger.kernel.org>

This is a multi-part message in MIME format.
--------------FE55E5BB576DF120F532BB7E
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi all,

	I finally released my patch in order to get the PS2 mouse support. It
is working with GPM if you run STI-console with the Deller's frambuffer
available at ftp://people.redhat.com/hdeller/parisc_stifb

	This patch can be downloaded from our website
http://www.esiee.fr/puffin

Feedback is always appreciated, Thomas
ESIEE Team

PS: If someone want to commit it, please do!
--------------FE55E5BB576DF120F532BB7E
Content-Type: text/plain; charset=us-ascii;
 name="mouse.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="mouse.patch"

diff -Nru linuxbf/drivers/char/hp_keyb.h linux/drivers/char/hp_keyb.h
--- linuxbf/drivers/char/hp_keyb.h	Thu Jan  1 01:00:00 1970
+++ linux/drivers/char/hp_keyb.h	Fri May 11 02:10:41 2001
@@ -0,0 +1,60 @@
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
+#define KBD_ECHO	0xEE		/* in/out */
+#define KBD_DEFAULT	0xF6		/* out */
+#define KBD_DIAGFAIL	0xFD		/* in */
+
+/* Only in hp_keyb.c */
+#define KBD_BREAK	0xF0		/* in */
+
+/* Standard mouse behaviour parameters */
+
+#define AUX_REPLY_ACK   0xFA            /* Command byte ACK. */
+#define AUX_RECONNECT   0xAA            /* scancode when ps2 device is plugged (back) in */
+
+/* PA-RISC define */
+#define LASI_OFFSET     0x0100
+
+#define	LASI_ID		0x00
+#define LASI_RESET	0x00
+#define LASI_RCVDATA	0x04
+#define LASI_XMTDATA	0x04
+#define LASI_CONTROL	0x08
+#define LASI_STATUS	0x0C
+
+/* Control register bits */
+
+#define LASI_CTRL_ENBL		0x01	/* enable interface */
+#define LASI_CTRL_LPBXR		0x02	/* loopback operation */
+#define LASI_CTRL_DIAG		0x20	/* directly control clock/data line */
+#define	LASI_CTRL_DATDIR	0x40	/* data line direct control */
+#define	LASI_CTRL_CLKDIR	0x80	/* clock line direct control */
+
+/* Status register bits */
+
+#define LASI_STAT_RBNE		0x01
+#define LASI_STAT_TBNE		0x02
+#define LASI_STAT_TERR		0x04
+#define LASI_STAT_PERR		0x08
+#define LASI_STAT_CMPINTR	0x10
+#define LASI_STAT_DATSHD	0x40
+#define LASI_STAT_CLKSHD	0x80
+
+
+
+
+
+
+
+
+
diff -Nru linuxbf/drivers/char/hp_psaux.c linux/drivers/char/hp_psaux.c
--- linuxbf/drivers/char/hp_psaux.c	Fri May 11 02:09:08 2001
+++ linux/drivers/char/hp_psaux.c	Fri May 11 02:10:41 2001
@@ -9,7 +9,9 @@
  *			Marteau Thomas (marteaut@esiee.fr)
  * 			Djoudi Malek (djoudim@esiee.fr)
  *	fixed leds control
+ *      implemented the psaux and controlled the mouse scancode
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
+/* HP include */
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
+static struct aux_queue *queue;	/* Mouse data buffer. */
+static int aux_count;
+static spinlock_t kbd_controller_lock = SPIN_LOCK_UNLOCKED;
+#endif
 
 
 static inline u8 read_input(void *hpa)
@@ -94,7 +78,6 @@
 static void write_output(u8 val, void *hpa)
 {
 	int wait = 0;
-
 	while (read_status(hpa) & LASI_STAT_TBNE) {
 		wait++;
 		if (wait>10000) {
@@ -111,12 +94,19 @@
 	return;
 }
 
+/* This function is the PA-RISC adaptation of i386 source */
+
+static void aux_write_ack(u8 val)
+{
+      write_output(val,lasikbd_hpa+LASI_OFFSET);
+}
+
 
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
+int lasi_ps2_reset(void *hpa,int id)
 {
 	u8 control;
 
@@ -161,6 +151,14 @@
 	control = read_control(hpa);
 	write_control(control | LASI_CTRL_ENBL, hpa);
 
+	/* initializes the leds at the default state */
+	if (id==0){
+	   write_output(KBD_CMD_SET_LEDS, hpa);
+	   write_output(0, hpa);
+	   write_output(KBD_CMD_ENABLE, hpa);
+	}
+ 
+
 	return 0;
 }
 
@@ -171,34 +169,248 @@
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
+{
+	return queue->head == queue->tail;
+}
+
+static unsigned char get_from_queue(void)
 {
-	u8 status;
-	extern void handle_at_scancode(int); /* in drivers/char/keyb_at.c */
+	unsigned char result;
+	unsigned long flags;
 
-	while ((status = read_status(hpa)) & LASI_STAT_RBNE) {
-		u8 scancode;
+	spin_lock_irqsave(&kbd_controller_lock, flags);
+	result = queue->buf[queue->tail];
+	queue->tail = (queue->tail + 1) & (AUX_BUF_SIZE-1);
+	spin_unlock_irqrestore(&kbd_controller_lock, flags);
+	return result;
+}
+
+
+/*
+ * Write to the aux device.
+ */
 
-		scancode = read_input(hpa);
+static ssize_t write_aux(struct file * file, const char * buffer,
+			 size_t count, loff_t *ppos)
+{
+	ssize_t retval = 0;
+
+	if (count) {
+		ssize_t written = 0;
 
-		if (inited)
-			handle_at_scancode(scancode);
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
 
-	return status;
+
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
 	
 extern struct pt_regs *kbd_pt_regs;
 
 static void lasikbd_interrupt(int irq, void *dev, struct pt_regs *regs)
 {
-	lasikbd_hpa = dev; /* save "hpa" for lasikbd_leds() */
+   
+	lasips2_hpa = dev; /* save "hpa" for lasikbd_leds() */
 
 	kbd_pt_regs = regs;
 
-	handle_lasikbd_event(lasikbd_hpa);
+	handle_lasikbd_event(lasips2_hpa);
 }
 
 
@@ -230,6 +442,23 @@
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
+
+
 static int __init
 lasi_ps2_register(struct hp_device *d, struct pa_iodc_driver *dri)
 {
@@ -247,21 +476,27 @@
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
@@ -270,11 +505,39 @@
 		    
 		request_irq(irq, lasikbd_interrupt, 0, name, hpa);
 
-		request_mem_region((unsigned long)hpa, LASI_STATUS + 4, name);
+		request_region((unsigned long)hpa, LASI_STATUS + 4, name);
 		
 		register_kbd_ops(&gsc_ps2_kbd_ops);
 	}
 
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
+
 	return 0;
 }
 
@@ -290,3 +553,9 @@
 	register_driver(lasi_psaux_drivers_for);
 	return 0;
 }
+
+
+
+
+
+
diff -Nru linuxbf/drivers/gsc/lasi.c linux/drivers/gsc/lasi.c
--- linuxbf/drivers/gsc/lasi.c	Fri May 11 02:09:10 2001
+++ linux/drivers/gsc/lasi.c	Fri May 11 02:10:57 2001
@@ -48,7 +48,8 @@
 	case 0x5000:	irq = 26; break; /* RS232 */
 	case 0x6000:	irq = 22; break; /* SCSI */
 	case 0x7000:	irq = 23; break; /* LAN */
-	case 0x8000:	irq =  5; break; /* PS/2 Keyboard and Mouse */
+	case 0x8000:	irq =  5; break; /* PS/2 Keyboard */
+	case 0x8100:	irq =  5; break; /* PS/2 Mouse */
 	case 0xA000:	irq = 11; break; /* Floppy Disk Controller */
 	default: 	irq = -1; break; /* unknown */
 	}

--------------FE55E5BB576DF120F532BB7E--
