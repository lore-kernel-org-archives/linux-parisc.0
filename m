From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] No 2.6 kernel on 735/125 with CRX24?
Date: Tue, 28 Sep 2004 07:34:12 +0200
Message-ID: <4152E64500001139@mail-2-bnl.tiscali.it>
References: <200409272110.59787.j.raspe@t-online.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: parisc-linux@parisc-linux.org
To: j.raspe@t-online.de
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200409272110.59787.j.raspe@t-online.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


Hello Johannes,
> >
> > [...]
> >
> > > I tried:
> > > palinux-712-defconfig-2.6.8.1-pa11
> > > palinux-b180-defconfig-2.6.8.1-pa11
> > > palinux-32-2.6.6-pa4
> > > palinux-712-defconfig-2.6.6-pa4
> > > palinux-b180-defconfig-2.6.6-pa4
> > >
> > > all with the same result as before.
> > >
> > > After that I compiled a 2.6.9-rc2-pa7 kernel without support for
> > > framebuffer
> > >
> > > (CONFIG_FB) which booted perfectly with serial console.
> >
> > Cool :)
> >
> > > So I think we can track down the problem to the framebuffer driver
in
> >
> > the
> >
> > > kernels > 2.6 with my graphics device, which should be supported
> > > according to
> > > the beginning of stifb.c.
> >
> > I trust that it's a known issue: read the thread on debian-hppa
> > <http://lists.debian.org/debian-hppa/2004/09/msg00000.html>
> >
> > > I attached both, the 2.4 and the 2.6 dmesg.
> >
> > Thanks
> >
> > > What could I try next ??
> >
> > It seems that severall are already working on this pb :).
> >
> > Regards,
> >     Joel
> >
> > ---------------------------------------------------------------------=
------
> > Tiscali ADSL GO, 29,50 Euro/mois pendant toute une ann=E9e, profitez-=
en...
> > http://reg.tiscali.be/adsl/welcome.asp?lg=3DFR
> 
> Hi again,
> 
> I don't know if this is really the same problem. The problem described
in
> the 
> link is about the penguin getting his legs chopped. I would be glad if
I
> 
> could even see a penguin, with or without legs :).
I just had the feeling of a stifb pb (It's a ong time that I didn't paly
any more with stifb on my c110 or b180)?

> Where can I get 2.6.4-hppa-kernels? I tried the source from www.kernel.=
org,
> 
Either you choose anonymous co of cvs tree:
see <http://www.parisc-linux.org/faq/cvs.html>

or you grab the tarball at:
<http://cvs.parisc-linux.org/download/linux-2.6/>
(the patch against vanilla src is also available)

> but this seems to lack HIL-support and at the cvs.parisc-linux.org site=

the
> 
> oldest kernels are 2.6.5.
> With a 2.6.4 kernel I could verify if I have the same problem as mentio=
ned
> in 
> the link above, because this problem first came up with kernels > 2.6.4=
.
> 
Hmm good starting point :)

Good luck,
    Joel

-------------------------------------------------------------------------=
--
Tiscali ADSL GO, 29,50 Euro/mois pendant toute une ann=E9e, profitez-en..=
.
http://reg.tiscali.be/adsl/welcome.asp?lg=3DFR




_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
