Return-Path: <soete.joel@tiscali.be>
Received: from spoolo2.tiscali.be (spoolo2.tiscali.be [62.235.13.173])
	by dsl2.external.hp.com (Postfix) with ESMTP id DA099487E
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 13 Mar 2004 16:22:11 -0700 (MST)
Message-ID: <405397F3.1050406@tiscali.be>
Date: Sat, 13 Mar 2004 23:23:31 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: PA-RISC Linux Port <parisc-linux@lists.parisc-linux.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] 2.6.4-pa2 panic on c110 :(
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi all,

I just compile successfully (with defconfig) and seems to boot fine the last 2.6.4-pa2 kernel on my C110.
But as I was starting a rm -rf glibc it panics with console message:
arq->state 2
Badness in as_requeue_request at drivers/block/as-iosched.c:1479
Kernel addresses on the stack:
[<10125de8>] printk+0x188/0x1c8
[<10105938>] dump_stack+0x18/0x24
[<10229688>] as_requeue_request+0x64/0x10c
[<102205b0>] elv_requeue_request+0x2c/0x38
[<102232bc>] blk_insert_request+0xfc/0x104
[<1024cd30>] scsi_queue_insert+0x68/0x9c
[<102491ec>] scsi_softirq+0xfc/0x11c
[<10170560>] sys_select+0x1d0/0x3b8
[<101299c8>] do_softirq+0xf4/0xf8
[<1010c1e4>] syscall_do_softirq+0x8/0x10
[<1010b088>] intr_check_sig+0x0/0xc 


Don't know if it can help but that was the only system on which I always had to apply Grant tips:
<http://lists.parisc-linux.org/pipermail/parisc-linux/2003-October/021244.html>
ie replacing
	static unsigned long ccio_mem_ratio = 4;
by 2 in drivers/parisc/ccio-dma.c

Thanks in advance for help,
	Joel
