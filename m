From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] K410 SCSI 53c700 issue with PLEXTOR PX-R820T
Date: Thu, 30 Nov 2006 13:13:46 -0500
Message-ID: <1164910427.22826.37.camel__5772.7744141177$1416624625$gmane$org@mulgrave.il.steeleye.com>
References: <20061112160350.8b7d4afd.gmsoft@tuxicoman.be>
	<20061112191436.GY16952@parisc-linux.org>
	<20061127115832.b413fd7b.gmsoft@tuxicoman.be>
	<20061127153713.GQ14076@parisc-linux.org>
	<20061130101805.2a82273b.gmsoft@tuxicoman.be>
	<1164907064.22826.23.camel@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Matthew Wilcox <matthew@wil.cx>,
 parisc-linux@parisc-linux.org
To: Guy Martin <gmsoft@tuxicoman.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1164907064.22826.23.camel@mulgrave.il.steeleye.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, 2006-11-30 at 12:17 -0500, James Bottomley wrote:
> And here we get a phase mismatch in the command phase because the drive
> transitions to data phase after six bytes and the driver still thinks it
> has another four to send.
> 
> I'd have the maintainer shot ... he clearly forgot to set up the command
> length for auto request sense.

Try this and see if it fixes the problem

James

diff --git a/drivers/scsi/53c700.c b/drivers/scsi/53c700.c
index 562432d..9aabb64 100644
--- a/drivers/scsi/53c700.c
+++ b/drivers/scsi/53c700.c
@@ -622,8 +622,10 @@ #endif
 			dma_unmap_single(hostdata->dev, slot->dma_handle, sizeof(SCp->sense_buffer), DMA_FROM_DEVICE);
 			/* restore the old result if the request sense was
 			 * successful */
-			if(result == 0)
+			if (result == 0)
 				result = cmnd[7];
+			/* restore the original length */
+			SCp->cmd_len = cmnd[8];
 		} else
 			NCR_700_unmap(hostdata, SCp, slot);
 
@@ -1007,6 +1009,9 @@ #endif
 				 * of the command */
 				cmnd[6] = NCR_700_INTERNAL_SENSE_MAGIC;
 				cmnd[7] = hostdata->status[0];
+				cmnd[8] = SCp->cmd_len;
+				SCp->cmd_len = 6; /* command length for 
+						   * REQUEST_SENSE */
 				slot->pCmd = dma_map_single(hostdata->dev, cmnd, MAX_COMMAND_SIZE, DMA_TO_DEVICE);
 				slot->dma_handle = dma_map_single(hostdata->dev, SCp->sense_buffer, sizeof(SCp->sense_buffer), DMA_FROM_DEVICE);
 				slot->SG[0].ins = bS_to_host(SCRIPT_MOVE_DATA_IN | sizeof(SCp->sense_buffer));


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
