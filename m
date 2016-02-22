From: John David Anglin <dave.anglin@bell.net>
Subject: Re: SCSI bug
Date: Sun, 21 Feb 2016 19:53:50 -0500
Message-ID: <0905D3D6-635F-4E09-BFD0-2EBE5DA0B0CC@bell.net>
References: <28D5FC66-A9E6-4F3E-A8AC-F9E68A6BC543@bell.net> <82D4BF6F-05CF-4441-9530-79475BFF84F3@bell.net> <E2C8DBC2-F0AD-4C78-BD63-9C85B387E284@bell.net> <56C8E1AC.3030409@gmx.de> <038473FE-9E6D-4F03-BBD4-9844B7B529E1@bell.net> <9C42B388-96D5-412A-BAC3-14E93415CA21@bell.net> <1456026424.2268.5.camel@HansenPartnership.com> <14EF1F4E-8045-4990-B29E-D489E82B1929@bell.net> <1456078381.2340.5.camel@HansenPartnership.com> <D14AFC12-8245-4862-9FFA-92A4F114FC41@bell.net> <1456081676.2340.10.camel@HansenPartnership.com> <56CA11D2.3020900@gmx.de> <1456086490.2340.18.camel@HansenPartnership.com> <28582474-5AB3-4022-86FE-E823F5990623@bell.net> <56CA2982.1030607@gmx.de>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: multipart/mixed; boundary=Apple-Mail-10-1053860630
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-parisc List <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <56CA2982.1030607@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--Apple-Mail-10-1053860630
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

On 2016-02-21, at 4:17 PM, Helge Deller wrote:

> I enabled CONFIG_DEBUG_SG, which I had enabled the last few times as =
well, but it now happened
> for the first time:

I also enabled CONFIG_DEBUG_SG.  I added a bunch of printks and =
eventually narrowed the bug occurance
to __blk_segment_map_sg.  It seems like clearing the termination bit is =
somewhat dangerous.  I added the
attached check.  With it, I get the following on boot:

scsi target6:0:2: Beginning Domain Validation                            =
      =20
 sdb: sdb1 sdb2 sdb3 sdb4                                                =
      =20
scsi target6:0:2: Ending Domain Validation                               =
      =20
scsi target6:0:2: FAST-160 WIDE SCSI 320.0 MB/s DT IU QAS RTI WRFLOW =
PCOMP (6.2)
sd 6:0:2:0: [sdc] 143374738 512-byte logical blocks: (73.4 GB/68.3 GiB)  =
      =20
sd 6:0:0:0: [sdb] Attached SCSI disk                                     =
      =20
sd 6:0:2:0: [sdc] Write Protect is off                                   =
      =20
sd 6:0:2:0: [sdc] Write cache: enabled, read cache: enabled, supports =
DPO and FA
mptbase: ioc1: Initiating bringup                                        =
      =20
sd 6:0:2:0: [sdc] Attached SCSI disk                                     =
      =20
ioc1: LSI53C1030 B2: Capabilities=3D{Initiator,Target}                   =
        =20
scsi host7: ioc1: LSI53C1030 B2, FwRev=3D01032341h, Ports=3D1, MaxQ=3D255,=
 IRQ=3D68    =20
__blk_segment_map_sg: clearing termination bit                           =
      =20
------------[ cut here ]------------                                     =
      =20
kernel BUG at include/linux/scatterlist.h:92!                            =
      =20
__blk_segment_map_sg: clearing termination bit                           =
      =20
------------[ cut here ]------------                                     =
      =20
kernel BUG at include/linux/scatterlist.h:92!                            =
      =20
CPU: 3 PID: 1026 Comm: systemd-udevd Not tainted 4.2.0-rc2+ #16          =
      =20
task: 000000007f77d548 ti: 000000007e4f0000 task.ti: 000000007e4f0000    =
      =20
                                                                         =
      =20
     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI                                    =
      =20
PSW: 00001000000001000011001000001110 Not tainted                        =
      =20
r00-03  000000ff0804320e 000000007e4f1130 00000000403623e8 =
000000007e4f1130    =20
r04-07  000000004074f010 000000000001c000 0000000000001000 =
00000000000001a0    =20
r08-11  000000007e7b3040 0000000000000000 0000000000000000 =
000000007e6990c0    =20
r12-15  000000000000001a 0000000000000000 000000007c784790 =
0000000000000006    =20
r16-19  0000000042d79220 0000000000001000 0000000000000001 =
0000000000000000    =20
r20-23  000000000000002e 00000000705f7367 000000000000001f =
0000000000000000    =20
r24-27  ffffffff87654000 000000000800000e 000000007e6990c0 =
000000004074f010    =20
r28-31  000000007e7b3a00 000000007e4f1230 000000007e4f1260 =
0000000087654321    =20
sr00-03  0000000000016800 0000000000000000 0000000000000000 =
0000000000016800   =20
sr04-07  0000000000000000 0000000000000000 0000000000000000 =
0000000000000000   =20
                                                                         =
      =20
IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000040362608 =
000000004036260c=20
 IIR: 03ffe01f    ISR: 0000000010340000  IOR: 000000f93c4f1260           =
      =20
 CPU:        3   CR30: 000000007e4f0000 CR31: ffffffffffffffff           =
      =20
 ORIG_R28: 000000000000002e                                              =
      =20
 IAOQ[0]: blk_rq_map_sg+0x580/0x6a0                                      =
      =20
 IAOQ[1]: blk_rq_map_sg+0x584/0x6a0                                      =
      =20
 RP(r2): blk_rq_map_sg+0x360/0x6a0                                       =
      =20
Backtrace:                                                               =
      =20
 [<000000004046f4b0>] scsi_init_sgtable+0x70/0xb8                        =
      =20
 [<000000004046f564>] scsi_init_io+0x6c/0x220                            =
      =20
 [<000000000811c5c0>] sd_setup_read_write_cmnd+0x58/0x968 [sd_mod]       =
      =20
 [<000000000811cf14>] sd_init_command+0x44/0x130 [sd_mod]                =
      =20
 [<000000004046f81c>] scsi_setup_cmnd+0x104/0x1b0                        =
      =20
 [<000000004046fab8>] scsi_prep_fn+0x100/0x1a0                           =
      =20
 [<000000004035b9b0>] blk_peek_request+0x1b8/0x298                       =
      =20
 [<0000000040471028>] scsi_request_fn+0xf8/0xa90                         =
      =20
 [<0000000040357244>] __blk_run_queue+0x4c/0x70                          =
      =20
 [<00000000403802c4>] cfq_insert_request+0x2dc/0x580                     =
      =20
 [<0000000040356404>] __elv_add_request+0x1b4/0x300                      =
      =20

We have in blk-merge.c:

                else {
                        /*
                         * If the driver previously mapped a shorter
                         * list, we could see a termination bit
                         * prematurely unless it fully inits the sg
                         * table on each mapping. We KNOW that there
                         * must be more entries here or the driver
                         * would be buggy, so force clear the
                         * termination bit to avoid doing a full
                         * sg_init_table() in drivers for each command.
                         */
                        if (sg_is_last (*sg))
                          printk ("__blk_segment_map_sg: clearing =
termination bi
t\n");
                        sg_unmark_end(*sg);
                        *sg =3D sg_next(*sg);
                        BUG_ON (!*sg);
                }

The comment suggests there must be more entries...

Dave
--
John David Anglin	dave.anglin@bell.net



--Apple-Mail-10-1053860630
Content-Disposition: attachment;
	filename=blk-merge.c.d.txt
Content-Type: text/plain;
	name="blk-merge.c.d.txt"
Content-Transfer-Encoding: quoted-printable

diff --git a/block/blk-merge.c b/block/blk-merge.c
index d9c3a75..f893ecf 100644
--- a/block/blk-merge.c
+++ b/block/blk-merge.c
@@ -327,8 +327,11 @@ new_segment:
 			 * termination bit to avoid doing a full
 			 * sg_init_table() in drivers for each command.
 			 */
+			if (sg_is_last (*sg))
+			  printk ("__blk_segment_map_sg: clearing =
termination bit\n");
 			sg_unmark_end(*sg);
 			*sg =3D sg_next(*sg);
+			BUG_ON (!*sg);
 		}
=20
 		sg_set_page(*sg, bvec->bv_page, nbytes, =
bvec->bv_offset);
@@ -392,6 +395,9 @@ int blk_rq_map_sg(struct request_queue *q, struct =
request *rq,
 	if (rq->bio)
 		nsegs =3D __blk_bios_map_sg(q, rq->bio, sglist, &sg);
=20
+	if (!sg)
+		return nsegs;
+
 	if (unlikely(rq->cmd_flags & REQ_COPY_USER) &&
 	    (blk_rq_bytes(rq) & q->dma_pad_mask)) {
 		unsigned int pad_len =3D
@@ -415,8 +421,7 @@ int blk_rq_map_sg(struct request_queue *q, struct =
request *rq,
 		rq->extra_len +=3D q->dma_drain_size;
 	}
=20
-	if (sg)
-		sg_mark_end(sg);
+	sg_mark_end(sg);
=20
 	return nsegs;
 }
@@ -439,6 +444,14 @@ static inline int ll_new_hw_segment(struct =
request_queue *q,
 	 * counters.
 	 */
 	req->nr_phys_segments +=3D nr_phys_segs;
+
+#if 0
+if (req->nr_phys_segments !=3D __blk_recalc_rq_segments(req->q, =
req->bio, false))=20
+	printk("ll_new_hw_segment: MISMATCH IN MERGE: got %d, should get =
%d\n",=20
+	       req->nr_phys_segments,
+	       __blk_recalc_rq_segments(req->q, req->bio, false));
+#endif
+
 	return 1;
=20
 no_merge:
@@ -545,6 +558,14 @@ static int ll_merge_requests_fn(struct =
request_queue *q, struct request *req,
=20
 	/* Merge is OK... */
 	req->nr_phys_segments =3D total_phys_segments;
+
+#if 0
+if (req->nr_phys_segments !=3D __blk_recalc_rq_segments(req->q, =
req->bio,	false))=20
+	printk("MISMATCH IN MERGE: got %d, should get %d\n",=20
+		req->nr_phys_segments,
+		__blk_recalc_rq_segments(req->q, req->bio, false));
+#endif
+
 	return 1;
 }
=20

--Apple-Mail-10-1053860630--
