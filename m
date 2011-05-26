From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [PATCH] Do not set CROSS_COMPILE but let CONFIG_CROSS_COMPILE handle it all.
Date: Thu, 26 May 2011 01:16:53 -0400
Message-ID: <201105260116.54553.vapier@gentoo.org>
References: <20110524194701.6a4c1bd4@epia.jer-c2.orkz.net>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1344693.ElK78927Ga";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Cc: linux-parisc@vger.kernel.org
To: Jeroen Roovers <jer@gentoo.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110524194701.6a4c1bd4@epia.jer-c2.orkz.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--nextPart1344693.ElK78927Ga
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

also, since this is a parisc-specific patch, i'd suggest a summary that=20
reflects that.  perhaps something like:
parisc: do not always override CROSS_COMPILE
=2Dmike

--nextPart1344693.ElK78927Ga
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJN3eJGAAoJEEFjO5/oN/WBLfsQANOQj+kTcEM2UpFSLmk4VQQ8
gVh6kDg/bUQZSqinHDbM2xyD87Ar7pvXstfOJzQAbk2lUnEJsuWhplbTylD3bGTB
r3+BnSsv2ojhVuvtU6wM+VaprFuV8QHpd0QQrN/tvjxZ2aRZeiXFdzAT8b3MgBft
enI25btWQKiB8GY+YZWU2gEelYOZFrCOcQMh1B2tmzmwAz1+bDgnwX3vW6XgZapm
d7RyEFyA9ppda2LyidDSpY9utVzYdzU1BvvECHrX1j65IuNshKtUWpkY0yNjmCvu
RJ8/rRwCR9P5Muh0JF5JJAw2+hGWheeTouPy5rLi/vsYpYQVoQsCu/b2f5eEin81
rs8wRTghknjUnGwGns7DTJgIqtlBRrZjY3A/IdfvHWWzVHWnSM2xFl19BWqMLnhI
LvkaR6GG2GM1h8sQWtcxpAMiJ37YxVFJeQeYPmID79olXKLBN1SJQpVBv4KueHVE
weDWNzSInmbUAfmeJnkNsJmpeboN+3sOptxYYSQVcXOnl6nuqdP3EyTQfxwqsUya
ISQGUp/I5M9P6LNHbuNTRzlDxuHcmlC/gFqu3134+ZGylB6+qjY+r7cddgacltct
f/OK+e2ffJKryBFyKfGamc4knY62RaHb1UWdbHIeqpvdhb51i/SUb3LBHCBdczxe
6cgl3cUBcAFIi/httQS0
=XG3M
-----END PGP SIGNATURE-----

--nextPart1344693.ElK78927Ga--
