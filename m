From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] Re: linux-2.6 deller (ioremap-changes)
Date: Wed, 22 Mar 2006 23:30:19 +0100
Message-ID: <200603222330.19695.deller@gmx.de>
References: <IWJHEG$84A0993CB79425B02A52A47173C782A6@scarlet.be>
	<200603221916.19396.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: tsg45800 <tsg45800@scarlet.be>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200603221916.19396.deller@gmx.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wednesday 22 March 2006 19:16, Helge Deller wrote:
> On Wednesday 22 March 2006 18:18, Joel Soete wrote:
> > > The 64bit Kernel boots now, but I still have to clean up STIfb driver to 
> > > do the right thing.
> > > Anyway, nice to have this fixed.
> > > If STIfb is done, it's time to remove the CONFIG_HPPA_IOREMAP option.
> > 
> > But unfortuantely failed to boot on b2k (64bit up kernel):
> > STI GSC/PCI core graphics driver Version 0.9a                                
> > STI PCI graphic ROM found at fffffffff4940000 (128 kB), fb at fffffffffb000000
> > (16 MB)                                              
> >     id 35acda16-9a02587, conforms to spec rev. 8.0c                          
> > BUG: soft lockup detected on CPU#0!                                          
> > <crash>
> 
> That's why I said I need to fix STIfb.... :-)

It's fixed now in CVS (2.6.16-pa2).
Even X11 on stifb with 64bit kernel works...

Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
