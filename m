From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: parisc build failure
Date: Sun, 16 Nov 2008 23:13:42 +1100
Message-ID: <20081116231342.0cd747bd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sun__16_Nov_2008_23_13_42_+1100_n+AZsqsfjkK73wvx"
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>
To: Kyle McMartin <kyle@mcmartin.ca>, <linux-parisc@vger.kernel.org>
Return-path: <linux-next-owner@vger.kernel.org>
List-ID: <linux-next.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Signature=_Sun__16_Nov_2008_23_13_42_+1100_n+AZsqsfjkK73wvx
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Kyle,

Today's linux-next build (parisc allmodconfig) failed like this:

In file included from drivers/serial/mux.c:38:
include/linux/serial_core.h: In function 'uart_handle_sysrq_char':
include/linux/serial_core.h:450: error: 'struct uart_port' has no member na=
med 'sysrq'
include/linux/serial_core.h:451: error: 'struct uart_port' has no member na=
med 'sysrq'
include/linux/serial_core.h:451: error: 'struct uart_port' has no member na=
med 'sysrq'
include/linux/serial_core.h:453: error: 'struct uart_port' has no member na=
med 'sysrq'
include/linux/serial_core.h:456: error: 'struct uart_port' has no member na=
med 'sysrq'
include/linux/serial_core.h:473: error: 'struct uart_port' has no member na=
med 'sysrq'
include/linux/serial_core.h:474: error: 'struct uart_port' has no member na=
med 'sysrq'
include/linux/serial_core.h:477: error: 'struct uart_port' has no member na=
med 'sysrq'

This is happening in mainline as well. In fact, this has been happening
back as far as I have results (Aug 27).  The sysrq element of struct
uart_port is dependent on CONFIG_SERIAL_CORE_CONSOLE while the references
failing above are dependent on SUPPORT_SYSRQ which is defined if
CONFIG_MAGIC_SYSRQ is defined in mux.c.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sun__16_Nov_2008_23_13_42_+1100_n+AZsqsfjkK73wvx
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkgDnYACgkQjjKRsyhoI8zyIwCdF+noH6S5a7Ys3tJ8fInPNI2Q
0/UAoJQ6t69Tza0sqB8l6PcCoDH7A9gM
=1jhk
-----END PGP SIGNATURE-----

--Signature=_Sun__16_Nov_2008_23_13_42_+1100_n+AZsqsfjkK73wvx--
