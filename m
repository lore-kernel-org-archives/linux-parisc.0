Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA26560
	for <parisc-linux@puffin.external.hp.com>; Thu, 28 Oct 1999 12:37:39 -0600
Message-Id: <199910281838.MAA20701@debian.fc.hp.com>
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
cc: alan@lxorguk.ukuu.org.uk (Alan Cox), Helge.Deller@ruhr-uni-bochum.de,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] hack to use HPUX boot loader 
In-reply-to: Your message of "Thu, 28 Oct 1999 13:03:37 EDT."
             <199910281703.NAA06969@hiauly1.hia.nrc.ca>
Date: Thu, 28 Oct 1999 12:38:13 -0500
From: Paul Bame <bame@debian.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

= > 
= > > I find it very strange that the kernel is being linked to start at
= > > 0xc0010000.  It's not your average machine that has this much physical
= > 
= > Logical or physical ?
= 
= Physical, at least when loading with hpux.  LDFLAGS are "-R 0xc0010000
= -N -e stext".  I know at one time the link was being done at 0x10000.

There isn't any concept of physical versus virtual
location in the HP linker that I'm aware of, though there might be somthing
hidden in an extension record.

The hpux boot loader assumes the text relocation address should also be
used as a physical load address.  In the case of Linux, relocated
at 3Gb, this clearly makes no sense.  It works fine for HP-UX which
is relocated to, and runs in, low physical memory.

= Does anyone know why this was changed?

I assume the earlier linking was purely experimental, since I've been
told (and haven't confirmed myself) that Linux 2.2.x essentially needs
to be relocated at 3Gb (or some other big value) because it assumes
it's available from the page tables of every process.  If
Linux was relocated at addresses near zero, this would result in
user programs having to start at addresses larger than the amount
of memory used by the kernel, which would be weird.

	-P
