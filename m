From: Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: kernel 4.6-rc unbootable due to module changes
Date: Tue, 5 Apr 2016 13:36:21 -0400 (EDT)
Message-ID: <alpine.LRH.2.02.1604051332280.25453@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.1604051326470.14606@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.02.1604051326470.14606@file01.intranet.prod.int.rdu2.redhat.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org



On Tue, 5 Apr 2016, Mikulas Patocka wrote:

> Hi
> 
> The patch "parisc: Use generic extable search and sort routines" makes the 
> kernel unable to load any modules. It fails with:
> 
> module unix: Unknown relocation: 9
> modprobe: FATAL: Error inserting unix (/lib/modules/4.6.0-rc2/kernel/net/unix/unix.ko): Invalid module format
> 
> When I revert the patch, the kernel 4.6-rc2 boots fine.
> 
> Apparently, the function apply_relocate_add in arch/parisc/kernel/module.c 
> doesn't handle the new relocation type.
> 
> Mikulas

BTW. I'm using hppa64 binutils 2.21 to build the kernel. It generates the 
R_PARISC_PCREL32 relocation that the kernel module loader doesn't handle:

RELOCATION RECORDS FOR [__ex_table]:
OFFSET           TYPE              VALUE
0000000000000000 R_PARISC_PCREL32  .text.unix_ioctl+0x0000000000000064
0000000000000004 R_PARISC_PCREL32  fixup_put_user_skip_1+0x0000000000000008
0000000000000008 R_PARISC_PCREL32  .text.unix_ioctl+0x00000000000000a8
000000000000000c R_PARISC_PCREL32  fixup_put_user_skip_1+0x0000000000000008
0000000000000010 R_PARISC_PCREL32  .text.unix_ioctl+0x00000000000000b4
0000000000000014 R_PARISC_PCREL32  fixup_put_user_skip_1+0x0000000000000008
0000000000000018 R_PARISC_PCREL32  .text.unix_ioctl+0x00000000000000c0
000000000000001c R_PARISC_PCREL32  fixup_put_user_skip_1+0x0000000000000008

Mikulas
