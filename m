From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Re: linux-2.6 deller (ioremap-changes)
Date: Thu, 23 Mar 2006 07:17:24 +0100
Message-ID: <IWKHH0$9DD34FED84CC88F02F1247DA3E0C4B2A@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: "parisc-linux" <parisc-linux@lists.parisc-linux.org>,
 "tsg45800" <tsg45800@scarlet.be>
To: "deller" <deller@gmx.de>
Return-Path: <soete.joel@tiscali.be>
List-ID: <linux-parisc.vger.kernel.org>

> On Wednesday 22 March 2006 19:16, Helge Deller wrote:
> > On Wednesday 22 March 2006 18:18, Joel Soete wrote:
> > > > The 64bit Kernel boots now, but I still have to clean up STIfb dr=
iver to 
> > > > do the right thing.
> > > > Anyway, nice to have this fixed.
> > > > If STIfb is done, it's time to remove the CONFIG_HPPA_IOREMAP opt=
ion.
> > > 
> > > But unfortuantely failed to boot on b2k (64bit up kernel):
> > > STI GSC/PCI core graphics driver Version 0.9a                      =
    
     
> > > STI PCI graphic ROM found at fffffffff4940000 (128 kB), fb at
fffffffffb000000
> > > (16 MB)                                              
> > >     id 35acda16-9a02587, conforms to spec rev. 8.0c                =
    
     
> > > BUG: soft lockup detected on CPU#0!                                =
    
     
> > > <crash>
> > 
> > That's why I said I need to fix STIfb.... :-)
> 
Appologies for my bad understanding of your previous advise ;-)

> It's fixed now in CVS (2.6.16-pa2).
> Even X11 on stifb with 64bit kernel works...
> 
Great I will test asap.

Thanks a lot,
    Joel=0A=0A-------------------------------------------------------=0AN=
OTE! My email address is changing to ... @scarlet.be=0APlease make the ne=
cessary changes in your address book. =0A=0A
