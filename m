Return-Path: <soete.joel@tiscali.be>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 033C348DF
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 11 Mar 2004 05:59:58 -0700 (MST)
Date: Thu, 11 Mar 2004 13:59:49 +0100
Message-ID: <404EC1C6000018AB@ocpmta1.freegates.net>
In-Reply-To: <20040310224816.GA23292@tausq.org>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: RE: [parisc-linux] ns87415 (superio) support for 2.6.x
To: "Randolph Chung" <randolph@tausq.org>, parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: 
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi Randolph,

> This patch fixes ns87415 to work on suckyio-based boxes. the device
> reports that dma is enabled, but from the performance we get it 
>looks like something is still not quite right (we only see ~3MB/s)
>
>Patch is against 2.6.4-rc3-pa5....  tested on c3000 and c3750. 
>(Thanks Max.)

I just build the new 2.6.4-rc-pa6 (in which this patch is included also if
i didn't miss anything?) and boot it successfully on my b2k. Any way I noticed
a 'kernel bug()' in dmesg:

Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2
ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
kernel BUG at include/asm/ide.h:30!
Kernel addresses on the stack:
 [<10124bf8>] printk+0x188/0x1c8
 [<101036b8>] dump_stack+0x18/0x24
 [<1023e6dc>] init_hwif_data+0xd0/0x2e8
 [<101eaac4>] create_dir+0x4c/0x64
 [<104385bc>] init_ide_data+0x44/0x58
 [<10438fb0>] ide_init+0x44/0x80
 [<1042c780>] do_initcalls+0x58/0xf8
 [<101001d0>] init+0x28/0xd4
 [<10109c5c>] ret_from_kernel_thread+0x1c/0x24

kernel BUG at include/asm/ide.h:30!
Kernel addresses on the stack:
 [<10124bf8>] printk+0x188/0x1c8
 [<101036b8>] dump_stack+0x18/0x24
 [<1023e6dc>] init_hwif_data+0xd0/0x2e8
 [<101eaac4>] create_dir+0x4c/0x64
 [<104385c4>] init_ide_data+0x4c/0x58
 [<10438fb0>] ide_init+0x44/0x80
 [<1042c780>] do_initcalls+0x58/0xf8
 [<101001d0>] init+0x28/0xd4
 [<10109c5c>] ret_from_kernel_thread+0x1c/0x24

NS87415: IDE controller at PCI slot 0000:00:0e.0
NS87415: chipset revision 3
NS87415: 100% native mode on irq 103
    ide0: BM-DMA at 0x0900-0x0907, BIOS settings: hda:DMA, hdb:DMA
    ide1: BM-DMA at 0x0908-0x090f, BIOS settings: hdc:DMA, hdd:DMA
hda: LTN485S, ATAPI CD/DVD-ROM drive
Using anticipatory io scheduler
ide0 at 0xe00-0xe07,0xd02 on irq 103
hda: ATAPI 48X CD-ROM drive, 120kB Cache
Uniform CD-ROM driver Revision: 3.20


Thanks for your help,
    Joel

PS: this b2k is only equiped with a simple (readonly :O ) ide cdrom drive


----------------------------------------------------------------------------------------
Tiscali ADSL: 19,50 €/mois, pendant 3 mois! L'Internet rapide, c'est pour
tout le monde.
http://reg.tiscali.be/default.asp?lg=fr
