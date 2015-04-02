From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: E Class and SCSI (53c700 driver)
Date: Thu, 02 Apr 2015 11:59:34 +0300
Message-ID: <1427965174.3559.110.camel@HansenPartnership.com>
References: <5519CA2B.9060407@gmail.com> <551CF8D9.3020506@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Dmitry the Zuryanovich <dreadbit@gmail.com>,
	debian-hppa@lists.debian.org,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <551CF8D9.3020506@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, 2015-04-02 at 10:07 +0200, Helge Deller wrote:
> Hi Dmitry,
> 
> I've added the parisc-kernel-devel mailing list too, since I expect
> that *if* somebody is able to answer your question, it will probably
> be on the parisc-kernel-devel list...
> 
> On 31.03.2015 00:11, Dmitry the Zuryanovich wrote:
> > As I understand, E class (in my case - E25) has LASI based 53c710
> > which is handled by 53c700.c? (and in case of workstations wrapped by
> > lasi700 - what's for? Just for detecting it?)
> >
> > If I know that that's
> >
> > 5. Sahp Baat Kiuh SCSI at 0xfff74000 [56/52] {4, 0x0, 0x044, 0x00039}
> >
> > , is there a reason to try to
> >
> > #modprobe 53c700 clock=25  base=0xfff74000
> 
> Looking at drivers/scsi/lasi700.c, it seems the lasi700 driver sets
> additional flags like force_le_on_be, chip710, burst_length and so on.
> In addition, the IRQs gets connected via drivers/parisc/lasi.c (see lasi_choose_irq()).
> I assume you would need at least a "case 0x39" in there.
> But James is the expert on the 53c700 driver, so he might know more... ?

Well, I can tell you that the modprobe won't work.  The 53c700 is
designed to be a wrapper driver, meaning that it relies on another
driver (like lasi700 or zorro7xxx or something) to set up the interrupt
line and the register mappings.

Probably all that's needed is a tiny wrapper driver for whatever bus
it's on (what bus is this?).  If you look at lasi, it basically pulls
the parameters out of firmware, translates the lasi specific IRQ setting
and enables the GSC interrupt (plus some LED stuff specific to lasi).

> > [correct my syntax] and may I expect this to work somehow?
> >
> > What's the problem with  SCSI on E class? Is that a need of some
> > driver which calls 53c700.c with correct parameters taken from
> > hardware? Can it be just passed to module via parameter or the
> > problem is deeper?
> 
> It might be deeper.
> In  arch/parisc/kernel/hardware.c I see:
>          {HPHW_A_DMA, 0x044, 0x00039, 0x80, "Sahp Baat Kiuh SCSI"},

That tells us it's on the Precision bus, doesn't it?

> while other SCSI drivers on LASI have HPHW_FIO, e.g.:
> 	{HPHW_FIO, 0x016, 0x00082, 0x0, "Gecko Core SCSI"},
> 
> 
> For reference, here is the full dmesg from Dmitry when he tried to boot his E25
> machine with a recent Linux kernel:
> ftp://parisc.parisc-linux.org/dmesg/E25.dmesg  (http://pastebin.com/sXqUjVub)

There's not enough information there to reverse engineer the information
needed for the driver.

The best docs we have:

https://parisc.wiki.kernel.org/images-parisc/5/52/E-class_hpjournal.pdf

Say the SCSI controller here is precision attached not lasi attached
(the ethernet is on the lasi, though).  Unfortunately, we don't have any
documents at all in the archive for the precision bus that I can find.

James


