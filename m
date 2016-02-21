From: John David Anglin <dave.anglin@bell.net>
Subject: Re: SCSI bug
Date: Sun, 21 Feb 2016 09:45:16 -0500
Message-ID: <C6219E31-B9EA-4CD3-AD4A-76C5945E882D@bell.net>
References: <28D5FC66-A9E6-4F3E-A8AC-F9E68A6BC543@bell.net> <82D4BF6F-05CF-4441-9530-79475BFF84F3@bell.net> <E2C8DBC2-F0AD-4C78-BD63-9C85B387E284@bell.net> <56C8E1AC.3030409@gmx.de> <038473FE-9E6D-4F03-BBD4-9844B7B529E1@bell.net> <9C42B388-96D5-412A-BAC3-14E93415CA21@bell.net> <1456026424.2268.5.camel@HansenPartnership.com>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller@gmx.de>,
	linux-parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1456026424.2268.5.camel@HansenPartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

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


I tried HEAD this morning and problem is still present.  The warning in blk-merge.c occurs
first followed by BUG:
kernel BUG at drivers/scsi/scsi_lib.c:1097! 

Entire console output is shown below:
                              
reboot: Restarting system                                                       
                                                                                
Firmware Version  2.12                                                          
                                                                                
Duplex Console IO Dependent Code (IODC) revision 1                              
------------------------------------------------------------------------------  
   (c) Copyright 1995-2004, Hewlett-Packard Company, All rights reserved        
------------------------------------------------------------------------------  
                                                                                
  Processor   Speed            State           CoProcessor        Cache Size    
  Number                                       State              Inst    Data  
  ---------  --------   ---------------------  -----------------  ------------  
      0      1000 MHz   Active                 Functional         32 MB/32 MB   
      1      1000 MHz   Idle                   Functional         32 MB/32 MB   
      2      1000 MHz   Idle                   Functional         32 MB/32 MB   
      3      1000 MHz   Idle                   Functional         32 MB/32 MB   
                                                                                
  Central Bus Speed (in MHz)  :        200                                      
  Available Memory            :   12582912  KB                                  
  Good Memory Required        : Not initialized. Defaults to 32 MB.             
                                                                                
   Primary boot path:    scsiA.0                                                
                         0/2/1/0.0                                              
   Alternate boot path:  lan.0.0.0.0                                            
                         0/3/3/0                                                
   Console path:         serial_A.643                                           
                         17.643                                                 
   Keyboard path:        usb0                                                   
                         0/3/1/0.0                                              
   Keyboard path ignored for serial consoles.                                   
                                                                                
                                                                                
                                                                                
                                                                                
---- Main Menu ---------------------------------------------------------------  
                                                                                
     Command                           Description                              
     -------                           -----------                              
     BOot [PRI|ALT|<path>]             Boot from specified path                 
     PAth [PRI|ALT|CON|KEY [<path>]]   Display or change a path                 
     SEArch [DIsplay|[[IPL] [<path>]]] Search for boot devices                  
                                                                                
     COnfiguration menu                Displays or sets boot values             
     INformation menu                  Displays hardware information            
     SERvice menu                      Displays service commands                
                                                                                
     DIsplay                           Redisplay the current menu               
     HElp [<menu>|<command>]           Display help for menu or command         
     RESET                             Restart the system                       
----                                                                            
Main Menu: Enter command or menu > bo                                           
Interact with IPL (Y, N, or Cancel)?> n                                         
                                                                                
Booting...                                                                      
Boot IO Dependent Code (IODC) revision 2                                        
                                                                                
                                                                                
HARD Booted.                                                                    
palo ipl 1.92 root@c3000 Wed Oct  9 21:48:57 CEST 2013                          
                                                                                
Partition Start(MB) End(MB) Id Type                                             
1               1      62   f0 Palo                                             
2              63     305   83 ext2                                             
3             306    2259   82 swap                                             
4            2260   70007   83 ext2                                             
                                                                                
PALO(F0) partition contains:                                                    
    0/vmlinux64 3063747(8270074) bytes @ 0x48000                                
                                                                                
Command line for kernel: 'root=/dev/sda4 console=ttyS0 HOME=/ rootfstype=ext3 c'
Selected kernel: /vmlinuz from partition 2                                      
Selected ramdisk: /initrd.img from partition 2                                  
uncompressing Linux kernel.....................................................2
.                                                                               
ELF64 executable                                                                
Entry 00100000 first 00100000 n 2                                               
Segment 0 load 00100000 size 215488 mediaptr 0x1000                             
Segment 1 load 00135000 size 7706288 mediaptr 0x36000                           
Loading ramdisk 10819353 bytes @ 3e19d000...                                    
Branching to kernel entry point 0x00100000.  If this is the last                
message you see, you may need to switch your console.  This is                  
a common symptom -- search the FAQ and mailing list at parisc-linux.org         
                                                                                
Linux version 4.5.0-rc5 (dave@atlas) (gcc version 4.9.3 (GCC) ) #1 SMP Sun Feb 6
unwind_init: start = 0x407398b0, end = 0x40776820, entries = 15607              
FP[0] enabled: Rev 1 Model 20                                                   
The 64-bit Kernel has started...                                                
Kernel default page size is 4 KB. Huge pages disabled.                          
bootconsole [ttyB0] enabled                                                     
Initialized PDC Console for debugging.                                          
Determining PDC firmware type: 64 bit PAT.                                      
model 000088b0 00000491 00000000 00000002 56bb5389fb0d1ec0 100000f0 00000008 002
vers  00000302                                                                  
CPUID vers 20 rev 5 (0x00000285)                                                
capabilities 0x35                                                               
model 9000/785/C8000                                                            
parisc_cache_init: Only equivalent aliasing supported!                          
Memory Ranges:                                                                  
 0) Start 0x0000000000000000 End 0x000000003fffffff Size   1024 MB              
 1) Start 0x0000000100000000 End 0x00000002ffdfffff Size   8190 MB              
 2) Start 0x0000004040000000 End 0x00000040ffffffff Size   3072 MB              
Total Memory: 12286 MB                                                          
initrd: 7e19d000-7ebee719                                                       
initrd: reserving 3e19d000-3ebee719 (mem_max 2ffe00000)                         
PERCPU: Embedded 17 pages/cpu @0000000042e11000 s29936 r8192 d31504 u69632      
SMP: bootstrap CPU ID is 0                                                      
Built 3 zonelists in Zone order, mobility grouping on.  Total pages: 3102215    
Kernel command line: root=/dev/sda4 console=ttyS0 HOME=/ rootfstype=ext3 clocksz
log_buf_len individual max cpu contribution: 4096 bytes                         
log_buf_len total cpu_extra contributions: 126976 bytes                         
log_buf_len min size: 131072 bytes                                              
log_buf_len: 262144 bytes                                                       
early log buf free: 127768(97%)                                                 
PID hash table entries: 4096 (order: 3, 32768 bytes)                            
Dentry cache hash table entries: 2097152 (order: 12, 16777216 bytes)            
Inode-cache hash table entries: 1048576 (order: 11, 8388608 bytes)              
Sorting __ex_table...                                                           
Memory: 12338568K/12580864K available (4668K kernel code, 1515K rwdata, 842K ro)
virtual kernel memory layout:                                                   
   vmalloc : 0x0000000000008000 - 0x000000003f000000   (1007 MB)                
   memory  : 0x0000000040000000 - 0x0000004140000000   (266240 MB)              
     .init : 0x0000000040100000 - 0x0000000040145000   ( 276 kB)                
     .data : 0x00000000405d4000 - 0x0000000040821530   (2357 kB)                
     .text : 0x0000000040145000 - 0x00000000405d4000   (4668 kB)                
Hierarchical RCU implementation.                                                
        Build-time adjustment of leaf fanout to 64.                             
NR_IRQS:128                                                                     
clocksource: cr16: mask: 0xffffffffffffffff max_cycles: 0x1cd42e4dffb, max_idles
Console: colour dummy device 160x64                                             
------------------------                                                        
| Locking API testsuite:                                                        
----------------------------------------------------------------------------    
                                 | spin |wlock |rlock |mutex | wsem | rsem |    
  --------------------------------------------------------------------------    
                     A-A deadlock:failed|failed|  ok  |failed|failed|failed|    
                 A-B-B-A deadlock:failed|failed|  ok  |failed|failed|failed|    
             A-B-B-C-C-A deadlock:failed|failed|  ok  |failed|failed|failed|    
             A-B-C-A-B-C deadlock:failed|failed|  ok  |failed|failed|failed|    
         A-B-B-C-C-D-D-A deadlock:failed|failed|  ok  |failed|failed|failed|    
         A-B-C-D-B-D-D-A deadlock:failed|failed|  ok  |failed|failed|failed|    
         A-B-C-D-B-C-D-A deadlock:failed|failed|  ok  |failed|failed|failed|    
                    double unlock:failed|failed|failed|  ok  |failed|failed|    
                  initialize held:failed|failed|failed|failed|failed|failed|    
                 bad unlock order:  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |    
  --------------------------------------------------------------------------    
              recursive read-lock:             |  ok  |             |failed|    
           recursive read-lock #2:             |  ok  |             |failed|    
            mixed read-write-lock:             |failed|             |failed|    
            mixed write-read-lock:             |failed|             |failed|    
  --------------------------------------------------------------------------    
     hard-irqs-on + irq-safe-A/12:failed|failed|  ok  |                         
     soft-irqs-on + irq-safe-A/12:failed|failed|  ok  |                         
     hard-irqs-on + irq-safe-A/21:failed|failed|  ok  |                         
     soft-irqs-on + irq-safe-A/21:failed|failed|  ok  |                         
       sirq-safe-A => hirqs-on/12:failed|failed|  ok  |                         
       sirq-safe-A => hirqs-on/21:failed|failed|  ok  |                         
         hard-safe-A + irqs-on/12:failed|failed|  ok  |                         
         soft-safe-A + irqs-on/12:failed|failed|  ok  |                         
         hard-safe-A + irqs-on/21:failed|failed|  ok  |                         
         soft-safe-A + irqs-on/21:failed|failed|  ok  |                         
    hard-safe-A + unsafe-B #1/123:failed|failed|  ok  |                         
    soft-safe-A + unsafe-B #1/123:failed|failed|  ok  |                         
    hard-safe-A + unsafe-B #1/132:failed|failed|  ok  |                         
    soft-safe-A + unsafe-B #1/132:failed|failed|  ok  |                         
    hard-safe-A + unsafe-B #1/213:failed|failed|  ok  |                         
    soft-safe-A + unsafe-B #1/213:failed|failed|  ok  |                         
    hard-safe-A + unsafe-B #1/231:failed|failed|  ok  |                         
    soft-safe-A + unsafe-B #1/231:failed|failed|  ok  |                         
    hard-safe-A + unsafe-B #1/312:failed|failed|  ok  |                         
    soft-safe-A + unsafe-B #1/312:failed|failed|  ok  |                         
    hard-safe-A + unsafe-B #1/321:failed|failed|  ok  |                         
    soft-safe-A + unsafe-B #1/321:failed|failed|  ok  |                         
    hard-safe-A + unsafe-B #2/123:failed|failed|  ok  |                         
    soft-safe-A + unsafe-B #2/123:failed|failed|  ok  |                         
    hard-safe-A + unsafe-B #2/132:failed|failed|  ok  |                         
    soft-safe-A + unsafe-B #2/132:failed|failed|  ok  |                         
    hard-safe-A + unsafe-B #2/213:failed|failed|  ok  |                         
    soft-safe-A + unsafe-B #2/213:failed|failed|  ok  |                         
    hard-safe-A + unsafe-B #2/231:failed|failed|  ok  |                         
    soft-safe-A + unsafe-B #2/231:failed|failed|  ok  |                         
    hard-safe-A + unsafe-B #2/312:failed|failed|  ok  |                         
    soft-safe-A + unsafe-B #2/312:failed|failed|  ok  |                         
    hard-safe-A + unsafe-B #2/321:failed|failed|  ok  |                         
    soft-safe-A + unsafe-B #2/321:failed|failed|  ok  |                         
      hard-irq lock-inversion/123:failed|failed|  ok  |                         
      soft-irq lock-inversion/123:failed|failed|  ok  |                         
      hard-irq lock-inversion/132:failed|failed|  ok  |                         
      soft-irq lock-inversion/132:failed|failed|  ok  |                         
      hard-irq lock-inversion/213:failed|failed|  ok  |                         
      soft-irq lock-inversion/213:failed|failed|  ok  |                         
      hard-irq lock-inversion/231:failed|failed|  ok  |                         
      soft-irq lock-inversion/231:failed|failed|  ok  |                         
      hard-irq lock-inversion/312:failed|failed|  ok  |                         
      soft-irq lock-inversion/312:failed|failed|  ok  |                         
      hard-irq lock-inversion/321:failed|failed|  ok  |                         
      soft-irq lock-inversion/321:failed|failed|  ok  |                         
      hard-irq read-recursion/123:  ok  |                                       
      soft-irq read-recursion/123:  ok  |                                       
      hard-irq read-recursion/132:  ok  |                                       
      soft-irq read-recursion/132:  ok  |                                       
      hard-irq read-recursion/213:  ok  |                                       
      soft-irq read-recursion/213:  ok  |                                       
      hard-irq read-recursion/231:  ok  |                                       
      soft-irq read-recursion/231:  ok  |                                       
      hard-irq read-recursion/312:  ok  |                                       
      soft-irq read-recursion/312:  ok  |                                       
      hard-irq read-recursion/321:  ok  |                                       
      soft-irq read-recursion/321:  ok  |                                       
  --------------------------------------------------------------------------    
  | Wound/wait tests |                                                          
  ---------------------                                                         
                  ww api failures:  ok  |  ok  |  ok  |                         
               ww contexts mixing:failed|  ok  |                                
             finishing ww context:  ok  |  ok  |  ok  |  ok  |                  
               locking mismatches:  ok  |  ok  |  ok  |                         
                 EDEADLK handling:  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  o|
           spinlock nest unlocked:failed|                                       
  -----------------------------------------------------                         
                                 |block | try  |context|                        
  -----------------------------------------------------                         
                          context:failed|  ok  |  ok  |                         
                              try:failed|  ok  |failed|                         
                            block:failed|  ok  |failed|                         
                         spinlock:failed|  ok  |failed|                         
--------------------------------------------------------                        
153 out of 253 testcases failed, as expected. |                                 
----------------------------------------------------                            
Calibrating delay loop... 1993.93 BogoMIPS (lpj=9969664)                        
pid_max: default: 32768 minimum: 301                                            
Mount-cache hash table entries: 32768 (order: 6, 262144 bytes)                  
Mountpoint-cache hash table entries: 32768 (order: 6, 262144 bytes)             
Brought up 1 CPUs                                                               
devtmpfs: initialized                                                           
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 191s
atomic64_test: passed                                                           
NET: Registered protocol family 16                                              
Searching for devices...                                                        
Found devices:                                                                  
1. Crestone Peak Fast? at 0xfffffffffe780000 [128] { 0, 0x0, 0x88b, 0x00004 }   
2. Crestone Peak Fast? at 0xfffffffffe781000 [129] { 0, 0x0, 0x88b, 0x00004 }   
3. Crestone Peak Fast? at 0xfffffffffe798000 [152] { 0, 0x0, 0x88b, 0x00004 }   
4. Crestone Peak Fast? at 0xfffffffffe799000 [153] { 0, 0x0, 0x88b, 0x00004 }   
5. Memory at 0xfffffffffed08000 [8] { 1, 0x0, 0x0b6, 0x00009 }                  
6. Pluto BC McKinley Port at 0xfffffffffed00000 [0] { 12, 0x0, 0x880, 0x0000c } 
7. Mercury PCI Bridge at 0xfffffffffed20000 [0/0] { 13, 0x0, 0x783, 0x0000a }   
8. Mercury PCI Bridge at 0xfffffffffed24000 [0/2] { 13, 0x0, 0x783, 0x0000a }   
9. Mercury PCI Bridge at 0xfffffffffed26000 [0/3] { 13, 0x0, 0x783, 0x0000a }   
10. Quicksilver AGP Bridge at 0xfffffffffed28000 [0/4] { 13, 0x0, 0x784, 0x0000}
11. BMC IPMI Mgmt Ctlr at 0xfffffff0f05b0000 [16] { 15, 0x0, 0x004, 0x000c0 }   
12. Crestone Peak Fast? Core RS-232 at 0xfffffff0f05e0000 [17] { 10, 0x0, 0x077}
13. Crestone Peak Fast? Core RS-232 at 0xfffffff0f05e2000 [18] { 10, 0x0, 0x077}
Enabling PDC_PAT chassis codes support v0.05                                    
Releasing cpu 1 now, hpa=fffffffffe781000                                       
FP[1] enabled: Rev 1 Model 20                                                   
Releasing cpu 2 now, hpa=fffffffffe798000                                       
FP[2] enabled: Rev 1 Model 20                                                   
Releasing cpu 3 now, hpa=fffffffffe799000                                       
FP[3] enabled: Rev 1 Model 20                                                   
CPU(s): 4 out of 4 PA8800 (Mako) at 1000.000000 MHz online                      
Setting cache flush threshold to 32768 kB                                       
Setting TLB flush threshold to 1236 kB                                          
SBA found Pluto 2.3 at 0xfffffffffed00000                                       
Mercury version TR3.2 (0x32) found at 0xfffffffffed20000                        
LBA: lmmio_space [0xffffffff80000000-0xffffffff9fffffff] - new                  
LBA 0:0: PCI host bridge to bus 0000:00                                         
pci_bus 0000:00: root bus resource [io  0x0000-0xffff]                          
pci_bus 0000:00: root bus resource [mem 0xffffffff80000000-0xffffffff9fffffff] )
pci_bus 0000:00: root bus resource [bus 00-07]                                  
Mercury version TR3.2 (0x32) found at 0xfffffffffed24000                        
LBA 0:2: PCI host bridge to bus 0000:40                                         
pci_bus 0000:40: root bus resource [io  0x10000-0x1ffff] (bus address [0x0000-0)
pci_bus 0000:40: root bus resource [mem 0xffffffffa0000000-0xffffffffafffffff] )
pci_bus 0000:40: root bus resource [bus 40-47]                                  
Mercury version TR3.2 (0x32) found at 0xfffffffffed26000                        
LBA 0:3: PCI host bridge to bus 0000:60                                         
pci_bus 0000:60: root bus resource [io  0x20000-0x2ffff] (bus address [0x0000-0)
pci_bus 0000:60: root bus resource [mem 0xffffffffb0000000-0xffffffffbfffffff] )
pci_bus 0000:60: root bus resource [bus 60-67]                                  
Quicksilver version TR1.0 (0x10) found at 0xfffffffffed28000                    
LBA: lmmio_space [0xffffffffc0000000-0xffffffffdfffffff] - new                  
LBA 0:4: PCI host bridge to bus 0000:80                                         
pci_bus 0000:80: root bus resource [io  0x30000-0x3ffff] (bus address [0x0000-0)
pci_bus 0000:80: root bus resource [mem 0xffffffffc0000000-0xffffffffdfffffff] )
pci_bus 0000:80: root bus resource [bus 80-87]                                  
powersw: Soft power switch at 0xfffffff0f042e278 enabled.                       
vgaarb: setting as boot device: PCI:0000:80:00.0                                
vgaarb: device added: PCI:0000:80:00.0,decodes=io+mem,owns=io+mem,locks=none    
vgaarb: loaded                                                                  
vgaarb: bridge control possible 0000:80:00.0                                    
NET: Registered protocol family 2                                               
TCP established hash table entries: 131072 (order: 8, 1048576 bytes)            
TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)                    
TCP: Hash tables configured (established 131072 bind 65536)                     
UDP hash table entries: 8192 (order: 6, 262144 bytes)                           
UDP-Lite hash table entries: 8192 (order: 6, 262144 bytes)                      
NET: Registered protocol family 1                                               
RPC: Registered named UNIX socket transport module.                             
RPC: Registered udp transport module.                                           
RPC: Registered tcp transport module.                                           
RPC: Registered tcp NFSv4.1 backchannel transport module.                       
Trying to unpack rootfs image as initramfs...                                   
Freeing initrd memory: 10564K (000000007e19d000 - 000000007ebee000)             
Performance monitoring counters enabled for Crestone Peak Fast?                 
futex hash table entries: 8192 (order: 6, 262144 bytes)                         
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)            
io scheduler noop registered                                                    
io scheduler deadline registered                                                
io scheduler cfq registered (default)                                           
Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled                        
console [ttyS0] disabled                                                        
17: ttyS0 at MMIO 0xfffffff0f05e0800 (irq = 76, base_baud = 115200) is a 16550A 
console [ttyS0] enabled                                                         
console [ttyS0] enabled                                                         
bootconsole [ttyB0] disabled                                                    
bootconsole [ttyB0] disabled                                                    
18: ttyS1 at MMIO 0xfffffff0f05e2800 (irq = 77, base_baud = 115200) is a 16550A 
Linux agpgart interface v0.103                                                  
brd: module loaded                                                              
HP SDC: No SDC found.                                                           
HP SDC MLC: Registering the System Domain Controller's HIL MLC.                 
HP SDC MLC: Request for raw HIL ISR hook denied                                 
mousedev: PS/2 mouse device common for all mice                                 
rtc-generic rtc-generic: rtc core: registered rtc-generic as rtc0               
hidraw: raw HID events driver (C) Jiri Kosina                                   
rtc-generic rtc-generic: setting system clock to 2016-02-21 14:32:46 UTC (14560)
Freeing unused kernel memory: 276K (0000000040100000 - 0000000040145000)        
Loading, please wait...                                                         
starting versionrandom: systemd-udevd urandom read with 59 bits of entropy avaie
 228                                                                            
Fusion MPT base driver 3.04.20                                                  
Copyright (c) 1999-2008 LSI Corporation                                         
SCSI subsystem initialized                                                      
usbcore: registered new interface driver usbfs                                  
usbcore: registered new interface driver hub                                    
Uniform Multi-Platform E-IDE driver                                             
e1000: Intel(R) PRO/1000 Network Driver - version 7.3.21-k8-NAPI                
e1000: Copyright (c) 1999-2006 Intel Corporation.                               
usbcore: registered new device driver usb                                       
ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver                      
sata_sil24 0000:00:01.0: Applying completion IRQ loss on PCI-X errata fix       
ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver                          
ehci-pci: EHCI PCI platform driver                                              
Fusion MPT SPI Host driver 3.04.20                                              
mptbase: ioc0: Initiating bringup                                               
scsi host0: sata_sil24                                                          
scsi host1: sata_sil24                                                          
scsi host2: sata_sil24                                                          
scsi host3: sata_sil24                                                          
e1000 0000:60:03.0 eth0: (PCI:33MHz:32-bit) 00:11:0a:31:8a:77                   
e1000 0000:60:03.0 eth0: Intel(R) PRO/1000 Network Connection                   
siimage 0000:60:02.0: IDE controller (0x1095:0x0680 rev 0x02)                   
siimage 0000:60:02.0: BASE CLOCK == 133                                         
siimage 0000:60:02.0: 100% native mode on irq 72                                
    ide0: MMIO-DMA                                                              
    ide1: MMIO-DMA                                                              
ata1: SATA max UDMA/100 host m128@0xffffffff80088000 port 0xffffffff80080000 ir6
ata2: SATA max UDMA/100 host m128@0xffffffff80088000 port 0xffffffff80082000 ir6
ata3: SATA max UDMA/100 host m128@0xffffffff80088000 port 0xffffffff80084000 ir6
ata4: SATA max UDMA/100 host m128@0xffffffff80088000 port 0xffffffff80086000 ir6
hdc: HL-DT-STDVD+-RW GSA-H21L, ATAPI CD/DVD-ROM drive                           
ioc0: LSI53C1030 B2: Capabilities={Initiator,Target}                            
hdc: UDMA/44 mode selected                                                      
ide0 at 0x107c4080-0x107c4087,0x107c408a on irq 72                              
ide1 at 0x107c40c0-0x107c40c7,0x107c40ca on irq 72                              
ehci-pci 0000:60:01.2: EHCI Host Controller                                     
ehci-pci 0000:60:01.2: new USB bus registered, assigned bus number 1            
ehci-pci 0000:60:01.2: irq 71, io mem 0xffffffffb00a1000                        
ehci-pci 0000:60:01.2: USB 2.0 started, EHCI 0.95                               
usb usb1: New USB device found, idVendor=1d6b, idProduct=0002                   
usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1              
usb usb1: Product: EHCI Host Controller                                         
usb usb1: Manufacturer: Linux 4.5.0-rc5 ehci_hcd                                
usb usb1: SerialNumber: 0000:60:01.2                                            
hub 1-0:1.0: USB hub found                                                      
hub 1-0:1.0: 5 ports detected                                                   
ohci-pci: OHCI PCI platform driver                                              
ohci-pci 0000:60:01.0: OHCI PCI host controller                                 
ohci-pci 0000:60:01.0: new USB bus registered, assigned bus number 2            
ohci-pci 0000:60:01.0: irq 69, io mem 0xffffffffb00a3000                        
ata1: SATA link down (SStatus 0 SControl 0)                                     
scsi host4: ioc0: LSI53C1030 B2, FwRev=01032341h, Ports=1, MaxQ=255, IRQ=67     
usb usb2: New USB device found, idVendor=1d6b, idProduct=0001                   
usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1              
usb usb2: Product: OHCI PCI host controller                                     
usb usb2: Manufacturer: Linux 4.5.0-rc5 ohci_hcd                                
usb usb2: SerialNumber: 0000:60:01.0                                            
hub 2-0:1.0: USB hub found                                                      
hub 2-0:1.0: 3 ports detected                                                   
ohci-pci 0000:60:01.1: OHCI PCI host controller                                 
ohci-pci 0000:60:01.1: new USB bus registered, assigned bus number 3            
ohci-pci 0000:60:01.1: irq 70, io mem 0xffffffffb00a2000                        
scsi 4:0:0:0: Direct-Access     HP 73.4G ST373207LW       HPC1 PQ: 0 ANSI: 3    
scsi target4:0:0: Beginning Domain Validation                                   
scsi target4:0:0: Ending Domain Validation                                      
scsi target4:0:0: FAST-160 WIDE SCSI 320.0 MB/s DT IU QAS RTI WRFLOW PCOMP (6.2)
usb usb3: New USB device found, idVendor=1d6b, idProduct=0001                   
usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1              
usb usb3: Product: OHCI PCI host controller                                     
usb usb3: Manufacturer: Linux 4.5.0-rc5 ohci_hcd                                
usb usb3: SerialNumber: 0000:60:01.1                                            
hub 3-0:1.0: USB hub found                                                      
ata2: SATA link down (SStatus 0 SControl 0)                                     
hub 3-0:1.0: 2 ports detected                                                   
scsi 4:0:2:0: Direct-Access     HP 73.4G ST373207LW       HPC1 PQ: 0 ANSI: 3    
scsi target4:0:2: Beginning Domain Validation                                   
scsi target4:0:2: Ending Domain Validation                                      
scsi target4:0:2: FAST-160 WIDE SCSI 320.0 MB/s DT IU QAS RTI WRFLOW PCOMP (6.2)
random: nonblocking pool is initialized                                         
ata3: SATA link down (SStatus 0 SControl 0)                                     
mptbase: ioc1: Initiating bringup                                               
ata4: SATA link up 3.0 Gbps (SStatus 123 SControl 0)                            
ata4.00: ATA-9: ST3000DM001-1ER166, CC25, max UDMA/133                          
ata4.00: 5860533168 sectors, multi 0: LBA48 NCQ (depth 31/32)                   
ata4.00: configured for UDMA/100                                                
scsi 3:0:0:0: Direct-Access     ATA      ST3000DM001-1ER1 CC25 PQ: 0 ANSI: 5    
sd 3:0:0:0: [sdc] 5860533168 512-byte logical blocks: (3.00 TB/2.73 TiB)        
sd 3:0:0:0: [sdc] 4096-byte physical blocks                                     
sd 3:0:0:0: [sdc] Write Protect is off                                          
sd 3:0:0:0: [sdc] Write cache: enabled, read cache: enabled, doesn't support DPA
 sdc: sdc1                                                                      
sd 3:0:0:0: [sdc] Attached SCSI disk                                            
ioc1: LSI53C1030 B2: Capabilities={Initiator,Target}                            
sd 4:0:0:0: [sda] 143374738 512-byte logical blocks: (73.4 GB/68.4 GiB)         
sd 4:0:2:0: [sdb] 143374738 512-byte logical blocks: (73.4 GB/68.4 GiB)         
sd 4:0:0:0: [sda] Write Protect is off                                          
sd 4:0:0:0: [sda] Write cache: enabled, read cache: enabled, supports DPO and FA
scsi host5: ioc1: LSI53C1030 B2, FwRev=01032341h, Ports=1, MaxQ=255, IRQ=68     
sd 4:0:2:0: [sdb] Write Protect is off                                          
 sda: sda1 sda2 sda3 sda4                                                       
sd 4:0:0:0: [sda] Attached SCSI disk                                            
sd 4:0:2:0: [sdb] Write cache: enabled, read cache: enabled, supports DPO and FA
sd 4:0:2:0: [sdb] Attached SCSI disk                                            
------------[ cut here ]------------                                            
WARNING: at block/blk-merge.c:466                                               
Modules linked in: sd_mod ohci_pci pata_sil680 mptspi ehci_pci ohci_hcd scsi_trd
CPU: 2 PID: 927 Comm: systemd-udevd Not tainted 4.5.0-rc5 #1                    
task: 000000007f622b18 ti: 000000007e550000 task.ti: 000000007e550000           
                                                                                
     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI                                           
PSW: 00001000000001001111111100001110 Not tainted                               
r00-03  000000ff0804ff0e 000000007e551220 0000000000001000 000000007e551220     
r04-07  000000004070f340 0000000000000000 00000000000001e0 0000000000000000     
r08-11  0000000000000000 0000000000000001 000000007e231918 0000000000000000     
r12-15  0000000000001000 0000000000000008 000000000000001e 0000000042da3cc8     
r16-19  000000007e231918 000000007e2459b8 000000007f01e800 0000000000000000     
r20-23  0000000000000000 000000007feb4400 0000000000002000 000000004078c690     
r24-27  0002ea873ff455e3 cffd1578c0000000 000000007e231918 000000004070f340     
r28-31  0000000000000001 000000007e551320 000000007e551350 0000000000000007     
sr00-03  0000000000013000 0000000000000000 0000000000013000 0000000000013000    
sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000    
                                                                                
IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000040372d70 0000000040372d74 
 IIR: 03ffe01f    ISR: 0000000010340000  IOR: 000000f88c631918                  
 CPU:        2   CR30: 000000007e550000 CR31: ffffffffffffffff                  
 ORIG_R28: 0000000000000000                                                     
 IAOQ[0]: blk_rq_map_sg+0x5d8/0x610                                             
 IAOQ[1]: blk_rq_map_sg+0x5dc/0x610                                             
 RP(r2): 0x1000                                                                 
Backtrace:                                                                      
 [<0000000010217708>] scsi_init_sgtable+0x70/0x168 [scsi_mod]                   
 [<000000001021786c>] scsi_init_io+0x6c/0x250 [scsi_mod]                        
 [<00000000107f16e0>] sd_setup_read_write_cmnd+0x58/0x948 [sd_mod]              
 [<00000000107f2014>] sd_init_command+0x44/0x130 [sd_mod]                       
 [<0000000010217b54>] scsi_setup_cmnd+0x104/0x1c0 [scsi_mod]                    
 [<0000000010217ea0>] scsi_prep_fn+0x100/0x340 [scsi_mod]                       
 [<000000004036bc14>] blk_peek_request+0x1bc/0x2a8                              
 [<0000000010219aac>] scsi_request_fn+0xf4/0xab0 [scsi_mod]                     
 [<0000000040366fb4>] __blk_run_queue+0x4c/0x70                                 
 [<00000000403919e0>] cfq_insert_request+0x2e0/0x588                            
 [<0000000040366170>] __elv_add_request+0x190/0x2d8                             
                                                                                
---[ end trace c4c138874107ee9a ]---                                            
------------[ cut here ]------------                                            
kernel BUG at drivers/scsi/scsi_lib.c:1097!                                     
CPU: 2 PID: 927 Comm: systemd-udevd Tainted: G        W       4.5.0-rc5 #1      
task: 000000007f622b18 ti: 000000007e550000 task.ti: 000000007e550000           
                                                                                
     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI                                           
PSW: 00001000000001001111111100001110 Tainted: G        W                       
r00-03  000000ff0804ff0e 000000007e551220 0000000010217708 000000007e551180     
r04-07  0000000010201000 000000007e2459b8 000000007e0d04c0 0000000000000000     
r08-11  000000007e2459b8 000000007fe8e800 0000000040821520 0000000000000110     
r12-15  0000000000000000 000000007e550798 0000000010201000 0000000040738340     
r16-19  000000004082152c 000000007fe8e800 000000007e71d800 0000000000000000     
r20-23  0000000000000000 000000007feb4400 0000000000002000 000000004078c690     
r24-27  0002ea873ff455e3 cffd1578c0000000 000000007e231918 000000004070f340     
r28-31  0000000000000008 000000007e551320 000000007e551220 0000000000000007     
sr00-03  0000000000013000 0000000000000000 0000000000013000 0000000000013000    
sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000    
                                                                                
IASQ: 0000000000000000 0000000000000000 IAOQ: 000000001021774c 0000000010217750 
 IIR: 03ffe01f    ISR: 0000000000000000  IOR: 0000000000000000                  
 CPU:        2   CR30: 000000007e550000 CR31: ffffffffffffffff                  
 ORIG_R28: 0000000000000000                                                     
 IAOQ[0]: scsi_init_sgtable+0xb4/0x168 [scsi_mod]                               
 IAOQ[1]: scsi_init_sgtable+0xb8/0x168 [scsi_mod]                               
 RP(r2): scsi_init_sgtable+0x70/0x168 [scsi_mod]                                
Backtrace:                                                                      
 [<000000001021786c>] scsi_init_io+0x6c/0x250 [scsi_mod]                        
 [<00000000107f16e0>] sd_setup_read_write_cmnd+0x58/0x948 [sd_mod]              
 [<00000000107f2014>] sd_init_command+0x44/0x130 [sd_mod]                       
 [<0000000010217b54>] scsi_setup_cmnd+0x104/0x1c0 [scsi_mod]                    
 [<0000000010217ea0>] scsi_prep_fn+0x100/0x340 [scsi_mod]                       
 [<000000004036bc14>] blk_peek_request+0x1bc/0x2a8                              
 [<0000000010219aac>] scsi_request_fn+0xf4/0xab0 [scsi_mod]                     
 [<0000000040366fb4>] __blk_run_queue+0x4c/0x70                                 
 [<00000000403919e0>] cfq_insert_request+0x2e0/0x588                            
 [<0000000040366170>] __elv_add_request+0x190/0x2d8                             
                                                                                
CPU: 2 PID: 927 Comm: systemd-udevd Tainted: G        W       4.5.0-rc5 #1      
Backtrace:                                                                      
 [<000000004015c0a8>] show_stack+0x20/0x38                                      
 [<0000000040397458>] dump_stack+0xa8/0x120                                     
 [<000000004015c27c>] die_if_kernel+0x19c/0x2e0                                 
 [<000000004015d158>] handle_interruption+0x9a8/0x9d0                           
                                                                                
---[ end trace c4c138874107ee9b ]---                                            
NMI watchdog: BUG: soft lockup - CPU#3 stuck for 22s! [systemd-udevd:927]       
Modules linked in: sd_mod ohci_pci pata_sil680 mptspi ehci_pci ohci_hcd scsi_trd
CPU: 3 PID: 927 Comm: systemd-udevd Tainted: G      D W       4.5.0-rc5 #1      
task: 000000007f622b18 ti: 000000007e550000 task.ti: 000000007e550000           
                                                                                
     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI                                           
PSW: 00001000000001101111111100001111 Tainted: G      D W                       
r00-03  000000ff0806ff0f 000000007e551d10 0000000040202348 000000007e551c40     
r04-07  000000004070f340 000000007e551ce0 000000004079c560 000000004079c4a0     
r08-11  0000000042e4b360 0000000042e4b368 0000000000000001 00000000406e8360     
r12-15  0000000000000000 000000007e551ce0 0000000010201000 0000000040738340     
r16-19  000000007e551220 000000007fe8e800 000000007e71d800 0000000042e421d0     
r20-23  0000000000000001 0000000042e4b368 000000000800000f 0000000000000000     
r24-27  0000000000000000 0000000000000020 0000000042e4b368 000000004070f340     
r28-31  0000000000000002 000000007e551d60 000000007e551d10 0000000000000003     
sr00-03  000000000001b800 0000000000000000 0000000000000000 000000000001b800    
sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000    
                                                                                
IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000040202370 0000000040202374 
 IIR: 4a7f0030    ISR: 0000000000000000  IOR: 0000000002000200                  
 CPU:        3   CR30: 000000007e550000 CR31: fffffffffffeffff                  
 ORIG_R28: 0000000000000000                                                     
 IAOQ[0]: smp_call_function_many+0x338/0x3b0                                    
 IAOQ[1]: smp_call_function_many+0x33c/0x3b0                                    
 RP(r2): smp_call_function_many+0x310/0x3b0                                     
Backtrace:                                                                      
 [<00000000402024a0>] on_each_cpu+0x58/0xa0                                     
 [<0000000040159998>] flush_tlb_all+0x108/0x1e8                                 
 [<0000000040249600>] tlb_flush_mmu_tlbonly+0x48/0xa8                           
 [<000000004024a480>] tlb_finish_mmu+0x30/0x98                                  
 [<00000000402551dc>] exit_mmap+0x134/0x1b8                                     
 [<00000000401811d8>] mmput+0xc0/0x1a8                                          
 [<0000000040186438>] do_exit+0x320/0xcb8                                       
 [<000000004015c2d8>] die_if_kernel+0x1f8/0x2e0                                 
 [<000000004015d158>] handle_interruption+0x9a8/0x9d0                           
                                                                                
timer_interrupt(CPU 3): delayed! cycles 8291193C rem 903CC4  next/now 259158BA28
NMI watchdog: BUG: soft lockup - CPU#3 stuck for 22s! [systemd-udevd:927]       
Modules linked in: sd_mod ohci_pci pata_sil680 mptspi ehci_pci ohci_hcd scsi_trd
CPU: 3 PID: 927 Comm: systemd-udevd Tainted: G      D W    L  4.5.0-rc5 #1      
task: 000000007f622b18 ti: 000000007e550000 task.ti: 000000007e550000           
                                                                                
     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI                                           
PSW: 00001000000001101111111100001111 Tainted: G      D W    L                  
r00-03  000000ff0806ff0f 000000007e551d10 0000000040202348 000000007e551c40     
r04-07  000000004070f340 000000007e551ce0 000000004079c560 000000004079c4a0     
r08-11  0000000042e4b360 0000000042e4b368 0000000000000001 00000000406e8360     
r12-15  0000000000000000 000000007e551ce0 0000000010201000 0000000040738340     
r16-19  000000007e551220 000000007fe8e800 000000007e71d800 0000000042e421d0     
r20-23  0000000000000001 0000000042e4b368 000000000800000f 0000000000000000     
r24-27  0000000000000000 0000000000000020 0000000042e4b368 000000004070f340     
r28-31  0000000000000002 000000007e551d60 000000007e551d10 0000000000000003     
sr00-03  000000000001b800 0000000000000000 0000000000000000 000000000001b800    
sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000    
                                                                                
IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000040202370 0000000040202374 
 IIR: 4a7f0030    ISR: 0000000000000000  IOR: 0000000002000200                  
 CPU:        3   CR30: 000000007e550000 CR31: fffffffffffeffff                  
 ORIG_R28: 0000000000000000                                                     
 IAOQ[0]: smp_call_function_many+0x338/0x3b0                                    
 IAOQ[1]: smp_call_function_many+0x33c/0x3b0                                    
 RP(r2): smp_call_function_many+0x310/0x3b0                                     
Backtrace:                                                                      
 [<00000000402024a0>] on_each_cpu+0x58/0xa0                                     
 [<0000000040159998>] flush_tlb_all+0x108/0x1e8                                 
 [<0000000040249600>] tlb_flush_mmu_tlbonly+0x48/0xa8                           
 [<000000004024a480>] tlb_finish_mmu+0x30/0x98                                  
 [<00000000402551dc>] exit_mmap+0x134/0x1b8                                     
 [<00000000401811d8>] mmput+0xc0/0x1a8                                          
 [<0000000040186438>] do_exit+0x320/0xcb8                                       
 [<000000004015c2d8>] die_if_kernel+0x1f8/0x2e0                                 
 [<000000004015d158>] handle_interruption+0x9a8/0x9d0                           
                                                                                
timer_interrupt(CPU 3): delayed! cycles 82907C30 rem 90D9D0  next/now 2C1646D22C
INFO: rcu_sched self-detected stall on CPUINFO: rcu_sched detected stalls on CP:
        2-...: (1 GPs behind) idle=c8f/140000000000000/0 softirq=1886/1886 fqs= 
        3-...: (5545 ticks this GP) idle=a85/140000000000001/0 softirq=1132/113 
        (detected by 1, t=6002 jiffies, g=39, c=38, q=66)                       
Task dump for CPU 2:                                                            
kworker/2:1H    R  running task        0   998      2 0x00000004                
Workqueue: kblockd cfq_kick_queue                                               
Backtrace:                                                                      
 [<0000000040152044>] __schedule+0x264/0x5b8                                    
 [<00000000401523e4>] schedule+0x4c/0xc8                                        
 [<00000000401a12b8>] worker_thread+0x338/0x688                                 
 [<00000000401a976c>] kthread+0x144/0x178                                       
 [<0000000040148020>] end_fault_vector+0x20/0x28                                
 [<0000000010726808>] ohci_hub_control+0x0/0x650 [ohci_hcd]                     
 [<000000001072b0a0>] ohci_dump+0x0/0xf0 [ohci_hcd]                             
                                                                                
Task dump for CPU 3:                                                            
systemd-udevd   R  running task        0   927    921 0x00000014                
Backtrace:                                                                      
 [<00000000402024a0>] on_each_cpu+0x58/0xa0                                     
 [<0000000040159998>] flush_tlb_all+0x108/0x1e8                                 
 [<0000000040249600>] tlb_flush_mmu_tlbonly+0x48/0xa8                           
 [<000000004024a480>] tlb_finish_mmu+0x30/0x98                                  
 [<00000000402551dc>] exit_mmap+0x134/0x1b8                                     
 [<00000000401811d8>] mmput+0xc0/0x1a8                                          
 [<0000000040186438>] do_exit+0x320/0xcb8                                       
 [<000000004015c2d8>] die_if_kernel+0x1f8/0x2e0                                 
 [<000000004015d158>] handle_interruption+0x9a8/0x9d0                           
                                                                                
                                                                                
                                                                                
        3-...: (5545 ticks this GP) idle=a85/140000000000001/0 softirq=1132/113 
         (t=6147 jiffies g=39 c=38 q=67)                                        
Task dump for CPU 2:                                                            
kworker/2:1H    R  running task        0   998      2 0x00000004                
Workqueue: kblockd cfq_kick_queue                                               
Backtrace:                                                                      
 [<0000000040152044>] __schedule+0x264/0x5b8                                    
 [<00000000401523e4>] schedule+0x4c/0xc8                                        
 [<00000000401a12b8>] worker_thread+0x338/0x688                                 
 [<00000000401a976c>] kthread+0x144/0x178                                       
 [<0000000040148020>] end_fault_vector+0x20/0x28                                
                                                                                
Task dump for CPU 3:                                                            
systemd-udevd   R  running task        0   927    921 0x00000014                
Backtrace:                                                                      
 [<000000004015c0a8>] show_stack+0x20/0x38                                      
 [<00000000401b7e9c>] sched_show_task+0x134/0x1d0                               
 [<00000000401ba93c>] dump_cpu_task+0x64/0x80                                   
 [<00000000401e5dec>] rcu_dump_cpu_stacks+0xf4/0x180                            
 [<00000000401eaeac>] rcu_check_callbacks+0x5ac/0x9b8                           
 [<00000000401edacc>] update_process_times+0x74/0xd8                            
 [<000000004015d3c0>] timer_interrupt+0x1b0/0x210                               
 [<00000000401dad4c>] handle_irq_event_percpu+0xb4/0x250                        
 [<00000000401e06b4>] handle_percpu_irq+0xac/0xe8                               
 [<00000000401d9fc4>] generic_handle_irq+0x4c/0x68                              
 [<000000004014a2cc>] call_on_stack+0x18/0x24                                   
                                                                                
timer_interrupt(CPU 3): delayed! cycles 998573C3 rem 42393D  next/now 2EDA613C2F
NMI watchdog: BUG: soft lockup - CPU#3 stuck for 24s! [systemd-udevd:927]       
Modules linked in: sd_mod ohci_pci pata_sil680 mptspi ehci_pci ohci_hcd scsi_trd
CPU: 3 PID: 927 Comm: systemd-udevd Tainted: G      D W    L  4.5.0-rc5 #1      
task: 000000007f622b18 ti: 000000007e550000 task.ti: 000000007e550000           
                                                                                
     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI                                           
PSW: 00001000000001101111111100001111 Tainted: G      D W    L                  
r00-03  000000ff0806ff0f 000000007e551d10 0000000040202348 000000007e551c40     
r04-07  000000004070f340 000000007e551ce0 000000004079c560 000000004079c4a0     
r08-11  0000000042e4b360 0000000042e4b368 0000000000000001 00000000406e8360     
r12-15  0000000000000000 000000007e551ce0 0000000010201000 0000000040738340     
r16-19  000000007e551220 000000007fe8e800 000000007e71d800 0000000042e421d0     
r20-23  0000000000000001 0000000042e4b368 000000000800000f 0000000000000000     
r24-27  0000000000000000 0000000000000020 0000000042e4b368 000000004070f340     
r28-31  0000000000000002 000000007e551d60 000000007e551d10 0000000000000003     
sr00-03  000000000001b800 0000000000000000 0000000000000000 000000000001b800    
sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000    
                                                                                
IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000040202370 0000000040202374 
 IIR: 4a7f0030    ISR: 0000000000000000  IOR: 0000000002000200                  
 CPU:        3   CR30: 000000007e550000 CR31: fffffffffffeffff                  
 ORIG_R28: 0000000000000000                                                     
 IAOQ[0]: smp_call_function_many+0x338/0x3b0                                    
 IAOQ[1]: smp_call_function_many+0x33c/0x3b0                                    
 RP(r2): smp_call_function_many+0x310/0x3b0                                     
Backtrace:                                                                      
 [<00000000402024a0>] on_each_cpu+0x58/0xa0                                     
 [<0000000040159998>] flush_tlb_all+0x108/0x1e8                                 
 [<0000000040249600>] tlb_flush_mmu_tlbonly+0x48/0xa8                           
 [<000000004024a480>] tlb_finish_mmu+0x30/0x98                                  
 [<00000000402551dc>] exit_mmap+0x134/0x1b8                                     
 [<00000000401811d8>] mmput+0xc0/0x1a8                                          
 [<0000000040186438>] do_exit+0x320/0xcb8                                       
 [<000000004015c2d8>] die_if_kernel+0x1f8/0x2e0                                 
 [<000000004015d158>] handle_interruption+0x9a8/0x9d0                           
                                                                                
timer_interrupt(CPU 3): delayed! cycles 82907FF3 rem 90D60D  next/now 356676622F
NMI watchdog: BUG: soft lockup - CPU#3 stuck for 22s! [systemd-udevd:927]       
Modules linked in: sd_mod ohci_pci pata_sil680 mptspi ehci_pci ohci_hcd scsi_trd
CPU: 3 PID: 927 Comm: systemd-udevd Tainted: G      D W    L  4.5.0-rc5 #1      
task: 000000007f622b18 ti: 000000007e550000 task.ti: 000000007e550000           
                                                                                
     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI                                           
PSW: 00001000000001101111111100001111 Tainted: G      D W    L                  
r00-03  000000ff0806ff0f 000000007e551d10 0000000040202348 000000007e551c40     
r04-07  000000004070f340 000000007e551ce0 000000004079c560 000000004079c4a0     
r08-11  0000000042e4b360 0000000042e4b368 0000000000000001 00000000406e8360     
r12-15  0000000000000000 000000007e551ce0 0000000010201000 0000000040738340     
r16-19  000000007e551220 000000007fe8e800 000000007e71d800 0000000042e421d0     
r20-23  0000000000000001 0000000042e4b368 000000000800000f 0000000000000000     
r24-27  0000000000000000 0000000000000020 0000000042e4b368 000000004070f340     
r28-31  0000000000000002 000000007e551d60 000000007e551d10 0000000000000003     
sr00-03  000000000001b800 0000000000000000 0000000000000000 000000000001b800    
sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000    
                                                                                
IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000040202370 0000000040202374 
 IIR: 4a7f0030    ISR: 0000000000000000  IOR: 0000000002000200                  
 CPU:        3   CR30: 000000007e550000 CR31: fffffffffffeffff                  
 ORIG_R28: 0000000000000000                                                     
 IAOQ[0]: smp_call_function_many+0x338/0x3b0                                    
 IAOQ[1]: smp_call_function_many+0x33c/0x3b0                                    
 RP(r2): smp_call_function_many+0x310/0x3b0                                     
Backtrace:                                                                      
 [<00000000402024a0>] on_each_cpu+0x58/0xa0                                     
 [<0000000040159998>] flush_tlb_all+0x108/0x1e8                                 
 [<0000000040249600>] tlb_flush_mmu_tlbonly+0x48/0xa8                           
 [<000000004024a480>] tlb_finish_mmu+0x30/0x98                                  
 [<00000000402551dc>] exit_mmap+0x134/0x1b8                                     
 [<00000000401811d8>] mmput+0xc0/0x1a8                                          
 [<0000000040186438>] do_exit+0x320/0xcb8                                       
 [<000000004015c2d8>] die_if_kernel+0x1f8/0x2e0                                 
 [<000000004015d158>] handle_interruption+0x9a8/0x9d0                           
                                                                                
timer_interrupt(CPU 3): delayed! cycles 82919115 rem 8FC4EB  next/now 3BEB647A21
NMI watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [udevadm:929]             
Modules linked in: sd_mod ohci_pci pata_sil680 mptspi ehci_pci ohci_hcd scsi_trd
CPU: 1 PID: 929 Comm: udevadm Tainted: G      D W    L  4.5.0-rc5 #1            
task: 000000007f074d18 ti: 000000007c648000 task.ti: 000000007c648000           
                                                                                
     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI                                           
PSW: 00001000000001001111111100001111 Tainted: G      D W    L                  
r00-03  000000ff0804ff0f 000000007c648850 0000000040202348 000000007c648780     
r04-07  000000004070f340 000000007c648820 000000004079c560 000000004079c4a0     
r08-11  0000000042e29360 0000000042e29368 0000000000000001 00000000406e8360     
r12-15  0000000000000000 000000007c648820 00000000fa88bb88 0000000000000002     
r16-19  00000000fa889f20 0000000000000000 00000000000ce9f4 0000000042e42190     
r20-23  0000000000000001 0000000042e29368 000000000800000f 0000000000000000     
r24-27  0000000000000000 0000000000000020 0000000042e29368 000000004070f340     
r28-31  0000000000000002 000000007c6488a0 000000007c648850 0000000000000003     
sr00-03  0000000000015800 0000000000015800 0000000000000000 0000000000015800    
sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000    
                                                                                
IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000040202370 0000000040202374 
 IIR: 4a7f0030    ISR: 0000000000000000  IOR: 0000000002000200                  
 CPU:        1   CR30: 000000007c648000 CR31: ffffffffffffffff                  
 ORIG_R28: 0000000000000000                                                     
 IAOQ[0]: smp_call_function_many+0x338/0x3b0                                    
 IAOQ[1]: smp_call_function_many+0x33c/0x3b0                                    
 RP(r2): smp_call_function_many+0x310/0x3b0                                     
Backtrace:                                                                      
 [<00000000402024a0>] on_each_cpu+0x58/0xa0                                     
 [<0000000040159998>] flush_tlb_all+0x108/0x1e8                                 
 [<0000000040249600>] tlb_flush_mmu_tlbonly+0x48/0xa8                           
 [<000000004024a480>] tlb_finish_mmu+0x30/0x98                                  
 [<00000000402551dc>] exit_mmap+0x134/0x1b8                                     
 [<00000000401811d8>] mmput+0xc0/0x1a8                                          
 [<0000000040186438>] do_exit+0x320/0xcb8                                       
 [<00000000401880a0>] do_group_exit+0x50/0xf0                                   
 [<0000000040188160>] SyS_exit_group+0x20/0x28                                  
 [<0000000040149fe8>] syscall_exit+0x0/0x14                                     
                                                                                
timer_interrupt(CPU 1): delayed! cycles 84101F2A rem 4263D6  next/now 3CCB28AEFD
NMI watchdog: BUG: soft lockup - CPU#3 stuck for 22s! [systemd-udevd:927]       
Modules linked in: sd_mod ohci_pci pata_sil680 mptspi ehci_pci ohci_hcd scsi_trd
CPU: 3 PID: 927 Comm: systemd-udevd Tainted: G      D W    L  4.5.0-rc5 #1      
task: 000000007f622b18 ti: 000000007e550000 task.ti: 000000007e550000           
                                                                                
     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI                                           
PSW: 00001000000001101111111100001111 Tainted: G      D W    L                  
r00-03  000000ff0806ff0f 000000007e551d10 0000000040202348 000000007e551c40     
r04-07  000000004070f340 000000007e551ce0 000000004079c560 000000004079c4a0     
r08-11  0000000042e4b360 0000000042e4b368 0000000000000001 00000000406e8360     
r12-15  0000000000000000 000000007e551ce0 0000000010201000 0000000040738340     
r16-19  000000007e551220 000000007fe8e800 000000007e71d800 0000000042e421d0     
r20-23  0000000000000001 0000000042e4b368 000000000800000f 0000000000000000     
r24-27  0000000000000000 0000000000000020 0000000042e4b368 000000004070f340     
r28-31  0000000000000002 000000007e551d60 000000007e551d10 0000000000000003     
sr00-03  000000000001b800 0000000000000000 0000000000000000 000000000001b800    
sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000    
                                                                                
IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000040202370 0000000040202374 
 IIR: 4a7f0030    ISR: 0000000000000000  IOR: 0000000002000200                  
 CPU:        3   CR30: 000000007e550000 CR31: fffffffffffeffff                  
 ORIG_R28: 0000000000000000                                                     
 IAOQ[0]: smp_call_function_many+0x338/0x3b0                                    
 IAOQ[1]: smp_call_function_many+0x33c/0x3b0                                    
 RP(r2): smp_call_function_many+0x310/0x3b0                                     
Backtrace:                                                                      
 [<00000000402024a0>] on_each_cpu+0x58/0xa0                                     
 [<0000000040159998>] flush_tlb_all+0x108/0x1e8                                 
 [<0000000040249600>] tlb_flush_mmu_tlbonly+0x48/0xa8                           
 [<000000004024a480>] tlb_finish_mmu+0x30/0x98                                  
 [<00000000402551dc>] exit_mmap+0x134/0x1b8                                     
 [<00000000401811d8>] mmput+0xc0/0x1a8                                          
 [<0000000040186438>] do_exit+0x320/0xcb8                                       
 [<000000004015c2d8>] die_if_kernel+0x1f8/0x2e0                                 
 [<000000004015d158>] handle_interruption+0x9a8/0x9d0                           
                                                                                
timer_interrupt(CPU 3): delayed! cycles 829113E3 rem 90421D  next/now 427052922F
NMI watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [udevadm:929]             
Modules linked in: sd_mod ohci_pci pata_sil680 mptspi ehci_pci ohci_hcd scsi_trd
CPU: 1 PID: 929 Comm: udevadm Tainted: G      D W    L  4.5.0-rc5 #1            
task: 000000007f074d18 ti: 000000007c648000 task.ti: 000000007c648000           
                                                                                
     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI                                           
PSW: 00001000000001001111111100001111 Tainted: G      D W    L                  
r00-03  000000ff0804ff0f 000000007c648850 0000000040202348 000000007c648780     
r04-07  000000004070f340 000000007c648820 000000004079c560 000000004079c4a0     
r08-11  0000000042e29360 0000000042e29368 0000000000000001 00000000406e8360     
r12-15  0000000000000000 000000007c648820 00000000fa88bb88 0000000000000002     
r16-19  00000000fa889f20 0000000000000000 00000000000ce9f4 0000000042e42190     
r20-23  0000000000000001 0000000042e29368 000000000800000f 0000000000000000     
r24-27  0000000000000000 0000000000000020 0000000042e29368 000000004070f340     
r28-31  0000000000000002 000000007c6488a0 000000007c648850 0000000000000003     
sr00-03  0000000000015800 0000000000015800 0000000000000000 0000000000015800    
sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000    
                                                                                
IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000040202370 0000000040202374 
 IIR: 4a7f0030    ISR: 0000000000000000  IOR: 0000000002000200                  
 CPU:        1   CR30: 000000007c648000 CR31: ffffffffffffffff                  
 ORIG_R28: 0000000000000000                                                     
 IAOQ[0]: smp_call_function_many+0x338/0x3b0                                    
 IAOQ[1]: smp_call_function_many+0x33c/0x3b0                                    
 RP(r2): smp_call_function_many+0x310/0x3b0                                     
Backtrace:                                                                      
 [<00000000402024a0>] on_each_cpu+0x58/0xa0                                     
 [<0000000040159998>] flush_tlb_all+0x108/0x1e8                                 
 [<0000000040249600>] tlb_flush_mmu_tlbonly+0x48/0xa8                           
 [<000000004024a480>] tlb_finish_mmu+0x30/0x98                                  
 [<00000000402551dc>] exit_mmap+0x134/0x1b8                                     
 [<00000000401811d8>] mmput+0xc0/0x1a8                                          
 [<0000000040186438>] do_exit+0x320/0xcb8                                       
 [<00000000401880a0>] do_group_exit+0x50/0xf0                                   
 [<0000000040188160>] SyS_exit_group+0x20/0x28                                  
 [<0000000040149fe8>] syscall_exit+0x0/0x14                                     
                                                                                
timer_interrupt(CPU 1): delayed! cycles 840FA62E rem 42DCD2  next/now 435016C6F1

I've downloaded linux-block and I'll see if I can pin point the change that causes the problem.

Dave
--
John David Anglin	dave.anglin@bell.net



