From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] Re: [PATCH] PCMCIA: Disable probing on parisc
Date: Mon, 12 Dec 2005 22:17:16 +0100
Message-ID: <200512122217.16864.deller@gmx.de>
References: <20051204060423.GA12355@quicksilver.road.mcmartin.ca>
	<20051212073003.GA15901@colo.lackof.org>
	<1134398708.9994.3.camel@mulgrave>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_cjenDehzQq+DPF5"
Cc: James Bottomley <James.Bottomley@steeleye.com>,
 Russell King <rmk+pcmcia@arm.linux.org.uk>,
 linux-pcmcia@lists.infradead.org,
 Kyle McMartin <kyle@parisc-linux.org>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1134398708.9994.3.camel@mulgrave>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--Boundary-00=_cjenDehzQq+DPF5
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday 12 December 2005 15:45, James Bottomley wrote:
> On Mon, 2005-12-12 at 00:30 -0700, Grant Grundler wrote:
> > Before I propose the quirk to linux-pci, I need to know the scope of the
> > problem. Is this a problem only for that PCI slot on that box, for any
> > slot under dino, any PARISC PCI, or any PCI platform?
> 
> Actually, that's the problem.  This device is a built in PCI<->PCMCIA
> bridge in the tadpole.  I'm the one with the PCI<->PCMCIA card, and that
> doesn't need this quirk.  So, as far as we know (until someone tries
> other PCI<->PCMCIA cards) this is the only quirk needed.
> 
> So perhaps we should do it in dino_fixup_bus() instead.

I agree. As long as we don't know if this is a generic cirrus/parisc/dino problem I think it's not good to add code to the generic drivers/pci.c driver.
Furthermore, since I don't think there are many people out there who have the possibility to test cirrus pcmcia hw on parisc I would propose to put the (temporary) quirk in drivers/parisc/dino.c instead.
Attached is a patch for this parisc-specific quirk which works for me. 
Ok to commit to the local parisc CVS tree ?

Helge

BTW, I tested the orinoco_cs and ide_cs drivers. Both worked like a charm out of the box on my tadpole laptop (B160L) :-)

--Boundary-00=_cjenDehzQq+DPF5
Content-Type: text/plain;
  charset="utf-8";
  name="diff2"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="diff2"

Index: drivers/parisc/dino.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/parisc/dino.c,v
retrieving revision 1.36
diff -u -p -r1.36 dino.c
--- drivers/parisc/dino.c	11 Dec 2005 20:25:11 -0000	1.36
+++ drivers/parisc/dino.c	12 Dec 2005 21:10:14 -0000
@@ -436,6 +436,21 @@ static void dino_choose_irq(struct paris
 	dino_assign_irq(dino, irq, &dev->irq);
 }
 
+
+/*
+ * Cirrus 6832 Cardbus reports wrong irq on RDI Tadpole PARISC Laptop (deller@gmx.de)
+ * (the irqs are off-by-one, not sure yet if this is a cirrus, dino-hardware or dino-driver problem...)
+ */
+static void __devinit quirk_cirrus_cardbus(struct pci_dev *dev)
+{
+	u8 new_irq = dev->irq - 1;
+	printk(KERN_INFO "PCI: Cirrus Cardbus IRQ fixup for %s, from %d to %d\n",
+			pci_name(dev), dev->irq, new_irq);
+	dev->irq = new_irq;
+}
+DECLARE_PCI_FIXUP_ENABLE(PCI_VENDOR_ID_CIRRUS, PCI_DEVICE_ID_CIRRUS_6832, quirk_cirrus_cardbus );
+
+
 static void __init
 dino_bios_init(void)
 {

--Boundary-00=_cjenDehzQq+DPF5
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--Boundary-00=_cjenDehzQq+DPF5--
