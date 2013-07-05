From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: [PATCH] parisc: Fix gcc miscompilation in pa_memcpy()
Date: Fri, 05 Jul 2013 23:05:02 +0200
Message-ID: <12486210.aWq2PzHOxI@eto>
References: <20130704203411.GA1258@p100.box>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart8532174.JeCd6uWJb1"; micalg="pgp-sha1"; protocol="application/pgp-signature"
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130704203411.GA1258@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--nextPart8532174.JeCd6uWJb1
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Donnerstag 04 Juli 2013, 22:34:11 schrieb Helge Deller:
> When running the LTP testsuite one may hit this kernel BUG() with the
> write06 testcase:
> 
> kernel BUG at mm/filemap.c:2023!
> CPU: 1 PID: 8614 Comm: writev01 Not tainted 3.10.0-rc7-64bit-c3000+ #6
> IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000401e6e84
> 00000000401e6e88 IIR: 03ffe01f    ISR: 0000000010340000  IOR:
> 000001fbe0380820
>  CPU:        1   CR30: 00000000bef80000 CR31: ffffffffffffffff
>  ORIG_R28: 00000000bdc192c0
>  IAOQ[0]: iov_iter_advance+0x3c/0xc0
>  IAOQ[1]: iov_iter_advance+0x40/0xc0
>  RP(r2): generic_file_buffered_write+0x204/0x3f0
> Backtrace:
>  [<00000000401e764c>] generic_file_buffered_write+0x204/0x3f0
>  [<00000000401eab24>] __generic_file_aio_write+0x244/0x448
>  [<00000000401eadc0>] generic_file_aio_write+0x98/0x150
>  [<000000004024f460>] do_sync_readv_writev+0xc0/0x130
>  [<000000004025037c>] compat_do_readv_writev+0x12c/0x340
>  [<00000000402505f8>] compat_writev+0x68/0xa0
>  [<0000000040251d88>] compat_SyS_writev+0x98/0xf8
> 
> Reason for this crash is a gcc miscompilation in the fault handlers of
> pa_memcpy() which return the fault address instead of the copied bytes.
> Since this seems to be a generic problem with gcc-4.7.x (and below), it's
> better to simplify the fault handlers in pa_memcpy to avoid this problem.

Which gcc PR# is that?

Greetings,

Eike
--nextPart8532174.JeCd6uWJb1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEABECAAYFAlHXNQMACgkQXKSJPmm5/E41SACfZbOaAX0t1LQe+iku2DwNNDF7
EfEAoIWRnfaoH0oNMtz9Dn0/FCGh9Wxl
=vfH/
-----END PGP SIGNATURE-----

--nextPart8532174.JeCd6uWJb1--

