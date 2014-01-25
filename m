From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: 3.12.8 is doing nasty things
Date: Sat, 25 Jan 2014 23:40:06 +0100
Message-ID: <38632185.Uo4SvuvNmB@caliban.sf-tec.de>
References: <2696873.HIAXvrDslF@caliban.sf-tec.de> <20140124222615.66cb0d2a@borg.lux.tuxicoman.be> <1390689039.2275.52.camel@dabdike.int.hansenpartnership.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3963997.VMk9lzrmrJ"; micalg="pgp-sha1"; protocol="application/pgp-signature"
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1390689039.2275.52.camel@dabdike.int.hansenpartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--nextPart3963997.VMk9lzrmrJ
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Samstag, 25. Januar 2014, 14:30:39 schrieben Sie:
> On Fri, 2014-01-24 at 22:26 +0100, Guy Martin wrote:
> > On Fri, 24 Jan 2014 22:07:23 +0100
> > 
> > Jeroen Roovers <jer@gentoo.org> wrote:
> > > On Fri, 24 Jan 2014 21:44:51 +0100
> > > 
> > > Rolf Eike Beer <eike-kernel@sf-tec.de> wrote:
> > > > I reported that I saw strange things happening after upgrading to
> > > > 3.12.5. Meanwhile I upgraded to 3.12.8 and things became worse. I
> > > > regularly see processes to fail randomly. I can see this as I
> > > > somethimes get failures in my nagios because the SSH connection to
> > > > the watched host (only the watched one runs .8) fails.
> > > 
> > > Confirmed with any kernel above 3.12.2 that I cared to test (I didn't
> > > test 3.12.3). The issues vary from illegal instructions to
> > > segmentation faults to double frees in userland, so it's basically a
> > > "random" thing. I can't say it's become "worse" after 3.12.5 (since I
> > > haven't kept per version statistics).
> > 
> > Same here, 3.12.5 was not behaving correctly and 3.12.8 was even worse.
> > With the later, I also experienced sshd segfault, python threading
> > segfault/hangs.
> > I quickly reverted to 3.12.4 which is far more stable.
> 
> This all sounds like a flushing problem.  I can't confirm with my
> pa8800 ... but that could be because the additional pa8800 flushes are
> masking the problem.  Could you try bisecting the parisc commits
> between .4 and .5 and see if there's a particular cause?

It's the one mmap fix, I see .5 being stable after reverting that fix.

Eike
--nextPart3963997.VMk9lzrmrJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEABECAAYFAlLkPVAACgkQXKSJPmm5/E4j4gCfYg6uYs5pk3nvxJlPV2Mcf56r
q1IAniGjU/ba0lT9VL/ZZHFqDcFZpoXQ
=FT+/
-----END PGP SIGNATURE-----

--nextPart3963997.VMk9lzrmrJ--

