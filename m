From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: parisc boot crash on 3.10-rc1+git
Date: Thu, 16 May 2013 10:38:33 +0200
Message-ID: <1717012.DBvMCSU1Fh@eto>
References: <alpine.SOC.1.00.1305141432120.9094@math.ut.ee> <1536577.0f4jSevITp@eto> <BLU0-SMTP17357AC6F8AF968964CF7297A20@phx.gbl>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2225909.dOP4IPQNdi"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Cc: linux-parisc@vger.kernel.org
To: Meelis Roos <mroos@linux.ee>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP17357AC6F8AF968964CF7297A20@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--nextPart2225909.dOP4IPQNdi
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Mittwoch 15 Mai 2013, 18:32:34 schrieb John David Anglin:
> On 15-May-13, at 3:34 PM, Rolf Eike Beer wrote:
> > Am Mittwoch 15 Mai 2013, 20:16:21 schrieb Helge Deller:
> >> Hi Meelis,
> >> 
> >> On 05/15/2013 08:59 AM, Meelis Roos wrote:
> >>>>> It did not work - first a __schedule_bug,
> >>>> 
> >>>> I assume you have CONFIG_PREEMPT enabled? We know it's currently
> >>>> broken.
> >>> 
> >>> It is already disabled:
> >>> 
> >>> CONFIG_PREEMPT_NONE=y
> >>> # CONFIG_PREEMPT_VOLUNTARY is not set
> >>> # CONFIG_PREEMPT is not set
> >>> CONFIG_PREEMPT_COUNT=y
> >>> 
> >>> I just enabled the new irqstacks...
> >> 
> >> Ok, the good thing is, that I got today a rp5470 with which I could
> >> reproduce your problems.
> >> 
> >> The bad thing is:
> >> Beside CONFIG_PREEMPT, CONFIG_DISCONTIGMEM is broken too.
> > 
> > My C8000 runs 3.7.3 happily, so it must have happened after that.
> 
> I suspect that you actually have to have discontiguous memory to
> trigger the bug.

The C8000 has discontigmem. I can easily see if it is working or not: if I 
only have 1GB of RAM available it doesn't work. But I have all 2GB of RAM 
available.

Eike
--nextPart2225909.dOP4IPQNdi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEABECAAYFAlGUmw8ACgkQXKSJPmm5/E7ytwCgnhPS2apEzKBECgHtT0XwAMGM
uOcAoIqppE5beNdIStVCY+btS/BIPfGT
=CPH3
-----END PGP SIGNATURE-----

--nextPart2225909.dOP4IPQNdi--

