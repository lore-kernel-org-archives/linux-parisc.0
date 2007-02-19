From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] Re: [PARISC] fix uninitialized spinlock in HIL
	keyboard driver (second input patch - coding style cleanup)
Date: Mon, 19 Feb 2007 21:39:02 +0100
Message-ID: <200702192139.02814.deller__45279.092124156$1416624307$gmane$org@gmx.de>
References: <11717457251848-git-send-email-kyle@parisc-linux.org>
	<200702181615.14056.deller@gmx.de>
	<200702181655.14483.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Cc: akpm@osdl.org,
 parisc-linux@lists.parisc-linux.org
To: Dmitry Torokhov <dtor@insightbb.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200702181655.14483.deller@gmx.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi Dmitry,
 
This the second (and last) patch which cleanes up the coding-style and it should apply on top of the previous patch I sent you yesterday.

----------
Input: HIL - cleanup coding style
Signed-off-by: Helge Deller <deller@gmx.de>
----------

diff --git a/drivers/input/keyboard/hil_kbd.c b/drivers/input/keyboard/hil_kbd.c
index 1ebab49..6c28c69 100644
--- a/drivers/input/keyboard/hil_kbd.c
+++ b/drivers/input/keyboard/hil_kbd.c
@@ -95,9 +95,11 @@ static void hil_kbd_process_record(struc
 	p = data[idx - 1];
 
 	if ((p & ~HIL_CMDCT_POL) ==
-	    (HIL_ERR_INT | HIL_PKT_CMD | HIL_CMD_POL)) goto report;
+	    (HIL_ERR_INT | HIL_PKT_CMD | HIL_CMD_POL))
+		goto report;
 	if ((p & ~HIL_CMDCT_RPL) ==
-	    (HIL_ERR_INT | HIL_PKT_CMD | HIL_CMD_RPL)) goto report;
+	    (HIL_ERR_INT | HIL_PKT_CMD | HIL_CMD_RPL))
+		goto report;
 
 	/* Not a poll response.  See if we are loading config records. */
 	switch (p & HIL_PKT_DATA_MASK) {
@@ -107,27 +109,32 @@ static void hil_kbd_process_record(struc
 		for (; i < HIL_KBD_MAX_LENGTH; i++)
 			kbd->idd[i] = 0;
 		break;
+
 	case HIL_CMD_RSC:
 		for (i = 0; i < idx; i++)
 			kbd->rsc[i] = kbd->data[i] & HIL_PKT_DATA_MASK;
 		for (; i < HIL_KBD_MAX_LENGTH; i++)
 			kbd->rsc[i] = 0;
 		break;
+
 	case HIL_CMD_EXD:
 		for (i = 0; i < idx; i++)
 			kbd->exd[i] = kbd->data[i] & HIL_PKT_DATA_MASK;
 		for (; i < HIL_KBD_MAX_LENGTH; i++)
 			kbd->exd[i] = 0;
 		break;
+
 	case HIL_CMD_RNM:
 		for (i = 0; i < idx; i++)
 			kbd->rnm[i] = kbd->data[i] & HIL_PKT_DATA_MASK;
 		for (; i < HIL_KBD_MAX_LENGTH + 1; i++)
 			kbd->rnm[i] = '\0';
 		break;
+
 	default:
 		/* These occur when device isn't present */
-		if (p == (HIL_ERR_INT | HIL_PKT_CMD)) break;
+		if (p == (HIL_ERR_INT | HIL_PKT_CMD))
+			break;
 		/* Anything else we'd like to know about. */
 		printk(KERN_WARNING PREFIX "Device sent unknown record %x\n", p);
 		break;
@@ -139,16 +146,19 @@ static void hil_kbd_process_record(struc
 	switch (kbd->data[0] & HIL_POL_CHARTYPE_MASK) {
 	case HIL_POL_CHARTYPE_NONE:
 		break;
+
 	case HIL_POL_CHARTYPE_ASCII:
 		while (cnt < idx - 1)
 			input_report_key(dev, kbd->data[cnt++] & 0x7f, 1);
 		break;
+
 	case HIL_POL_CHARTYPE_RSVD1:
 	case HIL_POL_CHARTYPE_RSVD2:
 	case HIL_POL_CHARTYPE_BINARY:
 		while (cnt < idx - 1)
 			input_report_key(dev, kbd->data[cnt++], 1);
 		break;
+
 	case HIL_POL_CHARTYPE_SET1:
 		while (cnt < idx - 1) {
 			unsigned int key;
@@ -161,6 +171,7 @@ static void hil_kbd_process_record(struc
 				input_report_key(dev, key, !up);
 		}
 		break;
+
 	case HIL_POL_CHARTYPE_SET2:
 		while (cnt < idx - 1) {
 			unsigned int key;
@@ -173,6 +184,7 @@ static void hil_kbd_process_record(struc
 				input_report_key(dev, key, !up);
 		}
 		break;
+
 	case HIL_POL_CHARTYPE_SET3:
 		while (cnt < idx - 1) {
 			unsigned int key;
@@ -191,42 +203,43 @@ static void hil_kbd_process_record(struc
 	up(&kbd->sem);
 }
 
-static void hil_kbd_process_err(struct hil_kbd *kbd) {
+static void hil_kbd_process_err(struct hil_kbd *kbd)
+{
 	printk(KERN_WARNING PREFIX "errored HIL packet\n");
 	kbd->idx4 = 0;
 	up(&kbd->sem);
 }
 
 static irqreturn_t hil_kbd_interrupt(struct serio *serio,
-	      unsigned char data, unsigned int flags)
+				unsigned char data, unsigned int flags)
 {
 	struct hil_kbd *kbd;
 	hil_packet packet;
 	int idx;
 
 	kbd = serio_get_drvdata(serio);
-	if (kbd == NULL) {
-		BUG();
-		return IRQ_HANDLED;
-	}
+	BUG_ON(kbd == NULL);
 
 	if (kbd->idx4 >= (HIL_KBD_MAX_LENGTH * sizeof(hil_packet))) {
 		hil_kbd_process_err(kbd);
 		return IRQ_HANDLED;
 	}
 	idx = kbd->idx4/4;
-	if (!(kbd->idx4 % 4)) kbd->data[idx] = 0;
+	if (!(kbd->idx4 % 4))
+		kbd->data[idx] = 0;
 	packet = kbd->data[idx];
 	packet |= ((hil_packet)data) << ((3 - (kbd->idx4 % 4)) * 8);
 	kbd->data[idx] = packet;
 
 	/* Records of N 4-byte hil_packets must terminate with a command. */
-	if ((++(kbd->idx4)) % 4) return IRQ_HANDLED;
+	if ((++(kbd->idx4)) % 4)
+		return IRQ_HANDLED;
 	if ((packet & 0xffff0000) != HIL_ERR_INT) {
 		hil_kbd_process_err(kbd);
 		return IRQ_HANDLED;
 	}
-	if (packet & HIL_PKT_CMD) hil_kbd_process_record(kbd);
+	if (packet & HIL_PKT_CMD)
+		hil_kbd_process_record(kbd);
 	return IRQ_HANDLED;
 }
 
@@ -235,10 +248,7 @@ static void hil_kbd_disconnect(struct se
 	struct hil_kbd *kbd;
 
 	kbd = serio_get_drvdata(serio);
-	if (kbd == NULL) {
-		BUG();
-		return;
-	}
+	BUG_ON(kbd == NULL);
 
 	serio_close(serio);
 	input_unregister_device(kbd->dev);
@@ -267,34 +277,34 @@ static int hil_kbd_connect(struct serio 
 	serio_set_drvdata(serio, kbd);
 	kbd->serio = serio;
 
-	init_MUTEX_LOCKED(&(kbd->sem));
+	init_MUTEX_LOCKED(&kbd->sem);
 
 	/* Get device info.  MLC driver supplies devid/status/etc. */
 	serio->write(serio, 0);
 	serio->write(serio, 0);
 	serio->write(serio, HIL_PKT_CMD >> 8);
 	serio->write(serio, HIL_CMD_IDD);
-	down(&(kbd->sem));
+	down(&kbd->sem);
 
 	serio->write(serio, 0);
 	serio->write(serio, 0);
 	serio->write(serio, HIL_PKT_CMD >> 8);
 	serio->write(serio, HIL_CMD_RSC);
-	down(&(kbd->sem));
+	down(&kbd->sem);
 
 	serio->write(serio, 0);
 	serio->write(serio, 0);
 	serio->write(serio, HIL_PKT_CMD >> 8);
 	serio->write(serio, HIL_CMD_RNM);
-	down(&(kbd->sem));
+	down(&kbd->sem);
 
 	serio->write(serio, 0);
 	serio->write(serio, 0);
 	serio->write(serio, HIL_PKT_CMD >> 8);
 	serio->write(serio, HIL_CMD_EXD);
-	down(&(kbd->sem));
+	down(&kbd->sem);
 
-	up(&(kbd->sem));
+	up(&kbd->sem);
 
 	did = kbd->idd[0];
 	idd = kbd->idd + 1;
@@ -310,12 +320,11 @@ static int hil_kbd_connect(struct serio 
 		goto bail2;
 	}
 
-	if(HIL_IDD_NUM_BUTTONS(idd) || HIL_IDD_NUM_AXES_PER_SET(*idd)) {
+	if (HIL_IDD_NUM_BUTTONS(idd) || HIL_IDD_NUM_AXES_PER_SET(*idd)) {
 		printk(KERN_INFO PREFIX "keyboards only, no combo devices supported.\n");
 		goto bail2;
 	}
 
-
 	kbd->dev->evbit[0]	= BIT(EV_KEY) | BIT(EV_REP);
 	kbd->dev->ledbit[0]	= BIT(LED_NUML) | BIT(LED_CAPSL) | BIT(LED_SCROLLL);
 	kbd->dev->keycodemax	= HIL_KEYCODES_SET1_TBLSIZE;
@@ -344,8 +353,8 @@ static int hil_kbd_connect(struct serio 
 	serio->write(serio, 0);
 	serio->write(serio, HIL_PKT_CMD >> 8);
 	serio->write(serio, HIL_CMD_EK1); /* Enable Keyswitch Autorepeat 1 */
-	down(&(kbd->sem));
-	up(&(kbd->sem));
+	down(&kbd->sem);
+	up(&kbd->sem);
 
 	return 0;
  bail2:
@@ -383,11 +392,11 @@ static int __init hil_kbd_init(void)
 {
 	return serio_register_driver(&hil_kbd_serio_drv);
 }
-              
+
 static void __exit hil_kbd_exit(void)
 {
 	serio_unregister_driver(&hil_kbd_serio_drv);
 }
-                      
+
 module_init(hil_kbd_init);
 module_exit(hil_kbd_exit);
diff --git a/drivers/input/mouse/hil_ptr.c b/drivers/input/mouse/hil_ptr.c
index 61bbff9..79977fc 100644
--- a/drivers/input/mouse/hil_ptr.c
+++ b/drivers/input/mouse/hil_ptr.c
@@ -89,9 +89,11 @@ static void hil_ptr_process_record(struc
 	p = data[idx - 1];
 
 	if ((p & ~HIL_CMDCT_POL) ==
-	    (HIL_ERR_INT | HIL_PKT_CMD | HIL_CMD_POL)) goto report;
+	    (HIL_ERR_INT | HIL_PKT_CMD | HIL_CMD_POL))
+		goto report;
 	if ((p & ~HIL_CMDCT_RPL) ==
-	    (HIL_ERR_INT | HIL_PKT_CMD | HIL_CMD_RPL)) goto report;
+	    (HIL_ERR_INT | HIL_PKT_CMD | HIL_CMD_RPL))
+		goto report;
 
 	/* Not a poll response.  See if we are loading config records. */
 	switch (p & HIL_PKT_DATA_MASK) {
@@ -101,27 +103,32 @@ static void hil_ptr_process_record(struc
 		for (; i < HIL_PTR_MAX_LENGTH; i++)
 			ptr->idd[i] = 0;
 		break;
+
 	case HIL_CMD_RSC:
 		for (i = 0; i < idx; i++)
 			ptr->rsc[i] = ptr->data[i] & HIL_PKT_DATA_MASK;
 		for (; i < HIL_PTR_MAX_LENGTH; i++)
 			ptr->rsc[i] = 0;
 		break;
+
 	case HIL_CMD_EXD:
 		for (i = 0; i < idx; i++)
 			ptr->exd[i] = ptr->data[i] & HIL_PKT_DATA_MASK;
 		for (; i < HIL_PTR_MAX_LENGTH; i++)
 			ptr->exd[i] = 0;
 		break;
+
 	case HIL_CMD_RNM:
 		for (i = 0; i < idx; i++)
 			ptr->rnm[i] = ptr->data[i] & HIL_PKT_DATA_MASK;
 		for (; i < HIL_PTR_MAX_LENGTH + 1; i++)
-			ptr->rnm[i] = '\0';
+			ptr->rnm[i] = 0;
 		break;
+
 	default:
 		/* These occur when device isn't present */
-		if (p == (HIL_ERR_INT | HIL_PKT_CMD)) break;
+		if (p == (HIL_ERR_INT | HIL_PKT_CMD))
+			break;
 		/* Anything else we'd like to know about. */
 		printk(KERN_WARNING PREFIX "Device sent unknown record %x\n", p);
 		break;
@@ -130,7 +137,8 @@ static void hil_ptr_process_record(struc
 
  report:
 	if ((p & HIL_CMDCT_POL) != idx - 1) {
-		printk(KERN_WARNING PREFIX "Malformed poll packet %x (idx = %i)\n", p, idx);
+		printk(KERN_WARNING PREFIX
+			"Malformed poll packet %x (idx = %i)\n", p, idx);
 		goto out;
 	}
 
@@ -157,7 +165,8 @@ static void hil_ptr_process_record(struc
 			input_report_abs(dev, ABS_X + i, val);
 		} else {
 			val = (int) (((int8_t)lo) | ((int8_t)hi<<8));
-			if (i%3) val *= -1;
+			if (i%3)
+				val *= -1;
 			input_report_rel(dev, REL_X + i, val);
 		}
 	}
@@ -168,10 +177,11 @@ static void hil_ptr_process_record(struc
 		btn = ptr->data[cnt++];
 		up = btn & 1;
 		btn &= 0xfe;
-		if (btn == 0x8e) {
+		if (btn == 0x8e)
 			continue; /* TODO: proximity == touch? */
-		}
-		else if ((btn > 0x8c) || (btn < 0x80)) continue;
+		else
+			if ((btn > 0x8c) || (btn < 0x80))
+				continue;
 		btn = (btn - 0x80) >> 1;
 		btn = ptr->btnmap[btn];
 		input_report_key(dev, btn, !up);
@@ -182,11 +192,11 @@ static void hil_ptr_process_record(struc
 	up(&ptr->sem);
 }
 
-static void hil_ptr_process_err(struct hil_ptr *ptr) {
+static void hil_ptr_process_err(struct hil_ptr *ptr)
+{
 	printk(KERN_WARNING PREFIX "errored HIL packet\n");
 	ptr->idx4 = 0;
 	up(&ptr->sem);
-	return;
 }
 
 static irqreturn_t hil_ptr_interrupt(struct serio *serio,
@@ -197,29 +207,29 @@ static irqreturn_t hil_ptr_interrupt(str
 	int idx;
 
 	ptr = serio_get_drvdata(serio);
-	if (ptr == NULL) {
-		BUG();
-		return IRQ_HANDLED;
-	}
+	BUG_ON(ptr == NULL);
 
 	if (ptr->idx4 >= (HIL_PTR_MAX_LENGTH * sizeof(hil_packet))) {
 		hil_ptr_process_err(ptr);
 		return IRQ_HANDLED;
 	}
 	idx = ptr->idx4/4;
-	if (!(ptr->idx4 % 4)) ptr->data[idx] = 0;
+	if (!(ptr->idx4 % 4))
+		ptr->data[idx] = 0;
 	packet = ptr->data[idx];
 	packet |= ((hil_packet)data) << ((3 - (ptr->idx4 % 4)) * 8);
 	ptr->data[idx] = packet;
 
 	/* Records of N 4-byte hil_packets must terminate with a command. */
-	if ((++(ptr->idx4)) % 4) return IRQ_HANDLED;
+	if ((++(ptr->idx4)) % 4)
+		return IRQ_HANDLED;
 	if ((packet & 0xffff0000) != HIL_ERR_INT) {
 		hil_ptr_process_err(ptr);
 		return IRQ_HANDLED;
 	}
 	if (packet & HIL_PKT_CMD)
 		hil_ptr_process_record(ptr);
+
 	return IRQ_HANDLED;
 }
 
@@ -228,10 +238,7 @@ static void hil_ptr_disconnect(struct se
 	struct hil_ptr *ptr;
 
 	ptr = serio_get_drvdata(serio);
-	if (ptr == NULL) {
-		BUG();
-		return;
-	}
+	BUG_ON(ptr == NULL);
 
 	serio_close(serio);
 	input_unregister_device(ptr->dev);
@@ -241,7 +248,7 @@ static void hil_ptr_disconnect(struct se
 static int hil_ptr_connect(struct serio *serio, struct serio_driver *driver)
 {
 	struct hil_ptr	 *ptr;
-	char		 *txt;
+	const char	 *txt;
 	unsigned int	 i, naxsets, btntype;
 	uint8_t		 did, *idd;
 
@@ -260,34 +267,34 @@ static int hil_ptr_connect(struct serio 
 	serio_set_drvdata(serio, ptr);
 	ptr->serio = serio;
 
-	init_MUTEX_LOCKED(&(ptr->sem));
+	init_MUTEX_LOCKED(&ptr->sem);
 
 	/* Get device info.  MLC driver supplies devid/status/etc. */
 	serio->write(serio, 0);
 	serio->write(serio, 0);
 	serio->write(serio, HIL_PKT_CMD >> 8);
 	serio->write(serio, HIL_CMD_IDD);
-	down(&(ptr->sem));
+	down(&ptr->sem);
 
 	serio->write(serio, 0);
 	serio->write(serio, 0);
 	serio->write(serio, HIL_PKT_CMD >> 8);
 	serio->write(serio, HIL_CMD_RSC);
-	down(&(ptr->sem));
+	down(&ptr->sem);
 
 	serio->write(serio, 0);
 	serio->write(serio, 0);
 	serio->write(serio, HIL_PKT_CMD >> 8);
 	serio->write(serio, HIL_CMD_RNM);
-	down(&(ptr->sem));
+	down(&ptr->sem);
 
 	serio->write(serio, 0);
 	serio->write(serio, 0);
 	serio->write(serio, HIL_PKT_CMD >> 8);
 	serio->write(serio, HIL_CMD_EXD);
-	down(&(ptr->sem));
+	down(&ptr->sem);
 
-	up(&(ptr->sem));
+	up(&ptr->sem);
 
 	did = ptr->idd[0];
 	idd = ptr->idd + 1;
@@ -301,12 +308,12 @@ static int hil_ptr_connect(struct serio 
 		ptr->dev->evbit[0] = BIT(EV_ABS);
 		txt = "absolute";
 	}
-	if (!ptr->dev->evbit[0]) {
+	if (!ptr->dev->evbit[0])
 		goto bail2;
-	}
 
 	ptr->nbtn = HIL_IDD_NUM_BUTTONS(idd);
-	if (ptr->nbtn) ptr->dev->evbit[0] |= BIT(EV_KEY);
+	if (ptr->nbtn)
+		ptr->dev->evbit[0] |= BIT(EV_KEY);
 
 	naxsets = HIL_IDD_NUM_AXSETS(*idd);
 	ptr->naxes = HIL_IDD_NUM_AXES_PER_SET(*idd);
@@ -341,12 +348,10 @@ static int hil_ptr_connect(struct serio 
 	}
 
 	if ((did & HIL_IDD_DID_TYPE_MASK) == HIL_IDD_DID_TYPE_REL) {
-		for (i = 0; i < ptr->naxes; i++) {
+		for (i = 0; i < ptr->naxes; i++)
 			set_bit(REL_X + i, ptr->dev->relbit);
-		}
-		for (i = 3; (i < ptr->naxes + 3) && (naxsets > 1); i++) {
+		for (i = 3; (i < ptr->naxes + 3) && (naxsets > 1); i++)
 			set_bit(REL_X + i, ptr->dev->relbit);
-		}
 	} else {
 		for (i = 0; i < ptr->naxes; i++) {
 			set_bit(ABS_X + i, ptr->dev->absbit);
diff --git a/drivers/input/serio/hil_mlc.c b/drivers/input/serio/hil_mlc.c
index 5c3fc23..e45aaab 100644
--- a/drivers/input/serio/hil_mlc.c
+++ b/drivers/input/serio/hil_mlc.c
@@ -83,69 +83,85 @@ DECLARE_TASKLET_DISABLED(hil_mlcs_taskle
 
 /********************** Device info/instance management **********************/
 
-static void hil_mlc_clear_di_map (hil_mlc *mlc, int val) {
+static void hil_mlc_clear_di_map(hil_mlc *mlc, int val)
+{
 	int j;
-	for (j = val; j < 7 ; j++) {
+
+	for (j = val; j < 7 ; j++)
 		mlc->di_map[j] = -1;
-	}
 }
 
-static void hil_mlc_clear_di_scratch (hil_mlc *mlc) {
-	memset(&(mlc->di_scratch), 0, sizeof(mlc->di_scratch));
+static void hil_mlc_clear_di_scratch(hil_mlc *mlc)
+{
+	memset(&mlc->di_scratch, 0, sizeof(mlc->di_scratch));
 }
 
-static void hil_mlc_copy_di_scratch (hil_mlc *mlc, int idx) {
-	memcpy(&(mlc->di[idx]), &(mlc->di_scratch), sizeof(mlc->di_scratch));
+static void hil_mlc_copy_di_scratch(hil_mlc *mlc, int idx)
+{
+	memcpy(&mlc->di[idx], &mlc->di_scratch, sizeof(mlc->di_scratch));
 }
 
-static int hil_mlc_match_di_scratch (hil_mlc *mlc) {
+static int hil_mlc_match_di_scratch(hil_mlc *mlc)
+{
 	int idx;
 
 	for (idx = 0; idx < HIL_MLC_DEVMEM; idx++) {
-		int j, found;
+		int j, found = 0;
 
 		/* In-use slots are not eligible. */
-		found = 0;
-		for (j = 0; j < 7 ; j++) {
-			if (mlc->di_map[j] == idx) found++;
-		}
-		if (found) continue;
-		if (!memcmp(mlc->di + idx,
-			    &(mlc->di_scratch),
-			    sizeof(mlc->di_scratch))) break;
+		for (j = 0; j < 7 ; j++)
+			if (mlc->di_map[j] == idx)
+				found++;
+
+		if (found)
+			continue;
+
+		if (!memcmp(mlc->di + idx, &mlc->di_scratch,
+				sizeof(mlc->di_scratch)))
+			break;
 	}
-	return((idx >= HIL_MLC_DEVMEM) ? -1 : idx);
+	return idx >= HIL_MLC_DEVMEM ? -1 : idx;
 }
 
-static int hil_mlc_find_free_di(hil_mlc *mlc) {
+static int hil_mlc_find_free_di(hil_mlc *mlc)
+{
 	int idx;
+
 	/* TODO: Pick all-zero slots first, failing that,
 	 * randomize the slot picked among those eligible.
 	 */
 	for (idx = 0; idx < HIL_MLC_DEVMEM; idx++) {
-		int j, found;
-		found = 0;
-		for (j = 0; j < 7 ; j++) {
-			if (mlc->di_map[j] == idx) found++;
-		}
-		if (!found) break;
+		int j, found = 0;
+
+		for (j = 0; j < 7 ; j++)
+			if (mlc->di_map[j] == idx)
+				found++;
+
+		if (!found)
+			break;
 	}
-	return(idx); /* Note: It is guaranteed at least one above will match */
+
+	return idx; /* Note: It is guaranteed at least one above will match */
 }
 
-static inline void hil_mlc_clean_serio_map(hil_mlc *mlc) {
+static inline void hil_mlc_clean_serio_map(hil_mlc *mlc)
+{
 	int idx;
+
 	for (idx = 0; idx < HIL_MLC_DEVMEM; idx++) {
-		int j, found;
-		found = 0;
-		for (j = 0; j < 7 ; j++) {
-			if (mlc->di_map[j] == idx) found++;
-		}
-		if (!found) mlc->serio_map[idx].di_revmap = -1;
+		int j, found = 0;
+
+		for (j = 0; j < 7 ; j++)
+			if (mlc->di_map[j] == idx)
+				found++;
+
+		if (!found)
+			mlc->serio_map[idx].di_revmap = -1;
 	}
 }
 
-static void hil_mlc_send_polls(hil_mlc *mlc) {
+static void hil_mlc_send_polls(hil_mlc *mlc)
+{
 	int did, i, cnt;
 	struct serio *serio;
 	struct serio_driver *drv;
@@ -157,26 +173,31 @@ static void hil_mlc_send_polls(hil_mlc *
 
 	while (mlc->icount < 15 - i) {
 		hil_packet p;
+
 		p = mlc->ipacket[i];
 		if (did != (p & HIL_PKT_ADDR_MASK) >> 8) {
-			if (drv == NULL || drv->interrupt == NULL) goto skip;
+			if (drv && drv->interrupt) {
+				drv->interrupt(serio, 0, 0);
+				drv->interrupt(serio, HIL_ERR_INT >> 16, 0);
+				drv->interrupt(serio, HIL_PKT_CMD >> 8,  0);
+				drv->interrupt(serio, HIL_CMD_POL + cnt, 0);
+			}
 
-			drv->interrupt(serio, 0, 0);
-			drv->interrupt(serio, HIL_ERR_INT >> 16, 0);
-			drv->interrupt(serio, HIL_PKT_CMD >> 8,  0);
-			drv->interrupt(serio, HIL_CMD_POL + cnt, 0);
-		skip:
 			did = (p & HIL_PKT_ADDR_MASK) >> 8;
 			serio = did ? mlc->serio[mlc->di_map[did-1]] : NULL;
 			drv = (serio != NULL) ? serio->drv : NULL;
 			cnt = 0;
 		}
-		cnt++; i++;
-		if (drv == NULL || drv->interrupt == NULL) continue;
-		drv->interrupt(serio, (p >> 24), 0);
-		drv->interrupt(serio, (p >> 16) & 0xff, 0);
-		drv->interrupt(serio, (p >> 8) & ~HIL_PKT_ADDR_MASK, 0);
-		drv->interrupt(serio, p & 0xff, 0);
+
+		cnt++;
+		i++;
+
+		if (drv && drv->interrupt) {
+			drv->interrupt(serio, (p >> 24), 0);
+			drv->interrupt(serio, (p >> 16) & 0xff, 0);
+			drv->interrupt(serio, (p >> 8) & ~HIL_PKT_ADDR_MASK, 0);
+			drv->interrupt(serio, p & 0xff, 0);
+		}
 	}
 }
 
@@ -215,12 +236,16 @@ static void hil_mlc_send_polls(hil_mlc *
 #define HILSEN_DOZE	(HILSEN_SAME | HILSEN_SCHED | HILSEN_BREAK)
 #define HILSEN_SLEEP	(HILSEN_SAME | HILSEN_BREAK)
 
-static int hilse_match(hil_mlc *mlc, int unused) {
+static int hilse_match(hil_mlc *mlc, int unused)
+{
 	int rc;
+
 	rc = hil_mlc_match_di_scratch(mlc);
 	if (rc == -1) {
 		rc = hil_mlc_find_free_di(mlc);
-		if (rc == -1) goto err;
+		if (rc == -1)
+			goto err;
+
 #ifdef HIL_MLC_DEBUG
 		printk(KERN_DEBUG PREFIX "new in slot %i\n", rc);
 #endif
@@ -231,6 +256,7 @@ static int hilse_match(hil_mlc *mlc, int
 		serio_rescan(mlc->serio[rc]);
 		return -1;
 	}
+
 	mlc->di_map[mlc->ddi] = rc;
 #ifdef HIL_MLC_DEBUG
 	printk(KERN_DEBUG PREFIX "same in slot %i\n", rc);
@@ -238,45 +264,53 @@ static int hilse_match(hil_mlc *mlc, int
 	mlc->serio_map[rc].di_revmap = mlc->ddi;
 	hil_mlc_clean_serio_map(mlc);
 	return 0;
+
  err:
 	printk(KERN_ERR PREFIX "Residual device slots exhausted, close some serios!\n");
 	return 1;
 }
 
 /* An LCV used to prevent runaway loops, forces 5 second sleep when reset. */
-static int hilse_init_lcv(hil_mlc *mlc, int unused) {
+static int hilse_init_lcv(hil_mlc *mlc, int unused)
+{
 	struct timeval tv;
 
 	do_gettimeofday(&tv);
 
-	if(mlc->lcv == 0) goto restart;  /* First init, no need to dally */
-	if(tv.tv_sec - mlc->lcv_tv.tv_sec < 5) return -1;
- restart:
+	if (mlc->lcv && (tv.tv_sec - mlc->lcv_tv.tv_sec) < 5)
+		return -1;
+
 	mlc->lcv_tv = tv;
 	mlc->lcv = 0;
+
 	return 0;
 }
 
-static int hilse_inc_lcv(hil_mlc *mlc, int lim) {
-	if (mlc->lcv++ >= lim) return -1;
-	return 0;
+static int hilse_inc_lcv(hil_mlc *mlc, int lim)
+{
+	return mlc->lcv++ >= lim ? -1 : 0;
 }
 
 #if 0
-static int hilse_set_lcv(hil_mlc *mlc, int val) {
+static int hilse_set_lcv(hil_mlc *mlc, int val)
+{
 	mlc->lcv = val;
+
 	return 0;
 }
 #endif
 
 /* Management of the discovered device index (zero based, -1 means no devs) */
-static int hilse_set_ddi(hil_mlc *mlc, int val) {
+static int hilse_set_ddi(hil_mlc *mlc, int val)
+{
 	mlc->ddi = val;
 	hil_mlc_clear_di_map(mlc, val + 1);
+
 	return 0;
 }
 
-static int hilse_dec_ddi(hil_mlc *mlc, int unused) {
+static int hilse_dec_ddi(hil_mlc *mlc, int unused)
+{
 	mlc->ddi--;
 	if (mlc->ddi <= -1) {
 		mlc->ddi = -1;
@@ -284,19 +318,20 @@ static int hilse_dec_ddi(hil_mlc *mlc, i
 		return -1;
 	}
 	hil_mlc_clear_di_map(mlc, mlc->ddi + 1);
+
 	return 0;
 }
 
-static int hilse_inc_ddi(hil_mlc *mlc, int unused) {
-	if (mlc->ddi >= 6) {
-		BUG();
-		return -1;
-	}
+static int hilse_inc_ddi(hil_mlc *mlc, int unused)
+{
+	BUG_ON(mlc->ddi >= 6);
 	mlc->ddi++;
+
 	return 0;
 }
 
-static int hilse_take_idd(hil_mlc *mlc, int unused) {
+static int hilse_take_idd(hil_mlc *mlc, int unused)
+{
 	int i;
 
 	/* Help the state engine:
@@ -304,7 +339,9 @@ static int hilse_take_idd(hil_mlc *mlc, 
 	 *
 	 * Real IDD response does not start with a command.
 	 */
-	if (mlc->ipacket[0] & HIL_PKT_CMD) goto bail;
+	if (mlc->ipacket[0] & HIL_PKT_CMD)
+		goto bail;
+
 	/* Should have the command echoed further down. */
 	for (i = 1; i < 16; i++) {
 		if (((mlc->ipacket[i] & HIL_PKT_ADDR_MASK) ==
@@ -313,77 +350,91 @@ static int hilse_take_idd(hil_mlc *mlc, 
 		    ((mlc->ipacket[i] & HIL_PKT_DATA_MASK) == HIL_CMD_IDD))
 			break;
 	}
-	if (i > 15) goto bail;
+	if (i > 15)
+		goto bail;
+
 	/* And the rest of the packets should still be clear. */
-	while (++i < 16) {
-		if (mlc->ipacket[i]) break;
-	}
-	if (i < 16) goto bail;
-	for (i = 0; i < 16; i++) {
+	while (++i < 16)
+		if (mlc->ipacket[i])
+			break;
+
+	if (i < 16)
+		goto bail;
+
+	for (i = 0; i < 16; i++)
 		mlc->di_scratch.idd[i] =
 			mlc->ipacket[i] & HIL_PKT_DATA_MASK;
-	}
+
 	/* Next step is to see if RSC supported */
 	if (mlc->di_scratch.idd[1] & HIL_IDD_HEADER_RSC)
 		return HILSEN_NEXT;
+
 	if (mlc->di_scratch.idd[1] & HIL_IDD_HEADER_EXD)
 		return HILSEN_DOWN | 4;
+
 	return 0;
+
  bail:
 	mlc->ddi--;
+
 	return -1; /* This should send us off to ACF */
 }
 
-static int hilse_take_rsc(hil_mlc *mlc, int unused) {
+static int hilse_take_rsc(hil_mlc *mlc, int unused)
+{
 	int i;
 
-	for (i = 0; i < 16; i++) {
+	for (i = 0; i < 16; i++)
 		mlc->di_scratch.rsc[i] =
 			mlc->ipacket[i] & HIL_PKT_DATA_MASK;
-	}
+
 	/* Next step is to see if EXD supported (IDD has already been read) */
 	if (mlc->di_scratch.idd[1] & HIL_IDD_HEADER_EXD)
 		return HILSEN_NEXT;
+
 	return 0;
 }
 
-static int hilse_take_exd(hil_mlc *mlc, int unused) {
+static int hilse_take_exd(hil_mlc *mlc, int unused)
+{
 	int i;
 
-	for (i = 0; i < 16; i++) {
+	for (i = 0; i < 16; i++)
 		mlc->di_scratch.exd[i] =
 			mlc->ipacket[i] & HIL_PKT_DATA_MASK;
-	}
+
 	/* Next step is to see if RNM supported. */
 	if (mlc->di_scratch.exd[0] & HIL_EXD_HEADER_RNM)
 		return HILSEN_NEXT;
+
 	return 0;
 }
 
-static int hilse_take_rnm(hil_mlc *mlc, int unused) {
+static int hilse_take_rnm(hil_mlc *mlc, int unused)
+{
 	int i;
 
-	for (i = 0; i < 16; i++) {
+	for (i = 0; i < 16; i++)
 		mlc->di_scratch.rnm[i] =
 			mlc->ipacket[i] & HIL_PKT_DATA_MASK;
-	}
-	do {
-	  char nam[17];
-	  snprintf(nam, 16, "%s", mlc->di_scratch.rnm);
-	  nam[16] = '\0';
-	  printk(KERN_INFO PREFIX "Device name gotten: %s\n", nam);
-	} while (0);
+
+	printk(KERN_INFO PREFIX "Device name gotten: %16s\n",
+			mlc->di_scratch.rnm);
+
 	return 0;
 }
 
-static int hilse_operate(hil_mlc *mlc, int repoll) {
+static int hilse_operate(hil_mlc *mlc, int repoll)
+{
 
-	if (mlc->opercnt == 0) hil_mlcs_probe = 0;
+	if (mlc->opercnt == 0)
+		hil_mlcs_probe = 0;
 	mlc->opercnt = 1;
 
 	hil_mlc_send_polls(mlc);
 
-	if (!hil_mlcs_probe) return 0;
+	if (!hil_mlcs_probe)
+		return 0;
 	hil_mlcs_probe = 0;
 	mlc->opercnt = 0;
 	return 1;
@@ -530,7 +581,8 @@ const struct hilse_node hil_mlc_se[HILSE
 	/* 60 HILSEN_END */
 };
 
-static inline void hilse_setup_input(hil_mlc *mlc, const struct hilse_node *node) {
+static inline void hilse_setup_input(hil_mlc *mlc, const struct hilse_node *node)
+{
 
 	switch (node->act) {
 	case HILSE_EXPECT_DISC:
@@ -555,25 +607,25 @@ static inline void hilse_setup_input(hil
 	do_gettimeofday(&(mlc->instart));
 	mlc->icount = 15;
 	memset(mlc->ipacket, 0, 16 * sizeof(hil_packet));
-	BUG_ON(down_trylock(&(mlc->isem)));
-
-	return;
+	BUG_ON(down_trylock(&mlc->isem));
 }
 
 #ifdef HIL_MLC_DEBUG
-static int doze = 0;
+static int doze;
 static int seidx; /* For debug */
 #endif
 
-static int hilse_donode (hil_mlc *mlc) {
+static int hilse_donode(hil_mlc *mlc)
+{
 	const struct hilse_node *node;
 	int nextidx = 0;
 	int sched_long = 0;
 	unsigned long flags;
 
 #ifdef HIL_MLC_DEBUG
-	if (mlc->seidx && (mlc->seidx != seidx)  && mlc->seidx != 41 && mlc->seidx != 42 && mlc->seidx != 43) {
-	  printk(KERN_DEBUG PREFIX "z%i \n {%i}", doze, mlc->seidx);
+	if (mlc->seidx && mlc->seidx != seidx &&
+	    mlc->seidx != 41 && mlc->seidx != 42 && mlc->seidx != 43) {
+		printk(KERN_DEBUG PREFIX "z%i \n {%i}", doze, mlc->seidx);
 		doze = 0;
 	}
 
@@ -590,48 +642,57 @@ static int hilse_donode (hil_mlc *mlc) {
 		rc = node->object.func(mlc, node->arg);
 		nextidx = (rc > 0) ? node->ugly :
 			((rc < 0) ? node->bad : node->good);
-		if (nextidx == HILSEN_FOLLOW) nextidx = rc;
+		if (nextidx == HILSEN_FOLLOW)
+			nextidx = rc;
 		break;
+
 	case HILSE_EXPECT_LAST:
 	case HILSE_EXPECT_DISC:
 	case HILSE_EXPECT:
 	case HILSE_IN:
 		/* Already set up from previous HILSE_OUT_* */
-		write_lock_irqsave(&(mlc->lock), flags);
+		write_lock_irqsave(&mlc->lock, flags);
 		rc = mlc->in(mlc, node->arg);
 		if (rc == 2)  {
 			nextidx = HILSEN_DOZE;
 			sched_long = 1;
-			write_unlock_irqrestore(&(mlc->lock), flags);
+			write_unlock_irqrestore(&mlc->lock, flags);
 			break;
 		}
-		if (rc == 1)		nextidx = node->ugly;
-		else if (rc == 0)	nextidx = node->good;
-		else			nextidx = node->bad;
+		if (rc == 1)
+			nextidx = node->ugly;
+		else if (rc == 0)
+			nextidx = node->good;
+		else
+			nextidx = node->bad;
 		mlc->istarted = 0;
-		write_unlock_irqrestore(&(mlc->lock), flags);
+		write_unlock_irqrestore(&mlc->lock, flags);
 		break;
+
 	case HILSE_OUT_LAST:
-		write_lock_irqsave(&(mlc->lock), flags);
+		write_lock_irqsave(&mlc->lock, flags);
 		pack = node->object.packet;
 		pack |= ((mlc->ddi + 1) << HIL_PKT_ADDR_SHIFT);
 		goto out;
+
 	case HILSE_OUT_DISC:
-		write_lock_irqsave(&(mlc->lock), flags);
+		write_lock_irqsave(&mlc->lock, flags);
 		pack = node->object.packet;
 		pack |= ((mlc->ddi + 2) << HIL_PKT_ADDR_SHIFT);
 		goto out;
+
 	case HILSE_OUT:
-		write_lock_irqsave(&(mlc->lock), flags);
+		write_lock_irqsave(&mlc->lock, flags);
 		pack = node->object.packet;
 	out:
-		if (mlc->istarted) goto out2;
+		if (mlc->istarted)
+			goto out2;
 		/* Prepare to receive input */
 		if ((node + 1)->act & HILSE_IN)
 			hilse_setup_input(mlc, node + 1);
 
 	out2:
-		write_unlock_irqrestore(&(mlc->lock), flags);
+		write_unlock_irqrestore(&mlc->lock, flags);
 
 		if (down_trylock(&mlc->osem)) {
 			nextidx = HILSEN_DOZE;
@@ -639,37 +700,39 @@ static int hilse_donode (hil_mlc *mlc) {
 		}
 		up(&mlc->osem);
 
-		write_lock_irqsave(&(mlc->lock), flags);
-		if (!(mlc->ostarted)) {
+		write_lock_irqsave(&mlc->lock, flags);
+		if (!mlc->ostarted) {
 			mlc->ostarted = 1;
 			mlc->opacket = pack;
 			mlc->out(mlc);
 			nextidx = HILSEN_DOZE;
-			write_unlock_irqrestore(&(mlc->lock), flags);
+			write_unlock_irqrestore(&mlc->lock, flags);
 			break;
 		}
 		mlc->ostarted = 0;
 		do_gettimeofday(&(mlc->instart));
-		write_unlock_irqrestore(&(mlc->lock), flags);
+		write_unlock_irqrestore(&mlc->lock, flags);
 		nextidx = HILSEN_NEXT;
 		break;
+
 	case HILSE_CTS:
 		nextidx = mlc->cts(mlc) ? node->bad : node->good;
 		break;
+
 	default:
 		BUG();
-		nextidx = 0;
-		break;
 	}
 
 #ifdef HIL_MLC_DEBUG
-	if (nextidx == HILSEN_DOZE) doze++;
+	if (nextidx == HILSEN_DOZE)
+		doze++;
 #endif
 
 	while (nextidx & HILSEN_SCHED) {
 		struct timeval tv;
 
-		if (!sched_long) goto sched;
+		if (!sched_long)
+			goto sched;
 
 		do_gettimeofday(&tv);
 		tv.tv_usec += USEC_PER_SEC * (tv.tv_sec - mlc->instart.tv_sec);
@@ -683,16 +746,23 @@ static int hilse_donode (hil_mlc *mlc) {
 		tasklet_schedule(&hil_mlcs_tasklet);
 		break;
 	}
-	if (nextidx & HILSEN_DOWN) mlc->seidx += nextidx & HILSEN_MASK;
-	else if (nextidx & HILSEN_UP) mlc->seidx -= nextidx & HILSEN_MASK;
-	else mlc->seidx = nextidx & HILSEN_MASK;
 
-	if (nextidx & HILSEN_BREAK)	return 1;
+	if (nextidx & HILSEN_DOWN)
+		mlc->seidx += nextidx & HILSEN_MASK;
+	else if (nextidx & HILSEN_UP)
+		mlc->seidx -= nextidx & HILSEN_MASK;
+	else
+		mlc->seidx = nextidx & HILSEN_MASK;
+
+	if (nextidx & HILSEN_BREAK)
+		return 1;
+
 	return 0;
 }
 
 /******************** tasklet context functions **************************/
-static void hil_mlcs_process(unsigned long unused) {
+static void hil_mlcs_process(unsigned long unused)
+{
 	struct list_head *tmp;
 
 	read_lock(&hil_mlcs_lock);
@@ -700,19 +770,20 @@ static void hil_mlcs_process(unsigned lo
 		struct hil_mlc *mlc = list_entry(tmp, hil_mlc, list);
 		while (hilse_donode(mlc) == 0) {
 #ifdef HIL_MLC_DEBUG
-		  if (mlc->seidx != 41 &&
-		      mlc->seidx != 42 &&
-		      mlc->seidx != 43)
-		    printk(KERN_DEBUG PREFIX " + ");
+			if (mlc->seidx != 41 &&
+			    mlc->seidx != 42 &&
+			    mlc->seidx != 43)
+				printk(KERN_DEBUG PREFIX " + ");
 #endif
-		};
+		}
 	}
 	read_unlock(&hil_mlcs_lock);
 }
 
 /************************* Keepalive timer task *********************/
 
-void hil_mlcs_timer (unsigned long data) {
+void hil_mlcs_timer(unsigned long data)
+{
 	hil_mlcs_probe = 1;
 	tasklet_schedule(&hil_mlcs_tasklet);
 	/* Re-insert the periodic task. */
@@ -722,22 +793,19 @@ void hil_mlcs_timer (unsigned long data)
 
 /******************** user/kernel context functions **********************/
 
-static int hil_mlc_serio_write(struct serio *serio, unsigned char c) {
+static int hil_mlc_serio_write(struct serio *serio, unsigned char c)
+{
 	struct hil_mlc_serio_map *map;
 	struct hil_mlc *mlc;
 	struct serio_driver *drv;
 	uint8_t *idx, *last;
 
 	map = serio->port_data;
-	if (map == NULL) {
-		BUG();
-		return -EIO;
-	}
+	BUG_ON(map == NULL);
+
 	mlc = map->mlc;
-	if (mlc == NULL) {
-		BUG();
-		return -EIO;
-	}
+	BUG_ON(mlc == NULL);
+
 	mlc->serio_opacket[map->didx] |=
 		((hil_packet)c) << (8 * (3 - mlc->serio_oidx[map->didx]));
 
@@ -769,12 +837,11 @@ static int hil_mlc_serio_write(struct se
 	return -EIO;
  emu:
 	drv = serio->drv;
-	if (drv == NULL) {
-		BUG();
-		return -EIO;
-	}
+	BUG_ON(drv == NULL);
+
 	last = idx + 15;
-	while ((last != idx) && (*last == 0)) last--;
+	while ((last != idx) && (*last == 0))
+		last--;
 
 	while (idx != last) {
 		drv->interrupt(serio, 0, 0);
@@ -794,7 +861,8 @@ static int hil_mlc_serio_write(struct se
 	return 0;
 }
 
-static int hil_mlc_serio_open(struct serio *serio) {
+static int hil_mlc_serio_open(struct serio *serio)
+{
 	struct hil_mlc_serio_map *map;
 	struct hil_mlc *mlc;
 
@@ -802,33 +870,24 @@ static int hil_mlc_serio_open(struct ser
 		return -EBUSY;
 
 	map = serio->port_data;
-	if (map == NULL) {
-		BUG();
-		return -ENODEV;
-	}
+	BUG_ON(map == NULL);
+
 	mlc = map->mlc;
-	if (mlc == NULL) {
-		BUG();
-		return -ENODEV;
-	}
+	BUG_ON(mlc == NULL);
 
 	return 0;
 }
 
-static void hil_mlc_serio_close(struct serio *serio) {
+static void hil_mlc_serio_close(struct serio *serio)
+{
 	struct hil_mlc_serio_map *map;
 	struct hil_mlc *mlc;
 
 	map = serio->port_data;
-	if (map == NULL) {
-		BUG();
-		return;
-	}
+	BUG_ON(map == NULL);
+
 	mlc = map->mlc;
-	if (mlc == NULL) {
-		BUG();
-		return;
-	}
+	BUG_ON(mlc == NULL);
 
 	serio_set_drvdata(serio, NULL);
 	serio->drv = NULL;
@@ -842,27 +901,26 @@ static const struct serio_device_id hil_
 	.id = SERIO_ANY,
 };
 
-int hil_mlc_register(hil_mlc *mlc) {
+int hil_mlc_register(hil_mlc *mlc)
+{
 	int i;
-        unsigned long flags;
+	unsigned long flags;
 
-	if (mlc == NULL) {
-		return -EINVAL;
-	}
+	BUG_ON(mlc == NULL);
 
 	mlc->istarted = 0;
-        mlc->ostarted = 0;
+	mlc->ostarted = 0;
 
-        rwlock_init(&mlc->lock);
-        init_MUTEX(&(mlc->osem));
+	rwlock_init(&mlc->lock);
+	init_MUTEX(&mlc->osem);
 
-        init_MUTEX(&(mlc->isem));
-        mlc->icount = -1;
-        mlc->imatch = 0;
+	init_MUTEX(&mlc->isem);
+	mlc->icount = -1;
+	mlc->imatch = 0;
 
 	mlc->opercnt = 0;
 
-        init_MUTEX_LOCKED(&(mlc->csem));
+	init_MUTEX_LOCKED(&(mlc->csem));
 
 	hil_mlc_clear_di_scratch(mlc);
 	hil_mlc_clear_di_map(mlc, 0);
@@ -897,19 +955,18 @@ int hil_mlc_register(hil_mlc *mlc) {
 	return 0;
 }
 
-int hil_mlc_unregister(hil_mlc *mlc) {
+int hil_mlc_unregister(hil_mlc *mlc)
+{
 	struct list_head *tmp;
-        unsigned long flags;
+	unsigned long flags;
 	int i;
 
-	if (mlc == NULL)
-		return -EINVAL;
+	BUG_ON(mlc == NULL);
 
 	write_lock_irqsave(&hil_mlcs_lock, flags);
-	list_for_each(tmp, &hil_mlcs) {
+	list_for_each(tmp, &hil_mlcs)
 		if (list_entry(tmp, hil_mlc, list) == mlc)
 			goto found;
-	}
 
 	/* not found in list */
 	write_unlock_irqrestore(&hil_mlcs_lock, flags);
@@ -918,7 +975,7 @@ int hil_mlc_unregister(hil_mlc *mlc) {
 
  found:
 	list_del(tmp);
-        write_unlock_irqrestore(&hil_mlcs_lock, flags);
+	write_unlock_irqrestore(&hil_mlcs_lock, flags);
 
 	for (i = 0; i < HIL_MLC_DEVMEM; i++) {
 		serio_unregister_port(mlc->serio[i]);
@@ -942,7 +999,7 @@ static int __init hil_mlc_init(void)
 
 	return 0;
 }
-         
+
 static void __exit hil_mlc_exit(void)
 {
 	del_timer(&hil_mlcs_kicker);
diff --git a/drivers/input/serio/hp_sdc.c b/drivers/input/serio/hp_sdc.c
index 37dae19..155f539 100644
--- a/drivers/input/serio/hp_sdc.c
+++ b/drivers/input/serio/hp_sdc.c
@@ -106,33 +106,39 @@ EXPORT_SYMBOL(hp_sdc_dequeue_transaction
 static hp_i8042_sdc	hp_sdc;	/* All driver state is kept in here. */
 
 /*************** primitives for use in any context *********************/
-static inline uint8_t hp_sdc_status_in8 (void) {
+static inline uint8_t hp_sdc_status_in8(void)
+{
 	uint8_t status;
 	unsigned long flags;
 
 	write_lock_irqsave(&hp_sdc.ibf_lock, flags);
 	status = sdc_readb(hp_sdc.status_io);
-	if (!(status & HP_SDC_STATUS_IBF)) hp_sdc.ibf = 0;
+	if (!(status & HP_SDC_STATUS_IBF))
+		hp_sdc.ibf = 0;
 	write_unlock_irqrestore(&hp_sdc.ibf_lock, flags);
 
 	return status;
 }
 
-static inline uint8_t hp_sdc_data_in8 (void) {
+static inline uint8_t hp_sdc_data_in8(void)
+{
 	return sdc_readb(hp_sdc.data_io);
 }
 
-static inline void hp_sdc_status_out8 (uint8_t val) {
+static inline void hp_sdc_status_out8(uint8_t val)
+{
 	unsigned long flags;
 
 	write_lock_irqsave(&hp_sdc.ibf_lock, flags);
 	hp_sdc.ibf = 1;
-	if ((val & 0xf0) == 0xe0) hp_sdc.wi = 0xff;
+	if ((val & 0xf0) == 0xe0)
+		hp_sdc.wi = 0xff;
 	sdc_writeb(val, hp_sdc.status_io);
 	write_unlock_irqrestore(&hp_sdc.ibf_lock, flags);
 }
 
-static inline void hp_sdc_data_out8 (uint8_t val) {
+static inline void hp_sdc_data_out8(uint8_t val)
+{
 	unsigned long flags;
 
 	write_lock_irqsave(&hp_sdc.ibf_lock, flags);
@@ -145,7 +151,8 @@ static inline void hp_sdc_data_out8 (uin
  *	absolutely needed, or in rarely invoked subroutines.
  *	Not only does it waste CPU cycles, it also wastes bus cycles.
  */
-static inline void hp_sdc_spin_ibf(void) {
+static inline void hp_sdc_spin_ibf(void)
+{
 	unsigned long flags;
 	rwlock_t *lock;
 
@@ -158,14 +165,16 @@ static inline void hp_sdc_spin_ibf(void)
 	}
 	read_unlock(lock);
 	write_lock(lock);
-	while (sdc_readb(hp_sdc.status_io) & HP_SDC_STATUS_IBF) {};
+	while (sdc_readb(hp_sdc.status_io) & HP_SDC_STATUS_IBF)
+		{ }
 	hp_sdc.ibf = 0;
 	write_unlock_irqrestore(lock, flags);
 }
 
 
 /************************ Interrupt context functions ************************/
-static void hp_sdc_take (int irq, void *dev_id, uint8_t status, uint8_t data) {
+static void hp_sdc_take(int irq, void *dev_id, uint8_t status, uint8_t data)
+{
 	hp_sdc_transaction *curr;
 
 	read_lock(&hp_sdc.rtq_lock);
@@ -183,13 +192,14 @@ static void hp_sdc_take (int irq, void *
 
 	if (hp_sdc.rqty <= 0) {
 		/* All data has been gathered. */
-		if(curr->seq[curr->actidx] & HP_SDC_ACT_SEMAPHORE) {
-			if (curr->act.semaphore) up(curr->act.semaphore);
-		}
-		if(curr->seq[curr->actidx] & HP_SDC_ACT_CALLBACK) {
+		if (curr->seq[curr->actidx] & HP_SDC_ACT_SEMAPHORE)
+			if (curr->act.semaphore)
+				up(curr->act.semaphore);
+
+		if (curr->seq[curr->actidx] & HP_SDC_ACT_CALLBACK)
 			if (curr->act.irqhook)
 				curr->act.irqhook(irq, dev_id, status, data);
-		}
+
 		curr->actidx = curr->idx;
 		curr->idx++;
 		/* Return control of this transaction */
@@ -201,7 +211,8 @@ static void hp_sdc_take (int irq, void *
 	}
 }
 
-static irqreturn_t hp_sdc_isr(int irq, void *dev_id) {
+static irqreturn_t hp_sdc_isr(int irq, void *dev_id)
+{
 	uint8_t status, data;
 
 	status = hp_sdc_status_in8();
@@ -209,13 +220,13 @@ static irqreturn_t hp_sdc_isr(int irq, v
 	data =   hp_sdc_data_in8();
 
 	/* For now we are ignoring these until we get the SDC to behave. */
-	if (((status & 0xf1) == 0x51) && data == 0x82) {
-	  return IRQ_HANDLED;
-	}
+	if (((status & 0xf1) == 0x51) && data == 0x82)
+		return IRQ_HANDLED;
 
 	switch(status & HP_SDC_STATUS_IRQMASK) {
 	      case 0: /* This case is not documented. */
 		break;
+
 	      case HP_SDC_STATUS_USERTIMER:
 	      case HP_SDC_STATUS_PERIODIC:
 	      case HP_SDC_STATUS_TIMER:
@@ -224,9 +235,11 @@ static irqreturn_t hp_sdc_isr(int irq, v
 			hp_sdc.timer(irq, dev_id, status, data);
 		read_unlock(&hp_sdc.hook_lock);
 		break;
+
 	      case HP_SDC_STATUS_REG:
 		hp_sdc_take(irq, dev_id, status, data);
 		break;
+
 	      case HP_SDC_STATUS_HILCMD:
 	      case HP_SDC_STATUS_HILDATA:
 		read_lock(&hp_sdc.hook_lock);
@@ -234,13 +247,16 @@ static irqreturn_t hp_sdc_isr(int irq, v
 			hp_sdc.hil(irq, dev_id, status, data);
 		read_unlock(&hp_sdc.hook_lock);
 		break;
+
 	      case HP_SDC_STATUS_PUP:
 		read_lock(&hp_sdc.hook_lock);
 		if (hp_sdc.pup != NULL)
 			hp_sdc.pup(irq, dev_id, status, data);
-		else printk(KERN_INFO PREFIX "HP SDC reports successful PUP.\n");
+		else
+			printk(KERN_INFO PREFIX "HP SDC reports successful PUP.\n");
 		read_unlock(&hp_sdc.hook_lock);
 		break;
+
 	      default:
 		read_lock(&hp_sdc.hook_lock);
 		if (hp_sdc.cooked != NULL)
@@ -248,11 +264,13 @@ static irqreturn_t hp_sdc_isr(int irq, v
 		read_unlock(&hp_sdc.hook_lock);
 		break;
 	}
+
 	return IRQ_HANDLED;
 }
 
 
-static irqreturn_t hp_sdc_nmisr(int irq, void *dev_id) {
+static irqreturn_t hp_sdc_nmisr(int irq, void *dev_id)
+{
 	int status;
 	
 	status = hp_sdc_status_in8();
@@ -264,12 +282,12 @@ static irqreturn_t hp_sdc_nmisr(int irq,
 	      	if (hp_sdc.timer != NULL)
 			hp_sdc.timer(irq, dev_id, status, 0);
 		read_unlock(&hp_sdc.hook_lock);
-	}
-	else {
+	} else {
 		/* TODO: pass this on to the HIL handler, or do SAK here? */
 		printk(KERN_WARNING PREFIX "HIL NMI\n");
 	}
 #endif
+
 	return IRQ_HANDLED;
 }
 
@@ -278,13 +296,17 @@ static irqreturn_t hp_sdc_nmisr(int irq,
 
 unsigned long hp_sdc_put(void);
 
-static void hp_sdc_tasklet(unsigned long foo) {
-
+static void hp_sdc_tasklet(unsigned long foo)
+{
 	write_lock_irq(&hp_sdc.rtq_lock);
+
 	if (hp_sdc.rcurr >= 0) {
 		struct timeval tv;
+
 		do_gettimeofday(&tv);
-		if (tv.tv_sec > hp_sdc.rtv.tv_sec) tv.tv_usec += 1000000;
+		if (tv.tv_sec > hp_sdc.rtv.tv_sec)
+			tv.tv_usec += USEC_PER_SEC;
+
 		if (tv.tv_usec - hp_sdc.rtv.tv_usec > HP_SDC_MAX_REG_DELAY) {
 			hp_sdc_transaction *curr;
 			uint8_t tmp;
@@ -300,17 +322,18 @@ static void hp_sdc_tasklet(unsigned long
 			hp_sdc.rqty = 0;
 			tmp = curr->seq[curr->actidx];
 			curr->seq[curr->actidx] |= HP_SDC_ACT_DEAD;
-			if(tmp & HP_SDC_ACT_SEMAPHORE) {
+			if (tmp & HP_SDC_ACT_SEMAPHORE)
 				if (curr->act.semaphore)
 					up(curr->act.semaphore);
-			}
-			if(tmp & HP_SDC_ACT_CALLBACK) {
+
+			if (tmp & HP_SDC_ACT_CALLBACK) {
 				/* Note this means that irqhooks may be called
 				 * in tasklet/bh context.
 				 */
 				if (curr->act.irqhook)
 					curr->act.irqhook(0, NULL, 0, 0);
 			}
+
 			curr->actidx = curr->idx;
 			curr->idx++;
 			hp_sdc.rcurr = -1;
@@ -320,7 +343,8 @@ static void hp_sdc_tasklet(unsigned long
 	hp_sdc_put();
 }
 
-unsigned long hp_sdc_put(void) {
+unsigned long hp_sdc_put(void)
+{
 	hp_sdc_transaction *curr;
 	uint8_t act;
 	int idx, curridx;
@@ -333,19 +357,24 @@ unsigned long hp_sdc_put(void) {
 	   requires output, so we skip to the administrativa. */
 	if (hp_sdc.ibf) {
 		hp_sdc_status_in8();
-		if (hp_sdc.ibf) goto finish;
+		if (hp_sdc.ibf)
+			goto finish;
 	}
 
  anew:
 	/* See if we are in the middle of a sequence. */
-	if (hp_sdc.wcurr < 0) hp_sdc.wcurr = 0;
+	if (hp_sdc.wcurr < 0)
+		hp_sdc.wcurr = 0;
 	read_lock_irq(&hp_sdc.rtq_lock);
-	if (hp_sdc.rcurr == hp_sdc.wcurr) hp_sdc.wcurr++;
+	if (hp_sdc.rcurr == hp_sdc.wcurr)
+		hp_sdc.wcurr++;
 	read_unlock_irq(&hp_sdc.rtq_lock);
-	if (hp_sdc.wcurr >= HP_SDC_QUEUE_LEN) hp_sdc.wcurr = 0;
+	if (hp_sdc.wcurr >= HP_SDC_QUEUE_LEN)
+		hp_sdc.wcurr = 0;
 	curridx = hp_sdc.wcurr;
 
-	if (hp_sdc.tq[curridx] != NULL) goto start;
+	if (hp_sdc.tq[curridx] != NULL)
+		goto start;
 
 	while (++curridx != hp_sdc.wcurr) {
 		if (curridx >= HP_SDC_QUEUE_LEN) {
@@ -358,7 +387,8 @@ unsigned long hp_sdc_put(void) {
 			continue;
 		}
 		read_unlock_irq(&hp_sdc.rtq_lock);
-		if (hp_sdc.tq[curridx] != NULL) break; /* Found one. */
+		if (hp_sdc.tq[curridx] != NULL)
+			break; /* Found one. */
 	}
 	if (curridx == hp_sdc.wcurr) { /* There's nothing queued to do. */
 		curridx = -1;
@@ -374,7 +404,8 @@ unsigned long hp_sdc_put(void) {
 		goto finish;
 	}
 
-	if (hp_sdc.wcurr == -1) goto done;
+	if (hp_sdc.wcurr == -1)
+		goto done;
 
 	curr = hp_sdc.tq[curridx];
 	idx = curr->actidx;
@@ -383,7 +414,8 @@ unsigned long hp_sdc_put(void) {
 		hp_sdc.tq[curridx] = NULL;
 		/* Interleave outbound data between the transactions. */
 		hp_sdc.wcurr++;
-		if (hp_sdc.wcurr >= HP_SDC_QUEUE_LEN) hp_sdc.wcurr = 0;
+		if (hp_sdc.wcurr >= HP_SDC_QUEUE_LEN)
+			hp_sdc.wcurr = 0;
 		goto finish;	
 	}
 
@@ -391,11 +423,13 @@ unsigned long hp_sdc_put(void) {
 	idx++;
 
 	if (curr->idx >= curr->endidx) {
-		if (act & HP_SDC_ACT_DEALLOC) kfree(curr);
+		if (act & HP_SDC_ACT_DEALLOC)
+			kfree(curr);
 		hp_sdc.tq[curridx] = NULL;
 		/* Interleave outbound data between the transactions. */
 		hp_sdc.wcurr++;
-		if (hp_sdc.wcurr >= HP_SDC_QUEUE_LEN) hp_sdc.wcurr = 0;
+		if (hp_sdc.wcurr >= HP_SDC_QUEUE_LEN)
+			hp_sdc.wcurr = 0;
 		goto finish;	
 	}
 
@@ -409,9 +443,10 @@ unsigned long hp_sdc_put(void) {
 		curr->idx++;
 		/* act finished? */
 		if ((act & HP_SDC_ACT_DURING) == HP_SDC_ACT_PRECMD)
-		  goto actdone;
+			goto actdone;
 		/* skip quantity field if data-out sequence follows. */
-		if (act & HP_SDC_ACT_DATAOUT) curr->idx++;
+		if (act & HP_SDC_ACT_DATAOUT)
+			curr->idx++;
 		goto finish;
 	}
 	if (act & HP_SDC_ACT_DATAOUT) {
@@ -430,8 +465,8 @@ unsigned long hp_sdc_put(void) {
 		}
 		idx += qty;
 		act &= ~HP_SDC_ACT_DATAOUT;
-	}
-	else while (act & HP_SDC_ACT_DATAREG) {
+	} else
+	    while (act & HP_SDC_ACT_DATAREG) {
 		int mask;
 		uint8_t w7[4];
 
@@ -456,15 +491,19 @@ unsigned long hp_sdc_put(void) {
 			int i = 0;
 
 			/* Need to point the write index register */	
-			while ((i < 4) && w7[i] == hp_sdc.r7[i]) i++;
+			while ((i < 4) && w7[i] == hp_sdc.r7[i])
+				i++;
+
 			if (i < 4) {
 				hp_sdc_status_out8(HP_SDC_CMD_SET_D0 + i);
 				hp_sdc.wi = 0x70 + i;
 				goto finish;
 			}
+
 			idx++;
 			if ((act & HP_SDC_ACT_DURING) == HP_SDC_ACT_DATAREG)
 				goto actdone;
+
 			curr->idx = idx;
 			act &= ~HP_SDC_ACT_DATAREG;
 			break;
@@ -476,12 +515,13 @@ unsigned long hp_sdc_put(void) {
 		{
 			int i = 0;
 
-			while ((i < 4) && w7[i] == hp_sdc.r7[i]) i++;
+			while ((i < 4) && w7[i] == hp_sdc.r7[i])
+				i++;
 			if (i >= 4) {
 				curr->idx = idx + 1;
 				if ((act & HP_SDC_ACT_DURING) ==
 				    HP_SDC_ACT_DATAREG)
-				        goto actdone;
+					goto actdone;
 			}
 		}
 		goto finish;
@@ -519,64 +559,69 @@ unsigned long hp_sdc_put(void) {
 		goto actdone;
 	}
 
-actdone:
-	if (act & HP_SDC_ACT_SEMAPHORE) {
+ actdone:
+	if (act & HP_SDC_ACT_SEMAPHORE)
 		up(curr->act.semaphore);
-	}
-	else if (act & HP_SDC_ACT_CALLBACK) {
+	else if (act & HP_SDC_ACT_CALLBACK)
 		curr->act.irqhook(0,NULL,0,0);
-	}
+
 	if (curr->idx >= curr->endidx) { /* This transaction is over. */
-		if (act & HP_SDC_ACT_DEALLOC) kfree(curr);
+		if (act & HP_SDC_ACT_DEALLOC)
+			kfree(curr);
 		hp_sdc.tq[curridx] = NULL;
-	}
-	else {
+	} else {
 		curr->actidx = idx + 1;
 		curr->idx = idx + 2;
 	}
 	/* Interleave outbound data between the transactions. */
 	hp_sdc.wcurr++;
-	if (hp_sdc.wcurr >= HP_SDC_QUEUE_LEN) hp_sdc.wcurr = 0;
+	if (hp_sdc.wcurr >= HP_SDC_QUEUE_LEN)
+		hp_sdc.wcurr = 0;
 
  finish:
 	/* If by some quirk IBF has cleared and our ISR has run to
 	   see that that has happened, do it all again. */
-	if (!hp_sdc.ibf && limit++ < 20) goto anew;
+	if (!hp_sdc.ibf && limit++ < 20)
+		goto anew;
 
  done:
-	if (hp_sdc.wcurr >= 0) tasklet_schedule(&hp_sdc.task);
+	if (hp_sdc.wcurr >= 0)
+		tasklet_schedule(&hp_sdc.task);
 	write_unlock(&hp_sdc.lock);
+
 	return 0;
 }
 
 /******* Functions called in either user or kernel context ****/
-int hp_sdc_enqueue_transaction(hp_sdc_transaction *this) {
+int hp_sdc_enqueue_transaction(hp_sdc_transaction *this)
+{
 	unsigned long flags;
 	int i;
 
 	if (this == NULL) {
 		tasklet_schedule(&hp_sdc.task);
 		return -EINVAL;
-	};
+	}
 
 	write_lock_irqsave(&hp_sdc.lock, flags);
 
 	/* Can't have same transaction on queue twice */
-	for (i=0; i < HP_SDC_QUEUE_LEN; i++)
-		if (hp_sdc.tq[i] == this) goto fail;
+	for (i = 0; i < HP_SDC_QUEUE_LEN; i++)
+		if (hp_sdc.tq[i] == this)
+			goto fail;
 
 	this->actidx = 0;
 	this->idx = 1;
 
 	/* Search for empty slot */
-	for (i=0; i < HP_SDC_QUEUE_LEN; i++) {
+	for (i = 0; i < HP_SDC_QUEUE_LEN; i++)
 		if (hp_sdc.tq[i] == NULL) {
 			hp_sdc.tq[i] = this;
 			write_unlock_irqrestore(&hp_sdc.lock, flags);
 			tasklet_schedule(&hp_sdc.task);
 			return 0;
 		}
-	}
+
 	write_unlock_irqrestore(&hp_sdc.lock, flags);
 	printk(KERN_WARNING PREFIX "No free slot to add transaction.\n");
 	return -EBUSY;
@@ -587,7 +632,8 @@ int hp_sdc_enqueue_transaction(hp_sdc_tr
 	return -EINVAL;
 }
 
-int hp_sdc_dequeue_transaction(hp_sdc_transaction *this) {
+int hp_sdc_dequeue_transaction(hp_sdc_transaction *this)
+{
 	unsigned long flags;
 	int i;
 
@@ -595,8 +641,9 @@ int hp_sdc_dequeue_transaction(hp_sdc_tr
 
 	/* TODO: don't remove it if it's not done. */
 
-	for (i=0; i < HP_SDC_QUEUE_LEN; i++)
-		if (hp_sdc.tq[i] == this) hp_sdc.tq[i] = NULL;
+	for (i = 0; i < HP_SDC_QUEUE_LEN; i++)
+		if (hp_sdc.tq[i] == this)
+			hp_sdc.tq[i] = NULL;
 
 	write_unlock_irqrestore(&hp_sdc.lock, flags);
 	return 0;
@@ -605,11 +652,11 @@ int hp_sdc_dequeue_transaction(hp_sdc_tr
 
 
 /********************** User context functions **************************/
-int hp_sdc_request_timer_irq(hp_sdc_irqhook *callback) {
-
-	if (callback == NULL || hp_sdc.dev == NULL) {
+int hp_sdc_request_timer_irq(hp_sdc_irqhook *callback)
+{
+	if (callback == NULL || hp_sdc.dev == NULL)
 		return -EINVAL;
-	}
+
 	write_lock_irq(&hp_sdc.hook_lock);
 	if (hp_sdc.timer != NULL) {
 		write_unlock_irq(&hp_sdc.hook_lock);
@@ -629,11 +676,11 @@ int hp_sdc_request_timer_irq(hp_sdc_irqh
 	return 0;
 }
 
-int hp_sdc_request_hil_irq(hp_sdc_irqhook *callback) {
-
-	if (callback == NULL || hp_sdc.dev == NULL) {
+int hp_sdc_request_hil_irq(hp_sdc_irqhook *callback)
+{
+	if (callback == NULL || hp_sdc.dev == NULL)
 		return -EINVAL;
-	}
+
 	write_lock_irq(&hp_sdc.hook_lock);
 	if (hp_sdc.hil != NULL) {
 		write_unlock_irq(&hp_sdc.hook_lock);
@@ -650,11 +697,11 @@ int hp_sdc_request_hil_irq(hp_sdc_irqhoo
 	return 0;
 }
 
-int hp_sdc_request_cooked_irq(hp_sdc_irqhook *callback) {
-
-	if (callback == NULL || hp_sdc.dev == NULL) {
+int hp_sdc_request_cooked_irq(hp_sdc_irqhook *callback)
+{
+	if (callback == NULL || hp_sdc.dev == NULL)
 		return -EINVAL;
-	}
+
 	write_lock_irq(&hp_sdc.hook_lock);
 	if (hp_sdc.cooked != NULL) {
 		write_unlock_irq(&hp_sdc.hook_lock);
@@ -672,9 +719,8 @@ int hp_sdc_request_cooked_irq(hp_sdc_irq
 	return 0;
 }
 
-int hp_sdc_release_timer_irq(hp_sdc_irqhook *callback) {
-
-
+int hp_sdc_release_timer_irq(hp_sdc_irqhook *callback)
+{
 	write_lock_irq(&hp_sdc.hook_lock);
 	if ((callback != hp_sdc.timer) ||
 	    (hp_sdc.timer == NULL)) {
@@ -694,8 +740,8 @@ int hp_sdc_release_timer_irq(hp_sdc_irqh
 	return 0;
 }
 
-int hp_sdc_release_hil_irq(hp_sdc_irqhook *callback) {
-
+int hp_sdc_release_hil_irq(hp_sdc_irqhook *callback)
+{
 	write_lock_irq(&hp_sdc.hook_lock);
 	if ((callback != hp_sdc.hil) ||
 	    (hp_sdc.hil == NULL)) {
@@ -715,8 +761,8 @@ int hp_sdc_release_hil_irq(hp_sdc_irqhoo
 	return 0;
 }
 
-int hp_sdc_release_cooked_irq(hp_sdc_irqhook *callback) {
-
+int hp_sdc_release_cooked_irq(hp_sdc_irqhook *callback)
+{
 	write_lock_irq(&hp_sdc.hook_lock);
 	if ((callback != hp_sdc.cooked) ||
 	    (hp_sdc.cooked == NULL)) {
@@ -738,7 +784,8 @@ int hp_sdc_release_cooked_irq(hp_sdc_irq
 
 /************************* Keepalive timer task *********************/
 
-void hp_sdc_kicker (unsigned long data) {
+void hp_sdc_kicker (unsigned long data)
+{
 	tasklet_schedule(&hp_sdc.task);
 	/* Re-insert the periodic task. */
 	mod_timer(&hp_sdc.kicker, jiffies + HZ);
@@ -772,7 +819,6 @@ static struct parisc_driver hp_sdc_drive
 
 static int __init hp_sdc_init(void)
 {
-	int i;
 	char *errstr;
 	hp_sdc_transaction t_sync;
 	uint8_t ts_sync[6];
@@ -796,7 +842,8 @@ static int __init hp_sdc_init(void)
 	hp_sdc.r7[3]		= 0xff;
 	hp_sdc.ibf		= 1;
 
-	for (i = 0; i < HP_SDC_QUEUE_LEN; i++) hp_sdc.tq[i] = NULL;
+	memset(&hp_sdc.tq, 0, sizeof(hp_sdc.tq));
+
 	hp_sdc.wcurr		= -1;
         hp_sdc.rcurr		= -1;
 	hp_sdc.rqty		= 0;
@@ -804,25 +851,30 @@ static int __init hp_sdc_init(void)
 	hp_sdc.dev_err = -ENODEV;
 
 	errstr = "IO not found for";
-	if (!hp_sdc.base_io) goto err0;
+	if (!hp_sdc.base_io)
+		goto err0;
 
 	errstr = "IRQ not found for";
-	if (!hp_sdc.irq) goto err0;
+	if (!hp_sdc.irq)
+		goto err0;
 
 	hp_sdc.dev_err = -EBUSY;
 
 #if defined(__hppa__)
 	errstr = "IO not available for";
-        if (request_region(hp_sdc.data_io, 2, hp_sdc_driver.name)) goto err0;
+        if (request_region(hp_sdc.data_io, 2, hp_sdc_driver.name))
+		goto err0;
 #endif	
 
 	errstr = "IRQ not available for";
 	if (request_irq(hp_sdc.irq, &hp_sdc_isr, IRQF_SHARED|IRQF_SAMPLE_RANDOM,
-		"HP SDC", &hp_sdc)) goto err1;
+			"HP SDC", &hp_sdc))
+		goto err1;
 
 	errstr = "NMI not available for";
 	if (request_irq(hp_sdc.nmi, &hp_sdc_nmisr, IRQF_SHARED,
-		"HP SDC NMI", &hp_sdc)) goto err2;
+			"HP SDC NMI", &hp_sdc))
+		goto err2;
 
 	printk(KERN_INFO PREFIX "HP SDC at 0x%p, IRQ %d (NMI IRQ %d)\n",
 	       (void *)hp_sdc.base_io, hp_sdc.irq, hp_sdc.nmi);
@@ -861,6 +913,7 @@ static int __init hp_sdc_init(void)
 	printk(KERN_WARNING PREFIX ": %s SDC IO=0x%p IRQ=0x%x NMI=0x%x\n",
 		errstr, (void *)hp_sdc.base_io, hp_sdc.irq, hp_sdc.nmi);
 	hp_sdc.dev = NULL;
+
 	return hp_sdc.dev_err;
 }
 
@@ -868,8 +921,10 @@ static int __init hp_sdc_init(void)
 
 static int __init hp_sdc_init_hppa(struct parisc_device *d)
 {
-	if (!d) return 1;
-	if (hp_sdc.dev != NULL) return 1;	/* We only expect one SDC */
+	if (!d)
+		return 1;
+	if (hp_sdc.dev != NULL)
+		return 1;	/* We only expect one SDC */
 
 	hp_sdc.dev		= d;
 	hp_sdc.irq		= d->irq;
@@ -906,8 +961,6 @@ static void hp_sdc_exit(void)
 
 	tasklet_kill(&hp_sdc.task);
 
-/*        release_region(hp_sdc.data_io, 2); */
-
 #if defined(__hppa__)
 	if (unregister_parisc_driver(&hp_sdc_driver))
 		printk(KERN_WARNING PREFIX "Error unregistering HP SDC");
@@ -979,7 +1032,7 @@ static int __init hp_sdc_register(void)
 	}
 	hp_sdc.r11 = tq_init_seq[4];
 	if (hp_sdc.r11 & HP_SDC_CFG_NEW) {
-		char *str;
+		const char *str;
 		printk(KERN_INFO PREFIX "New style SDC\n");
 		tq_init_seq[1] = HP_SDC_CMD_READ_XTD;
 		tq_init.actidx		= 0;
@@ -995,12 +1048,10 @@ static int __init hp_sdc_register(void)
 		hp_sdc.r7e = tq_init_seq[4];
 		HP_SDC_XTD_REV_STRINGS(hp_sdc.r7e & HP_SDC_XTD_REV, str)
 		printk(KERN_INFO PREFIX "Revision: %s\n", str);
-		if (hp_sdc.r7e & HP_SDC_XTD_BEEPER) {
+		if (hp_sdc.r7e & HP_SDC_XTD_BEEPER)
 			printk(KERN_INFO PREFIX "TI SN76494 beeper present\n");
-		}
-		if (hp_sdc.r7e & HP_SDC_XTD_BBRTC) {
+		if (hp_sdc.r7e & HP_SDC_XTD_BBRTC)
 			printk(KERN_INFO PREFIX "OKI MSM-58321 BBRTC present\n");
-		}
 		printk(KERN_INFO PREFIX "Spunking the self test register to force PUP "
 		       "on next firmware reset.\n");
 		tq_init_seq[0] = HP_SDC_ACT_PRECMD |
@@ -1015,11 +1066,9 @@ static int __init hp_sdc_register(void)
 		hp_sdc_enqueue_transaction(&tq_init);		
 		down(&tq_init_sem);
 		up(&tq_init_sem);
-	}
-	else {
+	} else
 		printk(KERN_INFO PREFIX "Old style SDC (1820-%s).\n",
 		       (hp_sdc.r11 & HP_SDC_CFG_REV) ? "3300" : "2564/3087");
-	}
 
         return 0;
 }
diff --git a/drivers/input/serio/hp_sdc_mlc.c b/drivers/input/serio/hp_sdc_mlc.c
index 37b44c9..a87c453 100644
--- a/drivers/input/serio/hp_sdc_mlc.c
+++ b/drivers/input/serio/hp_sdc_mlc.c
@@ -59,11 +59,12 @@ struct hp_sdc_mlc_priv_s {
 
 /************************* Interrupt context ******************************/
 static void hp_sdc_mlc_isr (int irq, void *dev_id,
-			    uint8_t status, uint8_t data) {
+			    uint8_t status, uint8_t data)
+{
   	int idx;
 	hil_mlc *mlc = &hp_sdc_mlc;
 
-	write_lock(&(mlc->lock));
+	write_lock(&mlc->lock);
 	if (mlc->icount < 0) {
 		printk(KERN_WARNING PREFIX "HIL Overflow!\n");
 		up(&mlc->isem);
@@ -73,18 +74,19 @@ static void hp_sdc_mlc_isr (int irq, voi
 	if ((status & HP_SDC_STATUS_IRQMASK) == HP_SDC_STATUS_HILDATA) {
 		mlc->ipacket[idx] |= data | HIL_ERR_INT;
 		mlc->icount--;
-		if (hp_sdc_mlc_priv.got5x) goto check;
-		if (!idx) goto check;
+		if (hp_sdc_mlc_priv.got5x || !idx)
+			goto check;
 		if ((mlc->ipacket[idx-1] & HIL_PKT_ADDR_MASK) !=
 		    (mlc->ipacket[idx] & HIL_PKT_ADDR_MASK)) {
 			mlc->ipacket[idx] &= ~HIL_PKT_ADDR_MASK;
 			mlc->ipacket[idx] |= (mlc->ipacket[idx-1]
-						    & HIL_PKT_ADDR_MASK);
+						& HIL_PKT_ADDR_MASK);
 		}
 		goto check;
 	}
 	/* We know status is 5X */
-	if (data & HP_SDC_HIL_ISERR) goto err;
+	if (data & HP_SDC_HIL_ISERR)
+		goto err;
 	mlc->ipacket[idx] =
 		(data & HP_SDC_HIL_R1MASK) << HIL_PKT_ADDR_SHIFT;
 	hp_sdc_mlc_priv.got5x = 1;
@@ -92,54 +94,64 @@ static void hp_sdc_mlc_isr (int irq, voi
 
  check:
 	hp_sdc_mlc_priv.got5x = 0;
-	if (mlc->imatch == 0) goto done;
+	if (mlc->imatch == 0)
+		goto done;
 	if ((mlc->imatch == (HIL_ERR_INT | HIL_PKT_CMD | HIL_CMD_POL))
-	    && (mlc->ipacket[idx] == (mlc->imatch | idx))) goto done;
-	if (mlc->ipacket[idx] == mlc->imatch) goto done;
+	    && (mlc->ipacket[idx] == (mlc->imatch | idx)))
+		goto done;
+	if (mlc->ipacket[idx] == mlc->imatch)
+		goto done;
 	goto out;
 
  err:				
 	printk(KERN_DEBUG PREFIX "err code %x\n", data);
+
 	switch (data) {
 	case HP_SDC_HIL_RC_DONE:
 		printk(KERN_WARNING PREFIX "Bastard SDC reconfigured loop!\n");
 		break;
+
 	case HP_SDC_HIL_ERR:
 		mlc->ipacket[idx] |= HIL_ERR_INT | HIL_ERR_PERR |
-		  HIL_ERR_FERR | HIL_ERR_FOF;
+					HIL_ERR_FERR | HIL_ERR_FOF;
 		break;
+
 	case HP_SDC_HIL_TO:
 		mlc->ipacket[idx] |= HIL_ERR_INT | HIL_ERR_LERR;
 		break;
+
 	case HP_SDC_HIL_RC:
 		printk(KERN_WARNING PREFIX "Bastard SDC decided to reconfigure loop!\n");
 		break;
+
 	default:
 		printk(KERN_WARNING PREFIX "Unkown HIL Error status (%x)!\n", data);
 		break;
 	}
+
 	/* No more data will be coming due to an error. */
  done:
 	tasklet_schedule(mlc->tasklet);
-	up(&(mlc->isem));
+	up(&mlc->isem);
  out:
-	write_unlock(&(mlc->lock));
+	write_unlock(&mlc->lock);
 }
 
 
 /******************** Tasklet or userspace context functions ****************/
 
-static int hp_sdc_mlc_in (hil_mlc *mlc, suseconds_t timeout) {
+static int hp_sdc_mlc_in(hil_mlc *mlc, suseconds_t timeout)
+{
 	unsigned long flags;
 	struct hp_sdc_mlc_priv_s *priv;
 	int rc = 2;
 
 	priv = mlc->priv;
 
-	write_lock_irqsave(&(mlc->lock), flags);
+	write_lock_irqsave(&mlc->lock, flags);
 
 	/* Try to down the semaphore */
-	if (down_trylock(&(mlc->isem))) {
+	if (down_trylock(&mlc->isem)) {
 		struct timeval tv;
 		if (priv->emtestmode) {
 			mlc->ipacket[0] =
@@ -152,55 +164,54 @@ static int hp_sdc_mlc_in (hil_mlc *mlc, 
 			goto wasup;
 		}
 		do_gettimeofday(&tv);
-		tv.tv_usec += 1000000 * (tv.tv_sec - mlc->instart.tv_sec);
+		tv.tv_usec += USEC_PER_SEC * (tv.tv_sec - mlc->instart.tv_sec);
 		if (tv.tv_usec - mlc->instart.tv_usec > mlc->intimeout) {
-		  /*		  printk("!%i %i",
-				  tv.tv_usec - mlc->instart.tv_usec,
-				  mlc->intimeout);
-		  */
+			/*	printk("!%i %i",
+				tv.tv_usec - mlc->instart.tv_usec,
+				mlc->intimeout);
+			 */
 			rc = 1;
-			up(&(mlc->isem));
+			up(&mlc->isem);
 		}
 		goto done;
 	}
  wasup:
-	up(&(mlc->isem));
+	up(&mlc->isem);
 	rc = 0;
 	goto done;
  done:
-	write_unlock_irqrestore(&(mlc->lock), flags);
+	write_unlock_irqrestore(&mlc->lock, flags);
 	return rc;
 }
 
-static int hp_sdc_mlc_cts (hil_mlc *mlc) {
+static int hp_sdc_mlc_cts(hil_mlc *mlc)
+{
 	struct hp_sdc_mlc_priv_s *priv;
 	unsigned long flags;
 
 	priv = mlc->priv;	
 
-	write_lock_irqsave(&(mlc->lock), flags);
+	write_lock_irqsave(&mlc->lock, flags);
 
 	/* Try to down the semaphores -- they should be up. */
-	if (down_trylock(&(mlc->isem))) {
-		BUG();
-		goto busy;
-	}
-	if (down_trylock(&(mlc->osem))) {
-	 	BUG();
-		up(&(mlc->isem));
-		goto busy;
-	}
-	up(&(mlc->isem));
-	up(&(mlc->osem));
+	BUG_ON(down_trylock(&mlc->isem));
+	BUG_ON(down_trylock(&mlc->osem));
 
-	if (down_trylock(&(mlc->csem))) {
-		if (priv->trans.act.semaphore != &(mlc->csem)) goto poll;
-		goto busy;
+	up(&mlc->isem);
+	up(&mlc->osem);
+
+	if (down_trylock(&mlc->csem)) {
+		if (priv->trans.act.semaphore != &mlc->csem)
+			goto poll;
+		else
+			goto busy;
 	}
-	if (!(priv->tseq[4] & HP_SDC_USE_LOOP)) goto done;
+
+	if (!(priv->tseq[4] & HP_SDC_USE_LOOP))
+		goto done;
 
  poll:
-	priv->trans.act.semaphore = &(mlc->csem);
+	priv->trans.act.semaphore = &mlc->csem;
 	priv->trans.actidx = 0;
 	priv->trans.idx = 1;
 	priv->trans.endidx = 5;
@@ -210,48 +221,44 @@ static int hp_sdc_mlc_cts (hil_mlc *mlc)
 	priv->tseq[2] = 1;
 	priv->tseq[3] = 0;
 	priv->tseq[4] = 0;
-	hp_sdc_enqueue_transaction(&(priv->trans));
+	hp_sdc_enqueue_transaction(&priv->trans);
  busy:
-	write_unlock_irqrestore(&(mlc->lock), flags);
+	write_unlock_irqrestore(&mlc->lock, flags);
 	return 1;
  done:
-	priv->trans.act.semaphore = &(mlc->osem);
-	up(&(mlc->csem));
-	write_unlock_irqrestore(&(mlc->lock), flags);
+	priv->trans.act.semaphore = &mlc->osem;
+	up(&mlc->csem);
+	write_unlock_irqrestore(&mlc->lock, flags);
 	return 0;
 }
 
-static void hp_sdc_mlc_out (hil_mlc *mlc) {
+static void hp_sdc_mlc_out(hil_mlc *mlc)
+{
 	struct hp_sdc_mlc_priv_s *priv;
 	unsigned long flags;
 
 	priv = mlc->priv;
 
-	write_lock_irqsave(&(mlc->lock), flags);
+	write_lock_irqsave(&mlc->lock, flags);
 	
 	/* Try to down the semaphore -- it should be up. */
-	if (down_trylock(&(mlc->osem))) {
-	 	BUG();
-		goto done;
-	}
+	BUG_ON(down_trylock(&mlc->osem));
 
-	if (mlc->opacket & HIL_DO_ALTER_CTRL) goto do_control;
+	if (mlc->opacket & HIL_DO_ALTER_CTRL)
+		goto do_control;
 
  do_data:
 	if (priv->emtestmode) {
-		up(&(mlc->osem));
+		up(&mlc->osem);
 		goto done;
 	}
 	/* Shouldn't be sending commands when loop may be busy */
-	if (down_trylock(&(mlc->csem))) {
-	 	BUG();
-		goto done;
-	}
-	up(&(mlc->csem));
+	BUG_ON(down_trylock(&mlc->csem));
+	up(&mlc->csem);
 
 	priv->trans.actidx = 0;
 	priv->trans.idx = 1;
-	priv->trans.act.semaphore = &(mlc->osem);
+	priv->trans.act.semaphore = &mlc->osem;
 	priv->trans.endidx = 6;
 	priv->tseq[0] =
 		HP_SDC_ACT_DATAREG | HP_SDC_ACT_POSTCMD | HP_SDC_ACT_SEMAPHORE;
@@ -264,7 +271,8 @@ static void hp_sdc_mlc_out (hil_mlc *mlc
 		(mlc->opacket & HIL_PKT_DATA_MASK)
 		  >> HIL_PKT_DATA_SHIFT;
 	priv->tseq[4] = 0;  /* No timeout */
-	if (priv->tseq[3] == HIL_CMD_DHR) priv->tseq[4] = 1;
+	if (priv->tseq[3] == HIL_CMD_DHR)
+		priv->tseq[4] = 1;
 	priv->tseq[5] = HP_SDC_CMD_DO_HIL;
 	goto enqueue;
 
@@ -274,11 +282,12 @@ static void hp_sdc_mlc_out (hil_mlc *mlc
 	/* we cannot emulate this, it should not be used. */
 	BUG_ON((mlc->opacket & (HIL_CTRL_APE | HIL_CTRL_IPF)) == HIL_CTRL_APE);
 	
-	if ((mlc->opacket & HIL_CTRL_ONLY) == HIL_CTRL_ONLY) goto control_only;
-	if (mlc->opacket & HIL_CTRL_APE) {
-		BUG(); /* Should not send command/data after engaging APE */
-		goto done;
-	}
+	if ((mlc->opacket & HIL_CTRL_ONLY) == HIL_CTRL_ONLY)
+		goto control_only;
+
+	/* Should not send command/data after engaging APE */
+	BUG_ON(mlc->opacket & HIL_CTRL_APE);
+
 	/* Disengaging APE this way would not be valid either since
 	 * the loop must be allowed to idle.
 	 *
@@ -290,22 +299,22 @@ static void hp_sdc_mlc_out (hil_mlc *mlc
  control_only:
 	priv->trans.actidx = 0;
 	priv->trans.idx = 1;
-	priv->trans.act.semaphore = &(mlc->osem);
+	priv->trans.act.semaphore = &mlc->osem;
 	priv->trans.endidx = 4;
 	priv->tseq[0] =
 	  HP_SDC_ACT_PRECMD | HP_SDC_ACT_DATAOUT | HP_SDC_ACT_SEMAPHORE;
 	priv->tseq[1] = HP_SDC_CMD_SET_LPC;
 	priv->tseq[2] = 1;
-	//	priv->tseq[3] = (mlc->ddc + 1) | HP_SDC_LPS_ACSUCC;
+	/* priv->tseq[3] = (mlc->ddc + 1) | HP_SDC_LPS_ACSUCC; */
 	priv->tseq[3] = 0;
 	if (mlc->opacket & HIL_CTRL_APE) {
 		priv->tseq[3] |= HP_SDC_LPC_APE_IPF;
-		down_trylock(&(mlc->csem));
+		down_trylock(&mlc->csem);
 	}
  enqueue:
-	hp_sdc_enqueue_transaction(&(priv->trans));
+	hp_sdc_enqueue_transaction(&priv->trans);
  done:
-	write_unlock_irqrestore(&(mlc->lock), flags);
+	write_unlock_irqrestore(&mlc->lock, flags);
 }
 
 static int __init hp_sdc_mlc_init(void)
@@ -316,7 +325,7 @@ static int __init hp_sdc_mlc_init(void)
 
 	hp_sdc_mlc_priv.emtestmode = 0;
 	hp_sdc_mlc_priv.trans.seq = hp_sdc_mlc_priv.tseq;
-	hp_sdc_mlc_priv.trans.act.semaphore = &(mlc->osem);
+	hp_sdc_mlc_priv.trans.act.semaphore = &mlc->osem;
 	hp_sdc_mlc_priv.got5x = 0;
 
 	mlc->cts		= &hp_sdc_mlc_cts;
@@ -336,10 +345,9 @@ static int __init hp_sdc_mlc_init(void)
 	}
 	return 0;
  err1:
-	if (hil_mlc_unregister(mlc)) {
+	if (hil_mlc_unregister(mlc))
 		printk(KERN_ERR PREFIX "Failed to unregister MLC structure with hil_mlc.\n"
 			"This is bad.  Could cause an oops.\n");
-	}
  err0:
 	return -EBUSY;
 }
@@ -347,14 +355,14 @@ static int __init hp_sdc_mlc_init(void)
 static void __exit hp_sdc_mlc_exit(void)
 {
 	hil_mlc *mlc = &hp_sdc_mlc;
-	if (hp_sdc_release_hil_irq(&hp_sdc_mlc_isr)) {
+
+	if (hp_sdc_release_hil_irq(&hp_sdc_mlc_isr))
 		printk(KERN_ERR PREFIX "Failed to release the raw HIL ISR hook.\n"
 			"This is bad.  Could cause an oops.\n");
-	}
-	if (hil_mlc_unregister(mlc)) {
+
+	if (hil_mlc_unregister(mlc))
 		printk(KERN_ERR PREFIX "Failed to unregister MLC structure with hil_mlc.\n"
 			"This is bad.  Could cause an oops.\n");
-	}
 }
 
 module_init(hp_sdc_mlc_init);
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
