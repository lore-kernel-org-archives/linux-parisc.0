From: Dmitry Torokhov <dtor@insightbb.com>
Subject: Re: [PARISC] fix uninitialized spinlock in HIL keyboard driver
Date: Sun, 18 Feb 2007 02:24:47 -0500
Message-ID: <200702180224.48281.dtor__23426.9388056875$1416624297$gmane$org@insightbb.com>
References: <11717457251848-git-send-email-kyle@parisc-linux.org> <11717457253477-git-send-email-kyle@parisc-linux.org> <200702172321.37036.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Cc: Kyle McMartin <kyle@parisc-linux.org>,
 parisc-linux@lists.parisc-linux.org,
 akpm@osdl.org
To: Helge Deller <deller@gmx.de>
Return-Path: <dtor@insightbb.com>
In-Reply-To: <200702172321.37036.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

Hi Helge,

On Saturday 17 February 2007 17:21, Helge Deller wrote:
> 
> Can you drop this ^^ piece of this patch ?
> Cyrill V. Gorcunov's (<gorcunov@gmail.com>) HP300 patches from a few days ago
> are more correct since they include the release_region() call. 
> 

I have 2 patches from Cyrill applied to my tree:
 - one from couple days ago dealing with release_region() (2nd version that was
   acked by you)
 - another came to me throughg Andrew and deals with handling errors from
   input_register_device(), request_region(), request_irq() + whitespace cleanup.


> Or, if you want, I can resend this whole patch against your input-tree ?
> Just let me know...
> 

If you could redo the patches against my tree that would be nice - I am having
trouble applying "[PARISC] hp_sdc: fix request_irq()/free_irq() parameters"

Btw, is there any chance we coudl fix the code style in hil drivers. They are
very different from the rest of the kernel. Something like patch below...
 
-- 
Dmitry


Signed-off-by: Dmitry Torokhov <dtor@mail.ru>
---

 drivers/input/serio/hil_mlc.c |  381 +++++++++++++++++++++++++-----------------
 1 files changed, 228 insertions(+), 153 deletions(-)

Index: work/drivers/input/serio/hil_mlc.c
===================================================================
--- work.orig/drivers/input/serio/hil_mlc.c
+++ work/drivers/input/serio/hil_mlc.c
@@ -32,11 +32,11 @@
  *
  *	Driver theory of operation:
  *
- *	Some access methods and an ISR is defined by the sub-driver 
- *	(e.g. hp_sdc_mlc.c).  These methods are expected to provide a 
- *	few bits of logic in addition to raw access to the HIL MLC, 
- *	specifically, the ISR, which is entirely registered by the 
- *	sub-driver and invoked directly, must check for record 
+ *	Some access methods and an ISR is defined by the sub-driver
+ *	(e.g. hp_sdc_mlc.c).  These methods are expected to provide a
+ *	few bits of logic in addition to raw access to the HIL MLC,
+ *	specifically, the ISR, which is entirely registered by the
+ *	sub-driver and invoked directly, must check for record
  *	termination or packet match, at which point a semaphore must
  *	be cleared and then the hil_mlcs_tasklet must be scheduled.
  *
@@ -47,7 +47,7 @@
  *	itself if output is pending.  (This rescheduling should be replaced
  *	at some point with a sub-driver-specific mechanism.)
  *
- *	A timer task prods the tasklet once per second to prevent 
+ *	A timer task prods the tasklet once per second to prevent
  *	hangups when attached devices do not return expected data
  *	and to initiate probes of the loop for new devices.
  */
@@ -83,69 +83,86 @@ DECLARE_TASKLET_DISABLED(hil_mlcs_taskle
 
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
+			    sizeof(mlc->di_scratch)))
+			break;
 	}
-	return((idx >= HIL_MLC_DEVMEM) ? -1 : idx);
+
+	return idx >= HIL_MLC_DEVMEM ? -1 : idx;
 }
 
-static int hil_mlc_find_free_di(hil_mlc *mlc) {
+static int hil_mlc_find_free_di(hil_mlc *mlc)
+{
 	int idx;
-	/* TODO: Pick all-zero slots first, failing that, 
-	 * randomize the slot picked among those eligible. 
+
+	/* TODO: Pick all-zero slots first, failing that,
+	 * randomize the slot picked among those eligible.
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
@@ -157,26 +174,31 @@ static void hil_mlc_send_polls(hil_mlc *
 
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
 
@@ -215,8 +237,10 @@ static void hil_mlc_send_polls(hil_mlc *
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
@@ -244,21 +268,27 @@ static int hilse_match(hil_mlc *mlc, int
 }
 
 /* An LCV used to prevent runaway loops, forces 5 second sleep when reset. */
-static int hilse_init_lcv(hil_mlc *mlc, int unused) {
+static int hilse_init_lcv(hil_mlc *mlc, int unused)
+{
 	struct timeval tv;
 
 	do_gettimeofday(&tv);
 
-	if(mlc->lcv == 0) goto restart;  /* First init, no need to dally */
-	if(tv.tv_sec - mlc->lcv_tv.tv_sec < 5) return -1;
+	if (mlc->lcv == 0)
+		goto restart;  /* First init, no need to dally */
+	if (tv.tv_sec - mlc->lcv_tv.tv_sec < 5)
+		return -1;
  restart:
 	mlc->lcv_tv = tv;
 	mlc->lcv = 0;
 	return 0;
 }
 
-static int hilse_inc_lcv(hil_mlc *mlc, int lim) {
-	if (mlc->lcv++ >= lim) return -1;
+static int hilse_inc_lcv(hil_mlc *mlc, int lim)
+{
+	if (mlc->lcv++ >= lim)
+		return -1;
+
 	return 0;
 }
 
@@ -270,15 +300,18 @@ static int hilse_set_lcv(hil_mlc *mlc, i
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
-	if (mlc->ddi <= -1) { 
+	if (mlc->ddi <= -1) {
 		mlc->ddi = -1;
 		hil_mlc_clear_di_map(mlc, 0);
 		return -1;
@@ -287,7 +320,8 @@ static int hilse_dec_ddi(hil_mlc *mlc, i
 	return 0;
 }
 
-static int hilse_inc_ddi(hil_mlc *mlc, int unused) {
+static int hilse_inc_ddi(hil_mlc *mlc, int unused)
+{
 	if (mlc->ddi >= 6) {
 		BUG();
 		return -1;
@@ -296,37 +330,42 @@ static int hilse_inc_ddi(hil_mlc *mlc, i
 	return 0;
 }
 
-static int hilse_take_idd(hil_mlc *mlc, int unused) {
+static int hilse_take_idd(hil_mlc *mlc, int unused)
+{
 	int i;
 
-	/* Help the state engine: 
-	 * Is this a real IDD response or just an echo? 
+	/* Help the state engine:
+	 * Is this a real IDD response or just an echo?
 	 *
-	 * Real IDD response does not start with a command. 
+	 * Real IDD response does not start with a command.
 	 */
-	if (mlc->ipacket[0] & HIL_PKT_CMD) goto bail;
+	if (mlc->ipacket[0] & HIL_PKT_CMD)
+		goto bail;
 	/* Should have the command echoed further down. */
 	for (i = 1; i < 16; i++) {
-		if (((mlc->ipacket[i] & HIL_PKT_ADDR_MASK) == 
+		if (((mlc->ipacket[i] & HIL_PKT_ADDR_MASK) ==
 		     (mlc->ipacket[0] & HIL_PKT_ADDR_MASK)) &&
-		    (mlc->ipacket[i] & HIL_PKT_CMD) && 
+		    (mlc->ipacket[i] & HIL_PKT_CMD) &&
 		    ((mlc->ipacket[i] & HIL_PKT_DATA_MASK) == HIL_CMD_IDD))
 			break;
 	}
-	if (i > 15) goto bail;
+	if (i > 15)
+		goto bail;
 	/* And the rest of the packets should still be clear. */
-	while (++i < 16) {
-		if (mlc->ipacket[i]) break;
-	}
-	if (i < 16) goto bail;
+	while (++i < 16)
+		if (mlc->ipacket[i])
+			break;
+
+	if (i < 16)
+		goto bail;
 	for (i = 0; i < 16; i++) {
-		mlc->di_scratch.idd[i] = 
+		mlc->di_scratch.idd[i] =
 			mlc->ipacket[i] & HIL_PKT_DATA_MASK;
 	}
 	/* Next step is to see if RSC supported */
-	if (mlc->di_scratch.idd[1] & HIL_IDD_HEADER_RSC) 
+	if (mlc->di_scratch.idd[1] & HIL_IDD_HEADER_RSC)
 		return HILSEN_NEXT;
-	if (mlc->di_scratch.idd[1] & HIL_IDD_HEADER_EXD) 
+	if (mlc->di_scratch.idd[1] & HIL_IDD_HEADER_EXD)
 		return HILSEN_DOWN | 4;
 	return 0;
  bail:
@@ -334,56 +373,61 @@ static int hilse_take_idd(hil_mlc *mlc, 
 	return -1; /* This should send us off to ACF */
 }
 
-static int hilse_take_rsc(hil_mlc *mlc, int unused) {
+static int hilse_take_rsc(hil_mlc *mlc, int unused)
+{
 	int i;
 
 	for (i = 0; i < 16; i++) {
-		mlc->di_scratch.rsc[i] = 
+		mlc->di_scratch.rsc[i] =
 			mlc->ipacket[i] & HIL_PKT_DATA_MASK;
 	}
 	/* Next step is to see if EXD supported (IDD has already been read) */
-	if (mlc->di_scratch.idd[1] & HIL_IDD_HEADER_EXD) 
+	if (mlc->di_scratch.idd[1] & HIL_IDD_HEADER_EXD)
 		return HILSEN_NEXT;
 	return 0;
 }
 
-static int hilse_take_exd(hil_mlc *mlc, int unused) {
+static int hilse_take_exd(hil_mlc *mlc, int unused)
+{
 	int i;
 
 	for (i = 0; i < 16; i++) {
-		mlc->di_scratch.exd[i] = 
+		mlc->di_scratch.exd[i] =
 			mlc->ipacket[i] & HIL_PKT_DATA_MASK;
 	}
 	/* Next step is to see if RNM supported. */
-	if (mlc->di_scratch.exd[0] & HIL_EXD_HEADER_RNM) 
+	if (mlc->di_scratch.exd[0] & HIL_EXD_HEADER_RNM)
 		return HILSEN_NEXT;
+
 	return 0;
 }
-
-static int hilse_take_rnm(hil_mlc *mlc, int unused) {
+static int hilse_take_rnm(hil_mlc *mlc, int unused)
+{
 	int i;
+	char nam[17];
 
-	for (i = 0; i < 16; i++) {
-		mlc->di_scratch.rnm[i] = 
+	for (i = 0; i < 16; i++)
+		mlc->di_scratch.rnm[i] =
 			mlc->ipacket[i] & HIL_PKT_DATA_MASK;
-	}
-	do {
-	  char nam[17];
-	  snprintf(nam, 16, "%s", mlc->di_scratch.rnm);
-	  nam[16] = '\0';
-	  printk(KERN_INFO PREFIX "Device name gotten: %s\n", nam);
-	} while (0);
+
+	snprintf(nam, 16, "%s", mlc->di_scratch.rnm);
+	nam[16] = '\0';
+	printk(KERN_INFO PREFIX "Device name gotten: %s\n", nam);
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
@@ -428,7 +472,7 @@ struct hilse_node hil_mlc_se[HILSEN_END]
 	EXPECT(HIL_ERR_INT | TEST_PACKET(0xa),
 	       2000,		HILSEN_NEXT,	HILSEN_RESTART,	HILSEN_RESTART)
 	OUT(HIL_CTRL_ONLY | 0)			/* Disable test mode */
-	
+
 	/* 9  HILSEN_DHR */
 	FUNC(hilse_init_lcv, 0,	HILSEN_NEXT,	HILSEN_SLEEP,	0)
 
@@ -439,7 +483,7 @@ struct hilse_node hil_mlc_se[HILSEN_END]
 	IN(300000,		HILSEN_DHR2,	HILSEN_DHR2,	HILSEN_NEXT)
 
 	/* 14 HILSEN_IFC */
-  	OUT(HIL_PKT_CMD | HIL_CMD_IFC)
+	OUT(HIL_PKT_CMD | HIL_CMD_IFC)
 	EXPECT(HIL_PKT_CMD | HIL_CMD_IFC | HIL_ERR_INT,
 	       20000,		HILSEN_DISC,	HILSEN_DHR2,	HILSEN_NEXT )
 
@@ -455,7 +499,7 @@ struct hilse_node hil_mlc_se[HILSEN_END]
 
 	/* 18 HILSEN_HEAL */
 	OUT_LAST(HIL_CMD_ELB)
-	EXPECT_LAST(HIL_CMD_ELB | HIL_ERR_INT, 
+	EXPECT_LAST(HIL_CMD_ELB | HIL_ERR_INT,
 		    20000,	HILSEN_REPOLL,	HILSEN_DSR,	HILSEN_NEXT)
 	FUNC(hilse_dec_ddi, 0,	HILSEN_HEAL,	HILSEN_NEXT,	0)
 
@@ -503,7 +547,7 @@ struct hilse_node hil_mlc_se[HILSEN_END]
 
 	/* 44 HILSEN_PROBE */
 	OUT_LAST(HIL_PKT_CMD | HIL_CMD_EPT)
-	IN(10000, 		HILSEN_DISC,	HILSEN_DSR,	HILSEN_NEXT)
+	IN(10000,		HILSEN_DISC,	HILSEN_DSR,	HILSEN_NEXT)
 	OUT_DISC(HIL_PKT_CMD | HIL_CMD_ELB)
 	IN(10000,		HILSEN_DISC,	HILSEN_DSR,	HILSEN_NEXT)
 	OUT(HIL_PKT_CMD | HIL_CMD_ACF | 1)
@@ -514,7 +558,7 @@ struct hilse_node hil_mlc_se[HILSEN_END]
 	/* 52 HILSEN_DSR */
 	FUNC(hilse_set_ddi, -1,	HILSEN_NEXT,	0,		0)
 	OUT(HIL_PKT_CMD | HIL_CMD_DSR)
-	IN(20000, 		HILSEN_DHR,	HILSEN_DHR,	HILSEN_IFC)
+	IN(20000,		HILSEN_DHR,	HILSEN_DHR,	HILSEN_IFC)
 
 	/* 55 HILSEN_REPOLL */
 	OUT(HIL_PKT_CMD | HIL_CMD_RPL)
@@ -523,14 +567,15 @@ struct hilse_node hil_mlc_se[HILSEN_END]
 	FUNC(hilse_operate, 1,	HILSEN_OPERATE,	HILSEN_IFC,	HILSEN_PROBE)
 
 	/* 58 HILSEN_IFCACF */
-  	OUT(HIL_PKT_CMD | HIL_CMD_IFC)
+	OUT(HIL_PKT_CMD | HIL_CMD_IFC)
 	EXPECT(HIL_PKT_CMD | HIL_CMD_IFC | HIL_ERR_INT,
 	       20000,		HILSEN_ACF2,	HILSEN_DHR2,	HILSEN_HEAL)
 
 	/* 60 HILSEN_END */
 };
 
-static inline void hilse_setup_input(hil_mlc *mlc, struct hilse_node *node) {
+static inline void hilse_setup_input(hil_mlc *mlc, struct hilse_node *node)
+{
 
 	switch (node->act) {
 	case HILSE_EXPECT_DISC:
@@ -556,8 +601,6 @@ static inline void hilse_setup_input(hil
 	mlc->icount = 15;
 	memset(mlc->ipacket, 0, 16 * sizeof(hil_packet));
 	BUG_ON(down_trylock(&(mlc->isem)));
-
-	return;
 }
 
 #ifdef HIL_MLC_DEBUG
@@ -566,15 +609,18 @@ static int seidx; /* For debug */
 static int kick = 1;
 #endif
 
-static int hilse_donode (hil_mlc *mlc) {
+static int hilse_donode (hil_mlc *mlc)
+{
 	struct hilse_node *node;
 	int nextidx = 0;
 	int sched_long = 0;
 	unsigned long flags;
 
 #ifdef HIL_MLC_DEBUG
-	if (mlc->seidx && (mlc->seidx != seidx)  && mlc->seidx != 41 && mlc->seidx != 42 && mlc->seidx != 43) {
-	  printk(KERN_DEBUG PREFIX "z%i \n%s {%i}", doze, kick ? "K" : "", mlc->seidx);
+	if (mlc->seidx && mlc->seidx != seidx &&
+	    mlc->seidx != 41 && mlc->seidx != 42 && mlc->seidx != 43) {
+		printk(KERN_DEBUG PREFIX "z%i \n%s {%i}",
+			doze, kick ? "K" : "", mlc->seidx);
 		doze = 0;
 	}
 	kick = 0;
@@ -588,12 +634,15 @@ static int hilse_donode (hil_mlc *mlc) {
 		hil_packet pack;
 
 	case HILSE_FUNC:
-		if (node->object.func == NULL) break;
+		if (node->object.func == NULL)
+			break;
 		rc = node->object.func(mlc, node->arg);
-		nextidx = (rc > 0) ? node->ugly : 
+		nextidx = (rc > 0) ? node->ugly :
 			((rc < 0) ? node->bad : node->good);
-		if (nextidx == HILSEN_FOLLOW) nextidx = rc;
+		if (nextidx == HILSEN_FOLLOW)
+			nextidx = rc;
 		break;
+
 	case HILSE_EXPECT_LAST:
 	case HILSE_EXPECT_DISC:
 	case HILSE_EXPECT:
@@ -607,33 +656,40 @@ static int hilse_donode (hil_mlc *mlc) {
 			write_unlock_irqrestore(&(mlc->lock), flags);
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
 		write_unlock_irqrestore(&(mlc->lock), flags);
 		break;
+
 	case HILSE_OUT_LAST:
 		write_lock_irqsave(&(mlc->lock), flags);
 		pack = node->object.packet;
 		pack |= ((mlc->ddi + 1) << HIL_PKT_ADDR_SHIFT);
 		goto out;
+
 	case HILSE_OUT_DISC:
 		write_lock_irqsave(&(mlc->lock), flags);
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
@@ -641,8 +697,8 @@ static int hilse_donode (hil_mlc *mlc) {
 		}
 		up(&mlc->osem);
 
-		write_lock_irqsave(&(mlc->lock), flags);
-		if (!(mlc->ostarted)) {
+		write_lock_irqsave(&mlc->lock, flags);
+		if (!mlc->ostarted) {
 			mlc->ostarted = 1;
 			mlc->opacket = pack;
 			mlc->out(mlc);
@@ -651,13 +707,15 @@ static int hilse_donode (hil_mlc *mlc) {
 			break;
 		}
 		mlc->ostarted = 0;
-		do_gettimeofday(&(mlc->instart));
-		write_unlock_irqrestore(&(mlc->lock), flags);
+		do_gettimeofday(&mlc->instart);
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
 		nextidx = 0;
@@ -665,36 +723,47 @@ static int hilse_donode (hil_mlc *mlc) {
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
 		tv.tv_usec += 1000000 * (tv.tv_sec - mlc->instart.tv_sec);
 		tv.tv_usec -= mlc->instart.tv_usec;
-		if (tv.tv_usec >= mlc->intimeout) goto sched;
+		if (tv.tv_usec >= mlc->intimeout)
+			goto sched;
 		tv.tv_usec = (mlc->intimeout - tv.tv_usec) * HZ / 1000000;
-		if (!tv.tv_usec) goto sched;
+		if (!tv.tv_usec)
+			goto sched;
 		mod_timer(&hil_mlcs_kicker, jiffies + tv.tv_usec);
 		break;
 	sched:
 		tasklet_schedule(&hil_mlcs_tasklet);
 		break;
-	} 
-	if (nextidx & HILSEN_DOWN) mlc->seidx += nextidx & HILSEN_MASK;
-	else if (nextidx & HILSEN_UP) mlc->seidx -= nextidx & HILSEN_MASK;
-	else mlc->seidx = nextidx & HILSEN_MASK;
+	}
+
+	if (nextidx & HILSEN_DOWN)
+		mlc->seidx += nextidx & HILSEN_MASK;
+	else if (nextidx & HILSEN_UP)
+		mlc->seidx -= nextidx & HILSEN_MASK;
+	else
+		mlc->seidx = nextidx & HILSEN_MASK;
+
+	if (nextidx & HILSEN_BREAK)
+		return 1;
 
-	if (nextidx & HILSEN_BREAK)	return 1;
 	return 0;
 }
 
 /******************** tasklet context functions **************************/
-static void hil_mlcs_process(unsigned long unused) {
+static void hil_mlcs_process(unsigned long unused)
+{
 	struct list_head *tmp;
 
 	read_lock(&hil_mlcs_lock);
@@ -702,19 +771,20 @@ static void hil_mlcs_process(unsigned lo
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
+void hil_mlcs_timer (unsigned long data)
+{
 	hil_mlcs_probe = 1;
 	tasklet_schedule(&hil_mlcs_tasklet);
 	/* Re-insert the periodic task. */
@@ -724,7 +794,8 @@ void hil_mlcs_timer (unsigned long data)
 
 /******************** user/kernel context functions **********************/
 
-static int hil_mlc_serio_write(struct serio *serio, unsigned char c) {
+static int hil_mlc_serio_write(struct serio *serio, unsigned char c)
+{
 	struct hil_mlc_serio_map *map;
 	struct hil_mlc *mlc;
 	struct serio_driver *drv;
@@ -740,12 +811,12 @@ static int hil_mlc_serio_write(struct se
 		BUG();
 		return -EIO;
 	}
-	mlc->serio_opacket[map->didx] |= 
+	mlc->serio_opacket[map->didx] |=
 		((hil_packet)c) << (8 * (3 - mlc->serio_oidx[map->didx]));
 
 	if (mlc->serio_oidx[map->didx] >= 3) {
 		/* for now only commands */
-		if (!(mlc->serio_opacket[map->didx] & HIL_PKT_CMD)) 
+		if (!(mlc->serio_opacket[map->didx] & HIL_PKT_CMD))
 			return -EIO;
 		switch (mlc->serio_opacket[map->didx] & HIL_PKT_DATA_MASK) {
 		case HIL_CMD_IDD:
@@ -776,7 +847,8 @@ static int hil_mlc_serio_write(struct se
 		return -EIO;
 	}
 	last = idx + 15;
-	while ((last != idx) && (*last == 0)) last--;
+	while ((last != idx) && (*last == 0))
+		last--;
 
 	while (idx != last) {
 		drv->interrupt(serio, 0, 0);
@@ -789,14 +861,15 @@ static int hil_mlc_serio_write(struct se
 	drv->interrupt(serio, HIL_ERR_INT >> 16, 0);
 	drv->interrupt(serio, HIL_PKT_CMD >> 8, 0);
 	drv->interrupt(serio, *idx, 0);
-	
+
 	mlc->serio_oidx[map->didx] = 0;
 	mlc->serio_opacket[map->didx] = 0;
 
 	return 0;
 }
 
-static int hil_mlc_serio_open(struct serio *serio) {
+static int hil_mlc_serio_open(struct serio *serio)
+{
 	struct hil_mlc_serio_map *map;
 	struct hil_mlc *mlc;
 
@@ -817,7 +890,8 @@ static int hil_mlc_serio_open(struct ser
 	return 0;
 }
 
-static void hil_mlc_serio_close(struct serio *serio) {
+static void hil_mlc_serio_close(struct serio *serio)
+{
 	struct hil_mlc_serio_map *map;
 	struct hil_mlc *mlc;
 
@@ -844,13 +918,13 @@ static struct serio_device_id hil_mlc_se
 	.id = SERIO_ANY,
 };
 
-int hil_mlc_register(hil_mlc *mlc) {
+int hil_mlc_register(hil_mlc *mlc)
+{
 	int i;
         unsigned long flags;
 
-	if (mlc == NULL) {
+	if (mlc == NULL)
 		return -EINVAL;
-	}
 
 	mlc->istarted = 0;
         mlc->ostarted = 0;
@@ -897,7 +971,8 @@ int hil_mlc_register(hil_mlc *mlc) {
 	return 0;
 }
 
-int hil_mlc_unregister(hil_mlc *mlc) {
+int hil_mlc_unregister(hil_mlc *mlc)
+{
 	struct list_head *tmp;
         unsigned long flags;
 	int i;
@@ -942,7 +1017,7 @@ static int __init hil_mlc_init(void)
 
 	return 0;
 }
-                
+
 static void __exit hil_mlc_exit(void)
 {
 	del_timer(&hil_mlcs_kicker);
@@ -950,6 +1025,6 @@ static void __exit hil_mlc_exit(void)
 	tasklet_disable(&hil_mlcs_tasklet);
 	tasklet_kill(&hil_mlcs_tasklet);
 }
-                        
+
 module_init(hil_mlc_init);
 module_exit(hil_mlc_exit);
