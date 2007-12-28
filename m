From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: iommu_fill_pdir() and its /* Horrible hack. ... */ reading.
Date: Fri, 28 Dec 2007 01:27:02 -0700
Message-ID: <20071228082702.GE17782@colo.lackof.org>
References: <476CFFE3.3040102@scarlet.be> <20071223093903.GA30259@colo.lackof.org> <476EE63A.9080807@scarlet.be> <20071224085159.GC15161@colo.lackof.org> <47729007.8030807@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: rubisher <rubisher@scarlet.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <47729007.8030807@scarlet.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi,

On Wed, Dec 26, 2007 at 05:31:51PM +0000, rubisher wrote:
> Hello Grant,
>
> I suspecting a possible issue with this hack in your iommu_fill_pdir():
>
> you initialized dma_sg with the adress of startsg (/* pointer to current 
> DMA */)
> then before the loop you dma_sg--;

Yes. The comment before that line explains why it does that.

...
> Now in the while (nents-- > 0), suppose the test "if 
> (sg_dma_address(startsg) & PIDE_FLAG) {" failed,

Do you have any evidence this test has failed when dma_sg is pointing
at garbage?

While possible, that would be a bug in iommu_coalesce_chunks()
for not setting PIDE_FLAG.

> so later in the loop the "sg_dma_len(dma_sg) += startsg->length" (which is 
> actually "dma_sg->iova_length += startsg->length" ) imo could corrupt 
> something?

Yes, that would be the result. Can you try a bug catcher to prove
that's something is actually getting corrupted?

Add something like the following around line 65 (before "sg_dma_len(dma_sg)"
is assigned):
	BUG_ON(dma_sg < startsg);


On the same note, line 44 is clearly wrong:
 41                 if (sg_dma_address(startsg) & PIDE_FLAG) {
 42                         u32 pide = sg_dma_address(startsg) & ~PIDE_FLAG;
 43 
 44                         BUG_ON(pdirp && (dma_len != sg_dma_len(dma_sg)));
 45 
 46                         dma_sg++;

The BUG_ON at line 44 might fail when it shouldn't (and vice versa).
My preference is to remove it or put "#ifdef DEBUG_IOMMU" around
that line of code (not literally, but effectively).


In general, I didn't like the "pre-decrement" but it seems to work and
makes the code a bit more efficient. Efficiency is extremely important
for this code since it gets called so often. Small changes can have
easily measured impact.

> That said I tried to re-use the first implementation of jejb (what was in 
> ccio-dma.c before this patch 
> <http://cvs.parisc-linux.org/linux-2.6/drivers/parisc/ccio-dma.c?r1=1.12&r2=1.13> 
> but that doesn't seems to fix the ccio-dma issue at all: I can still read 
> those kind of message at the console while doing such copy
> [snip]
> scsi1: (4:0) phase mismatch at 01e8, phase IO CD MSG BSY REQ MSG IN
> scsi1: Bus Reset detected, executing command 10953600, slot 109708a4, dsp 
> 001301e8[01e8] 

I'm thinking we really need SCSI bus traces to figure out if the SCSI driver
is doing the right thing and if not, exactly what is it doing.

If it is a CCIO bug, my guess is it's more likely to be problems with
setting magic bits.  We really need the ERS to review register settings.

..
> (the scsi1 is the lasi scsi hba as sources and the target being the disks 
> on ncr53c720 hba)
>
> or experimenting fs issues on this target disks?

I doubt this is a file system problem.

> That said ok I will wait either U2/Uturn ers public doc or all volonteers 
> feedback.

I'm skeptical for the former and hopeful for the latter.
There is a chance Linux Foundation could ask HP for those docs under NDA.
But you need to sign up with Linux Foundataion as a developer and
then request HP for those docs.

cheers,
grant
