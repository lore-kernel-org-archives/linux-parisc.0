From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: [RFC] Fix warnings from various parisc and hp specific files
Date: Wed, 10 Dec 2008 21:26:14 -0500
Message-ID: <20081211022614.GA18170@hiauly1.hia.nrc.ca>
References: <20081210214638.GA28696@bombadil.infradead.org>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="+HP7ph2BbKc20aGI"
Cc: linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@infradead.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081210214638.GA28696@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Attached are various fixes to correct warnings.  Mostly, they fix
warnings about ignoring return values.  There is one warning about
using a possibly uninitialized variable.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="ccio-dma.c.d.1"

diff --git a/drivers/input/keyboard/hil_kbd.c b/drivers/input/keyboard/hil_kbd.c
index 71c1971..2d1aa6b 100644
--- a/drivers/input/keyboard/hil_kbd.c
+++ b/drivers/input/keyboard/hil_kbd.c
@@ -260,7 +260,7 @@ static int hil_kbd_connect(struct serio *serio, struct serio_driver *drv)
 {
 	struct hil_kbd	*kbd;
 	uint8_t		did, *idd;
-	int		i;
+	int		err, i;
 
 	kbd = kzalloc(sizeof(*kbd), GFP_KERNEL);
 	if (!kbd)
@@ -345,7 +345,13 @@ static int hil_kbd_connect(struct serio *serio, struct serio_driver *drv)
 	}
 	clear_bit(0, kbd->dev->keybit);
 
-	input_register_device(kbd->dev);
+	err = input_register_device(kbd->dev);
+	if (err < 0) {
+		input_free_device(kbd->dev);
+		kfree(kbd);
+		return err;
+	}
+
 	printk(KERN_INFO "input: %s, ID: %d\n",
 		kbd->dev->name, did);
 
diff --git a/drivers/input/misc/hp_sdc_rtc.c b/drivers/input/misc/hp_sdc_rtc.c
index 216a559..9a35a4c 100644
--- a/drivers/input/misc/hp_sdc_rtc.c
+++ b/drivers/input/misc/hp_sdc_rtc.c
@@ -52,6 +52,8 @@ MODULE_LICENSE("Dual BSD/GPL");
 
 #define RTC_VERSION "1.10d"
 
+#define CONFIG_EXPERIMENTAL_IOCTL 0
+
 static unsigned long epoch = 2000;
 
 static struct semaphore i8042tregs;
@@ -108,7 +110,9 @@ static int hp_sdc_rtc_do_read_bbrtc (struct rtc_time *rtctm)
 	
 	if (hp_sdc_enqueue_transaction(&t)) return -1;
 	
-	down_interruptible(&tsem);  /* Put ourselves to sleep for results. */
+	/* Put ourselves to sleep for results. */
+	if (down_interruptible(&tsem) < 0)
+		return -1;
 	
 	/* Check for nonpresence of BBRTC */
 	if (!((tseq[83] | tseq[90] | tseq[69] | tseq[76] |
@@ -175,11 +179,16 @@ static int64_t hp_sdc_rtc_read_i8042timer (uint8_t loadcmd, int numreg)
 	t.seq =			tseq;
 	t.act.semaphore =	&i8042tregs;
 
-	down_interruptible(&i8042tregs);  /* Sleep if output regs in use. */
+	/* Sleep if output regs in use. */
+	if (down_interruptible(&i8042tregs) < 0)
+		return -1;
 
 	if (hp_sdc_enqueue_transaction(&t)) return -1;
 	
-	down_interruptible(&i8042tregs);  /* Sleep until results come back. */
+	/* Sleep until results come back. */
+	if (down_interruptible(&i8042tregs) < 0)
+		return -1;
+
 	up(&i8042tregs);
 
 	return (tseq[5] | 
@@ -274,6 +283,7 @@ static inline int hp_sdc_rtc_read_ct(struct timeval *res) {
 	return 0;
 }
 
+#if CONFIG_EXPERIMENTAL_IOCTL
 
 /* Set the i8042 real-time clock */
 static int hp_sdc_rtc_set_rt (struct timeval *setto)
@@ -386,6 +396,8 @@ static int hp_sdc_rtc_set_i8042timer (struct timeval *setto, uint8_t setcmd)
 	return 0;
 }
 
+#endif /* CONFIG_EXPERIMENTAL_IOCTL */
+
 static ssize_t hp_sdc_rtc_read(struct file *file, char __user *buf,
 			       size_t count, loff_t *ppos) {
 	ssize_t retval;
@@ -517,7 +529,7 @@ static int hp_sdc_rtc_read_proc(char *page, char **start, off_t off,
 static int hp_sdc_rtc_ioctl(struct inode *inode, struct file *file, 
 			    unsigned int cmd, unsigned long arg)
 {
-#if 1
+#if !CONFIG_EXPERIMENTAL_IOCTL
 	return -EINVAL;
 #else
 	
diff --git a/drivers/parisc/ccio-dma.c b/drivers/parisc/ccio-dma.c
index dcc1e99..a194acb 100644
--- a/drivers/parisc/ccio-dma.c
+++ b/drivers/parisc/ccio-dma.c
@@ -1028,8 +1028,10 @@ static int ccio_proc_info(struct seq_file *m, void *p)
 
 	while (ioc != NULL) {
 		unsigned int total_pages = ioc->res_size << 3;
+#ifdef CCIO_COLLECT_STATS
 		unsigned long avg = 0, min, max;
 		int j;
+#endif
 
 		len += seq_printf(m, "%s\n", ioc->name);
 		

--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="hp_sdc_rtc.c.d.1"

diff --git a/drivers/input/misc/hp_sdc_rtc.c b/drivers/input/misc/hp_sdc_rtc.c
index 216a559..9a35a4c 100644
--- a/drivers/input/misc/hp_sdc_rtc.c
+++ b/drivers/input/misc/hp_sdc_rtc.c
@@ -52,6 +52,8 @@ MODULE_LICENSE("Dual BSD/GPL");
 
 #define RTC_VERSION "1.10d"
 
+#define CONFIG_EXPERIMENTAL_IOCTL 0
+
 static unsigned long epoch = 2000;
 
 static struct semaphore i8042tregs;
@@ -108,7 +110,9 @@ static int hp_sdc_rtc_do_read_bbrtc (struct rtc_time *rtctm)
 	
 	if (hp_sdc_enqueue_transaction(&t)) return -1;
 	
-	down_interruptible(&tsem);  /* Put ourselves to sleep for results. */
+	/* Put ourselves to sleep for results. */
+	if (down_interruptible(&tsem) < 0)
+		return -1;
 	
 	/* Check for nonpresence of BBRTC */
 	if (!((tseq[83] | tseq[90] | tseq[69] | tseq[76] |
@@ -175,11 +179,16 @@ static int64_t hp_sdc_rtc_read_i8042timer (uint8_t loadcmd, int numreg)
 	t.seq =			tseq;
 	t.act.semaphore =	&i8042tregs;
 
-	down_interruptible(&i8042tregs);  /* Sleep if output regs in use. */
+	/* Sleep if output regs in use. */
+	if (down_interruptible(&i8042tregs) < 0)
+		return -1;
 
 	if (hp_sdc_enqueue_transaction(&t)) return -1;
 	
-	down_interruptible(&i8042tregs);  /* Sleep until results come back. */
+	/* Sleep until results come back. */
+	if (down_interruptible(&i8042tregs) < 0)
+		return -1;
+
 	up(&i8042tregs);
 
 	return (tseq[5] | 
@@ -274,6 +283,7 @@ static inline int hp_sdc_rtc_read_ct(struct timeval *res) {
 	return 0;
 }
 
+#if CONFIG_EXPERIMENTAL_IOCTL
 
 /* Set the i8042 real-time clock */
 static int hp_sdc_rtc_set_rt (struct timeval *setto)
@@ -386,6 +396,8 @@ static int hp_sdc_rtc_set_i8042timer (struct timeval *setto, uint8_t setcmd)
 	return 0;
 }
 
+#endif /* CONFIG_EXPERIMENTAL_IOCTL */
+
 static ssize_t hp_sdc_rtc_read(struct file *file, char __user *buf,
 			       size_t count, loff_t *ppos) {
 	ssize_t retval;
@@ -517,7 +529,7 @@ static int hp_sdc_rtc_read_proc(char *page, char **start, off_t off,
 static int hp_sdc_rtc_ioctl(struct inode *inode, struct file *file, 
 			    unsigned int cmd, unsigned long arg)
 {
-#if 1
+#if !CONFIG_EXPERIMENTAL_IOCTL
 	return -EINVAL;
 #else
 	

--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="hil_kbd.c.d.1"

diff --git a/drivers/input/keyboard/hil_kbd.c b/drivers/input/keyboard/hil_kbd.c
index 71c1971..2d1aa6b 100644
--- a/drivers/input/keyboard/hil_kbd.c
+++ b/drivers/input/keyboard/hil_kbd.c
@@ -260,7 +260,7 @@ static int hil_kbd_connect(struct serio *serio, struct serio_driver *drv)
 {
 	struct hil_kbd	*kbd;
 	uint8_t		did, *idd;
-	int		i;
+	int		err, i;
 
 	kbd = kzalloc(sizeof(*kbd), GFP_KERNEL);
 	if (!kbd)
@@ -345,7 +345,13 @@ static int hil_kbd_connect(struct serio *serio, struct serio_driver *drv)
 	}
 	clear_bit(0, kbd->dev->keybit);
 
-	input_register_device(kbd->dev);
+	err = input_register_device(kbd->dev);
+	if (err < 0) {
+		input_free_device(kbd->dev);
+		kfree(kbd);
+		return err;
+	}
+
 	printk(KERN_INFO "input: %s, ID: %d\n",
 		kbd->dev->name, did);
 

--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="dino.c.d.1"

diff --git a/drivers/parisc/dino.c b/drivers/parisc/dino.c
index 3bc54b3..a61a37c 100644
--- a/drivers/parisc/dino.c
+++ b/drivers/parisc/dino.c
@@ -614,7 +614,9 @@ dino_fixup_bus(struct pci_bus *bus)
 			    bus->self->dev.bus_id, i,
 			    bus->self->resource[i].start,
 			    bus->self->resource[i].end);
-			pci_assign_resource(bus->self, i);
+			if (pci_assign_resource(bus->self, i) != 0) {
+				printk(KERN_WARNING "Could not assign dino bus resource\n");
+			}
 			DBG("DEBUG %s after assign %d [0x%lx,0x%lx]\n",
 			    bus->self->dev.bus_id, i,
 			    bus->self->resource[i].start,

--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="8250.c.d.1"

diff --git a/drivers/serial/8250.c b/drivers/serial/8250.c
index 303272a..c3120be 100644
--- a/drivers/serial/8250.c
+++ b/drivers/serial/8250.c
@@ -1609,7 +1609,7 @@ static int serial_link_irq_chain(struct uart_8250_port *up)
 
 static void serial_unlink_irq_chain(struct uart_8250_port *up)
 {
-	struct irq_info *i;
+	struct irq_info *i = NULL;
 	struct hlist_node *n;
 	struct hlist_head *h;
 
@@ -1624,6 +1624,7 @@ static void serial_unlink_irq_chain(struct uart_8250_port *up)
 	}
 
 	BUG_ON(n == NULL);
+	BUG_ON(i == NULL);
 	BUG_ON(i->head == NULL);
 
 	if (list_empty(i->head))

--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="hp_sdc_mlc.c.d.1"

diff --git a/drivers/input/serio/hp_sdc_mlc.c b/drivers/input/serio/hp_sdc_mlc.c
index b587e2d..15c99fb 100644
--- a/drivers/input/serio/hp_sdc_mlc.c
+++ b/drivers/input/serio/hp_sdc_mlc.c
@@ -295,8 +295,9 @@ static void hp_sdc_mlc_out(hil_mlc *mlc)
 	/* priv->tseq[3] = (mlc->ddc + 1) | HP_SDC_LPS_ACSUCC; */
 	priv->tseq[3] = 0;
 	if (mlc->opacket & HIL_CTRL_APE) {
+		int ignore;
 		priv->tseq[3] |= HP_SDC_LPC_APE_IPF;
-		down_trylock(&mlc->csem);
+		ignore = down_trylock(&mlc->csem);
 	}
  enqueue:
 	hp_sdc_enqueue_transaction(&priv->trans);

--+HP7ph2BbKc20aGI--
