From: Aurelien Jarno <aurel32@debian.org>
Subject: Re: debian hppa
Date: Thu, 7 Jul 2011 23:59:07 +0200
Message-ID: <20110707215907.GA1837@hall.aurel32.net>
References: <20110527213516.GH21744@dannf.org>
 <20110527233738.0B95D4FCB@hiauly1.hia.nrc.ca>
 <BANLkTi=maOnkCLD9aU=JDYL9257EkpHxnQ@mail.gmail.com>
 <20110601021049.GB3984@hiauly1.hia.nrc.ca>
 <BANLkTin2DhKC_ss6UsCPYxmTR-UD=GY0uw@mail.gmail.com>
 <E1F45BBE-F922-4E1C-9DEC-FAF4BF4B4E26@nrc-cnrc.gc.ca>
 <CA+DQjFgygVS0YQ_zUfQG=BkTb_zrSN+yYxGyTU6ufC-PV7dBxA@mail.gmail.com>
 <CADZpyiy8O_tsm=41fNCbC_nPq77RdsEfD=UahR_yxtdm7P7u0A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Cc: Thibaut VARENE <T-Bone@parisc-linux.org>,
	John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	dann frazier <dannf@dannf.org>, linux-parisc@vger.kernel.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CADZpyiy8O_tsm=41fNCbC_nPq77RdsEfD=UahR_yxtdm7P7u0A@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Jul 07, 2011 at 12:03:48PM -0400, Carlos O'Donell wrote:
> On Thu, Jul 7, 2011 at 11:49 AM, Thibaut VARENE <T-Bone@parisc-linux.=
org> wrote:
> > I have no problem with this, the only "active" user of the rp3440 i=
s
> > Aur=E9lien, so I suppose it wouldn't be a problem. Yet, my understa=
nding
> > is that the rp3440 is extremely slow at building anything (much slo=
wer
> > than my other machines, it seems) because of the cache flush issues=
=2E
> > AIUI that's why Debian stuck to J6700 for buildds, because those
> > machines were a lot faster.
> >
> > Other than that, the rp3440 currently runs unstable with 2.6.22.19,=
 so
> > I suppose a complete reinstall would be in order, and I'm not sure =
I
> > have time to deal with that just yet. I'd be happy to provide remot=
e
> > access to the machine though, if someone steps up. FWIW, the only
> > machine I have left running lenny is a J5000, 2x440MHz PA8500,
> > previously used as an autobuilder for debian-multimedia.org.
>=20
> I can do the install and help monitor the box.
>=20
> Aurelien,
>=20
> Exactly what do we need installed for debian-ports?
>=20

All the list of things to provide for debian-ports are available from m=
y
previous post back in April:

  http://lists.debian.org/debian-hppa/2011/04/msg00026.html

Please note that the first point is not relevant anymore given that I
have done the import myself:

  http://lists.debian.org/debian-hppa/2011/05/msg00002.html

--=20
Aurelien Jarno	                        GPG: 1024D/F1BCDB73
aurelien@aurel32.net                 http://www.aurel32.net
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
