From: Guy Martin <gmsoft@gentoo.org>
Subject: Re: [parisc-linux] Support for 2.4.x kernels on hppa
Date: Tue, 25 May 2004 19:14:45 +0200
Message-ID: <20040525191445.21b4ab3e.gmsoft@gentoo.org>
References: <20040524183227.GW7207@tausq.org>
	<20040525122124.7154e4d2.gmsoft@gentoo.org>
	<200405251212.03591.mszick@goquest.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============1955802044=="
Cc: parisc-linux@lists.parisc-linux.org
To: "Michael S. Zick" <mszick@goquest.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200405251212.03591.mszick@goquest.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--===============1955802044==
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="pgp-sha1"; boundary="=.v,gYZ3Fn,Sdnwx"

--=.v,gYZ3Fn,Sdnwx
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, 25 May 2004 12:12:03 -0500
"Michael S. Zick" <mszick@goquest.com> wrote:

> On Tue May 25 2004 05:21, Guy Martin wrote:
> > On Mon, 24 May 2004 11:32:27 -0700
> > > please speak up now!
> >
> > Personaly, I don't care about 2.4 even if 2.6 doesn't have SMP. With
> > a 2.4, my D270 compiles things slower with SMP than without.=20
>=20
> Hmm... Probably related to the slow fork/exec on hppa and the effect
> of SMP load balancing in kernel scheduler -
> There has been continuous work to improve fork/exec - I don't know if
> the changes have been applied to 2.4.x systems - others on this list
> will know.

Afaik, it was applied to kernel post 2.6.3.

> > I also have=20
> > other problems with SMP like packet loss to localhost, making
> > portmap and other socket dae=F9on unusable.
> 2.4?? or 2.6??  (2.6.x has i/o scheduling)

This is with a 2.4 SMP kernel on my D270/2. The problem disapear when I
use a non-SMP kernel.

--=20
Guy Martin
Gentoo Linux - HPPA port Lead / IPv6 team
Lug Charleroi (Belgium)

--=.v,gYZ3Fn,Sdnwx
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAs38IrpShrnoH4YYRAgz1AKCnMMutaSdntWqm79gAAU8Hte9yagCcDFUT
OdqJJCaxQRNSpYF9d2xL+gI=
=cVZu
-----END PGP SIGNATURE-----

--=.v,gYZ3Fn,Sdnwx--

--===============1955802044==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============1955802044==--
