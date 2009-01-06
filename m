From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: bad code with gcc-4.3 and lzma-utils ?
Date: Tue, 6 Jan 2009 01:16:08 -0500
Message-ID: <200901060116.09772.vapier@gentoo.org>
References: <20090106044058.7E85C4F9D@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1694592.DP27eyaurX";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Cc: Guy Martin <gmsoft@tuxicoman.be>, linux-parisc@vger.kernel.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090106044058.7E85C4F9D@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--nextPart1694592.DP27eyaurX
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Monday 05 January 2009 23:40:57 John David Anglin wrote:
> > On Sun, 4 Jan 2009 18:42:02 -0500 (EST) John David Anglin wrote:
> > > Would you please try this.
> >
> > It did work too.
>
> I installed the patch on the gcc trunk (4.4).  However, there are still
> issues.  The patch didn't fix the -O0 -fdelayed-branch error.  I have
> traced this to a middle-end bug:

thanks a lot for looking into this.  do you plan on adding the patch to the=
=20
4.3 branch as well ?
=2Dmike

--nextPart1694592.DP27eyaurX
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)

iQIcBAABAgAGBQJJYvcpAAoJEEFjO5/oN/WBo0IP+QHfQBPmboZzFnTHCqg/B4yV
mJKx+O2hF9yqSPsdDfzcqTY00xrzVDSdpAe82lB2QExQJhyOM3KCoqIN68IPxMXr
MgP5SXQO/zAb9IwWb6+MchE+pRt6NLvOV0VBmCGpF+5xhj0MTGVuqnYvF7vF7LkE
EP0V6c2m53MDcIROU16ZQsr5RcxBVNNyAHAmkh29uPH9Kic3lteluWjsKw3mIsHP
JW/x0wi8+w5f3iSokCXU/5v242uxAt3d9w7oRn1gW5EbzTDFphK+f5/y+ENKX5M3
hezT2zeoMO/wrFKmWUP1Hrz9LGsZyZiTKkrKvyrYyqoWYJN8M2G6d3HqKlJ6Re5q
XmiU2Gf2kfCvG6aMnjQwp7wD85zWCqdn8SL+Bsol6kdVO2u1gTqtInj57b1Tu8Ww
8/p3gFA2ASv61I0w83WiUtSDhccQ9BWcLjSLxE9lwv6LARzXryK1K+RL+xyTMez5
4dktLMA2PuSTL4FZsZK3O89Zje9MF24+yocUUQzd3iMIlvPMj8cEIRJSYDHIgUZf
/Jb+OQK7vr/dR1PzET5SOEUVs/rbQjATCzZ5OO5+Ml96UUzqJhXEAsmepG/5t0NR
1/WIVii82FFYbW0JFG/HW8I/NVyK2lBecp8LdnAFh2NIdL5rM3uTo9DSX2lp4ipQ
qsPLapkluusELmdUHC2S
=Es6z
-----END PGP SIGNATURE-----

--nextPart1694592.DP27eyaurX--
