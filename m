From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [parisc-linux] Re: [PATCH] Common compat_sys_sysinfo (v2)
Date: Mon, 8 Jan 2007 18:29:33 +1100
Message-ID: <20070108182933.b8153945.sfr__15191.2164678381$1416624259$gmane$org@canb.auug.org.au>
References: <20070107144850.GB3207@athena.road.mcmartin.ca>
	<20070107154045.GD3207@athena.road.mcmartin.ca>
	<20070108104347.83a004aa.sfr@canb.auug.org.au>
	<200701080654.27100.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============0642998112=="
Cc: akpm@osdl.org,
 linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>,
 parisc-linux@lists.parisc-linux.org
To: Arnd Bergmann <arnd@arndb.de>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200701080654.27100.arnd@arndb.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--===============0642998112==
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Mon__8_Jan_2007_18_29_33_+1100_bWnQA1q=iCU4iHvx"

--Signature=_Mon__8_Jan_2007_18_29_33_+1100_bWnQA1q=iCU4iHvx
Content-Type: text/plain; charset=ISO-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 8 Jan 2007 06:54:26 +0100 Arnd Bergmann <arnd@arndb.de> wrote:
>
> > People have complined before that this adds a whole stack frame to the
> > "normal" syscall path. =A0Personally I don't care, but it has been
> > mentioned.
>
> It might be a concern for something like 'read' which is called frequently
> and in strange ways, but for 'sysinfo' this really should not matter.

Absolutely true.

--
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__8_Jan_2007_18_29_33_+1100_bWnQA1q=iCU4iHvx
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFFofLdFdBgD/zoJvwRAq3sAJ95UYU7B9QntiOwuoCpeSqQyn4/KACgkx4h
bp1COzzonDn88eiRhxqHf8Y=
=4qXW
-----END PGP SIGNATURE-----

--Signature=_Mon__8_Jan_2007_18_29_33_+1100_bWnQA1q=iCU4iHvx--

--===============0642998112==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============0642998112==--
