From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: [PATCH] parisc: Suspend lockup detectors before system halt
Date: Tue, 25 Jul 2017 22:01:34 +0200
Message-ID: <2651830.be6NMSIgim@daneel.sf-tec.de>
References: <20170725194141.GA14760@p100.box> <5403864.sYzayCyLUt@daneel.sf-tec.de> <d015022e-2ecd-889f-7466-348fa2c230a6@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart12833711.hfPd7gA7iN"; micalg="pgp-"; protocol="application/pgp-signature"
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <d015022e-2ecd-889f-7466-348fa2c230a6@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--nextPart12833711.hfPd7gA7iN
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Helge Deller wrote:
> On 25.07.2017 21:47, Rolf Eike Beer wrote:
> > Helge Deller wrote:
> >> Some machines can't power off the machine, so disable the lockup
> >> detectors
> >> to avoid this watchdog BUG to show up every few seconds:
> >> watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [systemd-shutdow:1]
> > 
> > I don't think HPPA is the only architecture that has this problem,
> 
> Maybe.
> I haven't heard of others yet, probably because most other architectures
> do power off themselves, so they won't see this problem.
> 
> > so isn't there a generic solution? Or: is it time to add one?
> 
> Sure, you are welcome to test, post and discuss patches upstream if you
> like. It's not a very critical issue, so I can wait with pushing my patch.

I wont be able to do anything like that this week (maybe longer), so please go 
ahead with your patch to get rid of the annoying warning. Cleanups later.

Eike

--nextPart12833711.hfPd7gA7iN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEABECAAYFAll3o6MACgkQXKSJPmm5/E7SxwCfR8ldYOoCYzOyFH8Sg2BiXw/L
Eo8Ani+1ffhpzNiHRRGsBlpNcXqpSGzP
=tm8q
-----END PGP SIGNATURE-----

--nextPart12833711.hfPd7gA7iN--

