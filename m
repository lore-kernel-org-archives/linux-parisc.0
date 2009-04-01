From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tracing tree with the parisc tree
Date: Wed, 1 Apr 2009 11:37:40 +1100
Message-ID: <20090401113740.7f425e02.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__1_Apr_2009_11_37_40_+1100_Qpuk0GGD391hgbeu"
Cc: linux-next@vger.kernel.org, Helge Deller <deller@gmx.de>,
	Kyle McMartin <kyle@mcmartin.ca>,
	<linux-parisc@vger.kernel.org>,
	Uwe Kleine-Koenig <u.kleine-koenig@pengutronix.de>,
	Steven Rostedt <srostedt@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
	"H. Peter Anvin" <hpa@zytor.com>
Return-path: <linux-next-owner@vger.kernel.org>
List-ID: <linux-next.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Signature=_Wed__1_Apr_2009_11_37_40_+1100_Qpuk0GGD391hgbeu
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tracing tree got a conflict in
arch/parisc/include/asm/ftrace.h between commit
d75f054a2cf0614ff63d534ff21ca8eaab41e713 ("parisc: add ftrace (function
and graph tracer) functionality") from the parisc tree and commit
c79a61f55773d2519fd0525bf58385f7d20752d3 ("tracing: make CALLER_ADDRx
overwriteable") from the tracing tree.

The former adds a non-trivial version of the file, so I used that.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__1_Apr_2009_11_37_40_+1100_Qpuk0GGD391hgbeu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknSt1QACgkQjjKRsyhoI8ztqwCfdI8+in8ae4f97wMWbPh8cNjY
YtwAnAtQdbpXi5e+tsgF+4laoLJqNGlu
=jvfC
-----END PGP SIGNATURE-----

--Signature=_Wed__1_Apr_2009_11_37_40_+1100_Qpuk0GGD391hgbeu--
