From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] Strange newest LAB msg?
Date: Sun, 2 Apr 2006 15:15:04 +0200
Message-ID: <200604021515.04424.deller@gmx.de>
References: <IX008E$FF5F5C221189CADA64719030F0E34D37@scarlet.be>
	<200604021129.31095.deller@gmx.de> <442FB31A.5040308@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <442FB31A.5040308@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sunday 02 April 2006 13:18, Joel Soete wrote:
> > On Saturday 01 April 2006 16:30, James Bottomley wrote:
> >>On Sat, 2006-04-01 at 09:35 +0200, Helge Deller wrote:
> >>>I'm pretty sure.
> >>>We never vmalloc'ed IOmem before.
> >>
> >>Where are you taking the ioremap virtual range from?  If it's the
> >>vmalloc range, which is the only one I can think we have available for
> >>arbitrary kernel mappings, then that would explain the behaviour.
> > 
> > 
> > Correct.
> > ioremap() calls get_vm_area(), which in turn gets it from __get_vm_area(size, flags, VMALLOC_START, VMALLOC_END);
> > VMALLOC_START seems to be at 32KB, while VMALLOC_END at around 240MB.
> > This means we have ~240MB of IO-Space which seems to little for the N4k.
> > 
> > Willy said in another mail:
> > 
> >>Either we're leaking vmalloc space, we allocate too much of it, or we
> >>need to drastically increase it the amount of it we have available.
> > 
> > 
> > I think Willy is right.
> > We probably don't leak in ioremap(), since we use the standard Linux kernel functions.
> > I would propose to analyze how much the 14 PCI busses wants to allocate, and if they free it correctly and if they might leak.
> > 
> > Might this be the culprit: 
> > (lba_pci.c:1216)
> > case PAT_PIOP:
> >                         /*
> >                         ** Postable I/O port space is per PCI host adapter.
> >                         ** base of 64MB PIOP region
> >                         */
> >                         lba_dev->iop_base = ioremap_nocache(p->start, 64 * 1024 * 1024);
> > It allocates 64MB in a loop.


LOG ANALYSIS:

> Setting cache flush threshold to ad700 (2 CPUs online)
> IOREMAP: phys=fffffffffed00000, size=1000
> IOREMAP: remapped to 0000000000008000	STARTING HERE
> SBA found Ike rev 2 at 0xfffffffffed00000
> IOREMAP: phys=fffffffffed02000, size=1000
> IOREMAP: remapped to 000000000000a000	OK, includes 4k filler
> [...]
> LBA version TR4.0 (0x5) found at 0xffffffffbffe0000
> IOREMAP: phys=ffffffffbffe0000, size=2000
> IOREMAP: remapped to 0000000000034000
> IOREMAP: phys=fffffff000000000, size=4000000	THIS IS THE 64MB ioremap() (see above)
> IOREMAP: remapped to 0000000000080000		OK.
> iosapic: no IRTE for 0000:00:04.0 (IRQ not connected?)
> IOREMAP: phys=ffffffffbffe2000, size=1000
> IOREMAP: remapped to 0000000000032000		FILLS up in-between.
> LBA version TR4.0 (0x5) found at 0xffffffffbffe2000
> IOREMAP: phys=ffffffffbffe2000, size=2000
> IOREMAP: remapped to 0000000000038000
> IOREMAP: phys=fffffff080000000, size=4000000	THE NEXT 64MB
> IOREMAP: remapped to 0000000004100000		OK.
> IOREMAP: phys=ffffffffbffe4000, size=1000
> IOREMAP: remapped to 000000000003c000
> LBA version TR4.0 (0x5) found at 0xffffffffbffe4000
> IOREMAP: phys=ffffffffbffe4000, size=2000
> IOREMAP: remapped to 0000000000040000
> IOREMAP: phys=fffffff100000000, size=4000000	ANOTHER 64MB
> IOREMAP: remapped to 0000000008180000		WE ARE NOW at 008180000
> IOREMAP: phys=ffffffffbffe8000, size=1000
> IOREMAP: remapped to 000000000003e000
> LBA version TR4.0 (0x5) found at 0xffffffffbffe8000
> IOREMAP: phys=ffffffffbffe8000, size=2000
> IOREMAP: remapped to 0000000000044000		THIS SMALL ONE IS STILL OK.
> IOREMAP: phys=fffffff200000000, size=4000000	BUT THIS BIG 64MB CHUNK FAILS.
> allocation failed: out of vmalloc space - use vmalloc=<size> to increase size.
> IOREMAP: phys=ffffffffbffea000, size=1000
> IOREMAP: remapped to 0000000000048000		OTHER SMALLER ONES OK AGAIN..
> LBA version TR4.0 (0x5) found at 0xffffffffbffea000

So, the problem is really the 64MB ioremap() from lba_pci.c:1216.
Grant, Willy, ... : Is it possible to reduce it or to iounmap() it again ?


> EXT3-fs: mounted filesystem with ordered data mode.
> VFS: Mounted root (ext3 filesystem) readonly.
> Freeing unused kernel memory: Badness in smp_call_function at /usr/src/linux-2.6.16.1-pa10/arch/parisc/kernel/smp.c:348
> Backtrace:
>   [<0000000010112900>] dump_stack+0x18/0x28
>   [<000000001011d9b4>] smp_call_function+0x37c/0x3c0
>   [<0000000010111c5c>] flush_data_cache+0x2c/0x48
>   [<00000000101109a8>] free_initmem+0x68/0x2f8
>   [<000000001010fb20>] init+0x858/0x8c8
>   [<000000001010347c>] ret_from_kernel_
> (this latest 'Badness in smp_call_function ...' was there but seems to be harmless and the boot continue without showing any more 
> IOREMAP info ;-) )

WHAT'S THAT ?
Do we have some __init too much ?
I never tested SMP.


> PS: btw, rm CONFIG_DETECT_SOFTLOCKUP in the config doesn't help on this system ;<(:
> still hanging (this time without Softlockup msg) after only:
> top - 09:04:58 up 1 day, 16:26,  3 users,  load average: 2.40, 2.26, 2.20

I think the softlockups don't really matter.
Does your box hangs without SMP as well ?

Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
