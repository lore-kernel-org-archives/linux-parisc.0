Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id C3AC3482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  3 Aug 2001 10:28:04 -0600 (MDT)
Message-Id: <200108031626.KAA29447@puffin.external.hp.com>
To: Martin Eisfeld <me@hedd.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Problems with Installing of 0.9.2 on HP 715/100 
In-Reply-To: Message from Martin Eisfeld <me@hedd.de>
   of "Fri, 03 Aug 2001 11:26:21 +0200." <3B6A6E3D.40CF73C1@hedd.de>
Date: Fri, 03 Aug 2001 10:26:42 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Martin Eisfeld wrote:
> here are the full putput from serial terminal (terminalemulation with
> hyperterminal from winnt).

FYI, Richard Hirst put the System.map for 0.9.2 at:
	http://puffin.external.hp.com/~rhirst/sys_map.0.9.2-32.gz
	http://puffin.external.hp.com/~rhirst/sys_map.0.9.2-64.gz

gunzip and rename to System.map. Then 'a' (see CVS build-tools repository)
can pull the symbols out given the hex address.

...
> ELF32 executable
> Entry 00100000 first 00100000 n 4
> Segment 0 load 00100000 size 1606948 mediaptr 0x1000
> Segment 1 load 0028a000 size 468472 mediaptr 0x18a000
> Segment 2 load 00300000 size 8192 mediaptr 0x1fd000
> Segment 3 load 0034bea8 size 80688 mediaptr 0x1ffea8
> Loading ramdisk 1991209 bytes @ 0fe09000...
> branching to kernel entry point 0x00100000
> Set default PSW W bit to 0
> 0x02.CBF0
> 0x02.503F

I'm going to guess the system HPMC's at this point and then
our HPMC handler faults (Code 15). Symbols found in the
the stack dump were:
0x1028a010 $global$+0
0x10106750 skip_save_ior+164
0x10102220 handle_interruption+138
0x10292080 hpmc_stack+80
0x10292080 hpmc_stack+80
0x10102614 parisc_terminate+48
0x102565e4 packet_exit+cd8
0x10292080 hpmc_stack+80
0x10102568 show_stack+4c
0x10337010 pidhash+dfc
0x10102614 parisc_terminate+48
0x10256000 packet_exit+6f4
0x10292080 hpmc_stack+80
0x1029f3c0 exec_domains_lock+0
0x1028a010 $global$+0
0x10292700 hpmc_stack+700
0x10102574 show_stack+58
0x10102578 show_stack+5c
0x10106750 skip_save_ior+164

(found using "astk" script)

Could you post the PIM dump?
PIM dump is available from BOOT_ADMIN prompt by just typing "PIM HPMC"
after the machine resets. This will tell us if/where the kernel died when
accessing IO space.

FWIW, here are symbols for Code 15 register dump:
IOAQ 0x10102574 show_stack+58
GR02 0x10102614 parisc_terminate+48

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
