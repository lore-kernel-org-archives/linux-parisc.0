Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA12384
	for <parisc-linux@puffin.external.hp.com>; Wed, 12 May 1999 13:39:58 -0600
Message-ID: <19990512194227.52770@insula.local>
Date: Wed, 12 May 1999 19:42:27 +0000
From: Philipp Rumpf <prumpf@jcsbs.lanobis.de>
To: Matthew Wilcox <Matthew.Wilcox@genedata.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Hi
Reply-To: Philipp Rumpf <prumpf@jcsbs.lanobis.de>
References: <19990512205759.G1410@mencheca.ch.genedata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <19990512205759.G1410@mencheca.ch.genedata.com>; from Matthew Wilcox on Wed, May 12, 1999 at 08:57:59PM +0200
List-ID: <linux-parisc.vger.kernel.org>

> I'd just like to introduce myself.  I've liberated a 715/33 Apollo from
> use as a monitor stand and managed to retrieve all the pieces needed to
> get it as far as a boot prom prompt.  It's got 56MB of RAM and a hard disc
> of some description.  I've got it attached to the ethernet, though I have
> no idea whether this is working right now.  I don't however have anything
> to boot right now - apparently this disc was used for swap when this
> workstations was running HP-UX in the dim distant past (you should see
> the dust).

I think you have the choice to either wait til Linux is bootable or get a
second hard disk and an HP-UX on it. The disks should be narrow SCSI so the
second disk shouldn't really be much of a problem.

> I have no previous experience of the HP architecture, but I'm a dab hand
> at ARM assembler and I'm willing to learn.  Anyway, here I am with a
> machine, ready to help.  

OK, first I propose you look at www.thepuffingroup.com/parisc and get just
about everything linked from the Documentation section. What is most important
to get a kernel working fast is acd.pdf (ARM), the runtime architecture document
and perhaps pdc and iodc descriptions.

I think it should be theoretically possible to put the disk in a supported
machine, cross-build a kernel and bootloader (oh yeah, perhaps you should
fix the problems with that first ;), put it back into the PARISC aso. but
just getting a version of HP-UX and a second disk seems easier to me.

	Philipp Rumpf
