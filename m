From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [parisc-linux] Fwd: [patch] enable pie scripts for hppa64
Date: Wed, 9 Aug 2006 11:54:34 -0400
Message-ID: <200608091154.35852.vapier@gentoo.org>
References: <200608090013.09789.vapier@gentoo.org>
	<119aab440608090746o2341650ar6bfb0167057ffa16@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============1741181574=="
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440608090746o2341650ar6bfb0167057ffa16@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--===============1741181574==
Content-Type: multipart/signed; boundary="nextPart17803731.9HtcG1PI9g";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart17803731.9HtcG1PI9g
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wednesday 09 August 2006 10:46, Carlos O'Donell wrote:
> On 8/9/06, Mike Frysinger <vapier@gentoo.org> wrote:
> > ok to apply ?  i dont want to step on anyone's toes ...
>
> Don't worry about stepping on toes! You are doing good work looking
> for missing hppa features. Your patch looks good. Unfortunately we
> don't have an hppa64-linux userspace to take advantage of this, and I
> don't know if HPUX supports -fPIE and -pie.

right, i wasnt expecting a pie script to suddenly make everything work, but=
 i=20
know of no disadvantages and it would make [future] development easier

> Have you posted this on binutils for Dave to approve?

i posted it twice so far and havent heard back which is why i forwarded my=
=20
last one from July to the parisc list
=2Dmike

--nextPart17803731.9HtcG1PI9g
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.4 (GNU/Linux)

iQIVAwUARNoFO0FjO5/oN/WBAQJQxhAAyZ2mkM47Fh8/S1kf69Wamd0EMW5y+daW
0FIqSqHWgBO+lzN/C5FbSlqL7y9yy9uDA2Lo5DJSKCf8CjP4XJtLcYouVqv8AxDY
ir3S18p+d2O49jUTi4+ddS6TKrpQCBkptvU80QjWTEUQov600bufZfO3iteDnikS
KXO0mBip36hi6rA2Mphbi8qc03+t1UcuDa97DHIv1HJbdDhqhBDeyytpJnk56C9Q
aGt+bFTewdXlwXA9Cb1BiXsHPfMtYDzMXyUF7/7lPRq0ZP0WBumkZYgjwH2DBOjP
UvZza2ELUrK0km/uCEjmsIStoTVfmkzBdEuG5UgPyt1b9iAEkmzMNn4bQo9sgLUe
+ime0qQdAjQ1+ZuBG8flOgnES/8kFqAu7vaukqoYJakG+fs5SBP1ya2TTNdfhLIf
nTonO7hNUpR39wplRmQjO0IXakws9gEmjufJ6Ha/Uow14N34oBl4PFy5qYhdxziq
5ab+Pxb22DLbF38bpx8DkGQMTWPczXwgdTW4nH6dIVJT6nhUpW/+P1aIuP5rM+td
WsiRY9VbGqtqmQRfkIQTixvS9dzB3UMrpXFJL5Chr8M20iIcIIHIWx5AtRYjfgj2
nvRAazkmwswqmECsD67XahKlXfc11LYoUxxMH/p180aA6TtxOmfbSYTFRICYaIRl
rX4Ys2KK6c8=
=nk0z
-----END PGP SIGNATURE-----

--nextPart17803731.9HtcG1PI9g--

--===============1741181574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============1741181574==--
