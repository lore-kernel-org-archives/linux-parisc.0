Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.umr.edu (mrelay1.cc.umr.edu [131.151.1.120])
	by dsl2.external.hp.com (Postfix) with ESMTP id 135B74887
	for <parisc-linux@parisc-linux.org>; Fri, 12 Jul 2002 12:27:00 -0600 (MDT)
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Subject: RE: [parisc-linux] MD problem
Date: Fri, 12 Jul 2002 13:26:55 -0500
Message-ID: <4E39457CA36BA347A9940A14D48B11A90AFE3B@umr-mail2.umr.edu>
From: "Neulinger, Nathan" <nneul@umr.edu>
To: <joel.soete@freebel.net>, <parisc-linux@parisc-linux.org>
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

You got it in /etc/exports and running nfs?

-- Nathan

------------------------------------------------------------
Nathan Neulinger                       EMail:  nneul@umr.edu
University of Missouri - Rolla         Phone: (573) 341-4841
Computing Services                       Fax: (573) 341-4216


> -----Original Message-----
> From: joel.soete@freebel.net [mailto:joel.soete@freebel.net]=20
> Sent: Friday, July 12, 2002 1:05 PM
> To: parisc-linux@parisc-linux.org
> Subject: Re: [parisc-linux] MD problem
>=20
>=20
> and additional problem:
> if I mount automaticaly /boot in /etc/fstab it is impossible=20
> to dismount this fs:
>=20
> umount /boot
> device busy
>=20
> fuser -u /boot
> /boot
> No process references; use -v for the complete list
> fuser -v /boot:
>=20
>              USER       PID  ACCESS  COMMAND
> /boot        root    kernel  mount   /boot
>=20
> Any idea? (if I mount it manualy after the reboot no problem?)
>=20
> Quoting joel.soete@freebel.net:
>=20
> > Hi All,
> >=20
> > I build a raid-1 configuration starting from the internal disk sdb
> > formated as
> > follow:
> >                                   cfdisk 2.11n
> >=20
> >                               Disk Drive: /dev/sdb
> >                              Size: 9100044288 bytes
> >               Heads: 64   Sectors per Track: 32   Cylinders: 8678
> >=20
> >     Name        Flags      Part Type  FS Type         =20
> [Label]      =20
> > Size (MB)
> >=20
> >=20
> --------------------------------------------------------------
> ----------------
> >     sdb1                    Primary   Linux/PA-RISC boot   =20
>            =20
> >  63.97
> >     sdb2                    Primary   Linux swap           =20
>            =20
> > 128.98
> >     sdb3                    Primary   Linux                =20
>            =20
> > 127.93
> >     sdb5                    Logical   Linux                =20
>           =20
> > 1664.10
> >     sdb6                    Logical   Linux                =20
>            =20
> > 255.86
> >     sdb7                    Logical   Linux                =20
>            =20
> > 127.93
> >     sdb8                    Logical   Linux                =20
>            =20
> > 127.93
> >     sdb9                    Logical   Linux                =20
>           =20
> > 2047.87
> >     sdb10                   Logical   Linux                =20
>           =20
> > 2047.87
> >     sdb11                   Logical   Linux                =20
>           =20
> > 2047.87
> >                             Logical   Free Space           =20
>            =20
> > 459.28
> >=20
> > sdb3 being the /boot & sdb5 / fs.
> >=20
> > then I copy this structure with sfdisk -d /dev/sdb | sfdisk /dev/sda
> > (same size
> > but not the same supplier) and synchronize all mdi with=20
> respective disk
> > slice.
> >=20
> > All is ok. But still have to mirror manually quasi static=20
> slices: sdx1
> > (F0) and
> > sdx3 (/boot). So I umount /boot and made a dd from sdb3 to=20
> sda3 Ok and
> > sdb1 to
> > sda1 Ok.
> >=20
> > But when I try to boot from the mirror (ie sda) bootloader=20
> did not find
> > the ipl
> > eventhought the copy of the two F0 slices (I can still boot=20
> from sdb)?
> >=20
> > What do I wrong or better what should I have to resolve=20
> this problem?
> >=20
> > Thanks in advance for advice,
> >     Joel
> >=20
> >=20
> > -------------------------------------------------
> > This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
> > _______________________________________________
> > parisc-linux mailing list
> > parisc-linux@lists.parisc-linux.org
> > http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> >=20
>=20
>=20
> -------------------------------------------------
> This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>=20
