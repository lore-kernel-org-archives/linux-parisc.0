From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] Re: NS87415 on C3K broken
Date: Thu, 16 Sep 2004 17:25:31 -0600
Message-ID: <20040916232531.GB24048__36189.4070789733$1416623563$gmane$org@colo.lackof.org>
References: <20040916161749.GA17660@colo.lackof.org>
	<200409170050.15042.bzolnier@elka.pw.edu.pl>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: linux-ide@vger.kernel.org,
 parisc-linux@lists.parisc-linux.org
To: Bartlomiej Zolnierkiewicz <bzolnier@elka.pw.edu.pl>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200409170050.15042.bzolnier@elka.pw.edu.pl>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Sep 17, 2004 at 12:50:15AM +0200, Bartlomiej Zolnierkiewicz wrote:
> I don't think ide-probe.c changes are the cause of HPMC.
> 
> probe_hwif_init() is only called after PCI device is fully setup,
> see ide_setup_pci_device().

Sorry - you are right. I overlooked the first line of:
void ide_setup_pci_device (struct pci_dev *dev, ide_pci_device_t *d)
{
        ata_index_t index_list = do_ide_setup_pci_device(dev, d, 1);
...

and only saw the probe_hwif_init() calls that follow.
*sigh*.

> ide_setup_pci_controller()
> 	-> ide_pci_enable()
> 		-> pci_enable_device()
> 
> and ide_setup_pci_controller() is called at the beginning
> of ide_setup_pci_device() before ->init_chipset()

Yes - I tracked the pci_enabled_device back to ide_setup_pci_controller().
But I just realized I had another brainfart: ide_setup_pci_controller()
is not ide_setup_pci_device(). I should stop coding late at night...

> Ideally this should be done by host drivers
> but moving this out of setup-pci.c is non-trivial.

Yes - I reached the same conclusion.

> > Anyway, ns87415 driver has more problems. The patch below adds
> > "init_chipset" entry point and init_chipset_ns87415() calls
> > pci_enable_device() and pci_set_master() before the probe.
> > And my C3k still HPMCs. My guess is more of the code from
> > init_hwif_ns87415() needs to be moved to init_chipset_ns87415().
> > And possible call some special suckyio init routines.
> > I won't be able to touch this for a few days.
> > Anyone else on parisc-linux ml want to take a whack at this?
...
> Yep, also if they are to stay please move them to ns87415.c
> because using <linux/ide.h> outside drivers/ide is WRONG.

they? superio_ide_init_iops() or something else?
Willy mentioned that as a TODO item and it's on my list.
But I didn't plan on touching that before the HPMC is resolved
or the PCI resource mgt issues are resolved.

thanks for the correction,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
