From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: State of the PA-RISC/HPPA port (August 2013)
Date: Sun, 04 Aug 2013 15:06:45 +0200
Message-ID: <2023332.MIaTqJBISH@donald.sf-tec.de>
References: <20130803204119.GA2392@halden.box> <CAE2sS1j6z+PJbRW5gS+B4C-WKhPZCXPwOs8np07qsPM1fxAe2w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2003193.vp3WOVt7vX"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Cc: debian-hppa@lists.debian.org
To: linux-parisc@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CAE2sS1j6z+PJbRW5gS+B4C-WKhPZCXPwOs8np07qsPM1fxAe2w@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--nextPart2003193.vp3WOVt7vX
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="ISO-8859-1"

Carlos O'Donell wrote:
> On Sat, Aug 3, 2013 at 4:41 PM, Helge Deller <deller@gmx.de> wrote:
> > So, what's the status of the Linux kernel for parisc?
> > 
> > Basically, I think all major outstanding kernel patches are now in the
> > upcoming kernel 3.11 tree, and the important ones will show up in the
> > stable kernel 3.10 series soon as well. Kernel 3.9 should be OK as well,
> > but some patches might be missing.
> > 
> > With kernel 3.11 (and 3.10.5 or higher) I expect most instability issues
> > from the past to be gone.  There might still be minor issues with
> > userspace segfaults (due to cache issues), but they are rare....
> 
> Thanks for all the work Helge!
> 
> On the glibc front I don't have as good news. We shipped 2.18 without
> all of the hppa patches, but keep a patchset up to date, and I'm
> merging in some changes from Dave.
> 
> The glibc testsuite results are really bad, but hopefully I'll poke at
> those over the coming year.
> 
> I'm using gentoo, and taking patches form the gentoo people and
> feeding those upstream as they are reported (I still have a few to go
> through).

Thanks to all of you working on that.

I currently do not have problems with glibc, at least I don't see any (Gentoo, 
using their 2.14 version). What I see are problems in binutils, although 
AFAICT those are not really HPPA-specific. One easy test is to build a recent 
version of CMake: if you specify no compiler flags bootstrapping will work, as 
I inserted -Wl,--unique=.text.* into the LDFLAGS there. But if you pass -O2 if 
will not build (binutils 2.23.[12]). If you remove the linker flag it will not 
work without -O2. I can't build newer kernels for my C8000 with frame pointers 
as it will crash ld with a NULL deref somewhere, older kernels work (probably 
smaller).

But otherwise my machine became pretty stable in the last time, that is really 
good ;)

Greetings,

Eike
--nextPart2003193.vp3WOVt7vX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEABECAAYFAlH+UewACgkQXKSJPmm5/E7bxwCcCBGONrt1MHSXKR8AYg3fbeIv
m9QAn2wnDkG7oNAdvPmaPPMeItQI/hj6
=VgYA
-----END PGP SIGNATURE-----

--nextPart2003193.vp3WOVt7vX--

