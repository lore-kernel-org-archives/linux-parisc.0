From: Bartlomiej Zolnierkiewicz <bzolnier@elka.pw.edu.pl>
Subject: [parisc-linux] Re: NS87415 on C3K broken
Date: Fri, 17 Sep 2004 02:43:06 +0200
Message-ID: <200409170243.06449.bzolnier__33826.5252336443$1416623563$gmane$org@elka.pw.edu.pl>
References: <20040916161749.GA17660@colo.lackof.org>
	<200409170050.15042.bzolnier@elka.pw.edu.pl>
	<20040916232531.GB24048@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: linux-ide@vger.kernel.org,
 parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040916232531.GB24048@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Friday 17 September 2004 01:25, Grant Grundler wrote:
> > ide_setup_pci_controller()
> > 	-> ide_pci_enable()
> > 		-> pci_enable_device()
> > 
> > and ide_setup_pci_controller() is called at the beginning
> > of ide_setup_pci_device() before ->init_chipset()
> 
> Yes - I tracked the pci_enabled_device back to ide_setup_pci_controller().
> But I just realized I had another brainfart: ide_setup_pci_controller()
> is not ide_setup_pci_device(). I should stop coding late at night...

Heh.

> > > Anyway, ns87415 driver has more problems. The patch below adds
> > > "init_chipset" entry point and init_chipset_ns87415() calls
> > > pci_enable_device() and pci_set_master() before the probe.
> > > And my C3k still HPMCs. My guess is more of the code from
> > > init_hwif_ns87415() needs to be moved to init_chipset_ns87415().
> > > And possible call some special suckyio init routines.
> > > I won't be able to touch this for a few days.
> > > Anyone else on parisc-linux ml want to take a whack at this?
> ...
> > Yep, also if they are to stay please move them to ns87415.c
> > because using <linux/ide.h> outside drivers/ide is WRONG.
> 
> they? superio_ide_init_iops() or something else?

They.

> Willy mentioned that as a TODO item and it's on my list.
> But I didn't plan on touching that before the HPMC is resolved
> or the PCI resource mgt issues are resolved.

OK, thanks.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
