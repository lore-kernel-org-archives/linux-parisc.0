Return-Path: <soete.joel@tiscali.be>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2AD0A482B
	for <parisc-linux@lists.parisc-linux.org>;
	Tue,  4 May 2004 01:23:31 -0600 (MDT)
Date: Tue, 4 May 2004 09:22:50 +0200
Message-ID: <408D439D00004F55@ocpmta3.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] Re: NCR53c720
To: "List Parisc" <parisc-linux@lists.parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: willy@debian.org, James.Bottomley@steeleye.com, grundler@parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hello all,

There was a thread:: <http://lists.parisc-linux.org/pipermail/parisc-linux/2003-September/021172.html>

which would help me to find the right direction to solve this pb:
<http://lists.parisc-linux.org/pipermail/parisc-linux/2004-April/022968.html>

The only new think I discover became when I reboot a kernel build with gcc-3.0:
[snip]
: arq->state 2
Badness in as_requeue_request at drivers/block/as-iosched.c:1479
Kernel addresses on the stack:
 [<10127830>] printk+0x12c/0x1b0
 [<10107d64>] dump_stack+0x18/0x24
 [<1022b21c>] as_requeue_request+0x64/0x108
 [<102225c0>] elv_requeue_request+0x3c/0x64
 [<102250a8>] blk_insert_request+0x4c/0xf8
 [<1024f418>] scsi_queue_insert+0x6c/0xa0
 [<102642d8>] ncr_wakeup_done+0x90/0xc0
 [<1024b578>] scsi_softirq+0xcc/0x128
 [<1024b498>] scsi_done+0x5c/0x70
 [<1012b504>] __do_softirq+0x60/0xcc
 [<10109428>] do_irq+0xa4/0x160
 [<1010231c>] __scheduling_functions_end_here+0x3c/0x48
 [<10109574>] do_cpu_irq_mask+0x90/0xf0
 [<1010d068>] intr_return+0x0/0x14
 [<102632a4>] ncr_start_next_ccb+0xdc/0x104
 [<10145e6c>] kmem_cache_alloc+0x3c/0x4c
 [<1015d69c>] get_empty_filp+0x64/0x11c
 [<1015bc80>] dentry_open+0x12c/0x1b4
 [<1016f8b0>] locate_fd+0xfc/0x190
 [<10145e64>] kmem_cache_alloc+0x34/0x4c
 [<10140530>] mempool_alloc+0xac/0x184
 [<10225fcc>] generic_make_request+0x15c/0x1fc
 [<101ab458>] __journal_remove_journal_head+0x144/0x1e4
 [<10162b28>] bio_alloc+0x14c/0x1bc
 [<102260e0>] submit_bio+0x74/0x154
 [<10162234>] submit_bh+0x8c/0x16c
 [<10162388>] ll_rw_block+0x74/0x140
 [<101a6fc4>] journal_brelse_array+0x2c/0x44
 [<101a6f04>] journal_commit_transaction+0xfdc/0x1070
 [<101ee0cc>] vsnprintf+0x6a4/0x8cc
 [<101a94ac>] kjournald+0xc8/0x220
 [<1015cb58>] sys_write+0x4c/0x84
 [<10129b34>] do_group_exit+0x84/0xbc
 [<1010a35c>] tracesys_exit+0x0/0x34
 [<1010cc5c>] ret_from_kernel_thread+0x1c/0x24

kernel BUG at include/linux/blkdev.h:562!
Kernel addresses on the stack:
 [<10127830>] printk+0x12c/0x1b0
 [<10107d64>] dump_stack+0x18/0x24
 [<10250630>] scsi_request_fn+0x2b4/0x388
 [<102225c0>] elv_requeue_request+0x3c/0x64
 [<10225110>] blk_insert_request+0xb4/0xf8
 [<1024f418>] scsi_queue_insert+0x6c/0xa0
 [<102642d8>] ncr_wakeup_done+0x90/0xc0
 [<1024b578>] scsi_softirq+0xcc/0x128
 [<1024b498>] scsi_done+0x5c/0x70
 [<1012b504>] __do_softirq+0x60/0xcc
 [<10109428>] do_irq+0xa4/0x160
 [<1010231c>] __scheduling_functions_end_here+0x3c/0x48
 [<10109574>] do_cpu_irq_mask+0x90/0xf0
 [<1010d068>] intr_return+0x0/0x14
 [<102632a4>] ncr_start_next_ccb+0xdc/0x104
 [<10145e6c>] kmem_cache_alloc+0x3c/0x4c
 [<1015d69c>] get_empty_filp+0x64/0x11c
 [<1015bc80>] dentry_open+0x12c/0x1b4
 [<1016f8b0>] locate_fd+0xfc/0x190
 [<10145e64>] kmem_cache_alloc+0x34/0x4c
 [<10140530>] mempool_alloc+0xac/0x184
 [<10225fcc>] generic_make_request+0x15c/0x1fc
 [<101ab458>] __journal_remove_journal_head+0x144/0x1e4
 [<10162b28>] bio_alloc+0x14c/0x1bc
 [<102260e0>] submit_bio+0x74/0x154
 [<10162234>] submit_bh+0x8c/0x16c
 [<10162388>] ll_rw_block+0x74/0x140
 [<101a6fc4>] journal_brelse_array+0x2c/0x44
 [<101a6f04>] journal_commit_transaction+0xfdc/0x1070
 [<101ee0cc>] vsnprintf+0x6a4/0x8cc
 [<101a94ac>] kjournald+0xc8/0x220
 [<1015cb58>] sys_write+0x4c/0x84
 [<10129b34>] do_group_exit+0x84/0xbc
 [<1010a35c>] tracesys_exit+0x0/0x34
 [<1010cc5c>] ret_from_kernel_thread+0x1c/0x24

[snip]

which makes appear ncr_wakeup_done() and ncr_start_next_ccb() but I don't
yet reach to figure out why the work-around which consist of commenting 'parisc_vmerge_max_size
= ...' into ccio-dma.c make the stuff working (that just let parisc_vmerge_max_size
=0 as initialized in gsc.c)

I also try to compare ncr_start_next_ccb with its sister sym_ and discover
that there was a improved way to manage requeing but I don't find how to
manage such changes (new ncr53720 files, a sym53c7xx_2 tree, ...). 

Any idea?

Thanks for yoyr attention,
    Joel

----------------------------------------------------------------------------------------
Tiscali ADSL, 27,50 €/mois...pendant 6 mois. 
La meilleure offre du marché !
http://reg.tiscali.be/default.asp?lg=fr
