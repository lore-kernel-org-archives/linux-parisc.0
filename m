From: Thibaut VARENE <T-Bone@parisc-linux.org>
Subject: Re: debian hppa
Date: Tue, 14 Jun 2011 00:19:40 +0200
Message-ID: <BANLkTin2DhKC_ss6UsCPYxmTR-UD=GY0uw@mail.gmail.com>
References: <20110527213516.GH21744@dannf.org> <20110527233738.0B95D4FCB@hiauly1.hia.nrc.ca>
 <BANLkTi=maOnkCLD9aU=JDYL9257EkpHxnQ@mail.gmail.com> <20110601021049.GB3984@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: dann frazier <dannf@dannf.org>, carlos@systemhalted.org,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110601021049.GB3984@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Jun 1, 2011 at 4:10 AM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
> On Sat, 28 May 2011, Thibaut VARENE wrote:

Sorry for the late answer, I got slightly off-track lately.

>> BTW, I'm still running 2.6.22.19 on most these machines, and I've ki=
nd
>> of lost track: do we have a known better kernel I could safely upgra=
de
>> to?
>
> For the rp3440, the answer is definitely yes. =C2=A0Unfortunately, 2.=
6.39
> stable doesn't have the pata_cmd64x patch needed for DVD drive, or
> James' latest cache fix. =C2=A0So, I moved on.
>
> I think the random segfault issue present on pa8800 and pa8900 machin=
es
> is largely fixed in 3.0.0-rc1, but it is clear linux kernels are much=
 like
> wine. =C2=A0I think USB support for the rp3440 is broken and causes H=
PMCs.
> So, I have it disabled.

So, I'm not sure what to make of it: what would be the preferred
stable SMP kernel for pa8800/8900 machines as of now? Note I'm not
using udev anymore on any of my machines.

> At this time, there is no released stable kernel that I consider reli=
able
> on hppa. =C2=A0However, most recent kernel releases work ok on UP mac=
hines.
> Of course, my testing tends to be with CPU intensive applications.
>
> I am convinced that the rapid development methodology used by linux i=
sn't
> suited to ports with limited support. =C2=A0Ideally, we should pick t=
he next
> kernel designated for longterm support and patch it.

I've been making similar claims in the past, so I can only concur.
Unfortunately the time I can personally devote to palinux is
asymptotically nearing 0 ;P

> For your other machines, the cache issues are less severe because
> they support non equivalent aliasing. =C2=A0However, don't throw away=
 2.6.22.19
> because udev-266 is broken without libc6-2.13. =C2=A0Installing udev-=
266
> without libc6-2.13 will crash your machine at boot if your kernel use=
s
> udev. =C2=A0USB support is broken without it, so recovery can be tric=
ky.

not using udev anymore, after having had to face too many breakages to
remember, and deeming udev useless on headless with servers
non-hotswapable hardware anyway...

> I would say your other machines need updating even if the process is
> somewhat rocky as that's the only way a broadbased release can be tes=
ted.

Well I can assign one machine (the a500, being easy to reboot/fix as
it is) to testing kernels, but for a stable kernel suitable for the
machines I'm e.g. assigning to the GCC Compile Farm[0], what would be
a good SMP kernel version to choose? I'm looking for the same level of
hassle-freeness as 2.6.22.19 since these machines are under relatively
heavy load and I cannot afford to tend to their care on a daily basis
;-)

Thanks for your help!

T-Bone

[0] http://gcc.gnu.org/wiki/CompileFarm

--=20
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
