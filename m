Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.medianet-world.de (mail1.medianet-world.de [213.157.0.162])
	by dsl2.external.hp.com (Postfix) with SMTP id B86FC4851
	for <parisc-linux@lists.parisc-linux.org>; Sun, 22 Jun 2003 09:20:13 -0600 (MDT)
Message-ID: <3EF5C964.1040208@bluehash.de>
Date: Sun, 22 Jun 2003 17:21:08 +0200
From: =?ISO-8859-15?Q?R=FCdiger_Scholz?= <r.scholz@bluehash.de>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Subject: [parisc-linux] Problem during dselect with 2.5.72-pa1
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

Hi there,

after getting a working 2.5-kernel, I decided play a little bit with it. 
So I run dselect to update my debian. Everything went fine until 
unpacking a large package, the package "tetex-extra". After a while I 
heard no sound from the harddisk and dselect didn't response, so I 
opened the serial console. The following errror was reported in an 
endless loop:

------------SNIP-------------

    kernel BUG at include/linux/swapops.h:68!
    Kernel addresses on the stack:
     [<10124f20>] .L1612+0x0/0x38
     [<10105adc>] dump_stack+0x10/0x1c
     [<1014f0bc>] .L1248+0x0/0x28
     [<10140a78>] .L1226+0x0/0x7c
     [<1014f214>] .L1302+0x14/0x180
     [<10152354>] .L1179+0x0/0x90
     [<10145590>] .L1536+0x58/0x244
     [<101440ac>] .L1286+0x20/0x30
     [<10145a50>] .L1553+0xc4/0x2b8
     [<10146324>] .L1729+0xb8/0xec
     [<10146750>] balance_pgdat+0x16c/0x1bc
     [<10146880>] .L1802+0x0/0x70
     [<10109c5c>] ret_from_kernel_thread+0x1c/0x24

    kernel BUG at mm/rmap.c:343!
    Kernel addresses on the stack:
     [<10124f20>] .L1612+0x0/0x38
     [<10105adc>] dump_stack+0x10/0x1c
     [<1014efcc>] .L1254+0x0/0x24
     [<10140a78>] .L1226+0x0/0x7c
     [<1014f214>] .L1302+0x14/0x180
     [<10152354>] .L1179+0x0/0x90
     [<10145590>] .L1536+0x58/0x244
     [<101440ac>] .L1286+0x20/0x30
     [<10145a50>] .L1553+0xc4/0x2b8
     [<10146324>] .L1729+0xb8/0xec
     [<10146750>] balance_pgdat+0x16c/0x1bc
     [<10146880>] .L1802+0x0/0x70
     [<10109c5c>] ret_from_kernel_thread+0x1c/0x24

    kernel BUG at include/linux/swapops.h:68!
    Kernel addresses on the stack:
     [<10124f20>] .L1612+0x0/0x38
     [<10105adc>] dump_stack+0x10/0x1c
     [<1014f0bc>] .L1248+0x0/0x28
     [<10140a78>] .L1226+0x0/0x7c
     [<1014f214>] .L1302+0x14/0x180
     [<10152354>] .L1179+0x0/0x90
     [<10145590>] .L1536+0x58/0x244
     [<101440ac>] .L1286+0x20/0x30
     [<10145a50>] .L1553+0xc4/0x2b8
     [<10146324>] .L1729+0xb8/0xec
     [<10146750>] balance_pgdat+0x16c/0x1bc
     [<10146880>] .L1802+0x0/0x70
     [<10109c5c>] ret_from_kernel_thread+0x1c/0x24

    kernel BUG at mm/rmap.c:343!

------------SNAP-------------

Any idea why this had happened?
Kernel was compiled via "make defconfig", but disabled HIL-Support and 
gcc-3.2.

Rüdiger
