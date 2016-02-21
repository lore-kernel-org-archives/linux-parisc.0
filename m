From: John David Anglin <dave.anglin@bell.net>
Subject: Re: SCSI bug
Date: Sun, 21 Feb 2016 13:09:33 -0500
Message-ID: <14EF1F4E-8045-4990-B29E-D489E82B1929@bell.net>
References: <28D5FC66-A9E6-4F3E-A8AC-F9E68A6BC543@bell.net> <82D4BF6F-05CF-4441-9530-79475BFF84F3@bell.net> <E2C8DBC2-F0AD-4C78-BD63-9C85B387E284@bell.net> <56C8E1AC.3030409@gmx.de> <038473FE-9E6D-4F03-BBD4-9844B7B529E1@bell.net> <9C42B388-96D5-412A-BAC3-14E93415CA21@bell.net> <1456026424.2268.5.camel@HansenPartnership.com>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: multipart/mixed; boundary=Apple-Mail-2-1029604226
Cc: Helge Deller <deller@gmx.de>,
	linux-parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1456026424.2268.5.camel@HansenPartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--Apple-Mail-2-1029604226
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii

On 2016-02-20, at 10:47 PM, James Bottomley wrote:

> On Sat, 2016-02-20 at 21:52 -0500, John David Anglin wrote:
>> On 2016-02-20, at 5:52 PM, John David Anglin wrote:
>> 
>>> On 2016-02-20, at 4:59 PM, Helge Deller wrote:
>>> 
>>>> On 20.02.2016 21:43, John David Anglin wrote:
>>>>> On 2016-02-20, at 3:13 PM, John David Anglin wrote:
>>>>> 
>>>>>> On 2016-01-23, at 1:00 PM, John David Anglin wrote:
>>>>>> 
>>>>>>> WARNING: at block/blk-merge.c:454
>>>>>> 
>>>>>> With linux-image-4.4.0-1-parisc64-smp on c3740, the above
>>>>>> warning is the last message I see.
>>>>>> Kernel seems to hang at that point.  This is warning code:
>>>>>> 
>>>>>>     /*
>>>>>>      * Something must have been wrong if the figured number
>>>>>> of
>>>>>>      * segment is bigger than number of req's physical
>>>>>> segments
>>>>>>      */
>>>>>>     WARN_ON(nsegs > rq->nr_phys_segments);
>>>>> 
>>>>> On Sep. 12, 2015, I reported the following problem:
>>>>> 
>>>>> http://www.spinics.net/lists/linux-parisc/msg06327.html
>>>> 
>>>> The problem is still, that this bug can only be reproduced at
>>>> every boot when then 
>>>> scsi drivers are built as modules (and in an initrd). I could
>>>> never reproduce it when
>>>> I booted a kernel with built-in scsi drivers.
>>>> 
>>>> The bug seems to be triggered by(*nsegs)++ command in
>>>> __blk_segment_map_sg() in block/blk-merge.c.
>>>> I'm testing with the 4.4.2 kernel from debian.
>>>> I modified __blk_segment_map_sg() like that:
>>>> static inline void
>>>> __blk_segment_map_sg(struct request_queue *q, struct bio_vec
>>>> *bvec,
>>>>                   struct scatterlist *sglist, struct bio_vec
>>>> *bvprv,
>>>>                   struct scatterlist **sg, int *nsegs, int
>>>> *cluster)
>>>> {
>>>> 
>>>>      int nbytes = bvec->bv_len;
>>>> 
>>>>      if (*sg && *cluster) {
>>>>              if ((*sg)->length + nbytes >
>>>> queue_max_segment_size(q))
>>>>                      goto new_segment;
>>>> 
>>>>              if (!BIOVEC_PHYS_MERGEABLE(bvprv, bvec))
>>>>                      goto new_segment;
>>>>              if (!BIOVEC_SEG_BOUNDARY(q, bvprv, bvec))
>>>>                      goto new_segment;
>>>> 
>>>>              (*sg)->length += nbytes;
>>>>      } else {
>>>> new_segment:
>>>>              if (*sg && *cluster) {
>>>>                      printk("NEW SEGMENT sg = %p!!!\n", sg);
>>>>                      printk("__blk_segment_map_sg: length = %d,
>>>> nbytes = %d, sum = %d > %d\n", (*sg)->length, nbytes, (*sg)
>>>> ->length + nbytes, queue_max_segment_size(q));
>>>>                      printk("__blk_segment_map_sg:
>>>> BIOVEC_PHYS_MERGEABLE = %d, BIOVEC_SEG_BOUNDARY = %d\n",
>>>> BIOVEC_PHYS_MERGEABLE(bvprv, bvec), BIOVEC_SEG_BOUNDARY(q, bvprv,
>>>> bvec) );
>>>>              }
>>>>              if (!*sg)
>>>>                      *sg = sglist;
>>>>              else {
>>>>                      /*
>>>>                       * If the driver previously mapped a
>>>> shorter
>>>>                       * list, we could see a termination bit
>>>>                       * prematurely unless it fully inits the sg
>>>>                       * table on each mapping. We KNOW that
>>>> there
>>>>                       * must be more entries here or the driver
>>>>                       * would be buggy, so force clear the
>>>>                       * termination bit to avoid doing a full
>>>>                       * sg_init_table() in drivers for each
>>>> command.
>>>>                       */
>>>>                      sg_unmark_end(*sg);
>>>>                      *sg = sg_next(*sg);
>>>>              }
>>>> 
>>>>              sg_set_page(*sg, bvec->bv_page, nbytes, bvec
>>>> ->bv_offset);
>>>>              (*nsegs)++;
>>>>      }
>>>>      *bvprv = *bvec;
>>>> }
>>>> 
>>>> The boot log looks then like this:
>>>> [   43.044000] scsi_init_sgtable: count = 1, nents = 1
>>>> (there are lots of those before it!)
>>>> [   43.164000] scsi_init_sgtable: nr_phys_segments = 1
>>>> [   43.164000] scsi_init_sgtable: count = 1, nents = 1
>>>> [   43.280000] scsi_init_sgtable: nr_phys_segments = 1
>>>> [   43.280000] scsi_init_sgtable: count = 1, nents = 1
>>>> [   43.396000] scsi_init_sgtable: nr_phys_segments = 1
>>>> [   43.396000] scsi_init_sgtable: count = 1, nents = 1
>>>> [   43.512000] scsi_init_sgtable: nr_phys_segments = 1
>>>> [   43.512000] scsi_init_sgtable: count = 1, nents = 1
>>>> [   43.628000] scsi_init_sgtable: nr_phys_segments = 3
>>>> [   43.628000] NEW SEGMENT sg = 000000007fa911e8!!!
>>>> [   43.628000] __blk_segment_map_sg: length = 4096, nbytes =
>>>> 4096, sum = 8192 > 65536
>>>> [   43.628000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE = 0,
>>>> BIOVEC_SEG_BOUNDARY = 1
>>>> [   43.628000] NEW SEGMENT sg = 000000007fa911e8!!!
>>>> [   43.628000] __blk_segment_map_sg: length = 4096, nbytes =
>>>> 4096, sum = 8192 > 65536
>>>> [   43.628000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE = 0,
>>>> BIOVEC_SEG_BOUNDARY = 1
>>>> [   43.628000] scsi_init_sgtable: count = 3, nents = 3
>>>> [   44.224000] scsi_init_sgtable: nr_phys_segments = 1
>>>> [   44.224000] scsi_init_sgtable: count = 1, nents = 1
>>>> [   44.340000] scsi_init_sgtable: nr_phys_segments = 1
>>>> [   44.340000] scsi_init_sgtable: count = 1, nents = 1
>>>> [   44.456000] scsi_init_sgtable: nr_phys_segments = 7
>>>> [   44.456000] NEW SEGMENT sg = 00000000bfca0f98!!!
>>>> [   44.456000] __blk_segment_map_sg: length = 4096, nbytes =
>>>> 4096, sum = 8192 > 65536
>>>> [   44.456000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE = 0,
>>>> BIOVEC_SEG_BOUNDARY = 1
>>>> [   44.456000] NEW SEGMENT sg = 00000000bfca0f98!!!
>>>> [   44.456000] __blk_segment_map_sg: length = 4096, nbytes =
>>>> 4096, sum = 8192 > 65536
>>>> [   44.456000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE = 0,
>>>> BIOVEC_SEG_BOUNDARY = 1
>>>> [   44.456000] NEW SEGMENT sg = 00000000bfca0f98!!!
>>>> [   44.456000] __blk_segment_map_sg: length = 4096, nbytes =
>>>> 4096, sum = 8192 > 65536
>>>> [   44.456000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE = 0,
>>>> BIOVEC_SEG_BOUNDARY = 1
>>>> [   44.456000] NEW SEGMENT sg = 00000000bfca0f98!!!
>>>> [   44.456000] __blk_segment_map_sg: length = 4096, nbytes =
>>>> 4096, sum = 8192 > 65536
>>>> [   44.456000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE = 0,
>>>> BIOVEC_SEG_BOUNDARY = 1
>>>> [   44.456000] NEW SEGMENT sg = 00000000bfca0f98!!!
>>>> [   44.456000] __blk_segment_map_sg: length = 4096, nbytes =
>>>> 4096, sum = 8192 > 65536
>>>> [   44.456000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE = 0,
>>>> BIOVEC_SEG_BOUNDARY = 1
>>>> [   44.456000] NEW SEGMENT sg = 00000000bfca0f98!!!
>>>> [   44.456000] __blk_segment_map_sg: length = 4096, nbytes =
>>>> 4096, sum = 8192 > 65536
>>>> [   44.456000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE = 0,
>>>> BIOVEC_SEG_BOUNDARY = 1
>>>> [   44.456000] scsi_init_sgtable: count = 7, nents = 7
>>>> [   44.456000] timer_interrupt(CPU 0): delayed! cycles 4527081F
>>>> rem C6C21  next/now 14E153306E/14E146C44D
>>>> [   46.116000] scsi_init_sgtable: nr_phys_segments = 7
>>>> [   46.116000] NEW SEGMENT sg = 00000000bfca0f98!!!
>>>> [   46.116000] __blk_segment_map_sg: length = 4096, nbytes =
>>>> 4096, sum = 8192 > 65536
>>>> [   46.116000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE = 0,
>>>> BIOVEC_SEG_BOUNDARY = 1
>>>> [   46.116000] NEW SEGMENT sg = 00000000bfca0f98!!!
>>>> [   46.116000] __blk_segment_map_sg: length = 4096, nbytes =
>>>> 4096, sum = 8192 > 65536
>>>> [   46.116000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE = 0,
>>>> BIOVEC_SEG_BOUNDARY = 1
>>>> [   46.116000] NEW SEGMENT sg = 00000000bfca0f98!!!
>>>> [   46.116000] __blk_segment_map_sg: length = 4096, nbytes =
>>>> 4096, sum = 8192 > 65536
>>>> [   46.116000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE = 0,
>>>> BIOVEC_SEG_BOUNDARY = 1
>>>> [   46.116000] NEW SEGMENT sg = 00000000bfca0f98!!!
>>>> [   46.116000] __blk_segment_map_sg: length = 4096, nbytes =
>>>> 4096, sum = 8192 > 65536
>>>> [   46.116000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE = 0,
>>>> BIOVEC_SEG_BOUNDARY = 1
>>>> [   46.116000] NEW SEGMENT sg = 00000000bfca0f98!!!
>>>> [   46.116000] __blk_segment_map_sg: length = 8192, nbytes =
>>>> 4096, sum = 12288 > 65536
>>>> [   46.116000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE = 0,
>>>> BIOVEC_SEG_BOUNDARY = 1
>>>> [   46.116000] NEW SEGMENT sg = 00000000bfca0f98!!!
>>>> [   46.116000] __blk_segment_map_sg: length = 16384, nbytes =
>>>> 4096, sum = 20480 > 65536
>>>> [   46.116000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE = 0,
>>>> BIOVEC_SEG_BOUNDARY = 1
>>>> [   46.116000] scsi_init_sgtable: count = 7, nents = 7
>>>> [   46.116000] timer_interrupt(CPU 0): delayed! cycles 453F0A77
>>>> rem 223089  next/now 152BB6286E/152B93F7E5
>>>> [   47.780000] scsi_init_sgtable: nr_phys_segments = 1
>>>> [   47.780000] scsi_init_sgtable: count = 1, nents = 1
>>>> [   47.896000] scsi_init_sgtable: nr_phys_segments = 6
>>>> [   47.896000] NEW SEGMENT sg = 000000007fa911e8!!!
>>>> [   47.896000] __blk_segment_map_sg: length = 61440, nbytes =
>>>> 4096, sum = 65536 > 65536
>>>> [   47.896000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE = 0,
>>>> BIOVEC_SEG_BOUNDARY = 1
>>>> [   47.896000] NEW SEGMENT sg = 000000007fa911e8!!!
>>>> [   47.896000] __blk_segment_map_sg: length = 4096, nbytes =
>>>> 4096, sum = 8192 > 65536
>>>> [   47.896000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE = 0,
>>>> BIOVEC_SEG_BOUNDARY = 1
>>>> [   47.896000] NEW SEGMENT sg = 000000007fa911e8!!!
>>>> [   47.896000] __blk_segment_map_sg: length = 4096, nbytes =
>>>> 4096, sum = 8192 > 65536
>>>> [   47.896000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE = 0,
>>>> BIOVEC_SEG_BOUNDARY = 1
>>>> [   47.896000] NEW SEGMENT sg = 000000007fa911e8!!!
>>>> [   47.896000] __blk_segment_map_sg: length = 8192, nbytes =
>>>> 4096, sum = 12288 > 65536
>>>> [   47.896000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE = 0,
>>>> BIOVEC_SEG_BOUNDARY = 1
>>>> [   47.896000] NEW SEGMENT sg = 000000007fa911e8!!!
>>>> [   47.896000] __blk_segment_map_sg: length = 8192, nbytes =
>>>> 4096, sum = 12288 > 65536
>>>> [   47.896000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE = 0,
>>>> BIOVEC_SEG_BOUNDARY = 1
>>>> [   47.896000] scsi_init_sgtable: count = 6, nents = 6
>>>> [   47.896000] timer_interrupt(CPU 0): delayed! cycles 3AB087E2
>>>> rem 23E4DE  next/now 1570BBD5EE/157097F110
>>>> [   49.324000] scsi_init_sgtable: nr_phys_segments = 1
>>>> [   49.324000] scsi_init_sgtable: count = 1, nents = 1
>>>> [   49.440000] scsi_init_sgtable: nr_phys_segments = 2
>>>> [   49.440000] NEW SEGMENT sg = 000000007fa911e8!!!
>>>> [   49.440000] __blk_segment_map_sg: length = 65536, nbytes =
>>>> 4096, sum = 69632 > 65536
>>>> 
>>>> (this is interesting! Here we reach a sum of > 65536 the first
>>>> time)
>>>> 
>>>> [   49.440000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE = 1,
>>>> BIOVEC_SEG_BOUNDARY = 1
>>>> [   49.440000] NEW SEGMENT sg = 000000007fa911e8!!!
>>>> [   49.440000] __blk_segment_map_sg: length = 16384, nbytes =
>>>> 4096, sum = 20480 > 65536
>>>> [   49.440000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE = 0,
>>>> BIOVEC_SEG_BOUNDARY = 1
>>>> [   49.440000] *** FIXIT *** HELGE: nsegs > rq->nr_phys_segments
>>>> = 3 > 2
>>>> [   49.440000] scsi_init_sgtable: count = 3, nents = 2
>>>> [   50.116000] ------------[ cut here ]------------
>>>> [   50.172000] WARNING: at /build/linux-4.4/linux
>>>> -4.4.2/drivers/scsi/scsi_lib.c:1104
>>>> 
>>>> (this is usually a BUG(). I changed it to WARN() in the hope it
>>>> would work anyway. It didn't.)
>>>> 
>>>> [   50.260000] Modules linked in: sd_mod sr_mod cdrom ata_generic
>>>> ohci_pci ehci_pci ohci_hcd ehci_hcd pata_ns87415 sym53c8xx libata
>>>> scsi_transport_spi scsi_mod usbcorep
>>>> [   50.456000] CPU: 0 PID: 70 Comm: systemd-udevd Not tainted
>>>> 4.4.0-1-parisc64-smp #5 Debian 4.4.2-2
>>>> [   50.564000] task: 000000007f948b28 ti: 000000007fa90000
>>>> task.ti: 000000007fa90000
>>>> [   50.652000] 
>>>> [   50.672000]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
>>>> [   50.728000] PSW: 00001000000001001111100100001110 Not tainted
>>>> [   50.796000] r00-03  000000ff0804f90e 00000000409ea2e0
>>>> 00000000003e2ee0 000000007fa91140
>>>> [   50.892000] r04-07  00000000003cd000 000000007f914300
>>>> 000000007f914b10 0000000000000003
>>>> [   50.988000] r08-11  0000000000000000 000000007f918000
>>>> 0000000040bdd6b0 00000000003cd800
>>>> [   51.084000] r12-15  0000000000000000 000000007fa90778
>>>> 00000000003cd000 000000007f918000
>>>> [   51.180000] r16-19  0000000000001300 0000000040bdd6b8
>>>> 0000000040bdd6bc 0000000040ba2420
>>>> [   51.276000] r20-23  0000000099116e92 0000000000000000
>>>> 00000000000002a0 00000000000002ee
>>>> [   51.372000] r24-27  0000000000000000 000000000800000e
>>>> 0000000040b60750 00000000409b3ae0
>>>> [   51.468000] r28-31  0000000000000002 000000007fa914f0
>>>> 000000007fa911e0 0000000040ba2408
>>>> [   51.564000] sr00-03  0000000000015000 0000000000000000
>>>> 0000000000000000 0000000000015000
>>>> [   51.660000] sr04-07  0000000000000000 0000000000000000
>>>> 0000000000000000 0000000000000000
>>>> [   51.756000] 
>>>> [   51.772000] IASQ: 0000000000000000 0000000000000000 IAOQ:
>>>> 00000000003e2f24 00000000003e2f28
>>>> [   51.872000]  IIR: 03ffe01f    ISR: 0000000010340000  IOR:
>>>> 000000fea4691528
>>>> [   51.956000]  CPU:        0   CR30: 000000007fa90000 CR31:
>>>> 00000000ffff7dff
>>>> [   52.040000]  ORIG_R28: 0000000040b60718
>>>> [   52.084000]  IAOQ[0]: scsi_init_sgtable+0xfc/0x1b8 [scsi_mod]
>>>> [   52.152000]  IAOQ[1]: scsi_init_sgtable+0x100/0x1b8 [scsi_mod]
>>>> [   52.224000]  RP(r2): scsi_init_sgtable+0xb8/0x1b8 [scsi_mod]
>>>> [   52.292000] Backtrace:
>>>> [   52.320000]  [<00000000003e304c>] scsi_init_io+0x6c/0x258
>>>> [scsi_mod]
>>>> [   52.396000]  [<000000000087d078>] sd_init_command+0x70/0xec8
>>>> [sd_mod]
>>>> 
>>>> In general I think the bug is somehow in blk-merge.c.
>>>> But I'm not an expert in that code.
>>> 
>>> The warning was added in this patch sequence:
>>> https://lkml.org/lkml/2015/11/23/996
>>> 
>>> Possibly, but above seems to indicate that it could be driver issue
>>> as well.
>> 
>> 
>> I believe this bug was introduced by the following merge:
>> 
>> commit 1081230b748de8f03f37f80c53dfa89feda9b8de
>> Merge: df91039 2ca495a
>> Author: Linus Torvalds <torvalds@linux-foundation.org>
>> Date:   Wed Sep 2 13:10:25 2015 -0700
>> 
>>    Merge branch 'for-4.3/core' of git://git.kernel.dk/linux-block
>> 
>>    Pull core block updates from Jens Axboe:
>>     "This first core part of the block IO changes contains:
>> 
>>       - Cleanup of the bio IO error signaling from Christoph.  We
>> used to
>>         rely on the uptodate bit and passing around of an error, now
>> we
>>         store the error in the bio itself.
>> 
>>       - Improvement of the above from myself, by shrinking the bio
>> size
>>         down again to fit in two cachelines on x86-64.
>> 
>>       - Revert of the max_hw_sectors cap removal from a revision
>> again,
>>         from Jeff Moyer.  This caused performance regressions in
>> various
>>         tests.  Reinstate the limit, bump it to a more reasonable
>> size
>>         instead.
>> 
>>       - Make /sys/block/<dev>/queue/discard_max_bytes writeable, by
>> me.
>>         Most devices have huge trim limits, which can cause nasty
>> latencies
>>         when deleting files.  Enable the admin to configure the size
>> down.
>>         We will look into having a more sane default instead of
>> UINT_MAX
>>         sectors.
>> 
>>       - Improvement of the SGP gaps logic from Keith Busch.
>> 
>>       - Enable the block core to handle arbitrarily sized bios,
>> which
>>         enables a nice simplification of bio_add_page() (which is an
>> IO hot
>>         path).  From Kent.
>> 
>>       - Improvements to the partition io stats accounting, making it
>>         faster.  From Ming Lei.
>> 
>>       - Also from Ming Lei, a basic fixup for overflow of the sysfs
>> pending
>>         file in blk-mq, as well as a fix for a blk-mq timeout race
>>         condition.
>> 
>>       - Ming Lin has been carrying Kents above mentioned patches
>> forward
>>         for a while, and testing them.  Ming also did a few fixes
>> around
>>         that.
>> 
>>       - Sasha Levin found and fixed a use-after-free problem
>> introduced by
>>         the bio->bi_error changes from Christoph.
>> 
>>       - Small blk cgroup cleanup from Viresh Kumar"
>> 
>>    * 'for-4.3/core' of git://git.kernel.dk/linux-block: (26 commits)
>>      blk: Fix bio_io_vec index when checking bvec gaps
>>      block: Replace SG_GAPS with new queue limits mask
>>      block: bump BLK_DEF_MAX_SECTORS to 2560
>>      Revert "block: remove artifical max_hw_sectors cap"
>>      blk-mq: fix race between timeout and freeing request
>>      blk-mq: fix buffer overflow when reading sysfs file of
>> 'pending'
>>      Documentation: update notes in biovecs about arbitrarily sized
>> bios
>>      block: remove bio_get_nr_vecs()
>>      fs: use helper bio_add_page() instead of open coding on
>> bi_io_vec
>>      block: kill merge_bvec_fn() completely
>>      md/raid5: get rid of bio_fits_rdev()
>>      md/raid5: split bio for chunk_aligned_read
>>      block: remove split code in blkdev_issue_{discard,write_same}
>>      btrfs: remove bio splitting and merge_bvec_fn() calls
>>      bcache: remove driver private bio splitting code
>>      block: simplify bio_add_page()
>>      block: make generic_make_request handle arbitrarily sized bios
>>      blk-cgroup: Drop unlikely before IS_ERR(_OR_NULL)
>>      block: don't access bio->bi_error after bio_put()
>>      block: shrink struct bio down to 2 cache lines again
>>      ...
> 
> If you can bisect it down to the exact commit, I might be able to work
> out what's the problem.  Otherwise, even in an all modular config, I
> can't reproduce this on 4.5-rc4, so it may be fixed upstream (just not
> backported).


Okay, the bug was introduced by the following change:

commit 54efd50bfd873e2dbf784e0b21a8027ba4299a3e
Author: Kent Overstreet <kent.overstreet@gmail.com>
Date:   Thu Apr 23 22:37:18 2015 -0700

    block: make generic_make_request handle arbitrarily sized bios
    
    The way the block layer is currently written, it goes to great lengths
    to avoid having to split bios; upper layer code (such as bio_add_page())
    checks what the underlying device can handle and tries to always create
    bios that don't need to be split.
    
    But this approach becomes unwieldy and eventually breaks down with
    stacked devices and devices with dynamic limits, and it adds a lot of
    complexity. If the block layer could split bios as needed, we could
    eliminate a lot of complexity elsewhere - particularly in stacked
    drivers. Code that creates bios can then create whatever size bios are
    convenient, and more importantly stacked drivers don't have to deal with
    both their own bio size limitations and the limitations of the
    (potentially multiple) devices underneath them.  In the future this will
    let us delete merge_bvec_fn and a bunch of other code.
    
    We do this by adding calls to blk_queue_split() to the various
    make_request functions that need it - a few can already handle arbitrary
    size bios. Note that we add the call _after_ any call to
    blk_queue_bounce(); this means that blk_queue_split() and
    blk_recalc_rq_segments() don't need to be concerned with bouncing
    affecting segment merging.
    
    Some make_request_fn() callbacks were simple enough to audit and verify
    they don't need blk_queue_split() calls. The skipped ones are:
    
     * nfhd_make_request (arch/m68k/emu/nfblock.c)
     * axon_ram_make_request (arch/powerpc/sysdev/axonram.c)
     * simdisk_make_request (arch/xtensa/platforms/iss/simdisk.c)
     * brd_make_request (ramdisk - drivers/block/brd.c)
     * mtip_submit_request (drivers/block/mtip32xx/mtip32xx.c)
     * loop_make_request
     * null_queue_bio
     * bcache's make_request fns
    
    Some others are almost certainly safe to remove now, but will be left
    for future patches.
    
    Cc: Jens Axboe <axboe@kernel.dk>
    Cc: Christoph Hellwig <hch@infradead.org>
    Cc: Al Viro <viro@zeniv.linux.org.uk>
    Cc: Ming Lei <ming.lei@canonical.com>
    Cc: Neil Brown <neilb@suse.de>
    Cc: Alasdair Kergon <agk@redhat.com>
    Cc: Mike Snitzer <snitzer@redhat.com>
    Cc: dm-devel@redhat.com
    Cc: Lars Ellenberg <drbd-dev@lists.linbit.com>
    Cc: drbd-user@lists.linbit.com
    Cc: Jiri Kosina <jkosina@suse.cz>
    Cc: Geoff Levand <geoff@infradead.org>
    Cc: Jim Paris <jim@jtan.com>
    Cc: Philip Kelleher <pjk1939@linux.vnet.ibm.com>
    Cc: Minchan Kim <minchan@kernel.org>
    Cc: Nitin Gupta <ngupta@vflare.org>
    Cc: Oleg Drokin <oleg.drokin@intel.com>
    Cc: Andreas Dilger <andreas.dilger@intel.com>
    Acked-by: NeilBrown <neilb@suse.de> (for the 'md/md.c' bits)
    Acked-by: Mike Snitzer <snitzer@redhat.com>
    Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
    Signed-off-by: Kent Overstreet <kent.overstreet@gmail.com>
    [dpark: skip more mq-based drivers, resolve merge conflicts, etc.]
    Signed-off-by: Dongsu Park <dpark@posteo.net>
    Signed-off-by: Ming Lin <ming.l@ssi.samsung.com>
    Signed-off-by: Jens Axboe <axboe@fb.com>

Attached diff.

Dave
--
John David Anglin	dave.anglin@bell.net



--Apple-Mail-2-1029604226
Content-Disposition: attachment;
	filename=generic_make_request.d.txt
Content-Type: text/plain;
	name="generic_make_request.d.txt"
Content-Transfer-Encoding: quoted-printable

diff --git a/block/blk-core.c b/block/blk-core.c
index d1796b5..60912e9 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -643,6 +643,10 @@ struct request_queue *blk_alloc_queue_node(gfp_t =
gfp_mask, int node_id)
 	if (q->id < 0)
 		goto fail_q;
=20
+	q->bio_split =3D bioset_create(BIO_POOL_SIZE, 0);
+	if (!q->bio_split)
+		goto fail_id;
+
 	q->backing_dev_info.ra_pages =3D
 			(VM_MAX_READAHEAD * 1024) / PAGE_CACHE_SIZE;
 	q->backing_dev_info.capabilities =3D BDI_CAP_CGROUP_WRITEBACK;
@@ -651,7 +655,7 @@ struct request_queue *blk_alloc_queue_node(gfp_t =
gfp_mask, int node_id)
=20
 	err =3D bdi_init(&q->backing_dev_info);
 	if (err)
-		goto fail_id;
+		goto fail_split;
=20
 	setup_timer(&q->backing_dev_info.laptop_mode_wb_timer,
 		    laptop_mode_timer_fn, (unsigned long) q);
@@ -693,6 +697,8 @@ struct request_queue *blk_alloc_queue_node(gfp_t =
gfp_mask, int node_id)
=20
 fail_bdi:
 	bdi_destroy(&q->backing_dev_info);
+fail_split:
+	bioset_free(q->bio_split);
 fail_id:
 	ida_simple_remove(&blk_queue_ida, q->id);
 fail_q:
@@ -1610,6 +1616,8 @@ static void blk_queue_bio(struct request_queue *q, =
struct bio *bio)
 	struct request *req;
 	unsigned int request_count =3D 0;
=20
+	blk_queue_split(q, &bio, q->bio_split);
+
 	/*
 	 * low level driver can indicate that it wants pages above a
 	 * certain limit bounced to low memory (ie for highmem, or even
@@ -1832,15 +1840,6 @@ generic_make_request_checks(struct bio *bio)
 		goto end_io;
 	}
=20
-	if (likely(bio_is_rw(bio) &&
-		   nr_sectors > queue_max_hw_sectors(q))) {
-		printk(KERN_ERR "bio too big device %s (%u > %u)\n",
-		       bdevname(bio->bi_bdev, b),
-		       bio_sectors(bio),
-		       queue_max_hw_sectors(q));
-		goto end_io;
-	}
-
 	part =3D bio->bi_bdev->bd_part;
 	if (should_fail_request(part, bio->bi_iter.bi_size) ||
 	    should_fail_request(&part_to_disk(part)->part0,
diff --git a/block/blk-merge.c b/block/blk-merge.c
index a455b98..d9c3a75 100644
--- a/block/blk-merge.c
+++ b/block/blk-merge.c
@@ -9,12 +9,158 @@
=20
 #include "blk.h"
=20
+static struct bio *blk_bio_discard_split(struct request_queue *q,
+					 struct bio *bio,
+					 struct bio_set *bs)
+{
+	unsigned int max_discard_sectors, granularity;
+	int alignment;
+	sector_t tmp;
+	unsigned split_sectors;
+
+	/* Zero-sector (unknown) and one-sector granularities are the =
same.  */
+	granularity =3D max(q->limits.discard_granularity >> 9, 1U);
+
+	max_discard_sectors =3D min(q->limits.max_discard_sectors, =
UINT_MAX >> 9);
+	max_discard_sectors -=3D max_discard_sectors % granularity;
+
+	if (unlikely(!max_discard_sectors)) {
+		/* XXX: warn */
+		return NULL;
+	}
+
+	if (bio_sectors(bio) <=3D max_discard_sectors)
+		return NULL;
+
+	split_sectors =3D max_discard_sectors;
+
+	/*
+	 * If the next starting sector would be misaligned, stop the =
discard at
+	 * the previous aligned sector.
+	 */
+	alignment =3D (q->limits.discard_alignment >> 9) % granularity;
+
+	tmp =3D bio->bi_iter.bi_sector + split_sectors - alignment;
+	tmp =3D sector_div(tmp, granularity);
+
+	if (split_sectors > tmp)
+		split_sectors -=3D tmp;
+
+	return bio_split(bio, split_sectors, GFP_NOIO, bs);
+}
+
+static struct bio *blk_bio_write_same_split(struct request_queue *q,
+					    struct bio *bio,
+					    struct bio_set *bs)
+{
+	if (!q->limits.max_write_same_sectors)
+		return NULL;
+
+	if (bio_sectors(bio) <=3D q->limits.max_write_same_sectors)
+		return NULL;
+
+	return bio_split(bio, q->limits.max_write_same_sectors, =
GFP_NOIO, bs);
+}
+
+static struct bio *blk_bio_segment_split(struct request_queue *q,
+					 struct bio *bio,
+					 struct bio_set *bs)
+{
+	struct bio *split;
+	struct bio_vec bv, bvprv;
+	struct bvec_iter iter;
+	unsigned seg_size =3D 0, nsegs =3D 0;
+	int prev =3D 0;
+
+	struct bvec_merge_data bvm =3D {
+		.bi_bdev	=3D bio->bi_bdev,
+		.bi_sector	=3D bio->bi_iter.bi_sector,
+		.bi_size	=3D 0,
+		.bi_rw		=3D bio->bi_rw,
+	};
+
+	bio_for_each_segment(bv, bio, iter) {
+		if (q->merge_bvec_fn &&
+		    q->merge_bvec_fn(q, &bvm, &bv) < (int) bv.bv_len)
+			goto split;
+
+		bvm.bi_size +=3D bv.bv_len;
+
+		if (bvm.bi_size >> 9 > queue_max_sectors(q))
+			goto split;
+
+		/*
+		 * If the queue doesn't support SG gaps and adding this
+		 * offset would create a gap, disallow it.
+		 */
+		if (q->queue_flags & (1 << QUEUE_FLAG_SG_GAPS) &&
+		    prev && bvec_gap_to_prev(&bvprv, bv.bv_offset))
+			goto split;
+
+		if (prev && blk_queue_cluster(q)) {
+			if (seg_size + bv.bv_len > =
queue_max_segment_size(q))
+				goto new_segment;
+			if (!BIOVEC_PHYS_MERGEABLE(&bvprv, &bv))
+				goto new_segment;
+			if (!BIOVEC_SEG_BOUNDARY(q, &bvprv, &bv))
+				goto new_segment;
+
+			seg_size +=3D bv.bv_len;
+			bvprv =3D bv;
+			prev =3D 1;
+			continue;
+		}
+new_segment:
+		if (nsegs =3D=3D queue_max_segments(q))
+			goto split;
+
+		nsegs++;
+		bvprv =3D bv;
+		prev =3D 1;
+		seg_size =3D bv.bv_len;
+	}
+
+	return NULL;
+split:
+	split =3D bio_clone_bioset(bio, GFP_NOIO, bs);
+
+	split->bi_iter.bi_size -=3D iter.bi_size;
+	bio->bi_iter =3D iter;
+
+	if (bio_integrity(bio)) {
+		bio_integrity_advance(bio, split->bi_iter.bi_size);
+		bio_integrity_trim(split, 0, bio_sectors(split));
+	}
+
+	return split;
+}
+
+void blk_queue_split(struct request_queue *q, struct bio **bio,
+		     struct bio_set *bs)
+{
+	struct bio *split;
+
+	if ((*bio)->bi_rw & REQ_DISCARD)
+		split =3D blk_bio_discard_split(q, *bio, bs);
+	else if ((*bio)->bi_rw & REQ_WRITE_SAME)
+		split =3D blk_bio_write_same_split(q, *bio, bs);
+	else
+		split =3D blk_bio_segment_split(q, *bio, q->bio_split);
+
+	if (split) {
+		bio_chain(split, *bio);
+		generic_make_request(*bio);
+		*bio =3D split;
+	}
+}
+EXPORT_SYMBOL(blk_queue_split);
+
 static unsigned int __blk_recalc_rq_segments(struct request_queue *q,
 					     struct bio *bio,
 					     bool no_sg_merge)
 {
 	struct bio_vec bv, bvprv =3D { NULL };
-	int cluster, high, highprv =3D 1;
+	int cluster, prev =3D 0;
 	unsigned int seg_size, nr_phys_segs;
 	struct bio *fbio, *bbio;
 	struct bvec_iter iter;
@@ -36,7 +182,6 @@ static unsigned int __blk_recalc_rq_segments(struct =
request_queue *q,
 	cluster =3D blk_queue_cluster(q);
 	seg_size =3D 0;
 	nr_phys_segs =3D 0;
-	high =3D 0;
 	for_each_bio(bio) {
 		bio_for_each_segment(bv, bio, iter) {
 			/*
@@ -46,13 +191,7 @@ static unsigned int __blk_recalc_rq_segments(struct =
request_queue *q,
 			if (no_sg_merge)
 				goto new_segment;
=20
-			/*
-			 * the trick here is making sure that a high =
page is
-			 * never considered part of another segment, =
since
-			 * that might change with the bounce page.
-			 */
-			high =3D page_to_pfn(bv.bv_page) > =
queue_bounce_pfn(q);
-			if (!high && !highprv && cluster) {
+			if (prev && cluster) {
 				if (seg_size + bv.bv_len
 				    > queue_max_segment_size(q))
 					goto new_segment;
@@ -72,8 +211,8 @@ new_segment:
=20
 			nr_phys_segs++;
 			bvprv =3D bv;
+			prev =3D 1;
 			seg_size =3D bv.bv_len;
-			highprv =3D high;
 		}
 		bbio =3D bio;
 	}
diff --git a/block/blk-mq.c b/block/blk-mq.c
index 9455902..81edbd9 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -1287,6 +1287,8 @@ static void blk_mq_make_request(struct =
request_queue *q, struct bio *bio)
 		return;
 	}
=20
+	blk_queue_split(q, &bio, q->bio_split);
+
 	if (!is_flush_fua && !blk_queue_nomerges(q) &&
 	    blk_attempt_plug_merge(q, bio, &request_count, =
&same_queue_rq))
 		return;
@@ -1372,6 +1374,8 @@ static void blk_sq_make_request(struct =
request_queue *q, struct bio *bio)
 		return;
 	}
=20
+	blk_queue_split(q, &bio, q->bio_split);
+
 	if (!is_flush_fua && !blk_queue_nomerges(q) &&
 	    blk_attempt_plug_merge(q, bio, &request_count, NULL))
 		return;
diff --git a/block/blk-sysfs.c b/block/blk-sysfs.c
index b1f34e4..3e44a9d 100644
--- a/block/blk-sysfs.c
+++ b/block/blk-sysfs.c
@@ -561,6 +561,9 @@ static void blk_release_queue(struct kobject *kobj)
=20
 	blk_trace_shutdown(q);
=20
+	if (q->bio_split)
+		bioset_free(q->bio_split);
+
 	ida_simple_remove(&blk_queue_ida, q->id);
 	call_rcu(&q->rcu_head, blk_free_queue_rcu);
 }
diff --git a/drivers/block/drbd/drbd_req.c =
b/drivers/block/drbd/drbd_req.c
index 9cb4116..923c857 100644
--- a/drivers/block/drbd/drbd_req.c
+++ b/drivers/block/drbd/drbd_req.c
@@ -1499,6 +1499,8 @@ void drbd_make_request(struct request_queue *q, =
struct bio *bio)
 	struct drbd_device *device =3D (struct drbd_device *) =
q->queuedata;
 	unsigned long start_jif;
=20
+	blk_queue_split(q, &bio, q->bio_split);
+
 	start_jif =3D jiffies;
=20
 	/*
diff --git a/drivers/block/pktcdvd.c b/drivers/block/pktcdvd.c
index a7a259e..ee7ad5e 100644
--- a/drivers/block/pktcdvd.c
+++ b/drivers/block/pktcdvd.c
@@ -2447,6 +2447,10 @@ static void pkt_make_request(struct request_queue =
*q, struct bio *bio)
 	char b[BDEVNAME_SIZE];
 	struct bio *split;
=20
+	blk_queue_bounce(q, &bio);
+
+	blk_queue_split(q, &bio, q->bio_split);
+
 	pd =3D q->queuedata;
 	if (!pd) {
 		pr_err("%s incorrect request queue\n",
@@ -2477,8 +2481,6 @@ static void pkt_make_request(struct request_queue =
*q, struct bio *bio)
 		goto end_io;
 	}
=20
-	blk_queue_bounce(q, &bio);
-
 	do {
 		sector_t zone =3D get_zone(bio->bi_iter.bi_sector, pd);
 		sector_t last_zone =3D get_zone(bio_end_sector(bio) - 1, =
pd);
diff --git a/drivers/block/ps3vram.c b/drivers/block/ps3vram.c
index 49b4706..d89fcac 100644
--- a/drivers/block/ps3vram.c
+++ b/drivers/block/ps3vram.c
@@ -606,6 +606,8 @@ static void ps3vram_make_request(struct =
request_queue *q, struct bio *bio)
=20
 	dev_dbg(&dev->core, "%s\n", __func__);
=20
+	blk_queue_split(q, &bio, q->bio_split);
+
 	spin_lock_irq(&priv->lock);
 	busy =3D !bio_list_empty(&priv->list);
 	bio_list_add(&priv->list, bio);
diff --git a/drivers/block/rsxx/dev.c b/drivers/block/rsxx/dev.c
index 63b9d2f..3163e4cdc 100644
--- a/drivers/block/rsxx/dev.c
+++ b/drivers/block/rsxx/dev.c
@@ -151,6 +151,8 @@ static void rsxx_make_request(struct request_queue =
*q, struct bio *bio)
 	struct rsxx_bio_meta *bio_meta;
 	int st =3D -EINVAL;
=20
+	blk_queue_split(q, &bio, q->bio_split);
+
 	might_sleep();
=20
 	if (!card)
diff --git a/drivers/block/umem.c b/drivers/block/umem.c
index 3b3afd2..04d6579 100644
--- a/drivers/block/umem.c
+++ b/drivers/block/umem.c
@@ -531,6 +531,8 @@ static void mm_make_request(struct request_queue *q, =
struct bio *bio)
 		 (unsigned long long)bio->bi_iter.bi_sector,
 		 bio->bi_iter.bi_size);
=20
+	blk_queue_split(q, &bio, q->bio_split);
+
 	spin_lock_irq(&card->lock);
 	*card->biotail =3D bio;
 	bio->bi_next =3D NULL;
diff --git a/drivers/block/zram/zram_drv.c =
b/drivers/block/zram/zram_drv.c
index 68c3d48..aec781a 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -900,6 +900,8 @@ static void zram_make_request(struct request_queue =
*queue, struct bio *bio)
 	if (unlikely(!zram_meta_get(zram)))
 		goto error;
=20
+	blk_queue_split(queue, &bio, queue->bio_split);
+
 	if (!valid_io_request(zram, bio->bi_iter.bi_sector,
 					bio->bi_iter.bi_size)) {
 		atomic64_inc(&zram->stats.invalid_io);
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 7f367fc..069f8d7 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1799,6 +1799,8 @@ static void dm_make_request(struct request_queue =
*q, struct bio *bio)
=20
 	map =3D dm_get_live_table(md, &srcu_idx);
=20
+	blk_queue_split(q, &bio, q->bio_split);
+
 	generic_start_io_acct(rw, bio_sectors(bio), =
&dm_disk(md)->part0);
=20
 	/* if we're suspended, we have to queue this io for later */
diff --git a/drivers/md/md.c b/drivers/md/md.c
index ac4381a..e1d8723 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -257,6 +257,8 @@ static void md_make_request(struct request_queue *q, =
struct bio *bio)
 	unsigned int sectors;
 	int cpu;
=20
+	blk_queue_split(q, &bio, q->bio_split);
+
 	if (mddev =3D=3D NULL || mddev->pers =3D=3D NULL
 	    || !mddev->ready) {
 		bio_io_error(bio);
diff --git a/drivers/s390/block/dcssblk.c b/drivers/s390/block/dcssblk.c
index 8bcb822..29ea239 100644
--- a/drivers/s390/block/dcssblk.c
+++ b/drivers/s390/block/dcssblk.c
@@ -826,6 +826,8 @@ dcssblk_make_request(struct request_queue *q, struct =
bio *bio)
 	unsigned long source_addr;
 	unsigned long bytes_done;
=20
+	blk_queue_split(q, &bio, q->bio_split);
+
 	bytes_done =3D 0;
 	dev_info =3D bio->bi_bdev->bd_disk->private_data;
 	if (dev_info =3D=3D NULL)
diff --git a/drivers/s390/block/xpram.c b/drivers/s390/block/xpram.c
index 93856b9..02871f1 100644
--- a/drivers/s390/block/xpram.c
+++ b/drivers/s390/block/xpram.c
@@ -190,6 +190,8 @@ static void xpram_make_request(struct request_queue =
*q, struct bio *bio)
 	unsigned long page_addr;
 	unsigned long bytes;
=20
+	blk_queue_split(q, &bio, q->bio_split);
+
 	if ((bio->bi_iter.bi_sector & 7) !=3D 0 ||
 	    (bio->bi_iter.bi_size & 4095) !=3D 0)
 		/* Request is not page-aligned. */
diff --git a/drivers/staging/lustre/lustre/llite/lloop.c =
b/drivers/staging/lustre/lustre/llite/lloop.c
index cc00fd1..1e33d54 100644
--- a/drivers/staging/lustre/lustre/llite/lloop.c
+++ b/drivers/staging/lustre/lustre/llite/lloop.c
@@ -340,6 +340,8 @@ static void loop_make_request(struct request_queue =
*q, struct bio *old_bio)
 	int rw =3D bio_rw(old_bio);
 	int inactive;
=20
+	blk_queue_split(q, &old_bio, q->bio_split);
+
 	if (!lo)
 		goto err;
=20
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 243f29e..ca778d9 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -463,6 +463,7 @@ struct request_queue {
=20
 	struct blk_mq_tag_set	*tag_set;
 	struct list_head	tag_set_list;
+	struct bio_set		*bio_split;
 };
=20
 #define QUEUE_FLAG_QUEUED	1	/* uses generic tag queueing */
@@ -783,6 +784,8 @@ extern void blk_rq_unprep_clone(struct request *rq);
 extern int blk_insert_cloned_request(struct request_queue *q,
 				     struct request *rq);
 extern void blk_delay_queue(struct request_queue *, unsigned long);
+extern void blk_queue_split(struct request_queue *, struct bio **,
+			    struct bio_set *);
 extern void blk_recount_segments(struct request_queue *, struct bio *);
 extern int scsi_verify_blk_ioctl(struct block_device *, unsigned int);
 extern int scsi_cmd_blk_ioctl(struct block_device *, fmode_t,

--Apple-Mail-2-1029604226--
