From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] linux-2.6.10-pa1 panic on C360 in SCSI driver
Date: Mon, 27 Dec 2004 21:30:20 -0600
Message-ID: <1104204620.7447.33.camel@mulgrave>
References: <200412260504.40205.vapier@gentoo.org>
	<41CF56AD.2010504@tiscali.be>
	<20041227004909.GI11543@parcelfarce.linux.theplanet.co.uk>
	<200412272045.34143.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: parisc-linux@parisc-linux.org
To: Mike Frysinger <vapier@gentoo.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200412272045.34143.vapier@gentoo.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, 2004-12-27 at 20:45 -0500, Mike Frysinger wrote:
> it didnt panic, but it looks like the kernel went into an infinite loop ...

Well, I think that's the fault of your drive:

> sym0:9:ppr msgout: 1-6-4-c-0-10-1-0.

This is where the 875 offers an offset of 16 at FAST-20 which is the
best it can do.

> sym0:9:ppr msgin: 1-6-4-a-0-10-1-0.

This is where your WD says I accept your offer at offset 16 and FAST-40
(which is beyond the 875's capabilities).

This is illegal under the SCSI spec (you can only accept at a period of
greater than the offer, not less than).  The patch I gave you spots the
problem and rejects the bogus offer.  Unfortunately, apparently now the
drive throws a wobbly and refuses to talk any more.

The question is how we coax it to negotiate within the rules...It's
possible it would work correctly if the negotiation used WDTR and SDTR
instead of PPR, so could you try the attached hack.

James

===== sym_hipd.c 1.22 vs edited =====
--- 1.22/drivers/scsi/sym53c8xx_2/sym_hipd.c	2004-10-24 11:08:18 -05:00
+++ edited/sym_hipd.c	2004-12-27 21:28:35 -06:00
@@ -1538,7 +1538,7 @@
 	/*
 	 *  negotiate using PPR ?
 	 */
-	if (scsi_device_dt(sdev)) {
+	if (0 && scsi_device_dt(sdev)) {
 		nego = NS_PPR;
 	} else {
 		/*




_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
