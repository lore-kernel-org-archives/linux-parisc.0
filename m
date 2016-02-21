From: John David Anglin <dave.anglin@bell.net>
Subject: Re: SCSI bug
Date: Sun, 21 Feb 2016 16:09:19 -0500
Message-ID: <28582474-5AB3-4022-86FE-E823F5990623@bell.net>
References: <28D5FC66-A9E6-4F3E-A8AC-F9E68A6BC543@bell.net> <82D4BF6F-05CF-4441-9530-79475BFF84F3@bell.net> <E2C8DBC2-F0AD-4C78-BD63-9C85B387E284@bell.net> <56C8E1AC.3030409@gmx.de> <038473FE-9E6D-4F03-BBD4-9844B7B529E1@bell.net> <9C42B388-96D5-412A-BAC3-14E93415CA21@bell.net> <1456026424.2268.5.camel@HansenPartnership.com> <14EF1F4E-8045-4990-B29E-D489E82B1929@bell.net> <1456078381.2340.5.camel@HansenPartnership.com> <D14AFC12-8245-4862-9FFA-92A4F114FC41@bell.net> <1456081676.2340.10.camel@HansenPartnership.com> <56CA11D2.3020900@gmx.de> <1456086490.2340.18.camel@HansenPartnership.com>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller@gmx.de>,
	linux-parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1456086490.2340.18.camel@HansenPartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2016-02-21, at 3:28 PM, James Bottomley wrote:

> That said, I still can't reproduce this, so you're going to have to
> help me find it.  Current theory is ll_merge_request_fn() it looks like
> there's scope for miscalculation in there.  Can you instrument this
> line
> 
> 	/* Merge is OK... */
> 	req->nr_phys_segments = total_phys_segments;
> 
> To add just before the return
> 
> if (req->nr_phys_segments != __blk_recalc_rq_segments(rq->q, rq->bio,	false) 
> 	printk("MISMATCH IN MERGE: got %d, should get %d\n", 
> 		req->nr_phys_segments,
> 		__blk_recalc_rq_segments(rq->q, rq->bio, false));

This didn't trigger.  There were some typos:

diff --git a/block/blk-merge.c b/block/blk-merge.c
index d9c3a75..e8969ef 100644
--- a/block/blk-merge.c
+++ b/block/blk-merge.c
@@ -545,6 +545,12 @@ static int ll_merge_requests_fn(struct request_queue *q, struct request *req,
 
        /* Merge is OK... */
        req->nr_phys_segments = total_phys_segments;
+
+if (req->nr_phys_segments != __blk_recalc_rq_segments(req->q, req->bio,        false)) 
+       printk("MISMATCH IN MERGE: got %d, should get %d\n", 
+               req->nr_phys_segments,
+               __blk_recalc_rq_segments(req->q, req->bio, false));
+
        return 1;
 }
 

Any more ideas?

Dave
--
John David Anglin	dave.anglin@bell.net



