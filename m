Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6B93E4840
	for <parisc-linux@lists.parisc-linux.org>; Sun, 23 Nov 2003 23:44:37 -0700 (MST)
Received: from localhost (localhost [127.0.0.1])
	by colo.lackof.org (Postfix) with ESMTP id CBBAD298043
	for <parisc-linux@lists.parisc-linux.org>; Sun, 23 Nov 2003 23:44:36 -0700 (MST)
Received: from colo.lackof.org ([127.0.0.1])
	by localhost (colo [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 26551-02 for <parisc-linux@lists.parisc-linux.org>;
	Sun, 23 Nov 2003 23:44:35 -0700 (MST)
Date: Sun, 23 Nov 2003 23:44:35 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20031124064435.GA26585@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] BUG 2.6.0-test9-4 slab internal list corruption
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

A500-65 (aka ion) booted with:
Linux version 2.6.0-test9-4-parisc64 (jejb@raven) (gcc version 3.0.4) #2 Wed Nov 5 22:30:59 CST 2003


Last console output before it crashed:

slab: Internal list corruption detected in cache 'buffer_head'(32), slabp 000000003bc0c000(0). Hexdump:

000: 00 00 00 00 00 00 00 40 00 00 00 00 10 4a b5 90
010: 00 00 00 00 08 00 00 0f 00 00 00 00 4f 6c 14 c0
020: 00 00 00 00 00 0c 00 00 00 00 00 00 4f 6c 14 c0
030: 00 00 00 00 10 28 56 1c 00 00 00 00 3f 4d c9 48
040: 00 00 00 00 90 5b 70 b0 00 00 00 00 10 40 98 60
050: 00 00 00 00 4f 2a d5 00 00 00 00 00 10 40 98 60
060: 00 00 00 00 10 40 98 60 00 00 00 00 10 40 98 60
070: 00 00 00 00 00 0c c4 b0 00 00 00 00 10 3b 56 28
080: 00 00 00 00 11 a6 f8 30
kernel BUG at mm/slab.c:1752!
Kernel addresses on the stack:
 [<0000000010110478>] show_trace+0x40/0x110
 [<00000000101102c4>] dump_stack+0x24/0x38
 [<000000001016e170>] cache_alloc_refill+0x2f0/0x620
 [<0000000010190b30>] __getblk+0x38/0x80
 [<000000001016ee80>] kmem_cache_alloc+0x2a0/0x2b0
 [<000000000010f7c4>] ext2_alloc_branch+0x6c/0x310 [ext2]
 [<0000000010194fa8>] alloc_buffer_head+0x30/0x80
 [<000000001018fda8>] create_buffers+0x80/0x110
 [<00000000101eac24>] __divdi3+0x74/0xd0
 [<0000000010191154>] create_empty_buffers+0x2c/0x130
 [<000000001019230c>] __block_prepare_write+0x7d4/0x7e8
 [<0000000010193214>] block_prepare_write+0x44/0x78
 [<0000000000110024>] ext2_prepare_write+0x3c/0x50 [ext2]
 [<000000001016555c>] generic_file_aio_write_nolock+0x3cc/0xb88
 [<000000001016b724>] page_cache_readahead+0x144/0x198
 [<0000000010165d70>] generic_file_write_nolock+0x58/0x90
 [<000000001017aaa0>] do_no_page+0x320/0x678
 [<0000000010163938>] generic_file_read+0x68/0xa0
 [<000000001017b0e0>] handle_mm_fault+0x180/0x1f0
 [<0000000010165f54>] generic_file_write+0x7c/0xf0
 [<000000001018c8b4>] vfs_write+0xfc/0x170
 [<0000000010112258>] do_irq+0x138/0x190
 [<000000001018ca3c>] sys_write+0x64/0xb0
 [<0000000010112378>] do_cpu_irq_mask+0xc8/0x138


Last activity:
	I had just reconfigured the tulip/tg3.
And then started a "DISTCC" run from gsyprf11 with ion's tg3 card
listed as the only other in DISTCC_HOSTS. gsyprf11 and ion are
both connected to the same GigE switch and thus can talk full duplex
at "link rate". gsyprf11 survived and is running
	 2.4.21-pa6 #23 Mon Jul 14 23:11:39 PDT 2003

thanks,
grant
