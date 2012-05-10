From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: [PATCH 0/5] PA-RISC: fix compile
Date: Fri, 11 May 2012 00:44 +0200
Message-ID: <24772505.xKFVoyPWuj@donald.sf-tec.de>
References: <4430485.xEvkeJU8MB@donald.sf-tec.de> <CA+55aFwWrkmqFPW=hOPCiNDE9CGXrwk85W7-vt2Aeg5EC1MtJQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2476140.ODqGFRtFtZ"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Cc: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	linux-kernel <linux-kernel@vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CA+55aFwWrkmqFPW=hOPCiNDE9CGXrwk85W7-vt2Aeg5EC1MtJQ@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--nextPart2476140.ODqGFRtFtZ
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="ISO-8859-1"

Linus Torvalds wrote:
> On Thu, May 10, 2012 at 1:50 PM, Rolf Eike Beer <eike-kernel@sf-tec.de> 
wrote:
> >  arch/parisc/include/asm/hardware.h |    3 ++-
> >  arch/parisc/include/asm/page.h     |    6 ++++++
> >  arch/parisc/include/asm/pdc.h      |    7 -------
> >  arch/parisc/include/asm/pgtable.h  |    2 ++
> >  arch/parisc/include/asm/spinlock.h |    2 ++
> >  arch/parisc/kernel/pdc_cons.c      |    1 +
> >  arch/parisc/kernel/time.c          |    1 +
> >  drivers/parisc/sba_iommu.c         |    1 +
> >  drivers/video/console/sticore.c    |    2 ++
> >  include/asm-generic/getorder.h     |    2 +-
> >  10 files changed, 18 insertions(+), 9 deletions(-)
> 
> The diffstat doesn't match the actual patches - there are no getorder.h
> changes.
> 
> Hmm?

Yes, sorry. That diffstat is of the old patch series that included the 
getorder.h patch I now sent to you seperately as it doesn't have to do with 
the compile breakage itself.

Eike
--nextPart2476140.ODqGFRtFtZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEABECAAYFAk+sRLoACgkQXKSJPmm5/E4UtwCfSmH1eJ9pCsa/pPaQnGx3Tder
amwAoJ8y0oEj7uKnnJGgqPtVRJZsSB+v
=pV3S
-----END PGP SIGNATURE-----

--nextPart2476140.ODqGFRtFtZ--

