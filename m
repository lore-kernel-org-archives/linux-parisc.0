Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep15-int.chello.at (viefep15-int.chello.at [213.46.255.19])
	by dsl2.external.hp.com (Postfix) with ESMTP id 803694829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 16 Sep 2002 17:09:51 -0600 (MDT)
Message-ID: <3D8664B9.FFA6FD3A@gmx.at>
Date: Tue, 17 Sep 2002 01:09:45 +0200
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Content-Type: multipart/mixed;
 boundary="------------337BA726D358AC462F45C980"
Subject: [parisc-linux] New status MUX on E55
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

This is a multi-part message in MIME format.
--------------337BA726D358AC462F45C980
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

Hello Ryan,

I added the handling of the multi ports. So for example the
poll routine walks to all 8 devices (if opened), the
handling of the refcount is now per line, etc....

I give you the patch to see my changes, ignore my debug
print outs, and ignore the fact, that the polling routine
is running on 1.5 seconds !

We already have the state, that the HP machine completely
dies. Even no interrupts are working, no `ping' is answered,
etc...

I had seen an interesting effect:

mux_drv_poll: 0
mux_drv_poll:    done
mux_write: <hallo
>(5) to 0xfff788bc
68 61 6c 6c 6f 
mux_write:    before mux_flush_buffer()
mux_drv_poll: 0
mux_drv_poll: 1
mux_drv_poll:    done
mux_write: <àHIJKLMNOPQRSTUVWXYZ>(1) to 0xfff788bc
e0 
mux_write:    before mux_flush_buffer()

A `echo hallo > /dev/ttyB1' has produces this log.
After the mux_write() called with the string, the mux_write
is called a second time sending a 'e0' ???????
The first mux_write() is not finished (as no
`mux_write:   done' is displayed), the second blocks
the machine completely on the max_flush_buffer() call.
So the first writer block there, waiting in the endless
loop ! The second blocks up the whole machine ...

Further, NO OUTPUT were seen on the serial line of port
1 (not 0 !). Is there something, which is forgotten for
the initialization ? Perhaps something done for port 0
by the PDC code ?

Is this a common problem, as on the SPIFI, that there is
a general wrong access method to those devices ?

Bye
Christoph



-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at
--------------337BA726D358AC462F45C980
Content-Type: text/plain; charset=us-ascii;
 name="mux.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="mux.patch"

Index: drivers/char/mux.c
===================================================================
RCS file: /var/cvs/linux/drivers/char/mux.c,v
retrieving revision 1.3
diff -u -r1.3 mux.c
--- drivers/char/mux.c	11 Sep 2002 07:05:56 -0000	1.3
+++ drivers/char/mux.c	16 Sep 2002 22:59:48 -0000
@@ -56,7 +56,7 @@
 #define MUX_MIN_FREE_SIZE 32
 
 #define MUX_FIFO_DRAIN_DELAY 1
-#define MUX_POLL_DELAY (30 * HZ / 1000)
+#define MUX_POLL_DELAY (1500 * HZ / 1000)
 
 #define IO_COMMAND_REG_OFFSET 0x30
 #define IO_STATUS_REG_OFFSET 0x34
@@ -69,12 +69,13 @@
 #define MUX_STATUS(status) ((status & 0xF000) == 0x8000)
 #define MUX_BREAK(status) ((status & 0xF000) == 0x2000)
 
-static int mux_drv_refcount; /* = 0 */
+#define NR_PORTS 8
+static int global_mux_drv_refcount; /* = 0 */
+static int mux_drv_refcount [NR_PORTS]; /* = 0 */
 static struct tty_driver mux_drv_driver;
-static struct async_struct *mux_drv_info;
+static struct async_struct *mux_drv_info [NR_PORTS];
 static struct timer_list mux_drv_timer;
 
-#define NR_PORTS 1
 static struct tty_struct *mux_drv_table[NR_PORTS];
 static struct termios *mux_drv_termios[NR_PORTS];
 static struct termios *mux_drv_termios_locked[NR_PORTS];
@@ -127,6 +128,13 @@
 			break_pressed = 0;
 		}
 #endif
+		if ((data & 0xff) == 0x1c)
+		{
+                    extern void machine_restart (char *);
+                    
+                    printk ("\n\n<<console machine reset>>\n\n");
+                    machine_restart (NULL);
+		}
 
 		tty->flip.flag_buf_ptr++;
 		tty->flip.char_buf_ptr++;
@@ -146,13 +154,19 @@
 static void
 mux_drv_poll(unsigned long unused)
 {
-	struct async_struct *info = mux_drv_info;
+	struct async_struct *info;
+	int line;
 
-	if(info && info->tty && mux_drv_refcount) {
+	for (line = 0; line < NR_PORTS; line++)
+	{
+	    info = mux_drv_info [line];
+	    if(info && info->tty && mux_drv_refcount [line]) {
+		/* CP */ printk ("%s: %d\n", __FUNCTION__, line);
 		mux_read_fifo(info);
 		info->last_active = jiffies;
+	    }
 	}
-
+	/* CP */ printk ("%s:    done\n", __FUNCTION__);
 	mod_timer(&mux_drv_timer, jiffies + MUX_POLL_DELAY);
 }
 
@@ -224,6 +238,21 @@
 	unsigned long iomem_base = 
 		(unsigned long)((struct async_struct *)tty->driver_data)->iomem_base;
 
+	/* CP */ 
+	{
+	    int i, line = ((struct async_struct *)tty->driver_data)->line;
+
+	    if (line > 0)
+	    {
+		printk ("%s: <%s>(%d) to 0x%08x\n", __FUNCTION__, 
+			buf, count, iomem_base + IO_DATA_REG_OFFSET);
+		
+		for (i = 0; i < count; i++)
+		    printk ("%02x ", buf [i]);
+		printk ("\n");
+	    }
+	}
+
 	while (count) {
 		size = mux_write_room(tty);
 		len = (size < count) ? size : count;
@@ -245,8 +274,10 @@
 			__raw_writel(*buf_p++, iomem_base + IO_DATA_REG_OFFSET);
 		}
 	}
+	/* CP */ printk ("%s:    before mux_flush_buffer()\n", __FUNCTION__);
 
 	mux_flush_buffer(tty);
+	/* CP */ printk ("%s:    done\n", __FUNCTION__);
 	return ret;
 }
 
@@ -402,9 +433,11 @@
 mux_close(struct tty_struct *tty, struct file *filp)
 {
 	struct async_struct *info = (struct async_struct *) tty->driver_data;
+	int line = info->line;
 
-	mux_drv_refcount--;
-	if (mux_drv_refcount > 0)
+	mux_drv_refcount [line]--;
+	global_mux_drv_refcount--;
+	if (mux_drv_refcount [line] > 0)
 		return;
 
 	info->flags |= ASYNC_CLOSING;
@@ -434,7 +467,7 @@
 	tty->closing = 0;
 	info->event = 0;
 	info->tty = 0;
-	mux_drv_info = NULL;
+	mux_drv_info [line] = NULL;
 	if (info->blocked_open) {
 		if (info->close_delay) {
 			set_current_state(TASK_INTERRUPTIBLE);
@@ -473,7 +506,8 @@
 	info->port = 0;
 	info->flags = 0;
 	info->io_type = 0;
-	info->iomem_base = (void *)(hpa + MUX_OFFSET);
+	info->iomem_base = (void *)(hpa + MUX_OFFSET + 
+				    (line * MUX_LINE_OFFSET));
 	info->iomem_reg_shift = 0;
 	info->xmit_fifo_size = MUX_FIFO_SIZE;
 	info->line = line;
@@ -514,11 +548,12 @@
 
 	tty->driver_data = info;
 	info->tty = tty;
-	mux_drv_info = info;
+	mux_drv_info [line] = info;
 	info->tty->low_latency = 0;
 	info->session = current->session;
 	info->pgrp = current->pgrp;
-	mux_drv_refcount++;
+	mux_drv_refcount [line]++;
+	global_mux_drv_refcount++;
 	return 0;
 }
 
@@ -533,7 +568,8 @@
 mux_probe(struct parisc_device *dev)
 {
 	if(hpa) {
-		printk(KERN_INFO "Serial MUX driver already registered, skipping additonal MUXes for now.\n");
+		printk(KERN_INFO "Serial MUX driver already registered, "
+		       "skipping additonal MUXes for now.\n");
 		return 1;
 	}
 
@@ -564,7 +600,7 @@
 	mux_drv_driver.init_termios.c_cflag =
 	    B9600 | CS8 | CREAD | HUPCL | CLOCAL;
 	mux_drv_driver.flags = TTY_DRIVER_REAL_RAW | TTY_DRIVER_NO_DEVFS;
-	mux_drv_driver.refcount = &mux_drv_refcount;
+	mux_drv_driver.refcount = &global_mux_drv_refcount;
 	mux_drv_driver.table = mux_drv_table;
 	mux_drv_driver.termios = mux_drv_termios;
 	mux_drv_driver.termios_locked = mux_drv_termios_locked;
@@ -627,7 +663,8 @@
 {
 	int status = tty_unregister_driver(&mux_drv_driver);
 	if(status) {
-		printk("MUX: failed to unregister the Serial MUX driver (%d)\n", status);
+		printk("MUX: failed to unregister the "
+		       "Serial MUX driver (%d)\n", status);
 	}
 }
 

--------------337BA726D358AC462F45C980--
