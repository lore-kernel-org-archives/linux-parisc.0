From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] linux-2.6.10-pa1 panic on C360 in SCSI driver
Date: Wed, 29 Dec 2004 03:43:31 +0000
Message-ID: <20041229034331.GS11543@parcelfarce.linux.theplanet.co.uk>
References: <200412260504.40205.vapier@gentoo.org>
	<200412272045.34143.vapier@gentoo.org>
	<20041228033520.GO11543@parcelfarce.linux.theplanet.co.uk>
	<200412272301.03299.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Mike Frysinger <vapier@gentoo.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200412272301.03299.vapier@gentoo.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Dec 27, 2004 at 11:01:03PM -0500, Mike Frysinger wrote:
> On Monday 27 December 2004 10:35 pm, Matthew Wilcox wrote:
> > Can you try the following patch?  We're not actually disabling ppr atm,
> > depite what the comment says.
> 
> kernel panic :(

Okey dokey.  Here's a new one.  Now we only use PPR if we have a good
reason (eg we want to negotiate FAST-80 or DT clocking).  I'm sick of
devices that implement SDTR perfectly and have buggy PPR ;-(

Index: drivers/scsi/sym53c8xx_2/sym_hipd.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/scsi/sym53c8xx_2/sym_hipd.c,v
retrieving revision 1.43
diff -u -p -r1.43 sym_hipd.c
--- drivers/scsi/sym53c8xx_2/sym_hipd.c	2 Dec 2004 19:51:11 -0000	1.43
+++ drivers/scsi/sym53c8xx_2/sym_hipd.c	29 Dec 2004 03:31:30 -0000
@@ -1428,13 +1428,12 @@ static void sym_update_dmap_regs(struct 
 }
 #endif
 
+/* Enforce all the fiddly SPI rules and the chip limitations */
 static void sym_check_goals(struct scsi_device *sdev)
 {
 	struct sym_hcb *np = ((struct host_data *)sdev->host->hostdata)->ncb;
 	struct sym_trans *st = &np->target[sdev->id].tinfo.goal;
 
-	/* here we enforce all the fiddly SPI rules */
-
 	if (!scsi_device_wide(sdev))
 		st->width = 0;
 
@@ -1444,7 +1443,7 @@ static void sym_check_goals(struct scsi_
 		st->offset = 0;
 		return;
 	}
-		
+
 	if (scsi_device_dt(sdev)) {
 		if (scsi_device_dt_only(sdev))
 			st->options |= PPR_OPT_DT;
@@ -1455,8 +1454,8 @@ static void sym_check_goals(struct scsi_
 		st->options &= ~PPR_OPT_DT;
 	}
 
-	/* Some targets fail to properly negotiate using PPR in SE mode */
-	if (!((np->scsi_mode == SMODE_LVD) && (np->features & FE_ULTRA3)))
+	/* Some targets fail to properly negotiate DT in SE mode */
+	if ((np->scsi_mode != SMODE_LVD) || !(np->features & FE_U3EN))
 		st->options &= ~PPR_OPT_DT;
 
 	if (st->options & PPR_OPT_DT) {
@@ -1486,38 +1485,31 @@ static void sym_check_goals(struct scsi_
  *  negotiation and the nego_status field of the CCB.
  *  Returns the size of the message in bytes.
  */
-static int sym_prepare_nego(struct sym_hcb *np, ccb_p cp, int nego, u_char *msgptr)
+static int sym_prepare_nego(struct sym_hcb *np, ccb_p cp, u_char *msgptr)
 {
 	tcb_p tp = &np->target[cp->target];
-	int msglen = 0;
 	struct scsi_device *sdev = tp->sdev;
+	struct sym_trans *goal = &tp->tinfo.goal;
+	struct sym_trans *curr = &tp->tinfo.curr;
+	int msglen = 0;
+	int nego;
 
 	if (likely(sdev))
 		sym_check_goals(sdev);
 
 	/*
-	 *  Early C1010 chips need a work-around for DT 
-	 *  data transfer to work.
-	 */
-	if (!(np->features & FE_U3EN))
-		tp->tinfo.goal.options = 0;
-	/*
-	 *  negotiate using PPR ?
+	 * Many devices implement PPR in a buggy way, so only use it if we
+	 * really want to.
 	 */
-	if (scsi_device_dt(sdev)) {
+	if ((goal->options & PPR_OPT_MASK) || (goal->period < 0xa)) {
 		nego = NS_PPR;
+	} else if (curr->width != goal->width) {
+		nego = NS_WIDE;
+	} else if (curr->period != goal->period ||
+		   curr->offset != goal->offset) {
+		nego = NS_SYNC;
 	} else {
-		/*
-		 *  negotiate wide transfers ?
-		 */
-		if (tp->tinfo.curr.width != tp->tinfo.goal.width)
-			nego = NS_WIDE;
-		/*
-		 *  negotiate synchronous transfers?
-		 */
-		else if (tp->tinfo.curr.period != tp->tinfo.goal.period ||
-			 tp->tinfo.curr.offset != tp->tinfo.goal.offset)
-			nego = NS_SYNC;
+		nego = 0;
 	}
 
 	switch (nego) {
@@ -1525,24 +1517,24 @@ static int sym_prepare_nego(struct sym_h
 		msgptr[msglen++] = M_EXTENDED;
 		msgptr[msglen++] = 3;
 		msgptr[msglen++] = M_X_SYNC_REQ;
-		msgptr[msglen++] = tp->tinfo.goal.period;
-		msgptr[msglen++] = tp->tinfo.goal.offset;
+		msgptr[msglen++] = goal->period;
+		msgptr[msglen++] = goal->offset;
 		break;
 	case NS_WIDE:
 		msgptr[msglen++] = M_EXTENDED;
 		msgptr[msglen++] = 2;
 		msgptr[msglen++] = M_X_WIDE_REQ;
-		msgptr[msglen++] = tp->tinfo.goal.width;
+		msgptr[msglen++] = goal->width;
 		break;
 	case NS_PPR:
 		msgptr[msglen++] = M_EXTENDED;
 		msgptr[msglen++] = 6;
 		msgptr[msglen++] = M_X_PPR_REQ;
-		msgptr[msglen++] = tp->tinfo.goal.period;
+		msgptr[msglen++] = goal->period;
 		msgptr[msglen++] = 0;
-		msgptr[msglen++] = tp->tinfo.goal.offset;
-		msgptr[msglen++] = tp->tinfo.goal.width;
-		msgptr[msglen++] = tp->tinfo.goal.options & PPR_OPT_MASK;
+		msgptr[msglen++] = goal->offset;
+		msgptr[msglen++] = goal->width;
+		msgptr[msglen++] = goal->options & PPR_OPT_MASK;
 		break;
 	};
 
@@ -3062,7 +3054,6 @@ static void sym_sir_bad_scsi_status(stru
 	u_char		s_status = cp->ssss_status;
 	u_char		h_flags  = cp->host_flags;
 	int		msglen;
-	int		nego;
 	int		i;
 
 	/*
@@ -3137,16 +3128,7 @@ static void sym_sir_bad_scsi_status(stru
 		 *  cp->nego_status is filled by sym_prepare_nego().
 		 */
 		cp->nego_status = 0;
-		nego = 0;
-		if	(tp->tinfo.curr.options & PPR_OPT_MASK)
-			nego = NS_PPR;
-		else if	(tp->tinfo.curr.width != BUS_8_BIT)
-			nego = NS_WIDE;
-		else if (tp->tinfo.curr.offset != 0)
-			nego = NS_SYNC;
-		if (nego)
-			msglen +=
-			sym_prepare_nego (np,cp, nego, &cp->scsi_smsg2[msglen]);
+		msglen += sym_prepare_nego(np, cp, &cp->scsi_smsg2[msglen]);
 		/*
 		 *  Message table indirect structure.
 		 */
@@ -4135,7 +4117,7 @@ sym_ppr_nego_check(struct sym_hcb *np, i
 
 	if (ofs) {
 		unsigned char minsync = dt ? np->minsync_dt : np->minsync;
-		if (per < np->minsync_dt) {
+		if (per < minsync) {
 			chg = 1;
 			per = minsync;
 		}
@@ -5300,7 +5282,7 @@ int sym_queue_scsiio(struct sym_hcb *np,
 	    tp->tinfo.curr.offset  != tp->tinfo.goal.offset ||
 	    tp->tinfo.curr.options != tp->tinfo.goal.options) {
 		if (!tp->nego_cp && lp)
-			msglen += sym_prepare_nego(np, cp, 0, msgptr + msglen);
+			msglen += sym_prepare_nego(np, cp, msgptr + msglen);
 	}
 
 	/*

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
