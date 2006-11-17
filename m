From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [parisc-linux] gcc ICE PR29114 (was: 64-bit long double support.)
Date: Fri, 17 Nov 2006 17:35:06 -0500
Message-ID: <200611171735.07215.vapier@gentoo.org>
References: <200611172149.kAHLneVu017780@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============0420059544=="
Cc: dave.anglin@nrc.ca,
 parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200611172149.kAHLneVu017780@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--===============0420059544==
Content-Type: multipart/signed; boundary="nextPart2962698.pJ4HA85Ovm";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2962698.pJ4HA85Ovm
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Friday 17 November 2006 16:49, John David Anglin wrote:
> Would you generate a backtrace for this breakpoint?

ive gotta take off for a while, so i've generated a core at that break poin=
t=20
and uploaded it here:
http://dev.gentoo.org/~vapier/hppa/
hope it helps
=2Dmike

--nextPart2962698.pJ4HA85Ovm
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iQIVAwUARV45G0FjO5/oN/WBAQJEnhAAmc1mb2fAM29GijVsxv3EKN4JHAd1KFbX
65bvwM+ILE0zMAX/5r7x8P4ifd2mnbKfWgTOx3ueroi2f59zsP4rbpn7rV96+xXS
qZv4NX/ej/bPrv9mop1tdeuf+xgHnVON5RaXihnfY+k48At64DUK4+xGZnMVkQsK
9fVGpnewyMDpHh4KgPhiKecEFWMhQHKG6D8VN4JYDZWripODNefG318kKFKPJmkR
4UviNmY43AmRnq4omJfoQolgM7J8xuBxIF1oENSKuFysU7H9ZSOzMP0PLEn6Y/m9
mRhK3+cwr9xpcBQg67BthHPIVD7tgTADgNjMPh+Bu5FKZA27RvcRz+0bOZYrN8oj
jVmz6iBFb/bKrrVoetBK7hZ58GtZJavRz4IOdl5IRhm1S0uakwLDdvbb7g0qEfkN
c9aQQsWIyyYNBm3x7bmLfiX8/atN/XWyzQgLvusJx5TFOeOeUq3+7Anqfg1d1byl
VMwNNcpaRtWCweTjTf6pPOB8wAV2/smBitUtwytPsmh0wfQE7pGgNQf3Sv4XFr0d
fZEpBn7o7OCvswDj/idMxc635iYcUQtwOanlL+aDexILYVgc0kyqcXrWdeTe+QfL
2ZPbEnpj4xpeppGr/+JcW4zwHvV4wW4yVyX0NjkvkECbNfRIDz1y9C+/Va2ZS8Av
w+9fiy5qcRY=
=5dts
-----END PGP SIGNATURE-----

--nextPart2962698.pJ4HA85Ovm--

--===============0420059544==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============0420059544==--
