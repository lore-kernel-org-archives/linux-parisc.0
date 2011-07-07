From: Thibaut VARENE <T-Bone@parisc-linux.org>
Subject: Re: debian hppa
Date: Thu, 7 Jul 2011 17:49:36 +0200
Message-ID: <CA+DQjFgygVS0YQ_zUfQG=BkTb_zrSN+yYxGyTU6ufC-PV7dBxA@mail.gmail.com>
References: <20110527213516.GH21744@dannf.org> <20110527233738.0B95D4FCB@hiauly1.hia.nrc.ca>
 <BANLkTi=maOnkCLD9aU=JDYL9257EkpHxnQ@mail.gmail.com> <20110601021049.GB3984@hiauly1.hia.nrc.ca>
 <BANLkTin2DhKC_ss6UsCPYxmTR-UD=GY0uw@mail.gmail.com> <E1F45BBE-F922-4E1C-9DEC-FAF4BF4B4E26@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: dann frazier <dannf@dannf.org>, carlos@systemhalted.org,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <E1F45BBE-F922-4E1C-9DEC-FAF4BF4B4E26@nrc-cnrc.gc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Jul 7, 2011 at 1:20 AM, John David Anglin
<dave.anglin@nrc-cnrc.gc.ca> wrote:
> Hi Thibaut,
>
> On 13-Jun-11, at 6:19 PM, Thibaut VARENE wrote:
>
>>> I would say your other machines need updating even if the process i=
s
>>> somewhat rocky as that's the only way a broadbased release can be t=
ested.
>>
>> Well I can assign one machine (the a500, being easy to reboot/fix as
>> it is) to testing kernels, but for a stable kernel suitable for the
>> machines I'm e.g. assigning to the GCC Compile Farm[0], what would b=
e
>> a good SMP kernel version to choose? I'm looking for the same level =
of
>> hassle-freeness as 2.6.22.19 since these machines are under relative=
ly
>> heavy load and I cannot afford to tend to their care on a daily basi=
s
>> ;-)
>
> Sorry for the delay in responding. =C2=A0I think assigning the a500 t=
o the GCC
> farm
> provides good visibility. =C2=A0For GCC, the kernel version doesn't m=
atter much.
> =C2=A0The
> main issue is stability.

OK, so I suppose it's fine to stick with 2.6.22.19? I thought there
were issues with un-implemented syscalls and such, so I don't really
know...

> I was wondering if the rp3440 in the ESIEE might be assigned to runni=
ng
> debian
> buildd. =C2=A0I believe that the current set of known kernel patches =
will make
> this
> machine reasonably stable under medium load. =C2=A0Carlos recently fo=
und a big
> bug in the kernel futex code. =C2=A0In any case, I recently successfu=
lly built
> many
> unstable packages on my rp3440.
>
> I would be willing to help getting this going.

I have no problem with this, the only "active" user of the rp3440 is
Aur=C3=A9lien, so I suppose it wouldn't be a problem. Yet, my understan=
ding
is that the rp3440 is extremely slow at building anything (much slower
than my other machines, it seems) because of the cache flush issues.
AIUI that's why Debian stuck to J6700 for buildds, because those
machines were a lot faster.

Other than that, the rp3440 currently runs unstable with 2.6.22.19, so
I suppose a complete reinstall would be in order, and I'm not sure I
have time to deal with that just yet. I'd be happy to provide remote
access to the machine though, if someone steps up. FWIW, the only
machine I have left running lenny is a J5000, 2x440MHz PA8500,
previously used as an autobuilder for debian-multimedia.org.

HTH,
T-Bone

--=20
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
