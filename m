Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id B20ED485D
	for <parisc-linux@parisc-linux.org>; Fri, 22 Feb 2002 16:51:26 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16ePTE-0002Ex-00; Fri, 22 Feb 2002 23:51:20 +0000
Date: Fri, 22 Feb 2002 23:51:20 +0000
From: Matthew Wilcox <willy@debian.org>
To: Peter Mottram <peter@petescaff.com>
Cc: Matthew Wilcox <willy@debian.org>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Re: Strange serial behaviour on C160
Message-ID: <20020222235120.C30545@parcelfarce.linux.theplanet.co.uk>
References: <20020222203902.A30545@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.42.0202230007580.15892-100000@r6.petescaff.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.42.0202230007580.15892-100000@r6.petescaff.com>; from peter@petescaff.com on Sat, Feb 23, 2002 at 12:11:38AM +0100
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Sat, Feb 23, 2002 at 12:11:38AM +0100, Peter Mottram wrote:
> Found devices:
> 2. Dino PCI Bridge (13) at 0xf1600000 [8/0], versions 0x680, 0x1, 0xa
> 4. Dino RS-232 (10) at 0xf1603000 [8/3], versions 0x7, 0x0, 0x8c
> 7. Raven U/L2 Core BA (11) at 0xffd00000 [8/16], versions 0x3b, 0x0, 0x81,  additional addresses: 0xffd0c000 0xffc00000
> 10. Raven U/L2 Core RS-232 (10) at 0xffd05000 [8/16/4], versions 0x3b, 0x0, 0x8c
> 15. Raven Backplane Wax BA (11) at 0xffe00000 [8/20], versions 0x17, 0x0, 0x8e
> 17. Raven Backplane RS-232 (10) at 0xffe02000 [8/20/2], versions 0x17, 0x0, 0x8c
> Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled
> ttyS00 at iomem 0xffd05800 (irq = 90) is a 16550A
> ttyS01 at iomem 0xf1603800 (irq = 121) is a 16550A
> ttyS02 at iomem 0xffe02800 (irq = 121) is a 16550A

Hah, figured out the bug.  It's all my fault!  Now that Dino has stopped
accidentally walking its siblings and finding a serial port to assign
an IRQ to, Wax is intentionally walking its siblings to assign an IRQ
and finding Dino's serial port :-)

Here's the code:

        fixup_child_irqs(dev, wax->busdev_region->data.irqbase,
                        wax_choose_irq);
        /* On 715-class machines, Wax EISA is a sibling of Wax, not a child.
         * On B/C/J class machines, wax_choose_irq won't match any device so
         * no harm will be done.
         */
        fixup_child_irqs(dev->parent, wax->busdev_region->data.irqbase,
                        wax_choose_irq);

The comment is quite the smoking gun.  Ideally, I would conditionalise it
on wax->version, but that's not currently being read; WAX_VER is undefined
and I don't have proper Wax documentation (if anyone happens to have
more Wax documentation than just the EISA portions, please let me know).
So, for the moment, let's try something along the lines of:

diff -u -p -r1.20 wax.c
--- drivers/gsc/wax.c   2002/02/05 23:59:35     1.20
+++ drivers/gsc/wax.c   2002/02/22 23:45:30
@@ -128,12 +128,11 @@ wax_init_chip(struct parisc_device *dev)
 
 	fixup_child_irqs(dev, wax->busdev_region->data.irqbase,
 			wax_choose_irq);
-	/* On 715-class machines, Wax EISA is a sibling of Wax, not a child.
-	 * On B/C/J class machines, wax_choose_irq won't match any device so
-	 * no harm will be done.
-	 */
-	fixup_child_irqs(dev->parent, wax->busdev_region->data.irqbase,
-			wax_choose_irq);
+	/* On 715-class machines, Wax EISA is a sibling of Wax, not a child. */
+	if (dev->parent->id.hw_type != HPHW_IOA) {
+		fixup_child_irqs(dev->parent, wax->busdev_region->data.irqbase,
+				wax_choose_irq);
+	}
 
 	/* Register the HIL-Keyboard NMI-Handler */
 #ifdef CONFIG_HIL

It compiles, I haven't checked it boots...

-- 
Revolutions do not require corporate support.
