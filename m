Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.medianet-world.de (mail1.medianet-world.de [213.157.0.162])
	by dsl2.external.hp.com (Postfix) with SMTP id 85BFE482D
	for <parisc-linux@lists.parisc-linux.org>; Thu, 19 Jun 2003 12:48:50 -0600 (MDT)
Message-ID: <3EF205C9.9010600@bluehash.de>
Date: Thu, 19 Jun 2003 20:49:45 +0200
From: =?ISO-8859-1?Q?R=FCdiger_Scholz?= <r.scholz@bluehash.de>
MIME-Version: 1.0
To: Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Some 2.5-testing
References: <200306171622.h5HGM5QJ010581@hiauly1.hia.nrc.ca> <3EF1353C.8030705@bluehash.de> <20030619114009.GA24357@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20030619114009.GA24357@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

Hi,

back again with new results! Compiled Kernel with CONFIG_KALLSYMS and 
md-support. Here is a part from the boot-log:
---------SNIP

    md: linear personality registered as nr 1
    Badness in local_bh_enable at kernel/softirq.c:109
    Kernel addresses on the stack:
     [<10124ee8>] printk+0xf0/0x128
     [<10105adc>] dump_stack+0x10/0x1c
     [<101289b8>] .L886+0x0/0x50
     [<1028b3d0>] .L1082+0x8/0x18
     [<1028bdd4>] .L812+0x0/0x9c
     [<1012cdb8>] do_timer+0x68/0x118
     [<1028c9b0>] .L917+0x48/0x58
     [<1028cc0c>] hil_mlcs_process+0x28/0x4c
     [<10128c48>] .L919+0x10/0x24
     [<1012891c>] do_softirq+0x9c/0xf8
     [<1010a068>] intr_return+0x0/0x14
     [<10107268>] do_cpu_irq_mask+0x90/0xf0
     [<1020e7a0>] .L1836+0x18/0x38
     [<1010a068>] intr_return+0x0/0x14
     [<10210ef0>] serial8250_console_write+0xf0/0x158
     [<10210ec0>] serial8250_console_write+0xc0/0x158
     [<10124b4c>] __call_console_drivers+0x6c/0x98
     [<10124cd8>] call_console_drivers+0xf0/0x178
     [<1010ea4c>] .L632+0x0/0xac
     [<1012504c>] .L1637+0x0/0x2c
     [<1028b3d0>] .L1082+0x8/0x18
     [<10124f20>] .L1612+0x0/0x38
     [<1028b594>] .L1154+0x0/0x10
     [<1029aa6c>] register_md_personality+0xa0/0xa8
     [<103e14d4>] do_initcalls+0x64/0xe0
     [<10100284>] init+0x28/0x60
     [<10109c5c>] ret_from_kernel_thread+0x1c/0x24

    Badness in local_bh_enable at kernel/softirq.c:109
    Kernel addresses on the stack:
     [<10124ee8>] printk+0xf0/0x128
     [<10105adc>] dump_stack+0x10/0x1c
     [<101289b8>] .L886+0x0/0x50
     [<1028b3d0>] .L1082+0x8/0x18
     [<1028bbf0>] .L762+0x0/0x74
     [<1028ac48>] .L1018+0x0/0x3c
     [<1028cad8>] .L974+0x20/0xc4
     [<1028cc0c>] hil_mlcs_process+0x28/0x4c
     [<10128c48>] .L919+0x10/0x24
     [<1012891c>] do_softirq+0x9c/0xf8
     [<1020e7a0>] .L1836+0x18/0x38
     [<1010a260>] intr_do_softirq+0x8/0x10
     [<101e5248>] $$divU+0x100/0x120
     [<10210ec0>] serial8250_console_write+0xc0/0x158
     [<10124b4c>] __call_console_drivers+0x6c/0x98
     [<10124cd8>] call_console_drivers+0xf0/0x178
     [<1010ea4c>] .L632+0x0/0xac
     [<1012504c>] .L1637+0x0/0x2c
     [<1028b3d0>] .L1082+0x8/0x18
     [<10124f20>] .L1612+0x0/0x38
     [<1028b594>] .L1154+0x0/0x10
     [<1029aa6c>] register_md_personality+0xa0/0xa8
     [<103e14d4>] do_initcalls+0x64/0xe0
     [<10100284>] init+0x28/0x60
     [<10109c5c>] ret_from_kernel_thread+0x1c/0x24

----------SNAP

Later I will grap some piminfo on the loop, and run dump_analyser on it.
Anything else I can do?

Rüdiger

Matthew Wilcox schrieb:

>So... what's going on here is that someone's enabling softirqs with hard
>interrupts disabled.  This is not a smart thing to do.  Unfortunately,
>something is messing up the stack backtrace, so it's hard tosee what's
>going on.  Could you turn on CONFIG_KALLSYMS so the kernel prints out
>its symbols?  The messages may still be corrupt, but we should have more
>information to help us figure out what's going on.
>  
>
