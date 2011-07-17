From: Aurelien Jarno <aurel32@debian.org>
Subject: Re: debian hppa
Date: Mon, 18 Jul 2011 00:03:02 +0200
Message-ID: <20110717220302.GA30333@hall.aurel32.net>
References: <20110527213516.GH21744@dannf.org>
 <20110527233738.0B95D4FCB@hiauly1.hia.nrc.ca>
 <BANLkTi=maOnkCLD9aU=JDYL9257EkpHxnQ@mail.gmail.com>
 <20110601021049.GB3984@hiauly1.hia.nrc.ca>
 <BANLkTin2DhKC_ss6UsCPYxmTR-UD=GY0uw@mail.gmail.com>
 <E1F45BBE-F922-4E1C-9DEC-FAF4BF4B4E26@nrc-cnrc.gc.ca>
 <CA+DQjFgygVS0YQ_zUfQG=BkTb_zrSN+yYxGyTU6ufC-PV7dBxA@mail.gmail.com>
 <CADZpyiy8O_tsm=41fNCbC_nPq77RdsEfD=UahR_yxtdm7P7u0A@mail.gmail.com>
 <20110707215907.GA1837@hall.aurel32.net>
 <CADZpyiwaKjhqWJ0kGh4kV1BZSa02=OGVPYeHxQA9iD8LVnkEqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Cc: Thibaut VARENE <T-Bone@parisc-linux.org>,
	John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	dann frazier <dannf@dannf.org>, linux-parisc@vger.kernel.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CADZpyiwaKjhqWJ0kGh4kV1BZSa02=OGVPYeHxQA9iD8LVnkEqQ@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Jul 07, 2011 at 07:02:28PM -0400, Carlos O'Donell wrote:
> On Thu, Jul 7, 2011 at 5:59 PM, Aurelien Jarno <aurel32@debian.org> w=
rote:
> > All the list of things to provide for debian-ports are available fr=
om my
> > previous post back in April:
> >
> > =A0http://lists.debian.org/debian-hppa/2011/04/msg00026.html
> >
> > Please note that the first point is not relevant anymore given that=
 I
> > have done the import myself:
> >
> > =A0http://lists.debian.org/debian-hppa/2011/05/msg00002.html
>=20
> - A place/way to fetch all the .deb that have to be import with the
>   corresponding .changes.
>=20
> This is done.
>=20
> - List of persons who need to have access to the wanna-build interfac=
e.
>   If some of them are not DD, please also provide mail/login/ssh key.
>=20
> I would like to have access to the wanna-build interface.
>=20
> I will have Dann Frazier send you my mail/login/ssh key as a signed e=
mail.

Ok, will create that when I get the mail.

> - List of persons who should be able to upload packages to the archiv=
e
>   with the corresponding GPG keys (that should include buildds
>   maintainers).
>=20
> I will have Dann Frazier send you my GPG key in the same signed email=
=2E

Ditto.

> - List of emails to be used as a contact point for alpha/hppa buildds
>   and alpha/hppa related things.
>=20
> In the email from Dann.

Ditto.
=20
> - List of buildds with their IP, SSH key and mail address.
>=20
> What do you want installed on the buildds?

I personally don't really want to get anything installed. But to be
useful a buildd needs to be able to connect to the wanna-build db, send
the build logs, receive signed build logs by mail and upload packages.

> I've setup a buildd before, but the truth is that I had to crib the
> information from various sources.
>=20
> Is there actually a guide for this available anywhere?
>=20

You can use the setup guide from [1]. Basically you should change=20
debian.org by debian-ports.org and use the following sources.list
(or any of the corresponding mirrors [2]):

  deb http://ftp.debian-ports.org/debian sid main
  deb http://ftp.debian-ports.org/debian unreleased main
  deb-src http://ftp.debian.org/debian/ unstable main

  deb http://incoming.debian-ports.org/buildd unstable main
  deb-src http://incoming.debian-ports.org/buildd unstable main

Cheers,
Aurelien
 =20
[1] https://buildd.debian.org/docs/
[2] http://www.debian-ports.org/mirrors

--=20
Aurelien Jarno	                        GPG: 1024D/F1BCDB73
aurelien@aurel32.net                 http://www.aurel32.net
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
