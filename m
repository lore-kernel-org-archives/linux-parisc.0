Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA25741
	for <parisc-linux@puffin.external.hp.com>; Thu, 28 Oct 1999 11:02:43 -0600
Message-Id: <199910281703.NAA06969@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] hack to use HPUX boot loader
To: alan@lxorguk.ukuu.org.uk (Alan Cox)
Date: Thu, 28 Oct 1999 13:03:37 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: Helge.Deller@ruhr-uni-bochum.de, parisc-linux@thepuffingroup.com,
        bame@debian.fc.hp.com
In-Reply-To: <E11gsGT-0005Zn-00@the-village.bc.nu> from "Alan Cox" at Oct 28, 99 05:18:59 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> 
> > I find it very strange that the kernel is being linked to start at
> > 0xc0010000.  It's not your average machine that has this much physical
> 
> Logical or physical ?

Physical, at least when loading with hpux.  LDFLAGS are "-R 0xc0010000
-N -e stext".  I know at one time the link was being done at 0x10000.
Does anyone know why this was changed?

-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
