From: Helge Deller <deller@gmx.de>
Subject: Re: SCSI bug
Date: Sun, 21 Feb 2016 22:17:54 +0100
Message-ID: <56CA2982.1030607@gmx.de>
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
 <1456086490.2340.18.camel@HansenPartnership.com>
 <28582474-5AB3-4022-86FE-E823F5990623@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Cc: linux-parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <28582474-5AB3-4022-86FE-E823F5990623@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 21.02.2016 22:09, John David Anglin wrote:
> On 2016-02-21, at 3:28 PM, James Bottomley wrote:
> 
>> That said, I still can't reproduce this, so you're going to have to
>> help me find it.  Current theory is ll_merge_request_fn() it looks like
>> there's scope for miscalculation in there.  Can you instrument this
>> line
>>
>> 	/* Merge is OK... */
>> 	req->nr_phys_segments = total_phys_segments;
>>
>> To add just before the return
>>
>> if (req->nr_phys_segments != __blk_recalc_rq_segments(rq->q, rq->bio,	false) 
>> 	printk("MISMATCH IN MERGE: got %d, should get %d\n", 
>> 		req->nr_phys_segments,
>> 		__blk_recalc_rq_segments(rq->q, rq->bio, false));
> 
> This didn't trigger.  There were some typos:

It didn't trigger for me either.

 
> diff --git a/block/blk-merge.c b/block/blk-merge.c
> index d9c3a75..e8969ef 100644
> --- a/block/blk-merge.c
> +++ b/block/blk-merge.c
> @@ -545,6 +545,12 @@ static int ll_merge_requests_fn(struct request_queue *q, struct request *req,
>  
>         /* Merge is OK... */
>         req->nr_phys_segments = total_phys_segments;
> +
> +if (req->nr_phys_segments != __blk_recalc_rq_segments(req->q, req->bio,        false)) 
> +       printk("MISMATCH IN MERGE: got %d, should get %d\n", 
> +               req->nr_phys_segments,
> +               __blk_recalc_rq_segments(req->q, req->bio, false));
> +
>         return 1;
>  }

Interestingly it now triggered somewhere else...
I enabled CONFIG_DEBUG_SG, which I had enabled the last few times as well, but it now happened
for the first time:

[   49.848000] scsi_init_sgtable: nr_phys_segments = 4
[   49.848000] NEW SEGMENT sg = 00000000bbdd5008!!!
[   49.848000] __blk_segment_map_sg: length = 65536, nbytes = 4096, sum = 69632 > 65536
[   49.848000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE = 1, BIOVEC_SEG_BOUNDARY = 1
[   49.848000] NEW SEGMENT sg = 00000000bbdd5008!!!
[   49.848000] __blk_segment_map_sg: length = 8192, nbytes = 4096, sum = 12288 > 65536
[   49.848000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE = 0, BIOVEC_SEG_BOUNDARY = 1
[   49.848000] NEW SEGMENT sg = 00000000bbdd5008!!!
[   49.848000] __blk_segment_map_sg: length = 20480, nbytes = 4096, sum = 24576 > 65536
[   49.848000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE = 0, BIOVEC_SEG_BOUNDARY = 1
[   49.848000] NEW SEGMENT sg = 00000000bbdd5008!!!
[   49.848000] __blk_segment_map_sg: length = 4096, nbytes = 4096, sum = 8192 > 65536
[   49.848000] __blk_segment_map_sg: BIOVEC_PHYS_MERGEABLE = 0, BIOVEC_SEG_BOUNDARY = 1
[   49.848000] timer_interrupt(CPU 0): delayed! cycles 2D6DC985 rem 2B2FBB  next/now 19218A269E/19215EF6E3
[   50.980000] ------------[ cut here ]------------
[   51.036000] kernel BUG at /build/linux-4.4/linux-4.4.2/include/linux/scatterlist.h:92!
[   51.128000] CPU: 0 PID: 62 Comm: systemd-udevd Not tainted 4.4.0-1-parisc64-smp #6 Debian 4.4.2-2
[   51.236000] task: 00000000bbd49508 ti: 00000000bbdd4000 task.ti: 00000000bbdd4000
[   51.324000] 
[   51.344000]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[   51.400000] PSW: 00001000000001001111110100001110 Not tainted
[   51.468000] r00-03  000000ff0804fd0e 00000000bbdd5000 00000000404f23f8 00000000bbdd5000
[   51.564000] r04-07  00000000409b3b10 0000000000006000 0000000000001000 0000000000000180
[   51.660000] r08-11  0000000000000000 00000000bfdab0f0 0000000000000018 0000000000000000
[   51.756000] r12-15  0000000000000004 00000000bbe22e00 000000007faf3188 0000000000000000
[   51.852000] r16-19  0000000042004140 0000000000001000 0000000000000001 0000000087654321
[   51.948000] r20-23  000000020000c18c ffffffff87654000 00000000000002a9 00000000000002ee
[   52.044000] r24-27  0000000000000000 ffffffff87654000 00000000bbe22e80 00000000409b3b10
[   52.140000] r28-31  00000000bbe22e80 00000000bbdd5140 00000000bbdd5170 0000c18c0000c18c
[   52.236000] sr00-03  0000000000013800 0000000000000000 0000000000000000 0000000000011800
[   52.332000] sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000
[   52.428000] 
[   52.448000] IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000404f2664 00000000404f2668
[   52.548000]  IIR: 03ffe01f    ISR: 0000000000000000  IOR: 000000000000005c
[   52.628000]  CPU:        0   CR30: 00000000bbdd4000 CR31: 00000000d20345e0
[   52.712000]  ORIG_R28: 0000000040b60718
[   52.756000]  IAOQ[0]: blk_rq_map_sg+0x6bc/0x7d0
[   52.812000]  IAOQ[1]: blk_rq_map_sg+0x6c0/0x7d0
[   52.864000]  RP(r2): blk_rq_map_sg+0x450/0x7d0
[   52.920000] Backtrace:
[   52.948000]  [<00000000003f5ebc>] scsi_init_sgtable+0x94/0x1b0 [scsi_mod]
[   53.028000]  [<00000000003f6044>] scsi_init_io+0x6c/0x258 [scsi_mod]
[   53.104000]  [<000000000080e078>] sd_init_command+0x70/0xec8 [sd_mod]
[   53.180000] scsi_init_sgtable: nr_phys_segments = 1
[   53.180000] scsi_init_sgtable: count = 1, nents = 1
[   53.300000] 
[   53.316000] CPU: 0 PID: 62 Comm: systemd-udevd Not tainted 4.4.0-1-parisc64-smp #6 Debian 4.4.2-2
[   53.424000] Backtrace:
[   53.452000]  [<0000000040215bd8>] show_stack+0x20/0x38
[   53.512000]  [<0000000040520a24>] dump_stack+0x9c/0x110
[   53.576000]  [<0000000040215dac>] die_if_kernel+0x19c/0x2e0
[   53.640000]  [<0000000040216c88>] handle_interruption+0x9a8/0x9d0
[   53.716000] 
[   53.732000] ---[ end trace 596bfe57ff9ccda5 ]---
[   53.788000] scsi_init_sgtable: nr_phys_segments = 1
[   53.788000] scsi_init_sgtable: count = 1, nents = 1

Helge
