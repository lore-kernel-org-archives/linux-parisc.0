Return-Path: <soete.joel@tiscali.be>
Received: from spoolo2.tiscali.be (spoolo2.tiscali.be [62.235.13.173])
	by dsl2.external.hp.com (Postfix) with ESMTP id 546AE4869
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 14 Apr 2004 14:52:28 -0600 (MDT)
Message-ID: <407DA495.1090009@tiscali.be>
Date: Wed, 14 Apr 2004 20:52:37 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Andy Walker <ajwalker@broadpark.no>
Subject: Re: [parisc-linux] 2.6.5-rc2-pa2 boot panic on c110 :(
References: <57789.127.0.0.1.1081971168.squirrel@www.puszczka.com>
In-Reply-To: <57789.127.0.0.1.1081971168.squirrel@www.puszczka.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Andy,

Many Thanks you save my mind: I was becoming crazy ;)

That said, thanks to viewcvs, cvs and some tbz I recover from my systems, I reach to rebuild on my b2k at the office:
2.6.3-pa2 (runing simultaneoulsy 2 find on different linux tree, a tar of one of those tree) survive :)
2.6.4-rc1-pa3 same test: survive (so no pb with ccio-dma changes) :)
but 2.6.4-rc4-pa6 died with same messages.

and too bad after such crash not more possible to reboot even with 2.6.4-rc1-pa3 which panic:
[snip]
EXT3-fs: INFO: recovery required on readonly filesystem.
EXT3-fs: write access will be enabled during recovery.
kjournald starting.  Commit interval 5 seconds
EXT3-fs: recovery complete.
EXT3-fs: mounted filesystem with ordered data mode.
VFS: Mounted root (ext3 filesystem) readonly.
Freeing unused kernel memory: 520k freed

Stack Dump:
  10380418:  10380418 00048308 00000040 ffe01800
  10380408:  ffe01801 1046f010 10380080 003803b8
[snip]
  10380038:  00000000 00000000 00000000 00000000
  10380028:  00000000 00000000 00000000 00000000

Kernel addresses on the stack:
  [<10125aec>] call_console_drivers+0xd0/0x17c
  [<10106020>] parisc_terminate+0x60/0xb8
  [<10111cd0>] pdc_console_restart+0x4c/0x68
  [<101061bc>] handle_interruption+0x144/0x5b0
  [<1010b088>] intr_check_sig+0x0/0xc
  [<1025e5bc>] ncr_reset_scsi_bus+0x158/0x2b8


High Priority Machine Check (HPMC): Code=1 regs=10380080 (Addr=00000000)

      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111100100001110 Not tainted
r00-03  00000000 103a5010 1025e4b8 0000000f
r04-07  17edeba0 17ec0000 00000002 103a5010
r08-11  00000000 17ec4110 b6da8c80 1046e060
r12-15  100fe244 00000000 10394010 1046e010
r16-19  f00010f4 f00000ac f00000a4 f3f8c80e
r20-23  00000001 0000000f 0000000e 1046d010
r24-27  17ec0000 00000000 0000c800 1037d010
r28-31  f3f8c800 00005dc0 17ec4380 1025e57c
sr0-3   00000000 00000003 00000000 00000003
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 1025e5b8 1025e5bc
  IIR: d6c30a3f    ISR: 00000000  IOR: f3f8c80c
  CPU:        0   CR30: 17ec4000 CR31: 103dc000
  ORIG_R28: 00000000
  IAOQ[0]: ncr_reset_scsi_bus+0x154/0x2b8
  IAOQ[1]: ncr_reset_scsi_bus+0x158/0x2b8
  RP(r2): ncr_reset_scsi_bus+0x54/0x2b8

(already retry 2 time even after a cycle power off/on?

and now with 2.6.3-pa2 up again pfff)

I can still restric research between 2.6.4-rc3-pa3 (which I missed in my investigation?) and 2.6.4-rc4-pa6?

hth,
	Joel

Andy Walker wrote:
> Joel Soete wrote:
> 
> 
>>That said, I am not able to link jejb with what I observe but here is
>>the story.
>>The system boot but hang very quickly as soon as io rate increase as per
>>a find of a file name :( (reproducible on request)
>>I then get mesg
>>
>>arq->state 2
>>Badness in as_requeue_request at drivers/block/as-iosched.c:1479
>>Kernel addresses on the stack:
>>[snip]
>>  [<10124528>] printk+0x144/0x1c0
>>  [<101036bc>] dump_stack+0x18/0x24
>>  [<102276a0>] as_requeue_request+0x5c/0x17c
>>  [<1021e630>] elv_requeue_request+0x30/0x3c
>>  [<1023baf4>] scsi_request_fn+0x220/0x2bc
>>  [<1021e630>] elv_requeue_request+0x30/0x3c
>>  [<102212b8>] blk_insert_request+0xd8/0xf0
>>  [<1023a978>] scsi_queue_insert+0x6c/0xa0
>>  [<1023b7bc>] scsi_prep_fn+0xc4/0x1dc
>>  [<102368f8>] scsi_dispatch_cmd+0x118/0x22c
>>  [<1021e820>] elv_remove_request+0x34/0x44
>>  [<1023ba80>] scsi_request_fn+0x1ac/0x2bc
>>  [<102273f0>] as_next_request+0x44/0x54
>>  [<10228218>] as_work_handler+0x44/0x48
>>  [<101344e4>] worker_thread+0x1e4/0x280
>>  [<101200cc>] schedule+0x3f8/0x718
>>  [<101385f4>] kthread+0xdc/0xe4
>>  [<10108c5c>] ret_from_kernel_thread+0x1c/0x24
>>
>>[snip]
>>
>>it seems to be infinite loop :(
>>
>>Any idea?
>>
>>Thanks in advance,
>>     Joel
> 
> 
> I'm experiencing a very similar problem with 2.6.5-pa7 on a C180. I'm in
> unfortunate position that my ext3 root filesystem needs INFO recovery,
> but as soon as the recovery kicks in I get:
> 
> arq->state 2
> Badness in as_requeue_request at drivers/block/as-iosched.c:1479
> Kernel addresses on the stack:
> [snip]
>   [<10125d0c>] printk+0x188/0x1c8
>   [<10105638>] dump_stack+0x18/0x24
>   [<101fb740>] as_requeue_request+0x64/0x10c
>   [<101f24b0>] elv_requeue_request+0x2c/0x38
>   [<101f51b4>] blk_insert_request+0xf4/0xfc
>   [<10211c2c>] scsi_queue_insert+0x68/0x9c
>   [<102376f4>] hp_sdc_tasklet+0x80/0x160
>   [<1020dd2c>] scsi_softirq+0xfc/0x11c
>   [<10129990>] do_softirq+0xf4/0xf8
>   [<10129e68>] ksoftirqd+0x84/0xf0
>   [<101398a0>] kthread+0xe8/0xf0
>   [<1010ac5c>] ret_from_kernel_thread+0x1c/0x24
> 
> Can't point to the last kernel version that worked, because this is
> actually the first kernel I've built for the C180, having just
> finished bootstrapping Gentoo. But I'll be happy to provide what
> info I can - seems this problem is real if both a C110 and a C180
> are suffering from it, and they're very similar pieces of hardware.
> 
> cheers
> -Andy
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
