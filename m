Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id OAA27259
	for <parisc-linux@puffin.external.hp.com>; Thu, 28 Oct 1999 14:34:50 -0600
Message-Id: <199910282034.QAA01794@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] hack to use HPUX boot loader
To: bame@debian.fc.hp.com (Paul Bame)
Date: Thu, 28 Oct 1999 16:34:21 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: alan@lxorguk.ukuu.org.uk, Helge.Deller@ruhr-uni-bochum.de,
        parisc-linux@thepuffingroup.com
In-Reply-To: <199910281838.MAA20701@debian.fc.hp.com> from "Paul Bame" at Oct 28, 99 12:38:13 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

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

Can't user programs be mapped with sr7 to OS public code while the kernel
runs in non-virtual mode in low physical memory?  When the kernel is
in virtual mode most of it might run with low virtual addresses.  I am
not an expert in Linux, so it is unclear to me how much of the system
needs to be visible to user apps.  However, I think for som apps we
want to achieve an app environment essentially identical to hp-ux so
hp compiled apps will run under pa linux.

-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
