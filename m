From: =?iso-8859-1?Q?Martin-=C9ric_Racine?= <q-funk-X3B1VOXEql0@public.gmane.org>
Subject: Re: [parisc-linux] Re: 2.6.10-pa1 compile fails
Date: Thu, 30 Dec 2004 00:40:41 +0200 (EET)
Message-ID: <Pine.LNX.4.21.0412300029010.28533-100000__9366.89719460464$1416624520$gmane$org@hal.pp.fishpool.fi>
References: <41D3094B.4060206@tiscali.be>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN;
  charset=iso-8859-1
Cc: parisc-linux-6jwH94ZQLHl74goWV3ctuw@public.gmane.org,
 debian-hppa-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org
To: Joel Soete <soete.joel-IWqWACnzNjyZIoH1IeqzKA@public.gmane.org>
Return-Path: <bounce-debian-hppa=deller=gmx.de-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org>
In-Reply-To: <41D3094B.4060206-IWqWACnzNjyZIoH1IeqzKA@public.gmane.org>
Resent-Message-ID: <MBc2VC.A.H1B.hKz0BB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org>
List-Help: <mailto:debian-hppa-request-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-hppa/>

On Wed, 29 Dec 2004, Joel Soete wrote:

> Matthew Wilcox wrote:
> > We had this discussion two months ago.
> >=20
> > http://lists.debian.org/debian-hppa/2004/10/msg00021.html
> =20
> Taken this into account, I move parport_gsc.h into drivers/parport and re=
move stuff from parport_gsc.c
> (btw I add a gnu license to parport_gsc.h based on the one of parport_gsc=
=2Ec ;-)

   1    551 lines   Text/PLAIN
   2    107 lines   Text/PLAIN (Name: "drivers_parport_parport_gsc.c.diff")
   3    196 lines   Text/PLAIN (Name: "include_asm-parisc_parport_gsc.h.dif=
f")
   4    225 lines   Text/PLAIN (Name: "drivers_parport_parport_gsc.h.diff")

Thanks Joel!  The patches finally made it possible to compile 2.6.10-pa1 us=
ing:

binutils-hppa-linux       2.15-1
gcc-hppa-linux            3.4.1-1

Unless the parisc-linux team sees anything wrong with these patches, would =
it be
possible to merge them into the current CVS tree?=20

--=20
Martin-=C9ric Racine, ICT Consultant
http://www.iki.fi/q-funk/
