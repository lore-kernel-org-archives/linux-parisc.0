From: Guy Martin <gmsoft@gentoo.org>
Subject: Re: [parisc-linux] Support for 2.4.x kernels on hppa
Date: Tue, 25 May 2004 12:21:24 +0200
Message-ID: <20040525122124.7154e4d2.gmsoft@gentoo.org>
References: <20040524183227.GW7207@tausq.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============1354919123=="
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040524183227.GW7207@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--===============1354919123==
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="pgp-sha1"; boundary=")mMqyb=.pN=f?,L?"

--)mMqyb=.pN=f?,L?
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 24 May 2004 11:32:27 -0700
Randolph Chung <tausq@debian.org> wrote:

> I'd like to take an informal "survey" of what kernel versions people
> are using....

I use a 2.6 on a A440 and B180l and a C3600.
I remember having trouble with a J5000 but it was some time ago and I
guess my problem was the SMP enabled.

I'd like to use it on my D270 and on a K360 but there are scsi problems
atm. They both suffer of the same problem described by Joel Soete.

Also, a gentoo user wasn't able to boot a 2.6 on a 735/120. Palo (1.5)
display "If it's the last message ..." and nothing more while it works
well with a 2.4. I'll try myself later on my 735/99 which is down atm.


I'd like to add that despite the scsi problem, I can't still produce
livecd (the gentoo installation cd) using 2.6 because of the numerous
default config. If I remember correctly, if I enable some HIL stuff,
the kernel loops or crash at boot on my b180l.

> If you are one of those people who really care about 2.4 support,
> please speak up now!=20

Personaly, I don't care about 2.4 even if 2.6 doesn't have SMP. With a
2.4, my D270 compiles things slower with SMP than without. I also have
other problems with SMP like packet loss to localhost, making portmap
and other socket dae=F9on unusable.


hth

--=20
Guy Martin
Gentoo Linux - HPPA port Lead / IPv6 team
Lug Charleroi (Belgium)

--)mMqyb=.pN=f?,L?
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAsx4nrpShrnoH4YYRAmfuAJ0fdQvZZnkJU0mTSDQt5MVyuETpAgCfXmhw
274ZPB6L9yLFPPVlQwQ1RG4=
=3I3a
-----END PGP SIGNATURE-----

--)mMqyb=.pN=f?,L?--

--===============1354919123==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============1354919123==--
