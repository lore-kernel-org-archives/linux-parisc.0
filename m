Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA27718
	for <parisc-linux@puffin.external.hp.com>; Thu, 28 Oct 1999 15:02:47 -0600
Sender: frowand@cup.hp.com
Message-ID: <3818B9F8.E38FFEA7@hp.com>
Date: Thu, 28 Oct 1999 14:02:48 -0700
From: Frank Rowand <frank_rowand@hp.com>
Reply-To: frowand@cup.hp.com
MIME-Version: 1.0
To: Paul Bame <bame@debian.fc.hp.com>
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
        Alan Cox <alan@lxorguk.ukuu.org.uk>, Helge.Deller@ruhr-uni-bochum.de,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] hack to use HPUX boot loader
References: <199910281838.MAA20701@debian.fc.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Paul Bame wrote:
> 
> = >
> = > > I find it very strange that the kernel is being linked to start at
> = > > 0xc0010000.  It's not your average machine that has this much physical
> = >
> = > Logical or physical ?
> =
> = Physical, at least when loading with hpux.  LDFLAGS are "-R 0xc0010000
> = -N -e stext".  I know at one time the link was being done at 0x10000.
> 
> There isn't any concept of physical versus virtual
> location in the HP linker that I'm aware of, though there might be somthing
> hidden in an extension record.
> 
> The hpux boot loader assumes the text relocation address should also be
> used as a physical load address.  In the case of Linux, relocated
> at 3Gb, this clearly makes no sense.  It works fine for HP-UX which
> is relocated to, and runs in, low physical memory.
> 
> = Does anyone know why this was changed?
> 
> I assume the earlier linking was purely experimental, since I've been
> told (and haven't confirmed myself) that Linux 2.2.x essentially needs
> to be relocated at 3Gb (or some other big value) because it assumes




> it's available from the page tables of every process.  If
> Linux was relocated at addresses near zero, this would result in
> user programs having to start at addresses larger than the amount
> of memory used by the kernel, which would be weird.
> 
>         -P

Not so weird.  It's just a virtual address, not a physical address.

-Frank
