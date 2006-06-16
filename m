From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] possible fix for pci-quirks.c: warning: unused
	variable
Date: Fri, 16 Jun 2006 11:40:11 -0400
Message-ID: <20060616154011.GB27846@skunkworks.cabal.ca>
References: <J0Y34T$0437D5FCE65DDF79AE4008B1486235FC@scarlet.be>
	<20060616154620.GE7868@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Joel Soete <soete.joel@scarlet.be>,
 Parisc List <parisc-linux@lists.parisc-linux.org>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060616154620.GE7868@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Jun 16, 2006 at 09:46:20AM -0600, Grant Grundler wrote:
> Adding an arch specific ifdef in driver code needs to have a darn good reason.
> 

The correct solution is,

--- drivers/usb/host/pci-quirks.c	19 Apr 2006 04:56:02 -0000	1.7
+++ drivers/usb/host/pci-quirks.c	16 Jun 2006 15:53:36 -0000
@@ -168,8 +168,6 @@ static int __devinit mmio_resource_enabl
 static void __devinit quirk_usb_handoff_ohci(struct pci_dev *pdev)
 {
 	void __iomem *base;
-	int wait_time;
-	u32 control;
 
 	if (!mmio_resource_enabled(pdev, 0))
 		return;
@@ -180,9 +178,10 @@ static void __devinit quirk_usb_handoff_
 
 /* On PA-RISC, PDC can leave IR set incorrectly; ignore it there. */
 #ifndef __hppa__
-	control = readl(base + OHCI_CONTROL);
+{
+	u32 control = readl(base + OHCI_CONTROL);
 	if (control & OHCI_CTRL_IR) {
-		wait_time = 500; /* arbitrary; 5 seconds */
+		int wait_time = 500; /* arbitrary; 5 seconds */
 		writel(OHCI_INTR_OC, base + OHCI_INTRENABLE);
 		writel(OHCI_OCR, base + OHCI_CMDSTATUS);
 		while (wait_time > 0 &&
@@ -199,6 +198,7 @@ static void __devinit quirk_usb_handoff_
 		/* reset controller, preserving RWC */
 		writel(control & OHCI_CTRL_RWC, base + OHCI_CONTROL);
 	}
+}
 #endif
 
 	/*

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
