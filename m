From: =?iso-8859-1?Q?Martin-=C9ric_Racine?= <q-funk-X3B1VOXEql0@public.gmane.org>
Subject: Re: front-panel LED and switch support broken (was: 2.6.10-pa1
 compile fails)
Date: Mon, 3 Jan 2005 11:42:37 +0200 (EET)
Message-ID: <Pine.LNX.4.21.0501031142060.31807-100000__30749.838500242$1416624525$gmane$org@hal.pp.fishpool.fi>
References: <20050103031907.GM18080@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN;
  charset=iso-8859-1
Cc: debian-hppa-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org,
 parisc-linux-6jwH94ZQLHl74goWV3ctuw@public.gmane.org
To: Matthew Wilcox <matthew-Ztpu424NOJ8@public.gmane.org>
Return-Path: <bounce-debian-hppa=deller=gmx.de-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org>
In-Reply-To: <20050103031907.GM18080-+pPCBgu9SkPzIGdyhVEDUDl5KyyQGfY2kSSpQ9I8OhVaa/9Udqfwiw@public.gmane.org>
Resent-Message-ID: <4i8IoD.A.WHF.vOR2BB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org>
List-Help: <mailto:debian-hppa-request-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-hppa/>

On Mon, 3 Jan 2005, Matthew Wilcox wrote:

> On Thu, Dec 30, 2004 at 04:40:38PM +0200, Martin-=C9ric Racine wrote:
> > On Thu, 30 Dec 2004, Martin-=C9ric Racine wrote:
> >=20
> > > On Thu, 30 Dec 2004, Martin-=C9ric Racine wrote:
> > > However, support for the front-panel LEDs and switches is BROKEN in 2=
=2E6.10-pa1:
> > > when I press the power switch, it kills the AC power instead of sendi=
ng a signal
> > > to the kernel to shut itself down.  OUCH!  The power/status LED is al=
so off.
> >=20
> > This is still broken in 2.6.10-pa2 as well.
>=20
> On which machine?  It works fine on my 725 and c3600.

712.

--=20
Martin-=C9ric Racine, ICT Consultant
http://www.iki.fi/q-funk/
