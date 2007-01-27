From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [parisc-linux] binutils-2.17.50.0.10+ hates hppa ?
Date: Sat, 27 Jan 2007 14:48:05 -0500
Message-ID: <200701271448.05974.vapier__25852.9881983579$1416624270$gmane$org@gentoo.org>
References: <200701271919.l0RJJDeq011264@hiauly1.hia.nrc.ca>
	<200701271438.52157.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============2027755443=="
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200701271438.52157.vapier@gentoo.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--===============2027755443==
Content-Type: multipart/signed; boundary="nextPart2783682.H1qgDGaEsM";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2783682.H1qgDGaEsM
Content-Type: text/plain;
  charset="iso-8859-6"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Saturday 27 January 2007 14:38, Mike Frysinger wrote:
> On Saturday 27 January 2007 14:19, John David Anglin wrote:
> > The problem appears to have been introduced by gentoo by the addition
> > of several ELF_OSABI defines to the file ;)  I don't think they should
> > be there.
>
> huh ?  that patch was against vanilla binutils release ... in other words,
> i did `tar jxf binutils-2.17.50.0.11.tar.bz2` ... so unless Gentoo has
> patched tar to screw up elf32-hppa.c, i dont think it's a Gentoo issue

looking through some binutils history, this looks like some fix that HJLu h=
as=20
done (Jan 2007 / PR3826) ... i'll complain to him/binutils list that he's=20
fuckin up my mojo :)
=2Dmike

--nextPart2783682.H1qgDGaEsM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.1 (GNU/Linux)

iQIVAwUARbusdUFjO5/oN/WBAQLWow/6A39WCQFpd62H9Klu9eozCbDDPb7OwFwA
1Fgb8EhxRZ20SO04JSX8fINfDApOAJQ8o8rFuWgo9gDRGXi1QgdC+zfLeEICWyp0
aNt3i2W9MHU7DQA2Q9evunMlAQLmGYgKZbo/MVMJpeBB3RuTThzb6QzNyI1bppTs
x1MoljyIQHjAuAAeRvFi0CZ618rb6mArGXSYx0TQ2heoSdDtZHCw1u8T1315Is1F
eh7WllqoHr6BEw/Llwx1aQqHTQHxm2xXLR+YGLVh+weWAyLoB24LWllpwIJW2O3Y
uRj8q7yw5bfCpMx0SA6q8k2TfX5qMH5TQSlOLUdrcNQcbOaL+r/eksPc5FhWyc4m
ebu68sQKnZiO7Qoshn+Yyjqk3aWacYwa0Okp3sJzgXiaD9TsBSthEoGSmeUWgZSP
BeJFL8gRm+WGcnjsT0D9QCxD7Y5UZ4eBY/JFAEBARDmuOoKDlUQ6BMnOcyL7Uw+c
b5pHLJS7T88e30IMrUFaOOnuXh8x5Y/+2ofxXa4zhKJZlfbBchwZFzrBS7/QiB80
Mngde9hgvxQr7wsaM6sqMIWAuHP0M5dtTbotDeDDpnKoC7gF0nfU9jM+m9x27dyp
Tp9EHLHmCg1lkg72JdKxjmVWW/0UMq8sIfhf1JlXjwjoxdpn6wkPkBZtNCKikP75
oPc0tRpmjgQ=
=pIsl
-----END PGP SIGNATURE-----

--nextPart2783682.H1qgDGaEsM--

--===============2027755443==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============2027755443==--
