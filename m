From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: SCSI bug
Date: Sun, 21 Feb 2016 10:13:01 -0800
Message-ID: <1456078381.2340.5.camel@HansenPartnership.com>
References: <28D5FC66-A9E6-4F3E-A8AC-F9E68A6BC543@bell.net>
	 <82D4BF6F-05CF-4441-9530-79475BFF84F3@bell.net>
	 <E2C8DBC2-F0AD-4C78-BD63-9C85B387E284@bell.net> <56C8E1AC.3030409@gmx.de>
	 <038473FE-9E6D-4F03-BBD4-9844B7B529E1@bell.net>
	 <9C42B388-96D5-412A-BAC3-14E93415CA21@bell.net>
	 <1456026424.2268.5.camel@HansenPartnership.com>
	 <14EF1F4E-8045-4990-B29E-D489E82B1929@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Helge Deller <deller@gmx.de>,
	linux-parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <14EF1F4E-8045-4990-B29E-D489E82B1929@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 2016-02-21 at 13:09 -0500, John David Anglin wrote:
> On 2016-02-20, at 10:47 PM, James Bottomley wrote:
> 
> > On Sat, 2016-02-20 at 21:52 -0500, John David Anglin wrote:
> > > On 2016-02-20, at 5:52 PM, John David Anglin wrote:
> > > 
> > > > On 2016-02-20, at 4:59 PM, Helge Deller wrote:
> > > > 
> > > > > On 20.02.2016 21:43, John David Anglin wrote:
> > > > > > On 2016-02-20, at 3:13 PM, John David Anglin wrote:
> > > > > > 
> > > > > > > On 2016-01-23, at 1:00 PM, John David Anglin wrote:
> > > > > > > 
> > > > > > > > WARNING: at block/blk-merge.c:454
> > > > > > > 
> > > > > > > With linux-image-4.4.0-1-parisc64-smp on c3740, the above
> > > > > > > warning is the last message I see.
> > > > > > > Kernel seems to hang at that point.  This is warning
> > > > > > > code:
> > > > > > > 
> > > > > > >     /*
> > > > > > >      * Something must have been wrong if the figured
> > > > > > > number
> > > > > > > of
> > > > > > >      * segment is bigger than number of req's physical
> > > > > > > segments
> > > > > > >      */
> > > > > > >     WARN_ON(nsegs > rq->nr_phys_segments);
> > > > > > 
> > > > > > On Sep. 12, 2015, I reported the following problem:
> > > > > > 
> > > > > > http://www.spinics.net/lists/linux-parisc/msg06327.html
> > > > > 
> > > > > The problem is still, that this bug can only be reproduced at
> > > > > every boot when then 
> > > > > scsi drivers are built as modules (and in an initrd). I could
> > > > > never reproduce it when
> > > > > I booted a kernel with built-in scsi drivers.
> > > > > 
> > > > > The bug seems to be triggered by(*nsegs)++ command in
> > > > > __blk_segment_map_sg() in block/blk-merge.c.
> > > > > I'm testing with the 4.4.2 kernel from debian.
> > > > > I modified __blk_segment_map_sg() like that:
> > > > > static inline void
> > > > > __blk_segment_map_sg(struct request_queue *q, struct bio_vec
> > > > > *bvec,
> > > > >                   struct scatterlist *sglist, struct bio_vec
> > > > > *bvprv,
> > > > >                   struct scatterlist **sg, int *nsegs, int
> > > > > *cluster)
> > > > > {
> > > > > 
> > > > >      int nbytes = bvec->bv_len;
> > > > > 
> > > > >      if (*sg && *cluster) {
> > > > >              if ((*sg)->length + nbytes >
> > > > > queue_max_segment_size(q))
> > > > >                      goto new_segment;
> > > > > 
> > > > >              if (!BIOVEC_PHYS_MERGEABLE(bvprv, bvec))
> > > > >                      goto new_segment;
> > > > >              if (!BIOVEC_SEG_BOUNDARY(q, bvprv, bvec))
> > > > >                      goto new_segment;
> > > > > 
> > > > >              (*sg)->length += nbytes;
> > > > >      } else {
> > > > > new_segment:
> > > > >              if (*sg && *cluster) {
> > > > >                      printk("NEW SEGMENT sg = %p!!!\n", sg);
> > > > >                      printk("__blk_segment_map_sg: length =
> > > > > %d,
> > > > > nbytes = %d, sum = %d > %d\n", (*sg)->length, nbytes, (*sg)
> > > > > ->length + nbytes, queue_max_segment_size(q));
> > > > >                      printk("__blk_segment_map_sg:
> > > > > BIOVEC_PHYS_MERGEABLE = %d, BIOVEC_SEG_BOUNDARY = %d\n",
> > > > > BIOVEC_PHYS_MERGEABLE(bvprv, bvec), BIOVEC_SEG_BOUNDARY(q,
> > > > > bvprv,
> > > > > bvec) );
> > > > >              }
> > > > >              if (!*sg)
> > > > >                      *sg = sglist;
> > > > >              else {
> > > > >                      /*
> > > > >                       * If the driver previously mapped a
> > > > > shorter
> > > > >                       * list, we could see a termination bit
> > > > >                       * prematurely unless it fully inits the
> > > > > sg
> > > > >                       * table on each mapping. We KNOW that
> > > > > there
> > > > >                       * must be more entries here or the
> > > > > driver
> > > > >                       * would be buggy, so force clear the
> > > > >                       * termination bit to avoid doing a full
> > > > >                       * sg_init_table() in drivers for each
> > > > > command.
> > > > >                       */
> > > > >                      sg_unmark_end(*sg);
> > > > >                      *sg = sg_next(*sg);
> > > > >              }
> > > > > 
> > > > >              sg_set_page(*sg, bvec->bv_page, nbytes, bvec
> > > > > ->bv_offset);
> > > > >              (*nsegs)++;
> > > > >      }
> > > > >      *bvprv = *bvec;
> > > > > }
> > > > > 
> > > > > The boot log looks then like this:
> > > > > [   43.044000] scsi_init_sgtable: count = 1, nents = 1
> > > > > (there are lots of those before it!)
> > > > > [   43.164000] scsi_init_sgtable: nr_phys_segments = 1
> > > > > [   43.164000] scsi_init_sgtable: count = 1, nents = 1
> > > > > [   43.280000] scsi_init_sgtable: nr_phys_segments = 1
> > > > > [   43.280000] scsi_init_sgtable: count = 1, nents = 1
> > > > > [   43.396000] scsi_init_sgtable: nr_phys_segments = 1
> > > > > [   43.396000] scsi_init_sgtable: count = 1, nents = 1
> > > > > [   43.512000] scsi_init_sgtable: nr_phys_segments = 1
> > > > > [   43.512000] scsi_init_sgtable: count = 1, nents = 1
> > > > > [   43.628000] scsi_init_sgtable: nr_phys_segments = 3
> > > > > [   43.628000] NEW SEGMENT sg = 000000007fa911e8!!!
> > > > > [   43.628000] __blk_segment_map_sg: length = 4096, nbytes =
> > > > > 4096, sum = 8192 > 65536
> > > > > [   43.628000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE =
> > > > > 0,
> > > > > BIOVEC_SEG_BOUNDARY = 1
> > > > > [   43.628000] NEW SEGMENT sg = 000000007fa911e8!!!
> > > > > [   43.628000] __blk_segment_map_sg: length = 4096, nbytes =
> > > > > 4096, sum = 8192 > 65536
> > > > > [   43.628000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE =
> > > > > 0,
> > > > > BIOVEC_SEG_BOUNDARY = 1
> > > > > [   43.628000] scsi_init_sgtable: count = 3, nents = 3
> > > > > [   44.224000] scsi_init_sgtable: nr_phys_segments = 1
> > > > > [   44.224000] scsi_init_sgtable: count = 1, nents = 1
> > > > > [   44.340000] scsi_init_sgtable: nr_phys_segments = 1
> > > > > [   44.340000] scsi_init_sgtable: count = 1, nents = 1
> > > > > [   44.456000] scsi_init_sgtable: nr_phys_segments = 7
> > > > > [   44.456000] NEW SEGMENT sg = 00000000bfca0f98!!!
> > > > > [   44.456000] __blk_segment_map_sg: length = 4096, nbytes =
> > > > > 4096, sum = 8192 > 65536
> > > > > [   44.456000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE =
> > > > > 0,
> > > > > BIOVEC_SEG_BOUNDARY = 1
> > > > > [   44.456000] NEW SEGMENT sg = 00000000bfca0f98!!!
> > > > > [   44.456000] __blk_segment_map_sg: length = 4096, nbytes =
> > > > > 4096, sum = 8192 > 65536
> > > > > [   44.456000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE =
> > > > > 0,
> > > > > BIOVEC_SEG_BOUNDARY = 1
> > > > > [   44.456000] NEW SEGMENT sg = 00000000bfca0f98!!!
> > > > > [   44.456000] __blk_segment_map_sg: length = 4096, nbytes =
> > > > > 4096, sum = 8192 > 65536
> > > > > [   44.456000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE =
> > > > > 0,
> > > > > BIOVEC_SEG_BOUNDARY = 1
> > > > > [   44.456000] NEW SEGMENT sg = 00000000bfca0f98!!!
> > > > > [   44.456000] __blk_segment_map_sg: length = 4096, nbytes =
> > > > > 4096, sum = 8192 > 65536
> > > > > [   44.456000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE =
> > > > > 0,
> > > > > BIOVEC_SEG_BOUNDARY = 1
> > > > > [   44.456000] NEW SEGMENT sg = 00000000bfca0f98!!!
> > > > > [   44.456000] __blk_segment_map_sg: length = 4096, nbytes =
> > > > > 4096, sum = 8192 > 65536
> > > > > [   44.456000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE =
> > > > > 0,
> > > > > BIOVEC_SEG_BOUNDARY = 1
> > > > > [   44.456000] NEW SEGMENT sg = 00000000bfca0f98!!!
> > > > > [   44.456000] __blk_segment_map_sg: length = 4096, nbytes =
> > > > > 4096, sum = 8192 > 65536
> > > > > [   44.456000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE =
> > > > > 0,
> > > > > BIOVEC_SEG_BOUNDARY = 1
> > > > > [   44.456000] scsi_init_sgtable: count = 7, nents = 7
> > > > > [   44.456000] timer_interrupt(CPU 0): delayed! cycles
> > > > > 4527081F
> > > > > rem C6C21  next/now 14E153306E/14E146C44D
> > > > > [   46.116000] scsi_init_sgtable: nr_phys_segments = 7
> > > > > [   46.116000] NEW SEGMENT sg = 00000000bfca0f98!!!
> > > > > [   46.116000] __blk_segment_map_sg: length = 4096, nbytes =
> > > > > 4096, sum = 8192 > 65536
> > > > > [   46.116000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE =
> > > > > 0,
> > > > > BIOVEC_SEG_BOUNDARY = 1
> > > > > [   46.116000] NEW SEGMENT sg = 00000000bfca0f98!!!
> > > > > [   46.116000] __blk_segment_map_sg: length = 4096, nbytes =
> > > > > 4096, sum = 8192 > 65536
> > > > > [   46.116000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE =
> > > > > 0,
> > > > > BIOVEC_SEG_BOUNDARY = 1
> > > > > [   46.116000] NEW SEGMENT sg = 00000000bfca0f98!!!
> > > > > [   46.116000] __blk_segment_map_sg: length = 4096, nbytes =
> > > > > 4096, sum = 8192 > 65536
> > > > > [   46.116000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE =
> > > > > 0,
> > > > > BIOVEC_SEG_BOUNDARY = 1
> > > > > [   46.116000] NEW SEGMENT sg = 00000000bfca0f98!!!
> > > > > [   46.116000] __blk_segment_map_sg: length = 4096, nbytes =
> > > > > 4096, sum = 8192 > 65536
> > > > > [   46.116000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE =
> > > > > 0,
> > > > > BIOVEC_SEG_BOUNDARY = 1
> > > > > [   46.116000] NEW SEGMENT sg = 00000000bfca0f98!!!
> > > > > [   46.116000] __blk_segment_map_sg: length = 8192, nbytes =
> > > > > 4096, sum = 12288 > 65536
> > > > > [   46.116000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE =
> > > > > 0,
> > > > > BIOVEC_SEG_BOUNDARY = 1
> > > > > [   46.116000] NEW SEGMENT sg = 00000000bfca0f98!!!
> > > > > [   46.116000] __blk_segment_map_sg: length = 16384, nbytes =
> > > > > 4096, sum = 20480 > 65536
> > > > > [   46.116000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE =
> > > > > 0,
> > > > > BIOVEC_SEG_BOUNDARY = 1
> > > > > [   46.116000] scsi_init_sgtable: count = 7, nents = 7
> > > > > [   46.116000] timer_interrupt(CPU 0): delayed! cycles
> > > > > 453F0A77
> > > > > rem 223089  next/now 152BB6286E/152B93F7E5
> > > > > [   47.780000] scsi_init_sgtable: nr_phys_segments = 1
> > > > > [   47.780000] scsi_init_sgtable: count = 1, nents = 1
> > > > > [   47.896000] scsi_init_sgtable: nr_phys_segments = 6
> > > > > [   47.896000] NEW SEGMENT sg = 000000007fa911e8!!!
> > > > > [   47.896000] __blk_segment_map_sg: length = 61440, nbytes =
> > > > > 4096, sum = 65536 > 65536
> > > > > [   47.896000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE =
> > > > > 0,
> > > > > BIOVEC_SEG_BOUNDARY = 1
> > > > > [   47.896000] NEW SEGMENT sg = 000000007fa911e8!!!
> > > > > [   47.896000] __blk_segment_map_sg: length = 4096, nbytes =
> > > > > 4096, sum = 8192 > 65536
> > > > > [   47.896000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE =
> > > > > 0,
> > > > > BIOVEC_SEG_BOUNDARY = 1
> > > > > [   47.896000] NEW SEGMENT sg = 000000007fa911e8!!!
> > > > > [   47.896000] __blk_segment_map_sg: length = 4096, nbytes =
> > > > > 4096, sum = 8192 > 65536
> > > > > [   47.896000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE =
> > > > > 0,
> > > > > BIOVEC_SEG_BOUNDARY = 1
> > > > > [   47.896000] NEW SEGMENT sg = 000000007fa911e8!!!
> > > > > [   47.896000] __blk_segment_map_sg: length = 8192, nbytes =
> > > > > 4096, sum = 12288 > 65536
> > > > > [   47.896000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE =
> > > > > 0,
> > > > > BIOVEC_SEG_BOUNDARY = 1
> > > > > [   47.896000] NEW SEGMENT sg = 000000007fa911e8!!!
> > > > > [   47.896000] __blk_segment_map_sg: length = 8192, nbytes =
> > > > > 4096, sum = 12288 > 65536
> > > > > [   47.896000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE =
> > > > > 0,
> > > > > BIOVEC_SEG_BOUNDARY = 1
> > > > > [   47.896000] scsi_init_sgtable: count = 6, nents = 6
> > > > > [   47.896000] timer_interrupt(CPU 0): delayed! cycles
> > > > > 3AB087E2
> > > > > rem 23E4DE  next/now 1570BBD5EE/157097F110
> > > > > [   49.324000] scsi_init_sgtable: nr_phys_segments = 1
> > > > > [   49.324000] scsi_init_sgtable: count = 1, nents = 1
> > > > > [   49.440000] scsi_init_sgtable: nr_phys_segments = 2
> > > > > [   49.440000] NEW SEGMENT sg = 000000007fa911e8!!!
> > > > > [   49.440000] __blk_segment_map_sg: length = 65536, nbytes =
> > > > > 4096, sum = 69632 > 65536
> > > > > 
> > > > > (this is interesting! Here we reach a sum of > 65536 the
> > > > > first
> > > > > time)
> > > > > 
> > > > > [   49.440000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE =
> > > > > 1,
> > > > > BIOVEC_SEG_BOUNDARY = 1
> > > > > [   49.440000] NEW SEGMENT sg = 000000007fa911e8!!!
> > > > > [   49.440000] __blk_segment_map_sg: length = 16384, nbytes =
> > > > > 4096, sum = 20480 > 65536
> > > > > [   49.440000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE =
> > > > > 0,
> > > > > BIOVEC_SEG_BOUNDARY = 1
> > > > > [   49.440000] *** FIXIT *** HELGE: nsegs > rq
> > > > > ->nr_phys_segments
> > > > > = 3 > 2
> > > > > [   49.440000] scsi_init_sgtable: count = 3, nents = 2
> > > > > [   50.116000] ------------[ cut here ]------------
> > > > > [   50.172000] WARNING: at /build/linux-4.4/linux
> > > > > -4.4.2/drivers/scsi/scsi_lib.c:1104
> > > > > 
> > > > > (this is usually a BUG(). I changed it to WARN() in the hope
> > > > > it
> > > > > would work anyway. It didn't.)
> > > > > 
> > > > > [   50.260000] Modules linked in: sd_mod sr_mod cdrom
> > > > > ata_generic
> > > > > ohci_pci ehci_pci ohci_hcd ehci_hcd pata_ns87415 sym53c8xx
> > > > > libata
> > > > > scsi_transport_spi scsi_mod usbcorep
> > > > > [   50.456000] CPU: 0 PID: 70 Comm: systemd-udevd Not tainted
> > > > > 4.4.0-1-parisc64-smp #5 Debian 4.4.2-2
> > > > > [   50.564000] task: 000000007f948b28 ti: 000000007fa90000
> > > > > task.ti: 000000007fa90000
> > > > > [   50.652000] 
> > > > > [   50.672000]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> > > > > [   50.728000] PSW: 00001000000001001111100100001110 Not
> > > > > tainted
> > > > > [   50.796000] r00-03  000000ff0804f90e 00000000409ea2e0
> > > > > 00000000003e2ee0 000000007fa91140
> > > > > [   50.892000] r04-07  00000000003cd000 000000007f914300
> > > > > 000000007f914b10 0000000000000003
> > > > > [   50.988000] r08-11  0000000000000000 000000007f918000
> > > > > 0000000040bdd6b0 00000000003cd800
> > > > > [   51.084000] r12-15  0000000000000000 000000007fa90778
> > > > > 00000000003cd000 000000007f918000
> > > > > [   51.180000] r16-19  0000000000001300 0000000040bdd6b8
> > > > > 0000000040bdd6bc 0000000040ba2420
> > > > > [   51.276000] r20-23  0000000099116e92 0000000000000000
> > > > > 00000000000002a0 00000000000002ee
> > > > > [   51.372000] r24-27  0000000000000000 000000000800000e
> > > > > 0000000040b60750 00000000409b3ae0
> > > > > [   51.468000] r28-31  0000000000000002 000000007fa914f0
> > > > > 000000007fa911e0 0000000040ba2408
> > > > > [   51.564000] sr00-03  0000000000015000 0000000000000000
> > > > > 0000000000000000 0000000000015000
> > > > > [   51.660000] sr04-07  0000000000000000 0000000000000000
> > > > > 0000000000000000 0000000000000000
> > > > > [   51.756000] 
> > > > > [   51.772000] IASQ: 0000000000000000 0000000000000000 IAOQ:
> > > > > 00000000003e2f24 00000000003e2f28
> > > > > [   51.872000]  IIR: 03ffe01f    ISR: 0000000010340000  IOR:
> > > > > 000000fea4691528
> > > > > [   51.956000]  CPU:        0   CR30: 000000007fa90000 CR31:
> > > > > 00000000ffff7dff
> > > > > [   52.040000]  ORIG_R28: 0000000040b60718
> > > > > [   52.084000]  IAOQ[0]: scsi_init_sgtable+0xfc/0x1b8
> > > > > [scsi_mod]
> > > > > [   52.152000]  IAOQ[1]: scsi_init_sgtable+0x100/0x1b8
> > > > > [scsi_mod]
> > > > > [   52.224000]  RP(r2): scsi_init_sgtable+0xb8/0x1b8
> > > > > [scsi_mod]
> > > > > [   52.292000] Backtrace:
> > > > > [   52.320000]  [<00000000003e304c>] scsi_init_io+0x6c/0x258
> > > > > [scsi_mod]
> > > > > [   52.396000]  [<000000000087d078>]
> > > > > sd_init_command+0x70/0xec8
> > > > > [sd_mod]
> > > > > 
> > > > > In general I think the bug is somehow in blk-merge.c.
> > > > > But I'm not an expert in that code.
> > > > 
> > > > The warning was added in this patch sequence:
> > > > https://lkml.org/lkml/2015/11/23/996
> > > > 
> > > > Possibly, but above seems to indicate that it could be driver
> > > > issue
> > > > as well.
> > > 
> > > 
> > > I believe this bug was introduced by the following merge:
> > > 
> > > commit 1081230b748de8f03f37f80c53dfa89feda9b8de
> > > Merge: df91039 2ca495a
> > > Author: Linus Torvalds <torvalds@linux-foundation.org>
> > > Date:   Wed Sep 2 13:10:25 2015 -0700
> > > 
> > >    Merge branch 'for-4.3/core' of git://git.kernel.dk/linux-block
> > > 
> > >    Pull core block updates from Jens Axboe:
> > >     "This first core part of the block IO changes contains:
> > > 
> > >       - Cleanup of the bio IO error signaling from Christoph.  We
> > > used to
> > >         rely on the uptodate bit and passing around of an error,
> > > now
> > > we
> > >         store the error in the bio itself.
> > > 
> > >       - Improvement of the above from myself, by shrinking the
> > > bio
> > > size
> > >         down again to fit in two cachelines on x86-64.
> > > 
> > >       - Revert of the max_hw_sectors cap removal from a revision
> > > again,
> > >         from Jeff Moyer.  This caused performance regressions in
> > > various
> > >         tests.  Reinstate the limit, bump it to a more reasonable
> > > size
> > >         instead.
> > > 
> > >       - Make /sys/block/<dev>/queue/discard_max_bytes writeable,
> > > by
> > > me.
> > >         Most devices have huge trim limits, which can cause nasty
> > > latencies
> > >         when deleting files.  Enable the admin to configure the
> > > size
> > > down.
> > >         We will look into having a more sane default instead of
> > > UINT_MAX
> > >         sectors.
> > > 
> > >       - Improvement of the SGP gaps logic from Keith Busch.
> > > 
> > >       - Enable the block core to handle arbitrarily sized bios,
> > > which
> > >         enables a nice simplification of bio_add_page() (which is
> > > an
> > > IO hot
> > >         path).  From Kent.
> > > 
> > >       - Improvements to the partition io stats accounting, making
> > > it
> > >         faster.  From Ming Lei.
> > > 
> > >       - Also from Ming Lei, a basic fixup for overflow of the
> > > sysfs
> > > pending
> > >         file in blk-mq, as well as a fix for a blk-mq timeout
> > > race
> > >         condition.
> > > 
> > >       - Ming Lin has been carrying Kents above mentioned patches
> > > forward
> > >         for a while, and testing them.  Ming also did a few fixes
> > > around
> > >         that.
> > > 
> > >       - Sasha Levin found and fixed a use-after-free problem
> > > introduced by
> > >         the bio->bi_error changes from Christoph.
> > > 
> > >       - Small blk cgroup cleanup from Viresh Kumar"
> > > 
> > >    * 'for-4.3/core' of git://git.kernel.dk/linux-block: (26
> > > commits)
> > >      blk: Fix bio_io_vec index when checking bvec gaps
> > >      block: Replace SG_GAPS with new queue limits mask
> > >      block: bump BLK_DEF_MAX_SECTORS to 2560
> > >      Revert "block: remove artifical max_hw_sectors cap"
> > >      blk-mq: fix race between timeout and freeing request
> > >      blk-mq: fix buffer overflow when reading sysfs file of
> > > 'pending'
> > >      Documentation: update notes in biovecs about arbitrarily
> > > sized
> > > bios
> > >      block: remove bio_get_nr_vecs()
> > >      fs: use helper bio_add_page() instead of open coding on
> > > bi_io_vec
> > >      block: kill merge_bvec_fn() completely
> > >      md/raid5: get rid of bio_fits_rdev()
> > >      md/raid5: split bio for chunk_aligned_read
> > >      block: remove split code in
> > > blkdev_issue_{discard,write_same}
> > >      btrfs: remove bio splitting and merge_bvec_fn() calls
> > >      bcache: remove driver private bio splitting code
> > >      block: simplify bio_add_page()
> > >      block: make generic_make_request handle arbitrarily sized
> > > bios
> > >      blk-cgroup: Drop unlikely before IS_ERR(_OR_NULL)
> > >      block: don't access bio->bi_error after bio_put()
> > >      block: shrink struct bio down to 2 cache lines again
> > >      ...
> > 
> > If you can bisect it down to the exact commit, I might be able to
> > work
> > out what's the problem.  Otherwise, even in an all modular config,
> > I
> > can't reproduce this on 4.5-rc4, so it may be fixed upstream (just
> > not
> > backported).
> 
> 
> Okay, the bug was introduced by the following change:
> 
> commit 54efd50bfd873e2dbf784e0b21a8027ba4299a3e
> Author: Kent Overstreet <kent.overstreet@gmail.com>

If you've verified that reverting this alone gets you a bootable
kernel, it's time to report it to the appropriate lists, which would be
linux-block and linux-scsi.

James


