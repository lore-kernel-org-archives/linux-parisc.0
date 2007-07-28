From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [parisc-linux] glibc-2.6 status
Date: Sat, 28 Jul 2007 17:32:35 -0400
Message-ID: <200707281732.36636.vapier__26299.7374324643$1416624420$gmane$org@gentoo.org>
References: <200707281608.33638.vapier@gentoo.org>
	<119aab440707281423s6f77803fi67015e6268d225bc@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============0926245548=="
Cc: parisc-linux@lists.parisc-linux.org
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440707281423s6f77803fi67015e6268d225bc@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--===============0926245548==
Content-Type: multipart/signed; boundary="nextPart1672387.QTWi1fsIXl";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1672387.QTWi1fsIXl
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Saturday 28 July 2007, Carlos O'Donell wrote:
> On 7/28/07, Mike Frysinger <vapier@gentoo.org> wrote:
> > is it worth trying to make vanilla glibc-2.6 work ?  once i fixed
> > elf/elf.h to have all of the new PARISC defines, it cross-compiled fine
> > for me ... or is there more patches needed for runtime ?
>
> Yes, it is worth trying to make vanilla glibc-2.6 work.

ok, i'll start riding GMsoft ;)

> Note that because sometime compiles OK doesn't mean it actually
> functions. Did you have any test failures?

right, i wasnt proposing compile =3D=3D means life is great.  it's trivial =
for me=20
to cross-compile on my fast ppc64 machines (~15 minutes), i wanted to find=
=20
out the expected status before i go building it natively on a parisc box=20
(~many hours).

> My current set of libc and libc-ports patches:
> http://www.parisc-linux.org/~carlos/libc-2007-07-28.diff
> http://www.parisc-linux.org/~carlos/libc-ports-2007-07-28.diff
>
> My current set of unaudited failures:
> http://www.parisc-linux.org/~carlos/libc-error-2007-07-28.txt

thanks for the info
=2Dmike

--nextPart1672387.QTWi1fsIXl
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.5 (GNU/Linux)

iQIVAwUARqu19EFjO5/oN/WBAQLJxQ//eG4iz3BwX3Vk9G/4bhFjOg3eJTplwgaU
IZsUfq2a2XBMFchfrhH6Mw789tBNnJvPBP9dTFBReW+W1uS0DGOQnZzeR+aNxWCK
GuerEoeoit7yz9NpJFNT5lzjvhMQPdi7QRg3860cK+s5XzNM7qdOKMActFIoqOpS
/Y6zLagXNIlr2s3RblAhsMcUTy8DPxKBmVVAvDkFqNhKVmInHb+Jz3Pl6H3TIjMJ
9bZE3y/Md/wdK7E9DfV/aU40aEwhoSuY8aXcMVCBbWwtwstSV+3RdDKUeUEdZwin
VnRzD6zWmVgHkjpBzuJJfkJ7bPxzkzItQkLXTvvrX2yU9tPQgjooDeoVyW2qKg+9
RiCMVP2ie8q5lLSvRMfGz2Gd6Iiy5A2zIjBfoAgzbblYEJ0ZqjvfN/Re0WeleK+V
NjZdQ164rnNogMsojLCsUSVQlAWNAFHDsBYNPMqiwYslsrPMySFo3JjB4iRv7vkH
qx+uWpQeS2vaE6SXacyok2nsichmpjXrFM41fVQB7KN1LLRoiZVOW2Qg3wMwks1k
HkiywLI4xsOmRvE8XxKVx+3Tg+osXUdIson3j77Vo6r3i7Htl1LgDTToA7dcwloU
01beUZx6OyKfkye+7m3Rq6bL7mTTNCFtNww2/2NOMUemtR5k7JfnIiis28kAkjSK
suGqYHyrg+c=
=Haiv
-----END PGP SIGNATURE-----

--nextPart1672387.QTWi1fsIXl--

--===============0926245548==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============0926245548==--
