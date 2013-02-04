From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: [PATCH] parisc: fixes and cleanups in page cache flushing (1/4)
Date: Mon, 04 Feb 2013 18:57:48 +0100
Message-ID: <1486683.rMoLpHzbnF@eto>
References: <20130203225909.GA14573@p100.box> <20130204163743.248510@gmx.net> <510FEBBD.9000207@bell.net>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6979563.VHPCXQA3fD"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Cc: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	James.Bottomley@hansenpartnership.com
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <510FEBBD.9000207@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--nextPart6979563.VHPCXQA3fD
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

John David Anglin wrote:
> On 2/4/2013 11:37 AM, Helge Deller wrote:
> >>> Von: Rolf Eike Beer <eike-kernel@sf-tec.de>
> >>> 
> >>> Helge Deller wrote:
> >>>> This is the first patch in a series of 4, with which the page cache
> >>>> flushing of
> >>>> parisc will gets fixed and enhanced. This even fixes the nasty
> >>>> "minifail" bug
> >>>> (http://wiki.parisc-linux.org/TestCases?highlight=%28minifail%29)
> >>>> which
> >>>> prevented parisc to stay an official debian port.  Basically the
> >>>> flush in
> >>>> copy_user_page together with the TLB patch from commit
> >>>> 7139bc1579901b53db7e898789e916ee2fb52d78 is what fixes the minifail
> >>>> bug.
> >>> 
> >>> Is this series expected to fix the thread related problems I see in the
> >>> git testsuite?
> >> 
> >> I expect so, if not, please let us know!
> > 
> > Ahem... actually:
> > MAYBE!!!
> > 
> > The problem is, that you probably will need an updated glibc (and maybe
> > compiler) as well. Dave has done a lot of work to fix stuff. We have
> > copied the most important update-packages to ftp.parisc-linux.org. To
> > update, just make sure the following lines are in your
> > /etc/apt/source.list file: deb ftp://ftp.de.debian.org/debian-ports
> > unstable main
> > deb ftp://ftp.parisc-linux.org/debian-ports/unstable unstable main
> > deb-src ftp://ftp.de.debian.org/debian unstable main
> > 
> > Do *not* just update to the packages of debian-ports.org. If you do that
> > it will render your system unbootable, since the udev-package is broken
> > and it will not find your discs at startup.
> > 
> > It's on my todo-list to upload further packages, update the website on how
> > to update your system, and of course to get a buildd working...
> Just a note, these packages are for debian systems.  I believe that Eike is
> running gentoo.  With respect to glibc, Carlos had a set of changes which I
> submitted to Debian.  The full set was accepted around the -30 unstable
> release.
> I think most of these are in gentoo but the matter needs review.

Oh Dave, I wanted to write a mail with "apt-get: no such command" or something 
;) I have tested your patchset you sent on 2012-12-31 and it fixed my git 
issues. So it simply boils down to: is everything from that patchset now in 
Helge's tree?

Eike
--nextPart6979563.VHPCXQA3fD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEABECAAYFAlEP9qEACgkQXKSJPmm5/E7gEACgh7iMz3l22ZCvkhmlco8B0zk/
YPgAn29c9fJV2rWvd01gGuyX7qNX7KVd
=VDRx
-----END PGP SIGNATURE-----

--nextPart6979563.VHPCXQA3fD--

