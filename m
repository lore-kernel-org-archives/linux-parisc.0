From: j.raspe@t-online.de (Johannes Raspe)
Subject: Re: [parisc-linux] No 2.6 kernel on 735/125 with CRX24?
Date: Mon, 27 Sep 2004 21:10:59 +0200
Message-ID: <200409272110.59787.j.raspe@t-online.de>
References: <4152E81E00000BF8@mail-8-bnl.mail.tiscali.sys>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Cc: parisc-linux@parisc-linux.org
To: "Joel Soete" <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4152E81E00000BF8@mail-8-bnl.mail.tiscali.sys>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Hello Johannes,
>
> [...]
>
> > I tried:
> > palinux-712-defconfig-2.6.8.1-pa11
> > palinux-b180-defconfig-2.6.8.1-pa11
> > palinux-32-2.6.6-pa4
> > palinux-712-defconfig-2.6.6-pa4
> > palinux-b180-defconfig-2.6.6-pa4
> >
> > all with the same result as before.
> >
> > After that I compiled a 2.6.9-rc2-pa7 kernel without support for
> > framebuffer
> >
> > (CONFIG_FB) which booted perfectly with serial console.
>
> Cool :)
>
> > So I think we can track down the problem to the framebuffer driver in
>
> the
>
> > kernels > 2.6 with my graphics device, which should be supported
> > according to
> > the beginning of stifb.c.
>
> I trust that it's a known issue: read the thread on debian-hppa
> <http://lists.debian.org/debian-hppa/2004/09/msg00000.html>
>
> > I attached both, the 2.4 and the 2.6 dmesg.
>
> Thanks
>
> > What could I try next ??
>
> It seems that severall are already working on this pb :).
>
> Regards,
>     Joel
>
> -------------------------------------------------------------------------=
=2D-
> Tiscali ADSL GO, 29,50 Euro/mois pendant toute une ann=E9e, profitez-en...
> http://reg.tiscali.be/adsl/welcome.asp?lg=3DFR

Hi again,

I don't know if this is really the same problem. The problem described in t=
he=20
link is about the penguin getting his legs chopped. I would be glad if I=20
could even see a penguin, with or without legs :).
Where can I get 2.6.4-hppa-kernels? I tried the source from www.kernel.org,=
=20
but this seems to lack HIL-support and at the cvs.parisc-linux.org site the=
=20
oldest kernels are 2.6.5.
With a 2.6.4 kernel I could verify if I have the same problem as mentioned =
in=20
the link above, because this problem first came up with kernels > 2.6.4.

Regards Johannes

=2D-=20
Johannes Raspe - j.raspe@t-online.de
GnuPG-Key ID: D342E105
=46ingerprint: D681 F800 FB2D 913E D14C 1F17 C3DB B1F1 D342 E105
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
