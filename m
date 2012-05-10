From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: Issue booting v2.6.39 .. v3.4-rc6 on hp712/100
Date: Thu, 10 May 2012 21:32:51 +0200
Message-ID: <5387176.ckZp8f83KT@donald.sf-tec.de>
References: <4FA9975C.5060708@bergerie> <2075347.T446pQRFvO@donald.sf-tec.de> <4FABED84.2040401@bell.net>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart9050600.EHEf2C0qfb"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Cc: Vincent <vincent.stehle@laposte.net>, linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4FABED84.2040401@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--nextPart9050600.EHEf2C0qfb
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="ISO-8859-1"

John David Anglin wrote:
> On 5/10/2012 2:41 AM, Rolf Eike Beer wrote:
> > John David Anglin wrote:
> >> I posted a number of kernel work in progress patches to the linux-parisc
> >> list but nobody bothered to test them except for Vincent today.  All I
> >> know at this point is my rp3440 is much more stable and runs twice as
> >> fast as it used to with my cache patch.  As such, it can keep up with
> >> unstable. This took hundreds of kernel builds and considerable long term
> >> testing.
> > 
> > I have your patch from a while back applied to my C8000 and I have not
> > seen any crashes or other issues yet (since beginning of April).

> > I think Guy Martin has the cache patch running on at least one of his
> > machines.

> Thanks, it's good to know that there has been some other testing.
> 
> Does anyone have a working 32-bit kernel using the tmpalias support?  It
> would be nice to know if the problem is a 32-bit or PA 1.1 issue.
> 
> I asked where the crash occurred because PA 2.0 mnemonics are used in
> the tmpalias code.  On the other hand, if the failure occurs on the first
> flush instruction, the issue is likely in the TLB insert code in entry.S.

I have a C3600 running a 32 bit kernel and it is rock solid. It is currently 
running 3.3.5 and has before been running 3.2.4 without any problems (but both 
without your cache patch).

Eike
--nextPart9050600.EHEf2C0qfb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEABECAAYFAk+sF+sACgkQXKSJPmm5/E46CACfV/PWC9DycMcJADXMqKuAwHqZ
388AoJjZRe3j1CXHMJ34gYWGSJ0m7bZ2
=Q5cO
-----END PGP SIGNATURE-----

--nextPart9050600.EHEf2C0qfb--

