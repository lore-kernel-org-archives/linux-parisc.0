From: rubisher <rubisher@scarlet.be>
Subject: Re: iommu_fill_pdir() and its /* Horrible hack. ... */ reading.
Date: Fri, 28 Dec 2007 15:27:04 +0000
Message-ID: <477515C8.1000204@scarlet.be>
References: <476CFFE3.3040102@scarlet.be> <20071223093903.GA30259@colo.lackof.org> <476EE63A.9080807@scarlet.be> <20071224085159.GC15161@colo.lackof.org> <47729007.8030807@scarlet.be> <20071228082702.GE17782@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: linux-parisc@vger.kernel.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20071228082702.GE17782@colo.lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Grant Grundler wrote:
> Hi,
> 
> On Wed, Dec 26, 2007 at 05:31:51PM +0000, rubisher wrote:
>> Hello Grant,
>>
>> I suspecting a possible issue with this hack in your iommu_fill_pdir():
>>
>> you initialized dma_sg with the adress of startsg (/* pointer to current 
>> DMA */)
>> then before the loop you dma_sg--;
> 
> Yes. The comment before that line explains why it does that.
> 
> ...
>> Now in the while (nents-- > 0), suppose the test "if 
>> (sg_dma_address(startsg) & PIDE_FLAG) {" failed,
> 
> Do you have any evidence this test has failed when dma_sg is pointing
> at garbage?
> 
> While possible, that would be a bug in iommu_coalesce_chunks()
> for not setting PIDE_FLAG.
> 
>> so later in the loop the "sg_dma_len(dma_sg) += startsg->length" (which is 
>> actually "dma_sg->iova_length += startsg->length" ) imo could corrupt 
>> something?
> 
> Yes, that would be the result. Can you try a bug catcher to prove
> that's something is actually getting corrupted?
> 
> Add something like the following around line 65 (before "sg_dma_len(dma_sg)"
> is assigned):
> 	BUG_ON(dma_sg < startsg);
> 
> 
> On the same note, line 44 is clearly wrong:
>  41                 if (sg_dma_address(startsg) & PIDE_FLAG) {
>  42                         u32 pide = sg_dma_address(startsg) & ~PIDE_FLAG;
>  43 
>  44                         BUG_ON(pdirp && (dma_len != sg_dma_len(dma_sg)));
>  45 
>  46                         dma_sg++;
> 
> The BUG_ON at line 44 might fail when it shouldn't (and vice versa).
> My preference is to remove it or put "#ifdef DEBUG_IOMMU" around
> that line of code (not literally, but effectively).
> 
Good idea:
here is the patch I used:
Index: linux-current/drivers/parisc/iommu-helpers.h
===================================================================
--- linux-current.orig/drivers/parisc/iommu-helpers.h   2007-12-28 12:59:35.000000000 +0000
+++ linux-current/drivers/parisc/iommu-helpers.h        2007-12-28 12:45:29.000000000 +0000
@@ -22,14 +22,14 @@
         /* Horrible hack.  For efficiency's sake, dma_sg starts one
          * entry below the true start (it is immediately incremented
          * in the loop) */
-        dma_sg--;
+       dma_sg--;

         while (nents-- > 0) {
                 unsigned long vaddr;
                 long size;

                 DBG_RUN_SG(" %d : %08lx/%05x %08lx/%05x\n", nents,
-                          (unsigned long)sg_dma_address(startsg), cnt,
+                          (unsigned long)sg_dma_address(startsg), sg_dma_len(startsg),
                            sg_virt_addr(startsg), startsg->length
                 );

@@ -41,7 +41,9 @@
                 if (sg_dma_address(startsg) & PIDE_FLAG) {
                         u32 pide = sg_dma_address(startsg) & ~PIDE_FLAG;

+#ifdef DEBUG_IOMMU
                         BUG_ON(pdirp && (dma_len != sg_dma_len(dma_sg)));
+#endif

                         dma_sg++;

@@ -62,6 +64,7 @@
                         prefetchw(pdirp);
                 }

+               BUG_ON(dma_sg < startsg);
                 BUG_ON(pdirp == NULL);

                 vaddr = sg_virt_addr(startsg);
=== <> ===

And :<(
------------[ cut here ]------------ 

kernel BUG at /CAD/linux-2.6.23-pa-git-20071022/drivers/parisc/iommu-helpers.h:67! 

 

      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI 

PSW: 00000000000001001111011100001110 Not tainted 

r00-03  0004f70e fff0bdc0 10212064 107dd000 

r04-07  00000000 10880d48 00000001 00000006 

r08-11  108fc8a0 10440e10 00000001 108fc8a0 

r12-15  10000000 00008000 00000005 0000000e 

r16-19  1084c800 1081880c 10387964 007dc005 

r20-23  10491000 00001000 00000000 00000005 

r24-27  107dc000 07dc0000 10880d40 103dee10 

r28-31  00000000 00000000 10819080 108fc8b4 

sr00-03  00000000 00000000 00000000 00000000 

sr04-07  00000000 00000000 00000000 00000000 

 

IASQ: 00000000 00000000 IAOQ: 102120a8 102120ac 

  IIR: 03ffe01f    ISR: 00000000  IOR: 108fc8b4 

  CPU:        0   CR30: 10818000 CR31: f01043c0 

  ORIG_R28: aac6ca23 

  IAOQ[0]: ccio_map_sg+0x22c/0x3a8 

  IAOQ[1]: ccio_map_sg+0x230/0x3a8 

  RP(r2): ccio_map_sg+0x1e8/0x3a8 

Backtrace: 

  [<10107164>] die_if_kernel+0xa0/0x1b0 

  [<10107898>] handle_interruption+0x624/0x6b4 

  [<1010b078>] intr_check_sig+0x0/0x34 

  [<10121574>] enqueue_task+0x28/0x44 

  [<102120ac>] ccio_map_sg+0x230/0x3a8 

  [<10171428>] do_filp_open+0x54/0x68 

  [<10211fd8>] ccio_map_sg+0x15c/0x3a8 

  [<10266d2c>] scsi_dma_map+0x48/0x58 

  [<1027597c>] NCR_700_queuecommand+0x38c/0x504 

  [<10260368>] scsi_dispatch_cmd+0x118/0x288 

  [<1026664c>] scsi_request_fn+0x184/0x2e0 

  [<101fb440>] __generic_unplug_device+0x38/0x44 

  [<101fb7fc>] generic_unplug_device+0x14/0x24 

  [<101f841c>] blk_backing_dev_unplug+0x1c/0x28 

  [<10198b18>] sync_buffer+0x38/0x50 

  [<1019ab20>] __bread+0x90/0xec 

 

Kernel panic - not syncing: Attempted to kill init!

but there must be something wrong in this test because same change applied to iommu-helper without 'horrible hack' panic at 
the same place:
------------[ cut here ]------------
kernel BUG at /CAD/linux-2.6.23-pa-git-20071022/drivers/parisc/iommu-helpers.h:64!

      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111011100001110 Not tainted
r00-03  0004f70e fff0bdc0 10212068 107dd000
r04-07  00000000 108fc8b4 108fc8a0 10880d48
r08-11  00000006 10440e10 00000001 00000001
r12-15  1084c800 108fc8a0 10000000 00008000
r16-19  00000005 0000000e 10387964 007dc005
r20-23  10491000 00000000 00000000 00000005
r24-27  107dc000 07dc0000 10880d40 103dee10
r28-31  000007dc 00002ee0 10819080 00000000
sr00-03  00000000 00000000 00000000 00000000
sr04-07  00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 102120b0 102120b4
  IIR: 03ffe01f    ISR: 00000000  IOR: 00000000
  CPU:        0   CR30: 10818000 CR31: f01043c0
  ORIG_R28: aac6ca23
  IAOQ[0]: ccio_map_sg+0x234/0x3ac
  IAOQ[1]: ccio_map_sg+0x238/0x3ac
  RP(r2): ccio_map_sg+0x1ec/0x3ac
Backtrace:
  [<10107164>] die_if_kernel+0xa0/0x1b0
  [<10107898>] handle_interruption+0x624/0x6b4
  [<1010b078>] intr_check_sig+0x0/0x34
  [<10121a84>] __wake_up_common+0x7c/0xcc
  [<101713c0>] nameidata_to_filp+0x44/0x58
  [<10171428>] do_filp_open+0x54/0x68
  [<10211fd8>] ccio_map_sg+0x15c/0x3ac
  [<10266d30>] scsi_dma_map+0x48/0x58
  [<10275980>] NCR_700_queuecommand+0x38c/0x504
  [<1026036c>] scsi_dispatch_cmd+0x118/0x288
  [<10266650>] scsi_request_fn+0x184/0x2e0
  [<101fb440>] __generic_unplug_device+0x38/0x44
  [<101fb7fc>] generic_unplug_device+0x14/0x24
  [<101f841c>] blk_backing_dev_unplug+0x1c/0x28
  [<10198b18>] sync_buffer+0x38/0x50
  [<1019ab20>] __bread+0x90/0xec

Kernel panic - not syncing: Attempted to kill init!
Rebooting in 10 seconds..

So we could only guess that the other BUG_ON(pdirp == NULL); do well its job and you have right I have no evidence that 
something is actually corrupted.

> 
> In general, I didn't like the "pre-decrement" but it seems to work and
> makes the code a bit more efficient. Efficiency is extremely important
> for this code since it gets called so often. Small changes can have
> easily measured impact.
> 
Understand, eventhought for my linux learning only I prefer a more robust code
>> That said I tried to re-use the first implementation of jejb (what was in 
>> ccio-dma.c before this patch 
>> <http://cvs.parisc-linux.org/linux-2.6/drivers/parisc/ccio-dma.c?r1=1.12&r2=1.13> 
>> but that doesn't seems to fix the ccio-dma issue at all: I can still read 
>> those kind of message at the console while doing such copy
>> [snip]
>> scsi1: (4:0) phase mismatch at 01e8, phase IO CD MSG BSY REQ MSG IN
>> scsi1: Bus Reset detected, executing command 10953600, slot 109708a4, dsp 
>> 001301e8[01e8] 
> 
> I'm thinking we really need SCSI bus traces to figure out if the SCSI driver
> is doing the right thing and if not, exactly what is it doing.
> 
Well, submitted some stress test (the loop of disk read/write with a tar -xf linux-2.6.11.tar) on the same disk but 
connected to a b180 (i.e. using same ncr53c710 driver for the same lasi hba but without ccio-dma driver) didn't showed any 
failures.
(for the ncr53c720 hba, i didn't have any other system to test it without ccio-dma ;<( )

> If it is a CCIO bug, my guess is it's more likely to be problems with
> setting magic bits.  We really need the ERS to review register settings.
> 
> ..
>> (the scsi1 is the lasi scsi hba as sources and the target being the disks 
>> on ncr53c720 hba)
>>
>> or experimenting fs issues on this target disks?
> 
> I doubt this is a file system problem.

No, it's a ext3 which I use on severall other hp model (b180, b2k so without ccio-dma) without any issues

> 
>> That said ok I will wait either U2/Uturn ers public doc or all volonteers 
>> feedback.
> 
> I'm skeptical for the former and hopeful for the latter.
> There is a chance Linux Foundation could ask HP for those docs under NDA.
> But you need to sign up with Linux Foundataion as a developer and
> then request HP for those docs.
> 
Well I am not actualy a developer, just an engineer (not in computer science) trying to help but may be is it enough to sign 
up with Linux Foundation?
If yes, can you send me a link to request papers?

tx again,
	r.

PS: This c110 boxe was more reliable (I mean I could easily update system frequently, build kernel, ...) when it was equiped 
with 512M RAM; it became not any more usable when I had to decrease this ram size to original one (i.e. 64M)?

> cheers,
> grant
> 
> 

