From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: [PATCH] parisc: Suspend lockup detectors before system halt
Date: Tue, 25 Jul 2017 21:47:38 +0200
Message-ID: <5403864.sYzayCyLUt@daneel.sf-tec.de>
References: <20170725194141.GA14760@p100.box>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3544663.FQYSIWSql0"; micalg="pgp-"; protocol="application/pgp-signature"
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20170725194141.GA14760@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--nextPart3544663.FQYSIWSql0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Helge Deller wrote:
> Some machines can't power off the machine, so disable the lockup detectors
> to avoid this watchdog BUG to show up every few seconds:
> watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [systemd-shutdow:1]

I don't think HPPA is the only architecture that has this problem, so isn't 
there a generic solution? Or: is it time to add one?

Eike
--nextPart3544663.FQYSIWSql0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEABECAAYFAll3oF4ACgkQXKSJPmm5/E7mPQCdEiBd2O9OyLz9QPp11FtTsvgI
c34An0By/3QLP6x3IGKQZ40Cj0YTZVNw
=Idl3
-----END PGP SIGNATURE-----

--nextPart3544663.FQYSIWSql0--

