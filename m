From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: [C8000] serial console drops input
Date: Sat, 25 Jan 2014 17:34:14 +0100
Message-ID: <1417398.fmUESL4Ngr@eto>
References: <20140125054144.4ccfde5e@marga.jer-c2.orkz.net> <57945170.qhAyWSFmja@caliban.sf-tec.de> <BLU0-SMTP74DD0D86114628AE2FE0A297A00@phx.gbl>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2306547.tOyIsrxiqX"; micalg="pgp-sha1"; protocol="application/pgp-signature"
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP74DD0D86114628AE2FE0A297A00@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--nextPart2306547.tOyIsrxiqX
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Samstag 25 Januar 2014, 11:29:22 schrieb John David Anglin:
> On 25-Jan-14, at 3:20 AM, Rolf Eike Beer wrote:
> > Am Samstag, 25. Januar 2014, 05:41:44 schrieben Sie:
> >> In recent kernels, with the new serial console code for the C8000,
> >> performance is terrible. Typing quickly results in characters getting
> >> dropped (I have no idea where I lose them), pasting results in 9
> >> out of
> >> 10 characters being dropped, and I don't see anything on the client
> >> side that could cause this, and I never had this problem with the old
> >> ttyB0 code. While entering a password, some characters never turn
> >> up on
> >> the other side and some get echoed back to the client.
> >> 
> >> Is anyone else seeing this?
> > 
> > What I see is that the C3600 now finally sees the kernel/console
> > output of the
> > C8000, I also see the login prompt, but typing anything on the C3600
> > doesn't
> > seem to make it to the C8k. So things have improved, I now can
> > actually see
> 
> Is XON/XOFF enabled in your terminal program?  See c8000 Technical
> Reference
> Guide for setup requirements
> 
> I'm using standard PC null modem cable from c3750 to c8000 and minicom
> 2.7.  It works
> fine but it's fairly slow.

Both on and off doesn't make a difference.

One other thing: the serial line from the C8000 to my Sun Fire V240 works 
flawlessly.

Eike
--nextPart2306547.tOyIsrxiqX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEABECAAYFAlLj54YACgkQXKSJPmm5/E6ltQCgku7BrT7izLy6YzWoj6r2qGRn
H14An07iWWa1g9KvCG0tZxcTIYM6B9AU
=+wkk
-----END PGP SIGNATURE-----

--nextPart2306547.tOyIsrxiqX--

