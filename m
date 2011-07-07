From: John David Anglin <dave.anglin@bell.net>
Subject: Re: debian hppa
Date: Thu, 07 Jul 2011 12:16:43 -0400
Message-ID: <4E15DBEB.9040703@bell.net>
References: <20110527213516.GH21744@dannf.org> <20110527233738.0B95D4FCB@hiauly1.hia.nrc.ca> <BANLkTi=maOnkCLD9aU=JDYL9257EkpHxnQ@mail.gmail.com> <20110601021049.GB3984@hiauly1.hia.nrc.ca> <BANLkTin2DhKC_ss6UsCPYxmTR-UD=GY0uw@mail.gmail.com> <E1F45BBE-F922-4E1C-9DEC-FAF4BF4B4E26@nrc-cnrc.gc.ca> <CA+DQjFgygVS0YQ_zUfQG=BkTb_zrSN+yYxGyTU6ufC-PV7dBxA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	dann frazier <dannf@dannf.org>, carlos@systemhalted.org,
	linux-parisc@vger.kernel.org
To: Thibaut VARENE <T-Bone@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CA+DQjFgygVS0YQ_zUfQG=BkTb_zrSN+yYxGyTU6ufC-PV7dBxA@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 7/7/2011 11:49 AM, Thibaut VARENE wrote:
>
> I have no problem with this, the only "active" user of the rp3440 is
> Aur=C3=A9lien, so I suppose it wouldn't be a problem. Yet, my underst=
anding
> is that the rp3440 is extremely slow at building anything (much slowe=
r
> than my other machines, it seems) because of the cache flush issues.
> AIUI that's why Debian stuck to J6700 for buildds, because those
> machines were a lot faster.

The rp3440 isn't bad for non trivial compilations.  At -j4, my 800 MHz=20
rp3440 is the fastest
machine that I have for building GCC.  It stumbles running the testsuit=
e=20
where it falls behind
my c3750.  The cache flush problem slows forks.  If this could be=20
resolved, the machine
could handle significantly larger loads than the J6700.

> Other than that, the rp3440 currently runs unstable with 2.6.22.19, s=
o
> I suppose a complete reinstall would be in order, and I'm not sure I
> have time to deal with that just yet. I'd be happy to provide remote
> access to the machine though, if someone steps up. FWIW, the only
> machine I have left running lenny is a J5000, 2x440MHz PA8500,
> previously used as an autobuilder for debian-multimedia.org.
The kernel on the rp3440 needs updating.  2.6.22.19 is not stable under=
=20
load.  To do this,
remote access to the console would be needed.  Many bugs have been fixe=
d=20
since
2.6.22.19, and I think many packages may not test successfully without=20
updating the
kernel and build environment.

I have done this manually on my rp3440 for quite a few packages.

Dave

--=20
John David Anglin    dave.anglin@bell.net

--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
