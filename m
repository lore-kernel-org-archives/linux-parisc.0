From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] NCR_700 problems on 715/64 with 2.6.11-rc4-pa1
Date: Sat, 19 Feb 2005 16:53:14 +0000
Message-ID: <20050219165314.GD455@parcelfarce.linux.theplanet.co.uk>
References: <200502191234.30310.deller@gmx.de> <20050219164007.GC455@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Helge Deller <deller@gmx.de>,
 James.Bottomley@HansenPartnership.com,
 parisc-linux@lists.parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <willy@www.linux.org.uk>
In-Reply-To: <20050219164007.GC455@parcelfarce.linux.theplanet.co.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Feb 19, 2005 at 04:40:07PM +0000, Matthew Wilcox wrote:
> On Sat, Feb 19, 2005 at 12:34:30PM +0100, Helge Deller wrote:
> > I get random messages from the 53c700 scsi driver (see below). 
> > Any ideas ?
> > _raw_foo() called with bad address 0xf0106121
> > Backtrace:
> >  [<10104ce4>] __raw_bad_addr+0x64/0x70
> >  [<1028edd8>] NCR_700_start_command+0x3e8/0x78c
> 
> Yup.  This is a missing ioremap() in the 53c700 driver.  I'll have a
> quick look, see if it's easily fixable (should be).  If the dmesg noise
> annoys you, you can just turn off CONFIG_DEBUG_IOREMAP, but thanks for
> reporting it -- it's an important step towards turning on HPPA_IOREMAP ...

Here's the patch I'm compiling now ...

--- drivers/scsi/lasi700.c      10 Dec 2004 20:46:33 -0000      1.10
+++ drivers/scsi/lasi700.c      19 Feb 2005 16:47:11 -0000
@@ -112,7 +112,7 @@ lasi700_probe(struct parisc_device *dev)
 
        hostdata->dev = &dev->dev;
        dma_set_mask(&dev->dev, 0xffffffffUL);
-       hostdata->base = base;
+       hostdata->base = ioremap(base, 0x100);
        hostdata->differential = 0;
 
        if (dev->id.sversion == LASI_700_SVERSION) {
@@ -138,6 +138,7 @@ lasi700_probe(struct parisc_device *dev)
        return 0;
 
  out_kfree:
+       iounmap(hostdata->base);
        kfree(hostdata);
        return -ENODEV;
 }
@@ -152,6 +153,7 @@ lasi700_driver_remove(struct parisc_devi
        scsi_remove_host(host);
        NCR_700_release(host);
        free_irq(host->irq, host);
+       iounmap(hostdata->base);
        kfree(hostdata);
 
        return 0;


-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
