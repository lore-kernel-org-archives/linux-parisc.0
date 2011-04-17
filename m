From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: Debian bug 622997
Date: Sat, 16 Apr 2011 23:57:04 -0500
Message-ID: <1303016224.5167.7.camel@mulgrave.site>
References: <20110416192920.1E15B4FD9@hiauly1.hia.nrc.ca>
	 <1302986887.4058.13.camel@mulgrave.site>
	 <1302988479.7967.0.camel@mulgrave.site>
	 <20110416233556.GA19802@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: linux-parisc@vger.kernel.org, 622997@bugs.debian.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110416233556.GA19802@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, 2011-04-16 at 19:35 -0400, John David Anglin wrote: 
> On Sat, 16 Apr 2011, James Bottomley wrote:
> 
> > Strike that one ... I enabled USB in my 2.6.39-rc3 build and it inserts
> > the OHCI module and discovers the ports just fine.
> 
> Boot 2.6.39-rc3 fails for me with attached config.

I can't quite build it.  With gcc version 4.2.4 (Debian 4.2.4-6) I'm
getting an ICE:

net/wireless/reg.c: In function 'freq_reg_info_regd':
net/wireless/reg.c:645: internal compiler error: in expand_expr_real_1,
at expr.c:8744
Please submit a full bug report,
with preprocessed source if appropriate.
See <URL:http://gcc.gnu.org/bugs.html> for instructions.
For Debian GNU/Linux specific bug reporting instructions,
see <URL:file:///usr/share/doc/gcc-4.2/README.Bugs>.
make[2]: *** [net/wireless/reg.o] Error 1

Plus there's a bug in my kernel code:

drivers/usb/host/xhci-pci.c: In function 'xhci_pci_setup':
drivers/usb/host/xhci-pci.c:61: error: implicit declaration of function
'kzalloc

If I correct for these (add missing slab.h include and disable wireless)
and build, the last message I see is

turn off boot console ttyB0

Which indicates it's got a problem with the console configuration (I
don't see any console registration for the DIVA serial port on ttyS1 in
the boot log).

James


