Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from vopserver.pflash.com (mail.pflash.com [207.19.136.5])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3E9B3482A
	for <parisc-linux@parisc-linux.org>; Tue,  5 Jun 2001 07:15:24 -0600 (MDT)
From: Michael S.Zick <mszick@pflash.com>
To: jheumann@fonts.de
Subject: Re: [parisc-linux] 0.9ser can't install on D210
Date: Tue, 5 Jun 2001 08:00:45 -0500
Content-Type: text/plain
Cc: parisc-linux@thepuffingroup.com, parisc-linux@parisc-linux.org,
	<debian-hppa@lists.debian.org>
References: <20010605134719.I25745@linuxcare.com>
MIME-Version: 1.0
Message-Id: <01060508142901.00472@wolf01.my.home>
List-ID: <linux-parisc.vger.kernel.org>

All -
OR, you might:

$>gunzip whatever.CD.ISO.gz
#>losetup /dev/loop0 ${whatever_path}/watever.CD.ISO
#>$mount -r -t iso9660 /dev/loop0 /somewhere

now you can browse the CD image to your hearts content.
also you can mount upto ten of these things (loop0-loop9) at
the same time.

Of course, you did build your kernel with the "loop device" and
"iso9660 filesystem support" didn't you?

PS: You can use similar commands to browse (and modify) your
ramdisk.bin files.

Mike

On Tue, 05 Jun 2001, Richard Hirst wrote:
> On Tue, Jun 05, 2001 at 12:23:14PM +0200, jheumann@fonts.de wrote:
> > please help,
> >=20
> > i can't load linux pa-risc 0.9seriell on my HP9000/D210.
> > Why?
>=20
> You will see from <http://parisc-linux.org/release-0.9/systems.html>
> that D series machines have not been tested.  However, your problem
> looks more like trouble reading the CD.  Can you mount the CD on some
> other system and see the contents, just to check the CD is burned
> properly?
>=20
> Alternatively you could try a network boot, as described in the
> README on the CD.
>=20
> Richard
>=20
>=20
> >=20
> > (HP-UX 10.20 is running....)
> >=20
> > Jan Heumann
> > jheumann@fonts.de
> > -----------------------------------------------------
> > Main Menu: Enter command > search
> >=20
> > Searching for potential boot device(s)...
> > This may take several minutes.
> >=20
> > To discontinue search, press any key (termination may not be immediat=
e).
> >=20
> >=20
> >=20
> >    Path Number        Device Path (dec)        Device Type
> >    -----------        -----------------        -----------
> >    P0                 4.5                      Random access media
> >    P1                 4.8                      Random access media
> >    P2                 16/5.2                   Random access media
> >    P3                 16/6.0                   LAN Module
> >=20
> >=20
> > Main Menu: Enter command > boot p2
> > Interact with IPL (Y or N)?> n
> >=20
> > Booting...
> > Boot IO Dependent Code (IODC) revision 1
> >=20
> > IPL error: bad IPL checksum.
> >=20
> > Error Reading IPL
> >=20
> > Main Menu: Enter command > search
>=20
>=20
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
