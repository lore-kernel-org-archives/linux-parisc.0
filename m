From: Helge Deller <deller@gmx.de>
Subject: [Fwd: [PATCH] ide-cd: fix REQ_QUIET tests in cdrom_decode_status]
Date: Wed, 29 Apr 2009 22:55:48 +0200
Message-ID: <49F8BED4.7000509@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
To: linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Forwarded to linux-parisc list for reference:
This patch is needed for 2.6.30 to make the IDE CDROM working on c3k
and similiar machines.
Helge

-------- Original Message --------
Subject: [PATCH] ide-cd: fix REQ_QUIET tests in cdrom_decode_status
Date: Tue, 28 Apr 2009 23:38:14 +0200
From: Borislav Petkov <petkovbb@googlemail.com>
Reply-To: petkovbb@gmail.com
To: linux-ide@vger.kernel.org
CC: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,	Helge Deller <deller@gmx.de>, Jens Axboe <jens.axboe@oracle.com>,	Sergei Shtylyov <sshtylyov@ru.mvista.com>
References: <49F6DC50.7000106@ru.mvista.com>

Here's a non-wrapped version, Sergei thanks for catching that.

--
From: Borislav Petkov <petkovbb@gmail.com>
Date: Mon, 27 Apr 2009 14:11:32 +0200
Subject: [PATCH] ide-cd: fix REQ_QUIET tests in cdrom_decode_status

Original patch (dfa4411cc3a690011cab90e9a536938795366cf9) was buggy.
This is a more proper fix which introduces blk_rq_quiet() macro
alleviating the need for dumb, too short caching variables.

Thanks to Helge Deller and Bart for debugging this.

Signed-off-by: Borislav Petkov <petkovbb@gmail.com>
---
 drivers/ide/ide-cd.c   |    9 ++++-----
 include/linux/blkdev.h |    1 +
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/ide/ide-cd.c b/drivers/ide/ide-cd.c
index 07fb9e4..e4df578 100644
--- a/drivers/ide/ide-cd.c
+++ b/drivers/ide/ide-cd.c
@@ -282,7 +282,6 @@ static int cdrom_decode_status(ide_drive_t *drive, u8 stat)
 	ide_hwif_t *hwif = drive->hwif;
 	struct request *rq = hwif->rq;
 	int err, sense_key, do_end_request = 0;
-	u8 quiet = rq->cmd_flags & REQ_QUIET;
 
 	/* get the IDE error register */
 	err = ide_read_error(drive);
@@ -317,7 +316,7 @@ static int cdrom_decode_status(ide_drive_t *drive, u8 stat)
 		} else {
 			cdrom_saw_media_change(drive);
 
-			if (blk_fs_request(rq) && !quiet)
+			if (blk_fs_request(rq) && !blk_rq_quiet(rq))
 				printk(KERN_ERR PFX "%s: tray open\n",
 					drive->name);
 		}
@@ -352,7 +351,7 @@ static int cdrom_decode_status(ide_drive_t *drive, u8 stat)
 		 * No point in retrying after an illegal request or data
 		 * protect error.
 		 */
-		if (!quiet)
+		if (!blk_rq_quiet(rq))
 			ide_dump_status(drive, "command error", stat);
 		do_end_request = 1;
 		break;
@@ -361,14 +360,14 @@ static int cdrom_decode_status(ide_drive_t *drive, u8 stat)
 		 * No point in re-trying a zillion times on a bad sector.
 		 * If we got here the error is not correctable.
 		 */
-		if (!quiet)
+		if (!blk_rq_quiet(rq))
 			ide_dump_status(drive, "media error "
 					"(bad sector)", stat);
 		do_end_request = 1;
 		break;
 	case BLANK_CHECK:
 		/* disk appears blank? */
-		if (!quiet)
+		if (!blk_rq_quiet(rq))
 			ide_dump_status(drive, "media error (blank)",
 					stat);
 		do_end_request = 1;
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index ba54c83..6f841fb 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -598,6 +598,7 @@ enum {
 				 blk_failfast_transport(rq) ||	\
 				 blk_failfast_driver(rq))
 #define blk_rq_started(rq)	((rq)->cmd_flags & REQ_STARTED)
+#define blk_rq_quiet(rq)	((rq)->cmd_flags & REQ_QUIET)
 
 #define blk_account_rq(rq)	(blk_rq_started(rq) && (blk_fs_request(rq) || blk_discard_rq(rq))) 
 
-- 
1.6.2.4


-- 
Regards/Gruss,
    Boris.

