Return-Path: <soete.joel@tiscali.be>
Received: from spoolo1.tiscali.be (spoolo1.tiscali.be [62.235.13.172])
	by dsl2.external.hp.com (Postfix) with ESMTP id F35D348E4
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 14 Mar 2004 06:41:58 -0700 (MST)
Message-ID: <40546177.90700@tiscali.be>
Date: Sun, 14 Mar 2004 13:43:19 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] 2.6.4-pa2 panic on c110 :(
References: <405397F3.1050406@tiscali.be>	<20040314010400.GB26705@parcelfarce.linux.theplanet.co.uk>
	<40542786.8050302@tiscali.be>
In-Reply-To: <40542786.8050302@tiscali.be>
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: Matthew Wilcox <willy@debian.org>,
	PA-RISC Linux Port <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>



Joel Soete wrote:
> Matthew Wilcox wrote:
> 
>> On Sat, Mar 13, 2004 at 11:23:31PM +0000, Joel Soete wrote:
>>
>>> I just compile successfully (with defconfig) and seems to boot fine 
>>> the last 2.6.4-pa2 kernel on my C110.
>>> But as I was starting a rm -rf glibc it panics with console message:
>>> arq->state 2
>>> Badness in as_requeue_request at drivers/block/as-iosched.c:1479
>>> Kernel addresses on the stack:
>>> [<10125de8>] printk+0x188/0x1c8
>>> [<10105938>] dump_stack+0x18/0x24
>>> [<10229688>] as_requeue_request+0x64/0x10c
>>> [<102205b0>] elv_requeue_request+0x2c/0x38
>>> [<102232bc>] blk_insert_request+0xfc/0x104
>>> [<1024cd30>] scsi_queue_insert+0x68/0x9c
>>> [<102491ec>] scsi_softirq+0xfc/0x11c
>>> [<10170560>] sys_select+0x1d0/0x3b8
>>> [<101299c8>] do_softirq+0xf4/0xf8
>>> [<1010c1e4>] syscall_do_softirq+0x8/0x10
>>> [<1010b088>] intr_check_sig+0x0/0xc 
>>
>>
>>
>> That's not good.  First, is this reproducable?

And finaly if I apply Grant tips (agianst 2.6.4-pa2) the crash is a bit different:
  arq->state 2
Badness in as_requeue_request at drivers/block/as-iosched.c:1479
Kernel addresses on the stack:
  [<10125de8>] printk+0x188/0x1c8
  [<10105938>] dump_stack+0x18/0x24
  [<10229688>] as_requeue_request+0x64/0x10c
  [<102205b0>] elv_requeue_request+0x2c/0x38
  [<102232bc>] blk_insert_request+0xfc/0x104
  [<1024cd30>] scsi_queue_insert+0x68/0x9c
  [<1012dd24>] update_process_times+0x38/0x54
  [<102491ec>] scsi_softirq+0xfc/0x11c
  [<101299c8>] do_softirq+0xf4/0xf8
  [<1010733c>] do_irq_mask+0xbc/0xcc
  [<10107270>] do_cpu_irq_mask+0xfc/0x10c
  [<10228d34>] as_remove_request+0xf4/0xfc
  [<1010b068>] intr_return+0x0/0x14
  [<1024dcfc>] scsi_request_fn+0x54/0x2c4
  [<101441f0>] kmem_cache_alloc+0x38/0x4c
  [<1016ba78>] may_open+0x58/0x1c8
  [<1015a848>] dentry_open+0x138/0x1c4
  [<10144200>] kmem_cache_alloc+0x48/0x4c
  [<1013efa4>] mempool_alloc+0xac/0x1a0
  [<101617bc>] bio_alloc+0x3c/0x1a4
  [<10160e90>] submit_bh+0x94/0x1e0
  [<101610e8>] ll_rw_block+0x10c/0x148
  [<101a53bc>] journal_brelse_array+0x30/0x48
  [<101a5154>] journal_commit_transaction+0xf18/0x1150
  [<10125b1c>] call_console_drivers+0xd0/0x17c
  [<101a7958>] kjournald+0xc0/0x224
  [<1010ac5c>] ret_from_kernel_thread+0x1c/0x24

kernel BUG at include/linux/blkdev.h:543!
Kernel addresses on the stack:
  [<10125de8>] printk+0x188/0x1c8
  [<10105938>] dump_stack+0x18/0x24
  [<1024df48>] scsi_request_fn+0x2a0/0x2c4
  [<102205b0>] elv_requeue_request+0x2c/0x38
  [<102232a0>] blk_insert_request+0xe0/0x104
  [<1024cd30>] scsi_queue_insert+0x68/0x9c
  [<1012dd24>] update_process_times+0x38/0x54
  [<102491ec>] scsi_softirq+0xfc/0x11c
  [<101299c8>] do_softirq+0xf4/0xf8
  [<1010733c>] do_irq_mask+0xbc/0xcc
  [<10107270>] do_cpu_irq_mask+0xfc/0x10c
  [<10228d34>] as_remove_request+0xf4/0xfc
  [<1010b068>] intr_return+0x0/0x14
  [<1024dcfc>] scsi_request_fn+0x54/0x2c4
  [<101441f0>] kmem_cache_alloc+0x38/0x4c
  [<1016ba78>] may_open+0x58/0x1c8
  [<1015a848>] dentry_open+0x138/0x1c4
  [<10144200>] kmem_cache_alloc+0x48/0x4c
  [<1013efa4>] mempool_alloc+0xac/0x1a0
  [<101617bc>] bio_alloc+0x3c/0x1a4
  [<10160e90>] submit_bh+0x94/0x1e0
  [<101610e8>] ll_rw_block+0x10c/0x148
  [<101a53bc>] journal_brelse_array+0x30/0x48
  [<101a5154>] journal_commit_transaction+0xf18/0x1150
  [<10125b1c>] call_console_drivers+0xd0/0x17c
  [<101a7958>] kjournald+0xc0/0x224
  [<1010ac5c>] ret_from_kernel_thread+0x1c/0x24

kernel BUG at include/linux/blkdev.h:543!
Kernel addresses on the stack:
  [<10125de8>] printk+0x188/0x1c8
  [<10105938>] dump_stack+0x18/0x24
  [<1024df48>] scsi_request_fn+0x2a0/0x2c4
  [<1013f0dc>] mempool_free+0x44/0x80
  [<102228b4>] blk_run_queue+0x2c/0x40
  [<1024d1e4>] scsi_run_queue+0x80/0xec
  [<1024d3e8>] scsi_end_request+0xdc/0xf4
  [<1013f0dc>] mempool_free+0x44/0x80
  [<1024d6b8>] scsi_io_completion+0x100/0x3f0
  [<1025f770>] ncr_wakeup_done+0x98/0xb4
  [<102492e0>] scsi_finish_command+0x9c/0xc0
  [<102491dc>] scsi_softirq+0xec/0x11c
  [<10263114>] ncr53c8xx_intr+0x74/0xbc
  [<101299c8>] do_softirq+0xf4/0xf8
  [<1010733c>] do_irq_mask+0xbc/0xcc
  [<10107270>] do_cpu_irq_mask+0xfc/0x10c
  [<10228d34>] as_remove_request+0xf4/0xfc
  [<1010b068>] intr_return+0x0/0x14
  [<1024dcfc>] scsi_request_fn+0x54/0x2c4
  [<101441f0>] kmem_cache_alloc+0x38/0x4c
  [<1016ba78>] may_open+0x58/0x1c8
  [<1015a848>] dentry_open+0x138/0x1c4
  [<10144200>] kmem_cache_alloc+0x48/0x4c
  [<1013efa4>] mempool_alloc+0xac/0x1a0
  [<101617bc>] bio_alloc+0x3c/0x1a4
  [<10160e90>] submit_bh+0x94/0x1e0
  [<101610e8>] ll_rw_block+0x10c/0x148
  [<101a53bc>] journal_brelse_array+0x30/0x48
  [<101a5154>] journal_commit_transaction+0xf18/0x1150
  [<10125b1c>] call_console_drivers+0xd0/0x17c
  [<101a7958>] kjournald+0xc0/0x224
  [<1010ac5c>] ret_from_kernel_thread+0x1c/0x24

kernel BUG at include/linux/blkdev.h:543!
Kernel addresses on the stack:
  [<10125de8>] printk+0x188/0x1c8
  [<10105938>] dump_stack+0x18/0x24
  [<1024df48>] scsi_request_fn+0x2a0/0x2c4
  [<102205b0>] elv_requeue_request+0x2c/0x38
  [<102232a0>] blk_insert_request+0xe0/0x104
  [<1024cd30>] scsi_queue_insert+0x68/0x9c
  [<10125de8>] printk+0x188/0x1c8
  [<10248e8c>] scsi_dispatch_cmd+0x184/0x22c
  [<102207ac>] elv_remove_request+0x34/0x44
  [<1024de54>] scsi_request_fn+0x1ac/0x2c4
  [<1013f0dc>] mempool_free+0x44/0x80
  [<102228b4>] blk_run_queue+0x2c/0x40
  [<1024d1e4>] scsi_run_queue+0x80/0xec
  [<1024d3e8>] scsi_end_request+0xdc/0xf4
  [<1013f0dc>] mempool_free+0x44/0x80
  [<1024d6b8>] scsi_io_completion+0x100/0x3f0
  [<1025f770>] ncr_wakeup_done+0x98/0xb4
  [<102492e0>] scsi_finish_command+0x9c/0xc0
  [<102491dc>] scsi_softirq+0xec/0x11c
  [<10263114>] ncr53c8xx_intr+0x74/0xbc
  [<101299c8>] do_softirq+0xf4/0xf8
  [<1010733c>] do_irq_mask+0xbc/0xcc
  [<10107270>] do_cpu_irq_mask+0xfc/0x10c
  [<10228d34>] as_remove_request+0xf4/0xfc
  [<1010b068>] intr_return+0x0/0x14
  [<1024dcfc>] scsi_request_fn+0x54/0x2c4
  [<101441f0>] kmem_cache_alloc+0x38/0x4c
  [<1016ba78>] may_open+0x58/0x1c8
  [<1015a848>] dentry_open+0x138/0x1c4
  [<10144200>] kmem_cache_alloc+0x48/0x4c
  [<1013efa4>] mempool_alloc+0xac/0x1a0
  [<101617bc>] bio_alloc+0x3c/0x1a4
  [<10160e90>] submit_bh+0x94/0x1e0
  [<101610e8>] ll_rw_block+0x10c/0x148
  [<101a53bc>] journal_brelse_array+0x30/0x48
  [<101a5154>] journal_commit_transaction+0xf18/0x1150
  [<10125b1c>] call_console_drivers+0xd0/0x17c
  [<101a7958>] kjournald+0xc0/0x224
  [<1010ac5c>] ret_from_kernel_thread+0x1c/0x24

kernel BUG at include/linux/blkdev.h:543!
Kernel addresses on the stack:
  [<10125de8>] printk+0x188/0x1c8
  [<10105938>] dump_stack+0x18/0x24
  [<1024df48>] scsi_request_fn+0x2a0/0x2c4
  [<10222708>] blk_remove_plug+0x5c/0x84
  [<102228b4>] blk_run_queue+0x2c/0x40
  [<1024d3e8>] scsi_end_request+0xdc/0xf4
  [<1013f0dc>] mempool_free+0x44/0x80
  [<1024d6b8>] scsi_io_completion+0x100/0x3f0
  [<1025f770>] ncr_wakeup_done+0x98/0xb4
  [<102492e0>] scsi_finish_command+0x9c/0xc0
  [<102491dc>] scsi_softirq+0xec/0x11c
  [<10263114>] ncr53c8xx_intr+0x74/0xbc
  [<101299c8>] do_softirq+0xf4/0xf8
  [<1010733c>] do_irq_mask+0xbc/0xcc
  [<10107270>] do_cpu_irq_mask+0xfc/0x10c
  [<10228d34>] as_remove_request+0xf4/0xfc
  [<1010b068>] intr_return+0x0/0x14
  [<1024dcfc>] scsi_request_fn+0x54/0x2c4
  [<101441f0>] kmem_cache_alloc+0x38/0x4c
  [<1016ba78>] may_open+0x58/0x1c8
  [<1015a848>] dentry_open+0x138/0x1c4
  [<10144200>] kmem_cache_alloc+0x48/0x4c
  [<1013efa4>] mempool_alloc+0xac/0x1a0
  [<101617bc>] bio_alloc+0x3c/0x1a4
  [<10160e90>] submit_bh+0x94/0x1e0
  [<101610e8>] ll_rw_block+0x10c/0x148
  [<101a53bc>] journal_brelse_array+0x30/0x48
  [<101a5154>] journal_commit_transaction+0xf18/0x1150
  [<10125b1c>] call_console_drivers+0xd0/0x17c
  [<101a7958>] kjournald+0xc0/0x224
  [<1010ac5c>] ret_from_kernel_thread+0x1c/0x24

arq->state 2
Badness in as_requeue_request at drivers/block/as-iosched.c:1479
Kernel addresses on the stack:
  [<10125de8>] printk+0x188/0x1c8
  [<10105938>] dump_stack+0x18/0x24
  [<10229688>] as_requeue_request+0x64/0x10c
  [<102205b0>] elv_requeue_request+0x2c/0x38
  [<102232bc>] blk_insert_request+0xfc/0x104
  [<1024cd30>] scsi_queue_insert+0x68/0x9c
  [<102492e0>] scsi_finish_command+0x9c/0xc0
  [<102491ec>] scsi_softirq+0xfc/0x11c
  [<10263114>] ncr53c8xx_intr+0x74/0xbc
  [<101299c8>] do_softirq+0xf4/0xf8
  [<1010733c>] do_irq_mask+0xbc/0xcc
  [<10107270>] do_cpu_irq_mask+0xfc/0x10c
  [<10228d34>] as_remove_request+0xf4/0xfc
  [<1010b068>] intr_return+0x0/0x14
  [<1024dcfc>] scsi_request_fn+0x54/0x2c4
  [<101441f0>] kmem_cache_alloc+0x38/0x4c
  [<1016ba78>] may_open+0x58/0x1c8
  [<1015a848>] dentry_open+0x138/0x1c4
  [<10144200>] kmem_cache_alloc+0x48/0x4c
  [<1013efa4>] mempool_alloc+0xac/0x1a0
  [<101617bc>] bio_alloc+0x3c/0x1a4
  [<10160e90>] submit_bh+0x94/0x1e0
  [<101610e8>] ll_rw_block+0x10c/0x148
  [<101a53bc>] journal_brelse_array+0x30/0x48
  [<101a5154>] journal_commit_transaction+0xf18/0x1150
  [<10125b1c>] call_console_drivers+0xd0/0x17c
  [<101a7958>] kjournald+0xc0/0x224
  [<1010ac5c>] ret_from_kernel_thread+0x1c/0x24

hth,
	Joel
