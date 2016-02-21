From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: SCSI bug
Date: Sun, 21 Feb 2016 12:28:10 -0800
Message-ID: <1456086490.2340.18.camel@HansenPartnership.com>
References: <28D5FC66-A9E6-4F3E-A8AC-F9E68A6BC543@bell.net>
	 <82D4BF6F-05CF-4441-9530-79475BFF84F3@bell.net>
	 <E2C8DBC2-F0AD-4C78-BD63-9C85B387E284@bell.net> <56C8E1AC.3030409@gmx.de>
	 <038473FE-9E6D-4F03-BBD4-9844B7B529E1@bell.net>
	 <9C42B388-96D5-412A-BAC3-14E93415CA21@bell.net>
	 <1456026424.2268.5.camel@HansenPartnership.com>
	 <14EF1F4E-8045-4990-B29E-D489E82B1929@bell.net>
	 <1456078381.2340.5.camel@HansenPartnership.com>
	 <D14AFC12-8245-4862-9FFA-92A4F114FC41@bell.net>
	 <1456081676.2340.10.camel@HansenPartnership.com> <56CA11D2.3020900@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: linux-parisc List <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <56CA11D2.3020900@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 2016-02-21 at 20:36 +0100, Helge Deller wrote:
> On 21.02.2016 20:07, James Bottomley wrote:
> > On Sun, 2016-02-21 at 13:43 -0500, John David Anglin wrote:
> > > I verified that commit 54efd50bfd873e2dbf784e0b21a8027ba4299a3e
> > > in
> > > linux-block fails to
> > > boot and commit 41609892701e26724b8617201f43254cadf2e7ae (blk
> > > -cgroup:
> > > Drop unlikely
> > > before IS_ERR(_OR_NULL)) does boot successfully.  Commit
> > > 41609892701e26724b8617201f43254cadf2e7ae
> > > is previous commit in tree.
> > > 
> > > I don't believe that the change can be reverted from Linus' tree
> > > as
> > > this commit allowed other
> > > stuff to be removed (see second paragraph of commit description).
> > 
> > OK, can you just verify you can boot 4.5-rc5 without the sata_sil24
> > driver?
> 
> I tried it on my c3000, debian kernel 4.4.2, in this case without the
> pata_ns87415.
> I used "modprobe.blacklist=libata,pata_ns87415,ata_generic" as
> additional 
> kernel command line option. 
> 
> [   45.980000] NEW SEGMENT sg = 00000000bbe991e8!!!
> [   45.980000] __blk_segment_map_sg: length = 12288, nbytes = 4096,
> sum = 16384 > 65536
> [   45.980000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE = 0,
> BIOVEC_SEG_BOUNDARY = 1
> [   45.980000] NEW SEGMENT sg = 00000000bbe991e8!!!
> [   45.980000] __blk_segment_map_sg: length = 65536, nbytes = 4096,
> sum = 69632 > 65536
> 
> ^^ here.
> 
> [   45.980000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE = 1,
> BIOVEC_SEG_BOUNDARY = 1
> [   45.980000] NEW SEGMENT sg = 00000000bbe991e8!!!
> [   45.980000] __blk_segment_map_sg: length = 12288, nbytes = 4096,
> sum = 16384 > 65536
> [   45.980000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE = 0,
> BIOVEC_SEG_BOUNDARY = 1
> [   45.980000] NEW SEGMENT sg = 00000000bbe991e8!!!
> [   45.980000] __blk_segment_map_sg: length = 4096, nbytes = 4096,
> sum = 8192 > 65536
> [   45.980000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE = 0,
> BIOVEC_SEG_BOUNDARY = 1
> [   45.980000] NEW SEGMENT sg = 00000000bbe991e8!!!
> [   45.980000] __blk_segment_map_sg: length = 4096, nbytes = 4096,
> sum = 8192 > 65536
> [   45.980000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE = 0,
> BIOVEC_SEG_BOUNDARY = 1
> [   45.980000] NEW SEGMENT sg = 00000000bbe991e8!!!
> [   45.980000] __blk_segment_map_sg: length = 4096, nbytes = 4096,
> sum = 8192 > 65536
> [   45.980000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE = 0,
> BIOVEC_SEG_BOUNDARY = 1
> [   45.980000] NEW SEGMENT sg = 00000000bbe991e8!!!
> [   45.980000] __blk_segment_map_sg: length = 4096, nbytes = 4096,
> sum = 8192 > 65536
> [   45.980000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE = 0,
> BIOVEC_SEG_BOUNDARY = 1
> [   45.980000] NEW SEGMENT sg = 00000000bbe991e8!!!
> [   45.980000] __blk_segment_map_sg: length = 4096, nbytes = 4096,
> sum = 8192 > 65536
> [   45.980000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE = 0,
> BIOVEC_SEG_BOUNDARY = 1
> [   45.980000] NEW SEGMENT sg = 00000000bbe991e8!!!
> [   45.980000] __blk_segment_map_sg: length = 4096, nbytes = 4096,
> sum = 8192 > 65536
> [   45.980000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE = 0,
> BIOVEC_SEG_BOUNDARY = 1
> [   45.980000] NEW SEGMENT sg = 00000000bbe991e8!!!
> [   45.980000] __blk_segment_map_sg: length = 4096, nbytes = 4096,
> sum = 8192 > 65536
> [   45.980000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE = 0,
> BIOVEC_SEG_BOUNDARY = 1
> [   45.980000] *** FIXIT *** HELGE: nsegs > rq->nr_phys_segments = 11
> > 10
> [   45.980000] scsi_init_sgtable: count = 11, nents = 10
> 
> ^^ here
> 
> [   45.980000] timer_interrupt(CPU 0): delayed! cycles 73C0F821 rem
> 1E1DDF  next/now 1D78B3071C/1D7894E93D
> [   48.684000] ------------[ cut here ]------------
> [   48.740000] WARNING: at /build/linux-4.4/linux
> -4.4.2/drivers/scsi/scsi_lib.c:1104
> [   48.828000] Modules linked in: sd_mod ohci_pci ehci_pci ohci_hcd
> ehci_hcd sym53c8xx scsi_transport_spi usbcore scsi_mod usb_common
> tulip
> [   48.976000] CPU: 0 PID: 66 Comm: systemd-udevd Not tainted 4.4.0-1
> -parisc64-smp #5 Debian 4.4.2-2
> [   49.084000] task: 00000000bbe97538 ti: 00000000bbe98000 task.ti:
> 00000000bbe98000
> 
>  
> > My theory, based on what Helge produced is that this commit is
> > building
> > a large transfer list > 65535 and then splitting it wrongly.  
> 
> Yes, this theory sounds right.
> 
> > I think
> > the problem is that it's not respecting the DMA boundary, so Helge
> > sees
> > a transfer size of 69632 which I think slops over on both sides,
> > requiring 3 segments to describe.  However, the merge code thinks
> > we
> > only need two (because the length is < 2*65536).  The reason we
> > only
> > see this with ATA drivers is because virtually no SCSI drivers set
> > the
> > DMA boundary.  Most ATA drivers require a dma boundary of 65535.
> 
> In my test above there is no ATA driver included, only SCSI discs.

Heh, well, it's a combination of problems.  Apparently in parisc we
don't set the max segment size, so we inherit 64k even in SCSI drivers.

That said, I still can't reproduce this, so you're going to have to
help me find it.  Current theory is ll_merge_request_fn() it looks like
there's scope for miscalculation in there.  Can you instrument this
line

	/* Merge is OK... */
	req->nr_phys_segments = total_phys_segments;

To add just before the return

if (req->nr_phys_segments != __blk_recalc_rq_segments(rq->q, rq->bio,	false) 
	printk("MISMATCH IN MERGE: got %d, should get %d\n", 
		req->nr_phys_segments,
		__blk_recalc_rq_segments(rq->q, rq->bio, false));

Thanks,

James

