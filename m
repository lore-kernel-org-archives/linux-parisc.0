From: Kyle McMartin <kyle@infradead.org>
Subject: Re: Hacking SuperDome
Date: Wed, 11 Feb 2009 13:28:47 -0500
Message-ID: <20090211182847.GB27133@bombadil.infradead.org>
References: <20090207142906.GA8553@alpha.franken.de> <20090211072312.GA19531@colo.lackof.org> <20090211181425.GA27133@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@infradead.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090211181425.GA27133@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Feb 11, 2009 at 01:14:25PM -0500, Kyle McMartin wrote:
> > I would add "initcall_debug=1" to boot parameters. See kernel/main.c.
> > Possible add a mdelay(100) after each initcall.
> > 
> > Since Tulip configured properly, I'm going to assume PCI resources
> > were properly assigned and all PCI Busses enumerated. PCI support
> > shouldn't be any different than for other PAT PDC machines.
> > 
> 
> The interrupt assignment looks a little wonky, don't you think?

Try this?

diff --git a/drivers/parisc/iosapic.c b/drivers/parisc/iosapic.c
index 7beffca..25eaf6e 100644
--- a/drivers/parisc/iosapic.c
+++ b/drivers/parisc/iosapic.c
@@ -153,8 +153,8 @@
 
 /* "local" compile flags */
 #undef PCI_BRIDGE_FUNCS
-#undef DEBUG_IOSAPIC
-#undef DEBUG_IOSAPIC_IRT
+#define DEBUG_IOSAPIC
+#define DEBUG_IOSAPIC_IRT
 
 
 #ifdef DEBUG_IOSAPIC
@@ -479,7 +479,7 @@ iosapic_xlate_pin(struct iosapic_info *isi, struct pci_dev *pcidev)
 	pci_read_config_byte(pcidev, PCI_INTERRUPT_PIN, &intr_pin);
 
 	DBG_IRT("iosapic_xlate_pin(%s) SLOT %d pin %d\n",
-		pcidev->slot_name, PCI_SLOT(pcidev->devfn), intr_pin);
+		pci_slot_name(pcidev->slot), PCI_SLOT(pcidev->devfn), intr_pin);
 
 	if (intr_pin == 0) {
 		/* The device does NOT support/use IRQ lines.  */
