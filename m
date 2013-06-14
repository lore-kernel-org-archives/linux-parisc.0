From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: fix LMMIO mismatch between PAT length and MASK
 register
Date: Fri, 14 Jun 2013 09:38:27 +0200
Message-ID: <20130614073827.GA18871@p100.box>
References: <20130614071142.GB10443@p100.box>
 <CAEdQ38H_nzCEUGXNOtfH=vQdHJ0HvbhyYKLQm8xzEj+DfevLzw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: Matt Turner <mattst88@gmail.com>, linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CAEdQ38H_nzCEUGXNOtfH=vQdHJ0HvbhyYKLQm8xzEj+DfevLzw@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

* Matt Turner <mattst88@gmail.com>:
> On Fri, Jun 14, 2013 at 12:11 AM, Helge Deller <deller@gmx.de> wrote:
> > From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> >
> > The LMMIO length reported by PAT and the length given by the LBA MASK
> > register are not consistent. This leads e.g. to a non-working ATI FireGL
> > card with the radeon DRM driver since the memory can't be mapped.
> >
> > Fix this by correctly adjusting the resource sizes.
> >
> > Signed-off-by: Helge Deller <deller@gmx.de>
> >
> > diff --git a/drivers/parisc/lba_pci.c b/drivers/parisc/lba_pci.c
> > index 1f05913..7dc0e40 100644
> > --- a/drivers/parisc/lba_pci.c
> > +++ b/drivers/parisc/lba_pci.c
> > @@ -994,6 +994,15 @@ lba_pat_resources(struct parisc_device *pa_dev, struct lba_device *lba_dev)
> >                 case PAT_LMMIO:
> >                         /* used to fix up pre-initialized MEM BARs */
> >                         if (!lba_dev->hba.lmmio_space.flags) {
> > +                               unsigned long lba_len;
> > +                               lba_len = ~READ_REG32(lba_dev->hba.base_addr
> > +                                               + LBA_LMMIO_MASK);
> > +                               if ((p->end - p->start) != lba_len) {
> > +                                       pr_warn("PCI%02x LMMIO mismatch between PAT length (0x%lx) and MASK register (0x%lx), fixing.\n",
> > +                                         (int)lba_dev->hba.bus_num.start,
> > +                                               p->end - p->start, lba_len);
> > +                                       p->end = p->start + lba_len;
> > +                               }
> >                                 sprintf(lba_dev->hba.lmmio_name,
> >                                                 "PCI%02x LMMIO",
> >                                                 (int)lba_dev->hba.bus_num.start);
> > --
> 
> With these two patches, does kernel modesetting (and X11?) work?

Yes, C8000 with ATI FireGL works then for me with framebuffer, SMP, serial port...everything I tested so far.

Important: *Disable* RADEON Framebuffer driver, and enable Radeon DRM driver instead!

I did not tested X11 yet (still need to fully install the C8000 with our
unstable) - but Thomas mentioned once that this is needed for X11.

BTW, I'll prepare a new installation CD for all machines soon...hopefully until end of
next week and hopefully when kernel 3.10 is released.

If you want to test, pull from git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git
a)  my "for-3.10" branch, then
b)  my "important-for-3.10" branch (two fixed on which I wait for James)...

PS: Does someone has a C800 with 0x77 serial ports? In that case some
small patch to the serial driver is needed to get it detected....

Helge
