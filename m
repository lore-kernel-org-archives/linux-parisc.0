From: "Michael S. Zick" <mszick@wolfbutter.com>
Subject: Re: [parisc-linux] BUG 2.6.11-rc4-pa1 XFS data page fault
Date: Fri, 18 Feb 2005 08:07:30 -0600
Message-ID: <200502180807.30480.mszick@wolfbutter.com>
References: <20050218092835.0E74E3658E2@mail.esiee.fr>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-2022-jp"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050218092835.0E74E3658E2@mail.esiee.fr>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri February 18 2005 03:28, Thibaut VARENE wrote:
> -------------------
> > On Thu, Feb 17, 2005 at 06:53:52AM -0600, Michael S. Zick wrote:
> > > I am tracking a timing and/or race condition(s) with x86-udev.
> > > Debian doesn't use it yet, they still have a hard disk based /dev.
> > > But it is not a compile time option.
> > > If you have a 2.6.+ kernel, you have it.
> > > 
> > > Try turning it off with the command line option: 'noudev'
> > 
> > I thought this helped at first.  (2.6.11-rc4-pa1)
> > Could run spew+"make -j4" over xfs without crashing the box (panic).
> > 
> > Then I rebooted with a freshly built kernel (and "noudev")
> > and right away when I start spew on the XFS file system I get:
> 
>  
> > The only difference in the .config was sym2 driver IOMAPPED.
> > I had it enabled (using IO Port space) and now disable it
> > since I really want MMIO space. I'm very skeptical this is
> > related to the problem.
> 
Try the command line option: pci=routeirq

I know that pa-risc pci is a totally different beast, so can't say
how much effect the changes in generic affect your systems.


> Hmmm.
> Back in the early days of 2.5, i recall issues with SYM2 in MMIO mode,
> so that it only worked in PIO mode (I think i had posted something on
> this m-l about that). At that time i was using ext3 for that matter.
> 
> OTOH, XFS relies a lot on memory and cache quality. I don't know how
> MMIO would interfere with that, but I suspect that if enabling MMIO
> has the side effect of messing with that somehow, it's very likely XFS
> won't like it at all. Just a random thought though.
>  
> > > If your compile time options include devfs, try turning it 
> > > off also.  Use the command line option: 'nodevfs'
> > 
> > I don't use devfs. Willy won't let me. :^P
> 
I have to agree with Willy on this one.
Taking it out of the kernel is a step forward for the kernel designers.

The udev system, although envisioned as a replacement for devfs
is much more general and can (could, might) lead to mountable
cpu and memory segments.

? ? ? ?

To take a cpu off-line, such as for test/maintance:
mount -o remount,ro /dev/cpu/xxx

To shut it down, such as for replacement:
umount /dev/cpu/xxx

To take a memory range off-line, such as for test/maintance:
mount -o remount,ro /dev/mem/<memory-range-id>

To take failed memory range down for replacement:
umount /dev/mem/<memory-range-id>

These operations are common in both tightly coupled
smp (symetrical) systems and loosely coupled amp
(asymetrical) systems. 

A loosely coupled multiple processor system might not
have all of its cpus and memory in a single box.

Even a tightly coupled multiple processor system used
for 'non-stop' service can use these features.

This is the real power of what is now the udev system, not
just dynamic device naming.
It allows Linux to grow into both a single processor OS
and a general purpose, parallel processing OS.

It looks to me as if nearly all of the code is in-place, just
needs some changes in kernel initialization and some
general consolidation of existing kernel functions.

Mike
PS: These changes also give new reasons for including
my version of system sched.c into the kernel as an option
in 2.9.x

> well, devfs is 3v1l and deprecated, so you'd better not use it :)
> 
> > > In my case, for kernels 2.6.8, 2.6.9, 2.6.10 and 2.6.11 -
> > > If I boot from slow devices (cdrom, zip disk) everything is
> > > fine, If I boot from fast devices (hard disk) - something isn't
> > > getting setup the same.
> > 
> > Is there a difference in the how the devices are used?
> > ie. serialized vs. multiple IOs in flight at the same time?
> > 
> > I didn't start hitting problems until I lauched a second job
> > on the same file system.
> 
> Come to think of it, I wonder how the XFS bug you're pointing at can
> be related to the bug Joel and I reported with ext3:
> http://lists.parisc-linux.org/pipermail/parisc-linux/2005-February/025
> 867.html
> 
> Maybe one would like to try XFS on a non-SYM2 box and see what
> happens? That way we might have a clue whether sym2's at fault or
> something else...
> 
> My 2 cents in the morning ;)
> 
> Thibaut VARENE
> PA/Linux ESIEE Team
> http://www.pateam.org/
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
> 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
