Return-Path: <ajwalker@broadpark.no>
Received: from mail.broadpark.no (mail.broadpark.no [217.13.4.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id 97073483D
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 14 Apr 2004 13:22:20 -0600 (MDT)
Received: from tolstoy.puszczka.com (87.80-203-39.nextgentel.com
	[80.203.39.87])
	by mail.broadpark.no (Postfix) with ESMTP id A51AB4462
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 14 Apr 2004 21:22:20 +0200 (MEST)
Message-ID: <57789.127.0.0.1.1081971168.squirrel@www.puszczka.com>
Date: Wed, 14 Apr 2004 21:32:48 +0200 (CEST)
Subject: Re: [parisc-linux] 2.6.5-rc2-pa2 boot panic on c110 :(
From: "Andy Walker" <ajwalker@broadpark.no>
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Joel Soete wrote:

> That said, I am not able to link jejb with what I observe but here is
> the story.
> The system boot but hang very quickly as soon as io rate increase as per
> a find of a file name :( (reproducible on request)
> I then get mesg
>
> arq->state 2
> Badness in as_requeue_request at drivers/block/as-iosched.c:1479
> Kernel addresses on the stack:
> [snip]
>   [<10124528>] printk+0x144/0x1c0
>   [<101036bc>] dump_stack+0x18/0x24
>   [<102276a0>] as_requeue_request+0x5c/0x17c
>   [<1021e630>] elv_requeue_request+0x30/0x3c
>   [<1023baf4>] scsi_request_fn+0x220/0x2bc
>   [<1021e630>] elv_requeue_request+0x30/0x3c
>   [<102212b8>] blk_insert_request+0xd8/0xf0
>   [<1023a978>] scsi_queue_insert+0x6c/0xa0
>   [<1023b7bc>] scsi_prep_fn+0xc4/0x1dc
>   [<102368f8>] scsi_dispatch_cmd+0x118/0x22c
>   [<1021e820>] elv_remove_request+0x34/0x44
>   [<1023ba80>] scsi_request_fn+0x1ac/0x2bc
>   [<102273f0>] as_next_request+0x44/0x54
>   [<10228218>] as_work_handler+0x44/0x48
>   [<101344e4>] worker_thread+0x1e4/0x280
>   [<101200cc>] schedule+0x3f8/0x718
>   [<101385f4>] kthread+0xdc/0xe4
>   [<10108c5c>] ret_from_kernel_thread+0x1c/0x24
>
> [snip]
>
> it seems to be infinite loop :(
>
> Any idea?
>
> Thanks in advance,
>      Joel

I'm experiencing a very similar problem with 2.6.5-pa7 on a C180. I'm in
unfortunate position that my ext3 root filesystem needs INFO recovery,
but as soon as the recovery kicks in I get:

arq->state 2
Badness in as_requeue_request at drivers/block/as-iosched.c:1479
Kernel addresses on the stack:
[snip]
  [<10125d0c>] printk+0x188/0x1c8
  [<10105638>] dump_stack+0x18/0x24
  [<101fb740>] as_requeue_request+0x64/0x10c
  [<101f24b0>] elv_requeue_request+0x2c/0x38
  [<101f51b4>] blk_insert_request+0xf4/0xfc
  [<10211c2c>] scsi_queue_insert+0x68/0x9c
  [<102376f4>] hp_sdc_tasklet+0x80/0x160
  [<1020dd2c>] scsi_softirq+0xfc/0x11c
  [<10129990>] do_softirq+0xf4/0xf8
  [<10129e68>] ksoftirqd+0x84/0xf0
  [<101398a0>] kthread+0xe8/0xf0
  [<1010ac5c>] ret_from_kernel_thread+0x1c/0x24

Can't point to the last kernel version that worked, because this is
actually the first kernel I've built for the C180, having just
finished bootstrapping Gentoo. But I'll be happy to provide what
info I can - seems this problem is real if both a C110 and a C180
are suffering from it, and they're very similar pieces of hardware.

cheers
-Andy
