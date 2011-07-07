From: dann frazier <dannf@dannf.org>
Subject: Re: debian hppa
Date: Thu, 7 Jul 2011 10:18:10 -0600
Message-ID: <20110707161810.GC12243@dannf.org>
References: <20110527213516.GH21744@dannf.org>
 <20110527233738.0B95D4FCB@hiauly1.hia.nrc.ca>
 <BANLkTi=maOnkCLD9aU=JDYL9257EkpHxnQ@mail.gmail.com>
 <20110601021049.GB3984@hiauly1.hia.nrc.ca>
 <BANLkTin2DhKC_ss6UsCPYxmTR-UD=GY0uw@mail.gmail.com>
 <E1F45BBE-F922-4E1C-9DEC-FAF4BF4B4E26@nrc-cnrc.gc.ca>
 <CA+DQjFgygVS0YQ_zUfQG=BkTb_zrSN+yYxGyTU6ufC-PV7dBxA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	carlos@systemhalted.org, linux-parisc@vger.kernel.org
To: Thibaut VARENE <T-Bone@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CA+DQjFgygVS0YQ_zUfQG=BkTb_zrSN+yYxGyTU6ufC-PV7dBxA@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Jul 07, 2011 at 05:49:36PM +0200, Thibaut VARENE wrote:
> On Thu, Jul 7, 2011 at 1:20 AM, John David Anglin
> <dave.anglin@nrc-cnrc.gc.ca> wrote:
> > Hi Thibaut,
> >
> > On 13-Jun-11, at 6:19 PM, Thibaut VARENE wrote:
> >
> >>> I would say your other machines need updating even if the process=
 is
> >>> somewhat rocky as that's the only way a broadbased release can be=
 tested.
> >>
> >> Well I can assign one machine (the a500, being easy to reboot/fix =
as
> >> it is) to testing kernels, but for a stable kernel suitable for th=
e
> >> machines I'm e.g. assigning to the GCC Compile Farm[0], what would=
 be
> >> a good SMP kernel version to choose? I'm looking for the same leve=
l of
> >> hassle-freeness as 2.6.22.19 since these machines are under relati=
vely
> >> heavy load and I cannot afford to tend to their care on a daily ba=
sis
> >> ;-)
> >
> > Sorry for the delay in responding. =A0I think assigning the a500 to=
 the GCC
> > farm
> > provides good visibility. =A0For GCC, the kernel version doesn't ma=
tter much.
> > =A0The
> > main issue is stability.
>=20
> OK, so I suppose it's fine to stick with 2.6.22.19? I thought there
> were issues with un-implemented syscalls and such, so I don't really
> know...
>=20
> > I was wondering if the rp3440 in the ESIEE might be assigned to run=
ning
> > debian
> > buildd. =A0I believe that the current set of known kernel patches w=
ill make
> > this
> > machine reasonably stable under medium load. =A0Carlos recently fou=
nd a big
> > bug in the kernel futex code. =A0In any case, I recently successful=
ly built
> > many
> > unstable packages on my rp3440.
> >
> > I would be willing to help getting this going.
>=20
> I have no problem with this, the only "active" user of the rp3440 is
> Aur=E9lien, so I suppose it wouldn't be a problem. Yet, my understand=
ing
> is that the rp3440 is extremely slow at building anything (much slowe=
r
> than my other machines, it seems) because of the cache flush issues.
> AIUI that's why Debian stuck to J6700 for buildds, because those
> machines were a lot faster.

I don't think speed was really a concern - it was more hardware
availability and some hand-wavy belief that these machines would be
more stable.

Honestly, the most reliable build machine I've used is my
C3700. I don't recall ever having any build issues with
that. Anything it gives up in speed is definitely outweighed by
having to e.g. retry gcc 5 times before succeeding. By the end of the
port, I'd normally handbuild new gcc uploads here to avoid thrashing
on the real buildds. If given the option, I'd recommend 3 of those
boxes for a buildd ring.

> Other than that, the rp3440 currently runs unstable with 2.6.22.19, s=
o
> I suppose a complete reinstall would be in order, and I'm not sure I
> have time to deal with that just yet. I'd be happy to provide remote
> access to the machine though, if someone steps up. FWIW, the only
> machine I have left running lenny is a J5000, 2x440MHz PA8500,
> previously used as an autobuilder for debian-multimedia.org.
>=20
> HTH,
> T-Bone
>=20
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
