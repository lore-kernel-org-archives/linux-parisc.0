From: Rolf Eike Beer <eike@sf-mail.de>
Subject: Re: New hppa kernel packages uploaded (3.10.11, aka 3.10-3) to parisc archives
Date: Sun, 13 Oct 2013 22:03:12 +0200
Message-ID: <4281904.kYLiapHo9h@caliban.sf-tec.de>
References: <BLU0-SMTP850C7B9645BBBC4DF76FD0971C0@phx.gbl> <BLU0-SMTP943EBAB2046BE47061811197190@phx.gbl> <525AFA12.2000002@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3774966.7RQWWPtt7x"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Cc: Dave Land <xmechanic@landcomp.net>
To: Parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <525AFA12.2000002@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--nextPart3774966.7RQWWPtt7x
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Sonntag, 13. Oktober 2013, 21:52:50 schrieb Helge Deller:
> Hi Dave,
> 
> On 10/13/2013 06:59 PM, John David Anglin wrote:
> > To get devtmpfs you need a kernel built with CONFIG_DEVTMPFS.  I think the
> > Debian kernels in the archive have this.  However, at least some of the
> > default parisc kernel configs miss this option.
> You are correct.
> I just tested shortly the 712_defconfig and c3000_defconfigs, and both are
> missing CONFIG_DEVTMPFS.
> 
> What about DEVTMPFS_MOUNT? Is it needed as well?
> (Automount devtmpfs at /dev, after the kernel mounted the rootfs
> (DEVTMPFS_MOUNT) [N/y/?] (NEW))

This only has an effect if no initrd is used. But it would help for the case it 
is not, and has no bad effect in case an initrd is used, so both should be 
switched on.

Eike
--nextPart3774966.7RQWWPtt7x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEABECAAYFAlJa/IUACgkQXKSJPmm5/E51DACgjb4ZRFHV+81+AhE7PqhPhyAN
/oUAn3whiSvzTiuZyzBfMvHlixZ1oMG6
=z6fI
-----END PGP SIGNATURE-----

--nextPart3774966.7RQWWPtt7x--

