Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id E3F8F482A
	for <parisc-linux@parisc-linux.org>; Sat,  4 Aug 2001 22:22:02 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15TFQM-00089I-00; Sun, 05 Aug 2001 05:21:58 +0100
Date: Sun, 5 Aug 2001 05:21:58 +0100
From: Matthew Wilcox <willy@debian.org>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] A general cleanup & overhaul of native device handling
Message-ID: <20010805052158.A26359@parcelfarce.linux.theplanet.co.uk>
References: <20010801165903.B4199@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010801165903.B4199@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Wed, Aug 01, 2001 at 04:59:03PM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Aug 01, 2001 at 04:59:03PM +0100, Matthew Wilcox wrote:
> At some point, I'm going to try booting a machine with this patch applied
> and see what happens.  I expect it to explode messily right now, tbh, but
> at least it compiles.  I'm interested in criticism of this architecture.
> After I get this hunk of work done, I'll move on to an iotree, and maybe
> then to actually doing hotplug for native devices... that isn't high on
> my priority list and I'd be happy to leave it to somebody else :-)

It was actually less messy than I thought.  The only issue which arose
was because i modularised Lasi & Asp without rearranging the order devices
are initialised in.  I decided to solve that one by demodularising these
two drivers rather than changing intialisation order because I think I
have a better way of fixing this, which will involve implementing the
fabled iotree.

I fixed a couple of minor thinkos from the original patch -- I didn't mean
to include an in-progress partial rewrite of some of the PCI inb/outw/etc
functions.  I probably made fallback processor detection work again.
And I missed a s/d/dev/ in lba_pci.

Anyway, this patch now works for me on a 712 & J7k.  With this kind of
patch, it's likely to break one random machine out there (and, on past
experience, it'll be lamont's...) , so I'd like to get people testing
as widely as possible.  The patch is against 2.4.7-pa1, and can be found
at ftp://puffin.external.hp.com/pub/parisc/src/parisc_device-2.diff

I am planning on committing this patch soon, so please test ASAP.
I'm particularly interested in seeing reports from 715/Scorpio, J2xx/C1xx
and B1xx/C1xxL machines.

If you feel you own any of these files, you should also at least glance
at the patch:

$ diffstat parisc_device-2.diff 
 arch/parisc/kernel/ccio-dma.c  |   60 ++++-----
 arch/parisc/kernel/drivers.c   |  259 ++++++++++++++++++++---------------------
 arch/parisc/kernel/firmware.c  |    1 
 arch/parisc/kernel/hardware.c  |    9 -
 arch/parisc/kernel/inventory.c |   32 +----
 arch/parisc/kernel/iosapic.c   |    2 
 arch/parisc/kernel/lba_pci.c   |  100 +++++++--------
 arch/parisc/kernel/led.c       |    2 
 arch/parisc/kernel/sba_iommu.c |  121 +++++++------------
 arch/parisc/kernel/setup.c     |   65 +++++-----
 drivers/char/hp_psaux.c        |   61 +++++----
 drivers/gsc/asp.c              |   34 +++--
 drivers/gsc/busdevice.c        |   49 ++-----
 drivers/gsc/busdevice.h        |   18 --
 drivers/gsc/dino.c             |  173 ++++++++++-----------------
 drivers/gsc/hil.c              |   39 +++---
 drivers/gsc/lan.c              |   59 +++++----
 drivers/gsc/lasi.c             |   51 +++++---
 drivers/gsc/serial.c           |  127 ++++++--------------
 drivers/gsc/wax.c              |   47 ++++---
 drivers/gsc/wax_eisa.c         |   53 ++++----
 drivers/parport/parport_gsc.c  |   34 +++--
 drivers/scsi/lasi7xx.c         |   64 ++++------
 drivers/scsi/zalon7xx.c        |   66 +++++-----
 drivers/sound/harmony.c        |   38 +++---
 drivers/video/sti/sticore.c    |   10 -
 include/asm-parisc/gsc.h       |    4 
 include/asm-parisc/hardware.h  |   87 ++++++-------
 include/asm-parisc/iosapic.h   |    2 
 include/asm-parisc/pci.h       |    4 
 include/asm-parisc/processor.h |    2 
 31 files changed, 776 insertions, 897 deletions


-- 
Revolutions do not require corporate support.
