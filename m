From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: parisc: fix mmap(MAP_FIXED|MAP_SHARED) to already mmapped address
Date: Sat, 7 Mar 2015 14:05:29 -0500
Message-ID: <CAE2sS1it+0djrgRhTz2NLU1hB6LTYX9mRGTT_iUZwJR4Bd7Bfw@mail.gmail.com>
References: <20131219191750.GC2881@blackmetal.musicnaut.iki.fi>
	<5313A12E.7010307@gmx.de>
	<20140401182627.GA3285@drone.musicnaut.iki.fi>
	<533B0A57.2060700@gmx.de>
	<CAE2sS1jZTzccFy_uWri++cgVz+AYVfY0_aFqXFxnJXZV3d1a0g@mail.gmail.com>
	<533C7C9A.5080703@gmx.de>
	<BLU0-SMTP84F101069B44354FC1070C976D0@phx.gbl>
	<533DB961.9010607@gmx.de>
	<BLU0-SMTP7204937E7AF88D8736354E976C0@phx.gbl>
	<533DC3E8.5010701@gmx.de>
	<CAE2sS1iY6H3fnEJDHr6oPGywwGYmM_2gt2r_p+DUz+v0Rf2szg@mail.gmail.com>
	<BLU436-SMTP15952414B35EC498F0793B1972B0@phx.gbl>
	<BLU437-SMTP9274AAFB2636BF93781F02972B0@phx.gbl>
	<1424560158.2146.22.camel@HansenPartnership.com>
	<54E9141B.4050009@gmx.de>
	<1424563046.2146.41.camel@HansenPartnership.com>
	<BLU436-SMTP737CEAAA0E7C3EAEFB9DB097280@phx.gbl>
	<1424625475.2146.88.camel@HansenPartnership.com>
	<BLU437-SMTP61AF76DB80DF7F81524FCC97280@phx.gbl>
	<1424627938.2146.103.camel@HansenPartnership.com>
	<54EA1ADC.60701@gmx.de>
	<1424632396.2146.116.camel@HansenPartnership.com>
	<54EA2B1B.10406@gmx.de>
	<1424634170.2146.119.camel@HansenPartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Helge Deller <deller@gmx.de>,
	John David Anglin <dave.anglin@bell.net>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Mike Frysinger <vapier@gentoo.org>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1424634170.2146.119.camel@HansenPartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Feb 22, 2015 at 2:42 PM, James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
> I know, I do, but that's sort of expected: most modern linux apps use
> mmap.  It's the older stuff that uses sys-v ipc, but perhaps for us this
> doesn't matter.

And that's the real truth.

The usage patterns that appear to matter are:
(a) An initial mmap, followed by an mmap with MAP_FIXED at the same
previous address.
(b) shmat with SHM_RND, in which case we get to round the resulting
address or return EINVAL.

Both of (a) and (b) work today if glibc sets SHMLBA to 4kb.

On parisc we simply can't deal with the user selecting an arbitrary address.

Cheers,
Carlos.
