Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA20142
	for <parisc-linux@puffin.external.hp.com>; Mon, 1 Jan 2001 12:15:36 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 1 Jan 2001 19:18:54 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14DATo-00071d-00; Mon, 01 Jan 2001 19:18:48 +0000
Date: Mon, 1 Jan 2001 19:18:48 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Matthew Wilcox <matthew@wil.cx>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] ZONE_DMA
Message-ID: <20010101191848.B25603@parcelfarce.linux.theplanet.co.uk>
References: <20010101185557.A25603@parcelfarce.linux.theplanet.co.uk> <E14DACv-0001Bg-00@the-village.bc.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E14DACv-0001Bg-00@the-village.bc.nu>; from alan@lxorguk.ukuu.org.uk on Mon, Jan 01, 2001 at 07:01:19PM +0000
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Jan 01, 2001 at 07:01:19PM +0000, Alan Cox wrote:
> > But if we have none, then all GFP_DMA allocations will fail.  Which
> > includes the scsi midlayers.  Ooh, I just noticed that scsi_scan.c
> > is broken...  expect a patch RSN.
> 
> SCSI may need fixing, but do you want to do it right 8)

I don't think I have time to do that :-)

Here's a patch which makes it slightly better.  Justifications:
 * changed GFP_DMA to GFP_KERNEL | GFP_DMA since GFP_DMA alone is nonsense.
 * got rid of the ?: since it's pure obfuscation in this case.
 * changed &scsi_result0[0] to scsi_result0.  again, sheer obfuscation.

just peering at this little bit makes me realise how large the scsi
problems must be :-)

It compiles.  I promise no more.

Index: drivers/scsi/scsi_scan.c
===================================================================
RCS file: /var/cvs/linux/drivers/scsi/scsi_scan.c,v
retrieving revision 1.1.1.1
diff -u -p -u -r1.1.1.1 scsi_scan.c
--- drivers/scsi/scsi_scan.c	2000/09/19 15:01:34	1.1.1.1
+++ drivers/scsi/scsi_scan.c	2001/01/01 19:09:43
@@ -288,8 +288,11 @@ void scan_scsis(struct Scsi_Host *shpnt,
 		scsi_initialize_queue(SDpnt, shpnt);
 		SDpnt->request_queue.queuedata = (void *) SDpnt;
 		/* Make sure we have something that is valid for DMA purposes */
-		scsi_result = ((!shpnt->unchecked_isa_dma)
-			       ? &scsi_result0[0] : kmalloc(512, GFP_DMA));
+		if (shpnt->unchecked_isa_dma) {
+			scsi_result = kmalloc(512, GFP_KERNEL | GFP_DMA);
+		} else {
+			scsi_result = scsi_result0;
+		}
 	}
 
 	if (scsi_result == NULL) {
@@ -411,7 +414,7 @@ void scan_scsis(struct Scsi_Host *shpnt,
 		}		/* for channel ends */
 	}			/* if/else hardcoded */
 
-      leave:
+ leave:
 
 	{			/* Unchain SRpnt from host_queue */
 		Scsi_Device *prev, *next;
@@ -438,7 +441,7 @@ void scan_scsis(struct Scsi_Host *shpnt,
 	}
 
 	/* If we allocated a buffer so we could do DMA, free it now */
-	if (scsi_result != &scsi_result0[0] && scsi_result != NULL) {
+	if (scsi_result != scsi_result0 && scsi_result != NULL) {
 		kfree(scsi_result);
 	} {
 		Scsi_Device *sdev;

-- 
Revolutions do not require corporate support.
