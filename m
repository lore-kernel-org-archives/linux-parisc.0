From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] "Unknown machine at ..." on N4k
Date: Thu, 15 Jul 2004 08:08:12 +0200
Message-ID: <40BDA0200001B92E@ocpmta3.freegates.net>
References: <40BDA0200001B916@ocpmta3.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-1"
Cc: parisc-linux@parisc-linux.org
To: "Grant Grundler" <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <40BDA0200001B916@ocpmta3.freegates.net>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


> > On Wed, Jul 14, 2004 at 05:24:23PM +0000, Joel Soete wrote:
> > ...
> > > 19. Unknown machine at 0xfffffffffed25000 [37] { 0, 0x0, 0x5d3, 0x0=
0000
> > }
> > ...
> > > Any idea where I have to look for to change it?
> >
> > It needs to be added to arch/parisc/kernel/hardware.c.
> > see hp_hardware_list[] declaration :^)
> >
> > We just need to know what the proper name for the CPU is.
> 
> Ah it seems to be a N4000-55 (cpu PA8600 (PCX-w+)  550Mhz, so according=

> to:
> <http://hwdb.parisc-linux.org/view.php?type=3Dmachine&name=3DN4000-55>,=

>  it would be of "Prelude W+ 540" model name (even thought that its actu=
al
> clock seems well 550?)
> 
umm not so easy to choose the right thing according to:
<http://www.openpa.net/cpu.html#xwp>
its code name would be "Landshark"

Thanks more,
    Joel

-------------------------------------------------------------------------=
--
Tiscali ADSL LIGHT, 19,95 EUR/mois pendant 6 mois, c'est le moment de fai=
re
le pas!
http://reg.tiscali.be/default.asp?lg=3Dfr




_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
