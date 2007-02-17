From: Kyle McMartin <kyle@parisc-linux.org>
Subject: [PARISC] input: various cleanups
Date: Sat, 17 Feb 2007 15:55:25 -0500
Message-ID: <11717457253323-git-send-email-kyle__36366.7530510158$1416624294$gmane$org@parisc-linux.org>
References: <11717457251848-git-send-email-kyle@parisc-linux.org> <11717457251606-git-send-email-kyle@parisc-linux.org> <11717457253477-git-send-email-kyle@parisc-linux.org> <11717457252335-git-send-email-kyle@parisc-linux.org>
Cc: parisc-linux@lists.parisc-linux.org,
 akpm@osdl.org,
 Helge Deller <deller@gmx.de>,
 Kyle McMartin <kyle@parisc-linux.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Return-Path: <kyle@athena.road.mcmartin.ca>
In-Reply-To: <11717457252335-git-send-email-kyle@parisc-linux.org>
List-ID: <linux-parisc.vger.kernel.org>

From: Helge Deller <deller@gmx.de>

- mark some structures and data as const or __read_mostly; use USEC_PER_SEC

Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Kyle McMartin <kyle@parisc-linux.org>
---
 drivers/input/keyboard/hil_kbd.c |    8 ++++----
 drivers/input/serio/hil_mlc.c    |   19 +++++++++----------
 drivers/input/serio/hp_sdc.c     |   10 +++++-----
 drivers/input/serio/hp_sdc_mlc.c |    3 ++-
 4 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/input/keyboard/hil_kbd.c b/drivers/input/keyboard/hil_kbd.c
index 7cc9728..7143f37 100644
--- a/drivers/input/keyboard/hil_kbd.c
+++ b/drivers/input/keyboard/hil_kbd.c
@@ -51,7 +51,7 @@ MODULE_LICENSE("Dual BSD/GPL");
 
 #define HIL_KBD_SET1_UPBIT 0x01
 #define HIL_KBD_SET1_SHIFT 1
-static unsigned int hil_kbd_set1[HIL_KEYCODES_SET1_TBLSIZE] = 
+static unsigned int hil_kbd_set1[HIL_KEYCODES_SET1_TBLSIZE] __read_mostly =
 	{ HIL_KEYCODES_SET1 };
 
 #define HIL_KBD_SET2_UPBIT 0x01
@@ -60,10 +60,10 @@ static unsigned int hil_kbd_set1[HIL_KEYCODES_SET1_TBLSIZE] =
 
 #define HIL_KBD_SET3_UPBIT 0x80
 #define HIL_KBD_SET3_SHIFT 0
-static unsigned int hil_kbd_set3[HIL_KEYCODES_SET3_TBLSIZE] =
+static unsigned int hil_kbd_set3[HIL_KEYCODES_SET3_TBLSIZE] __read_mostly =
 	{ HIL_KEYCODES_SET3 };
 
-static char hil_language[][16] = { HIL_LOCALE_MAP };
+static const char hil_language[][16] = { HIL_LOCALE_MAP };
 
 struct hil_kbd {
 	struct input_dev *dev;
@@ -368,7 +368,7 @@ static struct serio_device_id hil_kbd_ids[] = {
 	{ 0 }
 };
 
-struct serio_driver hil_kbd_serio_drv = {
+static struct serio_driver hil_kbd_serio_drv = {
 	.driver		= {
 		.name	= "hil_kbd",
 	},
diff --git a/drivers/input/serio/hil_mlc.c b/drivers/input/serio/hil_mlc.c
index 49e11e2..80f0e23 100644
--- a/drivers/input/serio/hil_mlc.c
+++ b/drivers/input/serio/hil_mlc.c
@@ -409,7 +409,7 @@ static int hilse_operate(hil_mlc *mlc, int repoll) {
 #define OUT_LAST(pack) \
 { HILSE_OUT_LAST,	{ .packet = pack }, 0, 0, 0, 0 },
 
-struct hilse_node hil_mlc_se[HILSEN_END] = {
+const struct hilse_node hil_mlc_se[HILSEN_END] = {
 
 	/* 0  HILSEN_START */
 	FUNC(hilse_init_lcv, 0,	HILSEN_NEXT,	HILSEN_SLEEP,	0)
@@ -531,7 +531,7 @@ struct hilse_node hil_mlc_se[HILSEN_END] = {
 	/* 60 HILSEN_END */
 };
 
-static inline void hilse_setup_input(hil_mlc *mlc, struct hilse_node *node) {
+static inline void hilse_setup_input(hil_mlc *mlc, const struct hilse_node *node) {
 
 	switch (node->act) {
 	case HILSE_EXPECT_DISC:
@@ -564,21 +564,19 @@ static inline void hilse_setup_input(hil_mlc *mlc, struct hilse_node *node) {
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
@@ -589,7 +587,6 @@ static int hilse_donode (hil_mlc *mlc) {
 		hil_packet pack;
 
 	case HILSE_FUNC:
-		if (node->object.func == NULL) break;
 		rc = node->object.func(mlc, node->arg);
 		nextidx = (rc > 0) ? node->ugly : 
 			((rc < 0) ? node->bad : node->good);
@@ -675,10 +672,10 @@ static int hilse_donode (hil_mlc *mlc) {
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
@@ -838,7 +835,7 @@ static void hil_mlc_serio_close(struct serio *serio) {
 	/* TODO wake up interruptable */
 }
 
-static struct serio_device_id hil_mlc_serio_id = {
+static const struct serio_device_id hil_mlc_serio_id = {
 	.type = SERIO_HIL_MLC,
 	.proto = SERIO_HIL,
 	.extra = SERIO_ANY,
@@ -874,6 +871,8 @@ int hil_mlc_register(hil_mlc *mlc) {
 		hil_mlc_copy_di_scratch(mlc, i);
 		mlc_serio = kzalloc(sizeof(*mlc_serio), GFP_KERNEL);
 		mlc->serio[i] = mlc_serio;
+		snprintf(mlc_serio->name, sizeof(mlc_serio->name)-1, "HIL_SERIO%d", i);
+		snprintf(mlc_serio->phys, sizeof(mlc_serio->phys)-1, "HIL%d", i);
 		mlc_serio->id			= hil_mlc_serio_id;
 		mlc_serio->write		= hil_mlc_serio_write;
 		mlc_serio->open			= hil_mlc_serio_open;
diff --git a/drivers/input/serio/hp_sdc.c b/drivers/input/serio/hp_sdc.c
index 211ff44..ae6b816 100644
--- a/drivers/input/serio/hp_sdc.c
+++ b/drivers/input/serio/hp_sdc.c
@@ -749,7 +749,7 @@ void hp_sdc_kicker (unsigned long data) {
 
 #if defined(__hppa__)
 
-static struct parisc_device_id hp_sdc_tbl[] = {
+static const struct parisc_device_id hp_sdc_tbl[] = {
 	{
 		.hw_type =	HPHW_FIO, 
 		.hversion_rev =	HVERSION_REV_ANY_ID,
@@ -818,12 +818,12 @@ static int __init hp_sdc_init(void)
 #endif	
 
 	errstr = "IRQ not available for";
-	if (request_irq(hp_sdc.irq, &hp_sdc_isr, 0, "HP SDC", &hp_sdc))
-		goto err1;
+	if (request_irq(hp_sdc.irq, &hp_sdc_isr, IRQF_SHARED|IRQF_SAMPLE_RANDOM,
+		"HP SDC", &hp_sdc)) goto err1;
 
 	errstr = "NMI not available for";
-	if (request_irq(hp_sdc.nmi, &hp_sdc_nmisr, 0, "HP SDC NMI", &hp_sdc))
-		goto err2;
+	if (request_irq(hp_sdc.nmi, &hp_sdc_nmisr, IRQF_SHARED,
+		"HP SDC NMI", &hp_sdc)) goto err2;
 
 	printk(KERN_INFO PREFIX "HP SDC at 0x%p, IRQ %d (NMI IRQ %d)\n", 
 	       (void *)hp_sdc.base_io, hp_sdc.irq, hp_sdc.nmi);
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
-- 
1.4.4.4
