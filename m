From: John David Anglin <dave.anglin@bell.net>
Subject: Re: SCSI bug
Date: Mon, 22 Feb 2016 22:04:09 -0500
Message-ID: <38C40D56-D72B-4F87-AAF3-050391B9546D@bell.net>
References: <28D5FC66-A9E6-4F3E-A8AC-F9E68A6BC543@bell.net> <82D4BF6F-05CF-4441-9530-79475BFF84F3@bell.net> <E2C8DBC2-F0AD-4C78-BD63-9C85B387E284@bell.net> <56C8E1AC.3030409@gmx.de> <038473FE-9E6D-4F03-BBD4-9844B7B529E1@bell.net> <9C42B388-96D5-412A-BAC3-14E93415CA21@bell.net> <1456026424.2268.5.camel@HansenPartnership.com> <14EF1F4E-8045-4990-B29E-D489E82B1929@bell.net> <1456078381.2340.5.camel@HansenPartnership.com> <D14AFC12-8245-4862-9FFA-92A4F114FC41@bell.net> <1456081676.2340.10.camel@HansenPartnership.com> <56CA11D2.3020900@gmx.de> <1456086490.2340.18.camel@HansenPartnership.com> <28582474-5AB3-4022-86FE-E823F5990623@bell.net> <56CA2982.1030607@gmx.de> <0905D3D6-635F-4E09-BFD0-2EBE5DA0B0CC@bell.net> <951EFC7D-4166-41E5-BD1B-E22EE7884AD7@bell.net>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: multipart/mixed; boundary=Apple-Mail-21--999403916
Cc: Helge Deller <deller@gmx.de>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <951EFC7D-4166-41E5-BD1B-E22EE7884AD7@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--Apple-Mail-21--999403916
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

On 2016-02-21, at 10:24 PM, John David Anglin wrote:

> On 2016-02-21, at 7:53 PM, John David Anglin wrote:
>=20
>> Backtrace:                                                            =
         =20
>> [<000000004046f4b0>] scsi_init_sgtable+0x70/0xb8                      =
        =20
>> [<000000004046f564>] scsi_init_io+0x6c/0x220                          =
        =20
>> [<000000000811c5c0>] sd_setup_read_write_cmnd+0x58/0x968 [sd_mod]     =
        =20
>> [<000000000811cf14>] sd_init_command+0x44/0x130 [sd_mod]              =
        =20
>> [<000000004046f81c>] scsi_setup_cmnd+0x104/0x1b0                      =
        =20
>> [<000000004046fab8>] scsi_prep_fn+0x100/0x1a0                         =
        =20
>> [<000000004035b9b0>] blk_peek_request+0x1b8/0x298                     =
        =20
>> [<0000000040471028>] scsi_request_fn+0xf8/0xa90                       =
        =20
>> [<0000000040357244>] __blk_run_queue+0x4c/0x70                        =
        =20
>> [<00000000403802c4>] cfq_insert_request+0x2dc/0x580                   =
        =20
>> [<0000000040356404>] __elv_add_request+0x1b4/0x300                    =
        =20
>>=20
>> We have in blk-merge.c:
>>=20
>>               else {
>>                       /*
>>                        * If the driver previously mapped a shorter
>>                        * list, we could see a termination bit
>>                        * prematurely unless it fully inits the sg
>>                        * table on each mapping. We KNOW that there
>>                        * must be more entries here or the driver
>>                        * would be buggy, so force clear the
>>                        * termination bit to avoid doing a full
>>                        * sg_init_table() in drivers for each command.
>>                        */
>>                       if (sg_is_last (*sg))
>>                         printk ("__blk_segment_map_sg: clearing =
termination bi
>> t\n");
>>                       sg_unmark_end(*sg);
>>                       *sg =3D sg_next(*sg);
>>                       BUG_ON (!*sg);
>>               }
>>=20
>> The comment suggests there must be more entries...
>=20
> I'm thinking with the split the scsi driver needs to provide one or =
two extra entires in the sg list.


With the attached patch, I'm able to boot 4.2.0-rc2+ on linux-block at =
commit
54efd50bfd873e2dbf784e0b21a8027ba4299a3e.

I didn't try to optimize the number of extra entries but I know one is =
not enough.

I guess the puzzle is why the number of entries isn't calculated =
correctly in the first place.
Further, why does blk-merge believe that it's okay to go beyond the =
terminator?  Clearly,
the magic number isn't always set, etc.

I added the WARN_ON so I'd know when we run off the end of the the list.

Dave
--
John David Anglin	dave.anglin@bell.net



--Apple-Mail-21--999403916
Content-Disposition: attachment;
	filename=scsi-nents.d.txt
Content-Type: text/plain;
	name="scsi-nents.d.txt"
Content-Transfer-Encoding: quoted-printable

diff --git a/block/blk-merge.c b/block/blk-merge.c
index d9c3a75..8e2566b 100644
--- a/block/blk-merge.c
+++ b/block/blk-merge.c
@@ -327,6 +327,7 @@ new_segment:
 			 * termination bit to avoid doing a full
 			 * sg_init_table() in drivers for each command.
 			 */
+			WARN_ON(sg_is_last (*sg));
 			sg_unmark_end(*sg);
 			*sg =3D sg_next(*sg);
 		}
@@ -392,6 +393,9 @@ int blk_rq_map_sg(struct request_queue *q, struct =
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
@@ -415,8 +419,7 @@ int blk_rq_map_sg(struct request_queue *q, struct =
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
diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
index b1a2631..b421f03 100644
--- a/drivers/scsi/scsi_lib.c
+++ b/drivers/scsi/scsi_lib.c
@@ -595,6 +595,11 @@ static int scsi_alloc_sgtable(struct =
scsi_data_buffer *sdb, int nents, bool mq)
=20
 	BUG_ON(!nents);
=20
+	/* Provide extra entries in case of split.  */
+	nents +=3D 8;
+	if (nents > SCSI_MAX_SG_SEGMENTS)
+		nents =3D SCSI_MAX_SG_SEGMENTS;
+
 	if (mq) {
 		if (nents <=3D SCSI_MAX_SG_SEGMENTS) {
 			sdb->table.nents =3D nents;

--Apple-Mail-21--999403916--
