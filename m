From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: Debian bug 622997
Date: Sun, 17 Apr 2011 10:23:27 -0500
Message-ID: <1303053807.2583.1.camel@mulgrave.site>
References: <20110417151147.326EC4FCB@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org,
	622997@bugs.debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110417151147.326EC4FCB@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 2011-04-17 at 11:11 -0400, John David Anglin wrote:
> > On Sat, 2011-04-16 at 19:35 -0400, John David Anglin wrote: 
> > > On Sat, 16 Apr 2011, James Bottomley wrote:
> > > 
> > > > Strike that one ... I enabled USB in my 2.6.39-rc3 build and it inserts
> > > > the OHCI module and discovers the ports just fine.
> > > 
> > > Boot 2.6.39-rc3 fails for me with attached config.
> > 
> > I can't quite build it.  With gcc version 4.2.4 (Debian 4.2.4-6) I'm
> > getting an ICE:
> > 
> > net/wireless/reg.c: In function 'freq_reg_info_regd':
> > net/wireless/reg.c:645: internal compiler error: in expand_expr_real_1,
> > at expr.c:8744
> > Please submit a full bug report,
> > with preprocessed source if appropriate.
> > See <URL:http://gcc.gnu.org/bugs.html> for instructions.
> > For Debian GNU/Linux specific bug reporting instructions,
> > see <URL:file:///usr/share/doc/gcc-4.2/README.Bugs>.
> > make[2]: *** [net/wireless/reg.o] Error 1
> 
> This is probably fixed as it doesn't occur with 
> gcc version 4.5.3 20110101 (prerelease) [gcc-4_5-branch revision 168387] (GCC) .
> GCC 4.2 and 4.3 are no longer maintained and there won't be any further
> releases from these branches.
> 
> Without looking at the above, it's hard to tell whether the bug is a
> middle-end or backend bug.  Many middle-end bugs are fixed in more recent
> GCC versions.  Although newer versions may bring their own problems,
> we can get help in fixing problems particularly if they are regressions. 
> 
> The asm delay slot bug affected all GCC versions.  I backported the fix to
> the 4.3, 4.4 and 4.5 branches.  This is a problem in the kernel because of
> the following:
> 
> ** The __asm__ op below simple prevents gcc/ld from reordering
> ** instructions across the mb() "call".
> */
> #define mb()            __asm__ __volatile__("":::"memory")     /* barrier() */
> 
> It's just a matter of chance whether a barrier ends up in the delay slot
> of a branch in a critical location.

I'll redo optimisation on that one and see if I can avoid this.

> > Plus there's a bug in my kernel code:
> > 
> > drivers/usb/host/xhci-pci.c: In function 'xhci_pci_setup':
> > drivers/usb/host/xhci-pci.c:61: error: implicit declaration of function
> > 'kzalloc
> > 
> > If I correct for these (add missing slab.h include and disable wireless)
> 
> I had to add missing slab.h as well.  However, I didn't touch wireless
> with 4.5.3.
> 
> > and build, the last message I see is
> > 
> > turn off boot console ttyB0
> > 
> > Which indicates it's got a problem with the console configuration (I
> > don't see any console registration for the DIVA serial port on ttyS1 in
> > the boot log).
> 
> Comparing the console output that I recorded for the debian kernel, I
> see udev starts much earlier.  It only has the initial message from the
> tg3 driver and SCSI subsystem.

It's most likely a driver module that's getting loaded which is turned
off in the booting configuration ... finding it isn't going to be easy,
though ...

James


