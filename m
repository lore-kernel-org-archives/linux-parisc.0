Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0AD24484B
	for <parisc-linux@parisc-linux.org>; Sun,  2 Feb 2003 14:03:36 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18fRH4-0000Ro-00; Sun, 02 Feb 2003 21:03:34 +0000
Date: Sun, 2 Feb 2003 21:03:34 +0000
From: Matthew Wilcox <willy@debian.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Matthew Wilcox <willy@debian.org>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Compiler switches
Message-ID: <20030202210334.H21040@parcelfarce.linux.theplanet.co.uk>
References: <20030202035920.F21040@parcelfarce.linux.theplanet.co.uk> <200302020456.h124ueYd025040@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200302020456.h124ueYd025040@hiauly1.hia.nrc.ca>; from dave@hiauly1.hia.nrc.ca on Sat, Feb 01, 2003 at 11:56:40PM -0500
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

On Sat, Feb 01, 2003 at 11:56:40PM -0500, John David Anglin wrote:
> > -D__linux__ looks like it can go away.
> 
> Agreed.  This is defined for sure in 3.1/3.2 and later.

Plus there's very little code which checks for __linux__ in the source tree ;-)

> > -fno-strength-reduce has been there since before we moved to ELF -- over 3
> > years.  Any bug this was working around has hopefully been long-squashed.
> > I think we should eliminate this and submit PRs if it finds new holes.
> 
> I always wondered why this option was used.

OK, I'll take it out now.

> > -mno-space-regs & -mfast-indirect-calls can also go away, I think.
> > I can't imagine that we ever didn't have them as default on a gcc
> > 3.0-based compiler.
> 
> These are still not the default but possibly they should be.
> 
> Actually, I can see that we can save a couple of instructions when
> generating long indirect calls to a symbol reference when no space
> registers is defined.

I think they definitely should be implied by configuring for hppa-linux.
I don't see any enthusiasm for allowing use of additional space registers
for special purposes.

> > Do we still need -ffunction-sections?  I'm inclined to leave it anyway
> > to enable compilation with older toolchains.
> 
> Cross my fingers, but I believe that the distance problem for calls
> is fixed 3.2.2.  However, if there really are objects with .text larger
> than 240000 bytes, then you should probably still define -ffunction-sections.

hmm.. part of the problem is the ld -r steps.  The current 2.5 build
process does things like:

  hppa-linux-gcc -Wp,-MD,drivers/block/.loop.o.d -D__KERNEL__ -Iinclude -Wall -W
strict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common -D__linux_
_ -pipe -fno-strength-reduce -mno-space-regs -mfast-indirect-calls -mdisable-fpr
egs -ffunction-sections -march=1.1 -mschedule=7100LC -fomit-frame-pointer -nostd
inc -iwithprefix include    -DKBUILD_BASENAME=loop -DKBUILD_MODNAME=loop   -c -o
 drivers/block/loop.o drivers/block/loop.c

   hppa-linux-ld   -r -o drivers/block/built-in.o drivers/block/elevator.o drive
rs/block/ll_rw_blk.o drivers/block/ioctl.o drivers/block/genhd.o drivers/block/s
csi_ioctl.o drivers/block/deadline-iosched.o drivers/block/rd.o drivers/block/lo
op.o

   hppa-linux-ld   -r -o drivers/built-in.o drivers/pci/built-in.o drivers/paris
c/built-in.o drivers/serial/built-in.o drivers/parport/built-in.o drivers/base/b
uilt-in.o drivers/char/built-in.o drivers/block/built-in.o drivers/misc/built-in
.o drivers/net/built-in.o drivers/media/built-in.o drivers/scsi/built-in.o drive
rs/cdrom/built-in.o drivers/video/built-in.o drivers/usb/built-in.o drivers/inpu
t/built-in.o drivers/input/serio/built-in.o drivers/md/built-in.o drivers/eisa/b
uilt-in.o

        hppa-linux-ld  -T arch/parisc/vmlinux.lds.s arch/parisc/kernel/head.o   
init/built-in.o --start-group  usr/built-in.o arch/parisc/kernel/pdc_cons.o arch
/parisc/kernel/process.o  arch/parisc/mm/built-in.o  arch/parisc/kernel/built-in
.o  arch/parisc/hpux/built-in.o  arch/parisc/math-emu/built-in.o arch/parisc/ker
nel/init_task.o  kernel/built-in.o  mm/built-in.o  fs/built-in.o  ipc/built-in.o
  security/built-in.o  crypto/built-in.o  lib/lib.a  arch/parisc/lib/lib.a `hppa
-linux-gcc -print-libgcc-file-name`  drivers/built-in.o  sound/built-in.o  arch/
parisc/oprofile/built-in.o  net/built-in.o --end-group  -o vmlinux

Now, which .text is limited to 240k?  loop.o, drivers/block/built-in.o,
drivers/built-in.o or vmlinux?

> When the total code bytes exceeds the above limit (PA 1.X), gcc switches
> to long indirect calls.  These are horribly inefficient.

Horribly inefficient in terms of being prefetchable?

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
