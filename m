Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id OAA13414
	for <parisc-linux@puffin.external.hp.com>; Wed, 12 May 1999 14:03:41 -0600
Message-Id: <199905122000.NAA15037@milano.cup.hp.com>
To: Philipp Rumpf <prumpf@jcsbs.lanobis.de>
cc: Matthew Wilcox <Matthew.Wilcox@genedata.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Hi 
In-reply-to: Your message of "Wed, 12 May 1999 19:42:27 PDT."
             <19990512194227.52770@insula.local>
Date: Wed, 12 May 1999 13:00:04 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Philipp Rumpf wrote:
> > I'd just like to introduce myself.  I've liberated a 715/33 Apollo from
> > use as a monitor stand and managed to retrieve all the pieces needed to
> > get it as far as a boot prom prompt.  It's got 56MB of RAM and a hard disc
> > of some description.  I've got it attached to the ethernet, though I have
> > no idea whether this is working right now.  I don't however have anything
> > to boot right now - apparently this disc was used for swap when this
> > workstations was running HP-UX in the dim distant past (you should see
> > the dust).
> 
> I think you have the choice to either wait til Linux is bootable or get a
> second hard disk and an HP-UX on it. The disks should be narrow SCSI so the
> second disk shouldn't really be much of a problem.

Mathew can also download and try to install the PA-mklinux.
I have this running on a 712/60 now. I suggest this because
I don't know how accessible HP-UX bits are to the general public.
HP-UX is usually distributed on CD-ROM these days.

Since the source is available for mk-linux, that would suppliment
the PA architecture documentation and might provide the kind of
implementation detail someone experienced in assembler could use.

grant

> 
> > I have no previous experience of the HP architecture, but I'm a dab hand
> > at ARM assembler and I'm willing to learn.  Anyway, here I am with a
> > machine, ready to help.  
> 
> OK, first I propose you look at www.thepuffingroup.com/parisc and get just
> about everything linked from the Documentation section. What is most importan
>   t
> to get a kernel working fast is acd.pdf (ARM), the runtime architecture docum
>   ent
> and perhaps pdc and iodc descriptions.
> 
> I think it should be theoretically possible to put the disk in a supported
> machine, cross-build a kernel and bootloader (oh yeah, perhaps you should
> fix the problems with that first ;), put it back into the PARISC aso. but
> just getting a version of HP-UX and a second disk seems easier to me.
> 
> 	Philipp Rumpf
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 

Grant Grundler
Enterprise Systems Technology Lab
+1.408.447.7253
