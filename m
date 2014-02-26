From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: 3.12.8 is doing nasty things
Date: Wed, 26 Feb 2014 17:06:28 +0100
Message-ID: <1708632.M6uBEiBPM4@eto>
References: <2696873.HIAXvrDslF@caliban.sf-tec.de> <trinity-903a5549-9385-4d6f-b51b-4892f056a959-1393424775606@3capp-gmx-bs50> <BLU0-SMTP13B63E01B4FA0E673CD81997800@phx.gbl>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1688059.OuzMYzfhht"; micalg="pgp-sha1"; protocol="application/pgp-signature"
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP13B63E01B4FA0E673CD81997800@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--nextPart1688059.OuzMYzfhht
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Mittwoch 26 Februar 2014, 11:00:01 schrieben Sie:
> On 2/26/2014 9:26 AM, Helge Deller wrote:

>>>> After 2,5 days with 3.13.2 and 0576da2c08e3d332f1b0653030d28ab804585ab6
>>>> I have not yet seen a single random segfault.
> >> 
> >> A short update on this: I am still running on that kernel and have not
> >> seen a single random process crash since then. I'm willing to help in
> >> debugging this if anyone tells me how, but I will now just revert that
> >> patch from every new kernel to get a stable machine.
> > 
> > On a debian-kernel linux-image-3.13-1-parisc64-smp (3.13.4-1) and the
> > latest libc6 which Dave uploaded, I'm now seeing similiar issues which
> > are most likely related:
> > 
> > lsXX:~# dpkg-reconfigure locales
> > Generating locales (this might take a while)...
> > 
> >    de_DE.ISO-8859-1...cannot map archive header: Invalid argument
> 
> In my opinion, this is a glibc bug.  The issue has been discussed before.
> 
> I'm not seeing random segvs with 3.13.2 and later in general use.  I
> haven't reverted anything.
> 
> The only random program failures that I see are thread related. There
> are a bunch of failures
> in the glibc testsuite, but these are not new.  There was a message on
> the console this morning about
> reaching maximum lock depth 1024.  This was probably from glibc
> testsuite.  There is a known
> issue with locking in glib2.0 which sometimes causes dot to segv.
> 
> If you are testing programs that use threads intensively, then I could
> see that you might see problems.
> 
> A TLS bug affecting thread local variables was recently fixed in gcc-4.8.

I don't think this is the problem that I'm seeing. What crashed was things 
like make or ld which don't care for threads.

Eike
--nextPart1688059.OuzMYzfhht
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEABECAAYFAlMOEQsACgkQXKSJPmm5/E7FvgCglXDoNhCdPVhqH4k1/+wIoT8t
174AnAsX0EyiyUW+QrFWeXAvZ544aLBD
=n0et
-----END PGP SIGNATURE-----

--nextPart1688059.OuzMYzfhht--

