Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 3B894482A
	for <parisc-linux@parisc-linux.org>; Sat, 18 Aug 2001 17:01:40 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] Turn off CONFIG_PCI
Date: Sun, 19 Aug 2001 00:59:41 +0200
Cc: Matthew Wilcox <willy@ldl.fc.hp.com>,
	parisc-linux@parisc-linux.org
References: <E15Xdn8-0000kt-00@chrysl> <20010818193908.2DE79482A@dsl2.external.hp.com> <20010818233700.A14486@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20010818233700.A14486@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1.0
Message-Id: <20010818230140.3B894482A@dsl2.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

On Sunday 19 August 2001 00:37, Matthew Wilcox wrote:
> On Sat, Aug 18, 2001 at 09:37:06PM +0200, Helge Deller wrote:
> > I tested your patch sucessfully on my c3k and my 715/64.
> > I've only added a small security check to setup.c to prevent PA2.x
> > machines from booting without CONFIG_PCI and to print a small
> > panic-message at bootup instead of just HPMC'ing.
> >
> > +#ifndef CONFIG_PCI
> > +	/* security check: PA2.x processor machines won't detect their main
> > +	 * PCI-based devices (screen, serial, SCSI, ...), so it's better to
> > +	 * stop them from booting right here. If we would continue we would
> > +	 * only get a HPMC without any other information. */
> > +	if (boot_cpu_data.cpu_type >= pcxu) { /* >=PA8000 (PCX-U) CPU ? */
> > +		/* switch back to PDC console for panic */
> > +		pdc_console_restart();
> > +		panic("This system will not boot without PCI-support in the kernel
> > !\n"); +	}
> > +#endif
>
> I don't believe this is appropriate.  Cxxx / Jxxx machines use Lasi for
> their serial port, so it's theoretically possible to boot one without
> CONFIG_PCI.  If the user wants to turn it off, let them.  It's not like
> any other architecture does anything like this.

Sure, Cxxx and Jxxx may have LASI, but if I'm correct they all have a 32bit PA7XXX 
CPU and thus won't be catched by this check.
Machines with a PA8XXX CPU don't have any LASI/GSC devices and would _always_ 
HPMC without PCI support. So I still think it is better to panic() with a nice message 
instead of just let the user guess why the machine suddenly HPMC'ed with this kernel 
and start asking on the parisc-linux list.
  
Helge
