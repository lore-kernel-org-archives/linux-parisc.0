From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] Re: 2.6.4-rc1-pa3 siimage/NS87415 IDE progess (and
	another mystery)!
Date: Sun, 11 Jul 2004 16:18:29 -0600
Message-ID: <20040711221829.GA27835@colo.lackof.org>
References: <Pine.LNX.4.58.0403040044200.14527@sal.ucc.ie>
	<20040309063629.GM1113@tausq.org>
	<Pine.LNX.4.58.0403090656070.13701@sal.ucc.ie>
	<20040309072917.GN1113@tausq.org>
	<Pine.LNX.4.58.0403091401480.16082@sal.ucc.ie>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: "M. Grabert" <xam@cs.ucc.ie>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <Pine.LNX.4.58.0403091401480.16082@sal.ucc.ie>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

[ Note the date! sorry...finally got around to this...]

On Tue, Mar 09, 2004 at 03:26:00PM +0000, M. Grabert wrote:
...
> But NOW I have some very weird problem for you!
...
> Anyway, the IDE hard drive works with the onboard IDE controller of the C3000!
> ... Well, not 100%. Let me explain. The mystery is:
> 
> IDE works fine (without DMA support, like in the 2.4 kernels), as long as
> I interrupt the automatic boot up and to a "sea" followed by a "bo pri".

I looked at what the firmware is doing "out of the ordinary"
and it's only writing three config space registers at 0x40-0x42 offset
of the suckyio IDE. I appended a patch that does the same thing.
Well, almost. We don't want to mask interrupts in CTRL2.

And it seems to work. At least with the CD-532E-B 32X ATAPI CD-ROM drive.
I only tried  to "dd" from a data CD with and without DMA enabled.
w/o DMA I get ~900KB/s and with DMA I get ~2.4MB/s (8K blocks).

Now if someone could explain WTH the following bits in suckyIO
mean, it would likely explain why the DMA didn't work before.
See the 87560.pdf (page 247) available from parisc-linux docs:
	
| 20.4.17 Control Register 1
...
| bit  Description
|  4   Channel 1 Drive 1 IDE/ATAPI Buffer Mode
|      0: Normal IDE prefetch buffer mode (default)
|      1: ATAPI buffer mode (no prefetching)

which I think is related to CTRL3 (0x42):
| 20.4.19 Control Register 3
...
| Bit Description
|  0  Channel 1 Pre-fetch Buffer.
|     0: Disabled
|     1: Enabled
|  1  Channel 2 Pre-fetch Buffer.
|     0: Disabled
|     1: Enabled

(NS87415 data sheet says essentially the identical thing)


Can you (or anyone else) test this patch with IDE disk drive on C3000?
If this works, I can get rid of the magic numbers (define constants)
and commit the code.

grant

Index: drivers/ide/pci/ns87415.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/ide/pci/ns87415.c,v
retrieving revision 1.16
diff -u -p -r1.16 ns87415.c
--- drivers/ide/pci/ns87415.c	16 Jun 2004 18:47:42 -0000	1.16
+++ drivers/ide/pci/ns87415.c	11 Jul 2004 21:54:17 -0000
@@ -235,6 +235,25 @@ static ide_pci_device_t ns87415_chipset 
 
 static int __devinit ns87415_init_one(struct pci_dev *dev, const struct pci_device_id *id)
 {
+#ifdef CONFIG_PARISC
+	u8 progif = 0;
+
+	/* Firmware (IODC) doesn't init this unless we interrupt
+	 * the auto-boot and "search".
+	 */
+	pci_read_config_byte(dev, PCI_CLASS_PROG, &progif);
+	pci_write_config_byte(dev, PCI_CLASS_PROG, progif | 0x8f);
+
+	/* IODC clobbers the CTRL registers with:
+	 * CTRL1 = 0xf0 = "ATAPI buffer mode (no prefetching)" for everyone
+	 * CTRL2 = 0x03 = mask chan1/2 interrupts
+	 * CTRL3 = 0x00 = "disable prefetch buffer"/"Master Wait States"
+	 */
+	pci_write_config_byte(dev, 0x40, 0xf0); /* IDE_CTRL1 */
+	pci_write_config_byte(dev, 0x41, 0x00); /* IDE_CTRL2 */
+	pci_write_config_byte(dev, 0x42, 0x00); /* IDE_CTRL3 */
+#endif
+
 	ide_setup_pci_device(dev, &ns87415_chipset);
 	return 0;
 }
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
