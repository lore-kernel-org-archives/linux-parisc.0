Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id HAA08806
	for <parisc-linux@puffin.external.hp.com>; Tue, 1 Jun 1999 07:27:33 -0600
Date: Tue, 1 Jun 1999 09:27:26 -0400 (EDT)
From: Alex deVries <adevries@redhat.com>
To: Philipp Rumpf <prumpf@suse.de>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Creating a bootable image.
In-Reply-To: <19990601091601.A6399@suse.de>
Message-ID: <Pine.LNX.3.96.990601092249.29097A-100000@devserv.devel.redhat.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>



On Tue, 1 Jun 1999, Philipp Rumpf wrote:

> > I'm mailing this because I'm not entirely sure what I'm doing is correct.
> Neither am I, but arch/parisc/hp/boot/README seems to say something different.

That file is actually from Jason Eckhardt's boot loader.  How do you think
it's incorrect?

> > The way I understand it, the kernel we cross compile on Linux is in fact
> > a broken ELF32 file, which doesn't really matter, because at this point we
> > don't need the kernel to have any loader information itself. 
> 
> I think we should build a binary image of the kernel (that is not ELF) like
> we do for x86.

You're right, raw binary should work just fine.

> > However, to actually boot you need IPL, which requires SOM linking, so
> > that much must be done on HPUX.
> This I do not understand. According to arch/parisc/hp/boot/README, the IPL is
> stored in a special binary format which we could generate from ELF like we
> do for the kernel image.

Hm.  Okay then.  So what we need to do is fix the cross compiling of
mkipl.  I'll have a look at this.

> > and it'll create a kernel and boot header that should just boot right
> > away.  That way to do kernel work (and not bootstrap work), you don't need
> > HPUX at all.
> I think the vast majority of parisc boxes runs HP-UX at the moment so it
> probably would not be a big win.

Being able to cross compile really is a big win.  There's a lot of people
with slower 700 series boxes.  Also, building and booting is a lot easier
if you can xcompile on your PIII.  Booting into HPUX is pretty slow.

- Alex
