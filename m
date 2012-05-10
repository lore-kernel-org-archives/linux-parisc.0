From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: Issue booting v2.6.39 .. v3.4-rc6 on hp712/100
Date: Thu, 10 May 2012 08:41:50 +0200
Message-ID: <2075347.T446pQRFvO@donald.sf-tec.de>
References: <4FA9975C.5060708@bergerie> <4FAADE2A.9080803@bergerie> <BLU0-SMTP65CF901B170B044925E85897160@phx.gbl>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3216674.VVqWXHb0lN"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Cc: Vincent <vincent.stehle@laposte.net>, linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP65CF901B170B044925E85897160@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--nextPart3216674.VVqWXHb0lN
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="US-ASCII"

John David Anglin wrote:

> I posted a number of kernel work in progress patches to the linux-parisc
> list but nobody bothered to test them except for Vincent today.  All I
> know
> at this point is my rp3440 is much more stable and runs twice as fast as
> it used to with my cache patch.  As such, it can keep up with unstable.
> This took hundreds of kernel builds and considerable long term testing.

I have your patch from a while back applied to my C8000 and I have not seen 
any crashes or other issues yet (since beginning of April). Your futex patches 
are on this machine for even longer. This of course means only that there is 
no obvious breakage, I did not run any special testcase for any of those stuff, 
but at least it doesn't randomly eats my machine.

I think Guy Martin has the cache patch running on at least one of his 
machines.

Related note: The #Gentoo-HPPA channel on Freenode has at least some activity 
every other day, often even daily. The last 3 critical breakages I had (the 
gcc bug breaking swap, the gcc bug breaking ext4 and the 3.4-rc compile 
breakage) were first discussed there before posting anywhere. Because of that 
the initial report e.g. to linux-parisc already had rather good data on what 
is happening.

Eike
--nextPart3216674.VVqWXHb0lN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEABECAAYFAk+rYzQACgkQXKSJPmm5/E4mowCbBsFpuCX8oSEP0TRM+tgejrb0
CmUAoJw67eb/YAhQUKifr+Ogc3xeCEqi
=Yq1u
-----END PGP SIGNATURE-----

--nextPart3216674.VVqWXHb0lN--

