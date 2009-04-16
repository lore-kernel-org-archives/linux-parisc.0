From: Borislav Petkov <petkovbb@googlemail.com>
Subject: Re: [PATCH] ide-cd: fix kernel crash on hppa regression
Date: Thu, 16 Apr 2009 08:37:35 +0200
Message-ID: <20090416063735.GA21742@liondog.tnic>
References: <49E6638B.8090700@gmx.de>
Reply-To: petkovbb@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: Linus <torvalds@linux-foundation.org>,
	Borislav Petkov <petkovbb@googlemail.com>,
	Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	"Rafael J. Wysocki" <rjw@sisk.pl>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <49E6638B.8090700@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi,

On Thu, Apr 16, 2009 at 12:45:31AM +0200, Helge Deller wrote:
> With 2.6.30-rc2 I face a kernel crash on the 32bit hppa architecture 
> due to ide-cd when udev creates the device nodes at startup:
> 
> Kernel Fault: Code=26 regs=8ed34c40 (Addr=00000024)
> IASQ: 00000000 00000000 IAOQ: 1034b5ac 1034b5b0
>  IIR: 4ab30048    ISR: 00000000  IOR: 00000024
>  CPU:        0   CR30: 8ed34000 CR31: ffff55ff
>  ORIG_R28: 00000000
>  IAOQ[0]: ide_complete_rq+0x2c/0x70
>  IAOQ[1]: ide_complete_rq+0x30/0x70
>  RP(r2): cdrom_newpc_intr+0x178/0x46c
> Backtrace:
>  [<1035c608>] cdrom_newpc_intr+0x178/0x46c
>  [<1034c494>] ide_intr+0x1b0/0x214
>  [<1016d284>] handle_IRQ_event+0x70/0x150
>  [<1016d4b0>] __do_IRQ+0x14c/0x1cc
>  [<102f7864>] superio_interrupt+0x88/0xbc
>  [<1016d284>] handle_IRQ_event+0x70/0x150
>  [<1016d4b0>] __do_IRQ+0x14c/0x1cc
>  [<10112efc>] do_cpu_irq_mask+0x9c/0xd0
>  [<10116068>] intr_return+0x0/0x4
> 
> This crash seems to happen due to an uninitialized variable "rc".
> The compiler even warns about that:
>   CC      drivers/ide/ide-cd.o                                                         
> /mnt/sda4/home/cvs/parisc/git-kernel/linus-linux-2.6/drivers/ide/ide-cd.c: In function `cdrom_newpc_intr':
> /mnt/sda4/home/cvs/parisc/git-kernel/linus-linux-2.6/drivers/ide/ide-cd.c:612: warning: `rc' might be used uninitialized in this function

can you do

gdb ./vmlinux

and then

(gdb) l *(cdrom_newpc_intr+0x178)

I think I have a suspect but I want to be sure. In order to do that
you'll need a debug kernel (set CONFIG_DEBUG_INFO to 'y' in your
.config). In case the oops above is not from a debug kernel, can you
catch it again and _then_ do the gdb thing since the offset of 0x178 is
most probably going to change. In that case, you have to do

(gdb) l *(cdrom_newpc_intr+NEW_OFFSET_FROM_THE_OOPS)

Thanks.

-- 
Regards/Gruss,
    Boris.
