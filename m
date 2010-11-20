From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: HPMC in lba_pat_out8 on rp3440
Date: Sat, 20 Nov 2010 16:01:21 -0500
Message-ID: <20101120210120.GA20947@hiauly1.hia.nrc.ca>
References: <20101117052218.GB27930@lackof.org> <20101117160319.984F14DA1@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101117160319.984F14DA1@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 17 Nov 2010, John David Anglin wrote:

> > On that note, can you try a 32-bit kernel? (SMP maybe)
> 
> rp3440 doesn't support a 32-bit kernel.  I don't have a 32-bit SMP
> machine.  I did try a UP 2.6.36 kernel on my c3750.  It crashed doing
> its first gcc build.  Don't know why.  My 2.6.34.7 build is stable.

I noticed today building a new 32-bit kernel for c3750 that there
are a couple of section mismatches arising from lba_pci.c and superio.c.  

The attached patch fixes the warnings but clearly isn't ideal.
__devinit is supposed to be for modules/hotplug, but some code seems
to use it with .probe.  I couldn't find a good way to fix the warning
from superio.c, so I just removed the __init.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

diff --git a/drivers/parisc/lba_pci.c b/drivers/parisc/lba_pci.c
index 3aeb327..3a2a7cb 100644
--- a/drivers/parisc/lba_pci.c
+++ b/drivers/parisc/lba_pci.c
@@ -1303,7 +1303,7 @@ lba_legacy_resources(struct parisc_device *pa_dev, struct lba_device *lba_dev)
 **
 **************************************************************************/
 
-static int __init
+static int __devinit
 lba_hw_init(struct lba_device *d)
 {
 	u32 stat;
@@ -1400,7 +1400,7 @@ static unsigned int lba_next_bus = 0;
  * If so, initialize the chip and tell other partners in crime they
  * have work to do.
  */
-static int __init
+static int __devinit
 lba_driver_probe(struct parisc_device *dev)
 {
 	struct lba_device *lba_dev;
diff --git a/drivers/parisc/superio.c b/drivers/parisc/superio.c
index f7806d8..1f2f641 100644
--- a/drivers/parisc/superio.c
+++ b/drivers/parisc/superio.c
@@ -455,7 +455,7 @@ static void superio_fixup_pci(struct pci_dev *pdev)
 DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_NS, PCI_DEVICE_ID_NS_87415, superio_fixup_pci);
 
 
-static int __init
+static int
 superio_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
 	struct superio_device *sio = &sio_dev;
