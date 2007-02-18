From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] Re: [PARISC] fix uninitialized spinlock in HIL
	keyboard driver
Date: Sun, 18 Feb 2007 16:55:14 +0100
Message-ID: <200702181655.14483.deller__3448.54856743968$1416624298$gmane$org@gmx.de>
References: <11717457251848-git-send-email-kyle@parisc-linux.org>
	<200702180224.48281.dtor@insightbb.com>
	<200702181615.14056.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Cc: akpm@osdl.org,
 parisc-linux@lists.parisc-linux.org
To: Dmitry Torokhov <dtor@insightbb.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200702181615.14056.deller@gmx.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sunday 18 February 2007, Helge Deller wrote:
> On Sunday 18 February 2007, Dmitry Torokhov wrote:
> > If you could redo the patches against my tree that would be nice - I am having
> > trouble applying "[PARISC] hp_sdc: fix request_irq()/free_irq() parameters"
> >
> > Btw, is there any chance we coudl fix the code style in hil drivers. They are
> > very different from the rest of the kernel. Something like patch below...

> Sure, I'll do both and send you seperate patches soon.

Hi Dmitry,

Here is the patch and patchtext for the bugfixes which should cleanly apply to your git tree.
The coding-style cleanups will follow soon as well.
----------
Input: HIL - various fixes for HIL drivers

- mark some structures const or __read_mostly 
- hilkbd.c: fix uninitialized spinlock in HIL keyboard driver
- hil_mlc.c: use USEC_PER_SEC instead of 1000000
- hp_sdc: bugfix for request_irq()/free_irq() parameters, this prevented 
                  multiple load/unload cycles as module

Signed-off-by: Helge Deller <deller@gmx.de>
----------
diff --git a/drivers/input/keyboard/hil_kbd.c b/drivers/input/keyboard/hil_kbd.c
index 7cc9728..779322e 100644
--- a/drivers/input/keyboard/hil_kbd.c
+++ b/drivers/input/keyboard/hil_kbd.c
@@ -51,7 +51,7 @@ MODULE_LICENSE("Dual BSD/GPL");
 
 #define HIL_KBD_SET1_UPBIT 0x01
 #define HIL_KBD_SET1_SHIFT 1
-static unsigned int hil_kbd_set1[HIL_KEYCODES_SET1_TBLSIZE] = 
+static unsigned int hil_kbd_set1[HIL_KEYCODES_SET1_TBLSIZE] __read_mostly = 
 	{ HIL_KEYCODES_SET1 };
 
 #define HIL_KBD_SET2_UPBIT 0x01
@@ -60,10 +60,10 @@ static unsigned int hil_kbd_set1[HIL_KEY
 
 #define HIL_KBD_SET3_UPBIT 0x80
 #define HIL_KBD_SET3_SHIFT 0
-static unsigned int hil_kbd_set3[HIL_KEYCODES_SET3_TBLSIZE] =
+static unsigned int hil_kbd_set3[HIL_KEYCODES_SET3_TBLSIZE] __read_mostly =
 	{ HIL_KEYCODES_SET3 };
 
-static char hil_language[][16] = { HIL_LOCALE_MAP };
+static const char hil_language[][16] = { HIL_LOCALE_MAP };
 
 struct hil_kbd {
 	struct input_dev *dev;
@@ -368,7 +368,7 @@ static struct serio_device_id hil_kbd_id
 	{ 0 }
 };
 
-struct serio_driver hil_kbd_serio_drv = {
+static struct serio_driver hil_kbd_serio_drv = {
 	.driver		= {
 		.name	= "hil_kbd",
 	},
diff --git a/drivers/input/keyboard/hilkbd.c b/drivers/input/keyboard/hilkbd.c
index 4de4dc2..230f5db 100644
--- a/drivers/input/keyboard/hilkbd.c
+++ b/drivers/input/keyboard/hilkbd.c
@@ -3,7 +3,7 @@
  *
  *  Copyright (C) 1998 Philip Blundell <philb@gnu.org>
  *  Copyright (C) 1999 Matthew Wilcox <willy@bofh.ai>
- *  Copyright (C) 1999-2006 Helge Deller <deller@gmx.de>
+ *  Copyright (C) 1999-2007 Helge Deller <deller@gmx.de>
  *
  *  Very basic HP Human Interface Loop (HIL) driver.
  *  This driver handles the keyboard on HP300 (m68k) and on some
@@ -89,7 +89,7 @@ MODULE_LICENSE("GPL v2");
 #define	HIL_READKBDSADR		0xF9
 #define	HIL_WRITEKBDSADR	0xE9
 
-static unsigned int hphilkeyb_keycode[HIL_KEYCODES_SET1_TBLSIZE] =
+static unsigned int hphilkeyb_keycode[HIL_KEYCODES_SET1_TBLSIZE] __read_mostly =
 	{ HIL_KEYCODES_SET1 };
 
 /* HIL structure */
@@ -211,6 +211,7 @@ hil_keyb_init(void)
 		return -ENODEV; /* already initialized */
 	}
 
+	spin_lock_init(&hil_dev.lock);
 	hil_dev.dev = input_allocate_device();
 	if (!hil_dev.dev)
 		return -ENOMEM;
diff --git a/drivers/input/serio/hil_mlc.c b/drivers/input/serio/hil_mlc.c
index 4fa93ff..0710704 100644
--- a/drivers/input/serio/hil_mlc.c
+++ b/drivers/input/serio/hil_mlc.c
@@ -408,7 +408,7 @@ static int hilse_operate(hil_mlc *mlc, i
 #define OUT_LAST(pack) \
 { HILSE_OUT_LAST,	{ .packet = pack }, 0, 0, 0, 0 },
 
-struct hilse_node hil_mlc_se[HILSEN_END] = {
+const struct hilse_node hil_mlc_se[HILSEN_END] = {
 
 	/* 0  HILSEN_START */
 	FUNC(hilse_init_lcv, 0,	HILSEN_NEXT,	HILSEN_SLEEP,	0)
@@ -530,7 +530,7 @@ struct hilse_node hil_mlc_se[HILSEN_END]
 	/* 60 HILSEN_END */
 };
 
-static inline void hilse_setup_input(hil_mlc *mlc, struct hilse_node *node) {
+static inline void hilse_setup_input(hil_mlc *mlc, const struct hilse_node *node) {
 
 	switch (node->act) {
 	case HILSE_EXPECT_DISC:
@@ -563,21 +563,19 @@ static inline void hilse_setup_input(hil
 #ifdef HIL_MLC_DEBUG
 static int doze = 0;
 static int seidx; /* For debug */
-static int kick = 1;
 #endif
 
 static int hilse_donode (hil_mlc *mlc) {
-	struct hilse_node *node;
+	const struct hilse_node *node;
 	int nextidx = 0;
 	int sched_long = 0;
 	unsigned long flags;
 
 #ifdef HIL_MLC_DEBUG
 	if (mlc->seidx && (mlc->seidx != seidx)  && mlc->seidx != 41 && mlc->seidx != 42 && mlc->seidx != 43) {
-	  printk(KERN_DEBUG PREFIX "z%i \n%s {%i}", doze, kick ? "K" : "", mlc->seidx);
+	  printk(KERN_DEBUG PREFIX "z%i \n {%i}", doze, mlc->seidx);
 		doze = 0;
 	}
-	kick = 0;
 
 	seidx = mlc->seidx;
 #endif
@@ -588,7 +586,7 @@ static int hilse_donode (hil_mlc *mlc) {
 		hil_packet pack;
 
 	case HILSE_FUNC:
-		if (node->object.func == NULL) break;
+		BUG_ON(node->object.func == NULL);
 		rc = node->object.func(mlc, node->arg);
 		nextidx = (rc > 0) ? node->ugly : 
 			((rc < 0) ? node->bad : node->good);
@@ -674,10 +672,10 @@ static int hilse_donode (hil_mlc *mlc) {
 		if (!sched_long) goto sched;
 
 		do_gettimeofday(&tv);
-		tv.tv_usec += 1000000 * (tv.tv_sec - mlc->instart.tv_sec);
+		tv.tv_usec += USEC_PER_SEC * (tv.tv_sec - mlc->instart.tv_sec);
 		tv.tv_usec -= mlc->instart.tv_usec;
 		if (tv.tv_usec >= mlc->intimeout) goto sched;
-		tv.tv_usec = (mlc->intimeout - tv.tv_usec) * HZ / 1000000;
+		tv.tv_usec = (mlc->intimeout - tv.tv_usec) * HZ / USEC_PER_SEC;
 		if (!tv.tv_usec) goto sched;
 		mod_timer(&hil_mlcs_kicker, jiffies + tv.tv_usec);
 		break;
@@ -837,7 +835,7 @@ static void hil_mlc_serio_close(struct s
 	/* TODO wake up interruptable */
 }
 
-static struct serio_device_id hil_mlc_serio_id = {
+static const struct serio_device_id hil_mlc_serio_id = {
 	.type = SERIO_HIL_MLC,
 	.proto = SERIO_HIL,
 	.extra = SERIO_ANY,
@@ -873,6 +871,8 @@ int hil_mlc_register(hil_mlc *mlc) {
 		hil_mlc_copy_di_scratch(mlc, i);
 		mlc_serio = kzalloc(sizeof(*mlc_serio), GFP_KERNEL);
 		mlc->serio[i] = mlc_serio;
+		snprintf(mlc_serio->name, sizeof(mlc_serio->name)-1, "HIL_SERIO%d", i);
+		snprintf(mlc_serio->phys, sizeof(mlc_serio->phys)-1, "HIL%d", i);
 		mlc_serio->id			= hil_mlc_serio_id;
 		mlc_serio->write		= hil_mlc_serio_write;
 		mlc_serio->open			= hil_mlc_serio_open;
diff --git a/drivers/input/serio/hp_sdc.c b/drivers/input/serio/hp_sdc.c
index b57370d..353a8a1 100644
--- a/drivers/input/serio/hp_sdc.c
+++ b/drivers/input/serio/hp_sdc.c
@@ -748,7 +748,7 @@ void hp_sdc_kicker (unsigned long data) 
 
 #if defined(__hppa__)
 
-static struct parisc_device_id hp_sdc_tbl[] = {
+static const struct parisc_device_id hp_sdc_tbl[] = {
 	{
 		.hw_type =	HPHW_FIO, 
 		.hversion_rev =	HVERSION_REV_ANY_ID,
@@ -817,12 +817,12 @@ static int __init hp_sdc_init(void)
 #endif	
 
 	errstr = "IRQ not available for";
-        if(request_irq(hp_sdc.irq, &hp_sdc_isr, 0, "HP SDC",
-		       (void *) hp_sdc.base_io)) goto err1;
+	if (request_irq(hp_sdc.irq, &hp_sdc_isr, IRQF_SHARED|IRQF_SAMPLE_RANDOM,
+		"HP SDC", &hp_sdc)) goto err1;
 
 	errstr = "NMI not available for";
-	if (request_irq(hp_sdc.nmi, &hp_sdc_nmisr, 0, "HP SDC NMI", 
-			(void *) hp_sdc.base_io)) goto err2;
+	if (request_irq(hp_sdc.nmi, &hp_sdc_nmisr, IRQF_SHARED,
+		"HP SDC NMI", &hp_sdc)) goto err2;
 
 	printk(KERN_INFO PREFIX "HP SDC at 0x%p, IRQ %d (NMI IRQ %d)\n", 
 	       (void *)hp_sdc.base_io, hp_sdc.irq, hp_sdc.nmi);
@@ -854,7 +854,7 @@ static int __init hp_sdc_init(void)
 	hp_sdc.dev_err = 0;
 	return 0;
  err2:
-	free_irq(hp_sdc.irq, NULL);
+	free_irq(hp_sdc.irq, &hp_sdc);
  err1:
 	release_region(hp_sdc.data_io, 2);
  err0:
@@ -898,8 +898,8 @@ static void hp_sdc_exit(void)
 	/* Wait until we know this has been processed by the i8042 */
 	hp_sdc_spin_ibf();
 
-	free_irq(hp_sdc.nmi, NULL);
-	free_irq(hp_sdc.irq, NULL);
+	free_irq(hp_sdc.nmi, &hp_sdc);
+	free_irq(hp_sdc.irq, &hp_sdc);
 	write_unlock_irq(&hp_sdc.lock);
 
 	del_timer(&hp_sdc.kicker);
diff --git a/drivers/input/serio/hp_sdc_mlc.c b/drivers/input/serio/hp_sdc_mlc.c
index aa4a8a4..1f131ff 100644
--- a/drivers/input/serio/hp_sdc_mlc.c
+++ b/drivers/input/serio/hp_sdc_mlc.c
@@ -323,11 +323,12 @@ static int __init hp_sdc_mlc_init(void)
 	mlc->in			= &hp_sdc_mlc_in;
 	mlc->out		= &hp_sdc_mlc_out;
 
+	mlc->priv		= &hp_sdc_mlc_priv;
+
 	if (hil_mlc_register(mlc)) {
 		printk(KERN_WARNING PREFIX "Failed to register MLC structure with hil_mlc\n");
 		goto err0;
 	}
-	mlc->priv		= &hp_sdc_mlc_priv;
 
 	if (hp_sdc_request_hil_irq(&hp_sdc_mlc_isr)) {
 		printk(KERN_WARNING PREFIX "Request for raw HIL ISR hook denied\n");
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
