Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2B90C482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 24 Mar 2003 17:05:41 -0700 (MST)
Date: Tue, 25 Mar 2003 01:05:39 +0100
Cc: parisc-linux@lists.parisc-linux.org
From: Thibaut VARENE <varenet@esiee.fr>
Content-Type: text/plain; charset=us-ascii
Subject: Re: [parisc-linux] Re: Out of memory problem
To: Markus Schaber <markus.schaber@student.uni-ulm.de>
In-Reply-To: <20030325002917.37f386fa.markus.schaber@student.uni-ulm.de>
MIME-Version: 1.0
Message-Id: <20030325000539.90F6049C0B@mail.esiee.fr>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

sorry for my previous answer, doomed keyboard shortcut for "send" :P
-------------------
> Hello,
>=20
> Thibaut VARENE <varenet@esiee.fr> schrieb:
>=20
> > >> The Net install ISOs are what you want. See
> > >> 	http://www.parisc-linux.org/software/install.html
> > > But as this are ISO files, I need to attach a CD drive, and I
don't=20
> > > have an external SCSI drive lying around. I also doubt I'll find
any
> > > IDE port inside my Apollo. That's why I looked for a net-boot
image.
> > there are lifimages as well.
> > you can also get them here:
> > http://pateam.esiee.fr/cd-images/lifimages/
> >
> > fwiw, reading the PA-RISC/Linux Boot HOWTO would have told you
about=20
> > them.
>=20
> I read it, and the _readme_first.txt there, but they don't mention
that
> those lifimages are prepared for NFS Root opposite to the one I
used.
actually they aren't: they're prepared for RAMDISK :)
> And the NetInst procedure for Debian/i386 uses a RAM-Disk, too, so I
> thought those were using a initrd just as the one I got from
> ftp://ftp.parisc-linux.org/kernels/. And so I just put it out of my
> scope when searching for non-ramdisk images.
I don't think there's any: indeed, if you have read the boot howto,
you'd have noticed that nfs-root images are very specific to your
network configuration, since you have to specify the server's IP.

therefore I don't see the point of releasing NFS-root images nobody
could possibly use.

So follow the cookbook in the HOWTO and prepare your own one ;P


Thibaut VARENE
PA/Linux ESIEE Team
http://pateam.esiee.fr/
