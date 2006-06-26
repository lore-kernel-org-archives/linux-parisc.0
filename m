From: Kai Holthaus <kmh@sonic.net>
Subject: Re: [parisc-linux] Module Relocation Problem
Date: Sun, 25 Jun 2006 19:02:04 -0700
Message-ID: <200606251902.11694.kmh@sonic.net>
References: <J0FGHF$3C34E7AFFFACE857F314B50EFB7BB29D@scarlet.be>
	<200606101105.38472.kmh@sonic.net> <448B184F.7020309@tiscali.be>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============0903894000=="
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <448B184F.7020309@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--===============0903894000==
Content-Type: multipart/signed; boundary="nextPart2750942.2loOpEWIHo";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2750942.2loOpEWIHo
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

>     1. How do I compile the qc-usb driver directly into the kernel rather
> than as a standalone module?
>
>        At the moment, it is not possible without a lot of work to build t=
he
> qc-usb driver into the kernel. We recommend building qc-usb driver as a
> separate module rather than directly into the kernel. [snip]
>
> So apparently there is a few chance but regarding the generic advise it
> could be out dated, the best is certainly to contact developers to get an
> actual status ;-)

Thanks for the help and advice - here's the answer from the developer:

"I haven't tried doing this recently. I made a couple of attempts to
shoehorn the driver into the kernel build system, but it ended up being
a rathole I didn't want to go down until I've cleaned up the driver
itself. Integrating the qc-usb driver into the kernel is definitely on
the TODO list, just not right now. Sorry."

> Appology if I don't have much more help to offer (no hardware and mainly
> dramaticaly lakes of time, specialy for the moment).

This has all been very helpful. If it is indeed a problem in the hppa-linux=
=20
kernel, I'll keep a watchful eye out for fixes. If there's anything a kerne=
l=20
layman like me can do, please let me know.

Thanks,

	Kai

--nextPart2750942.2loOpEWIHo
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQBEn0Ajwl7N6T1/FugRAqAiAJ9m/RqYaPxMT2jcQGVkl+0mi9uDjQCdGfdW
hpnBzGVhpHJp8JFoLxvxMvY=
=M6yM
-----END PGP SIGNATURE-----

--nextPart2750942.2loOpEWIHo--

--===============0903894000==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============0903894000==--
