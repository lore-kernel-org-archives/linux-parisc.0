Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id C52FE482A
	for <parisc-linux@parisc-linux.org>; Sat,  1 Sep 2001 01:21:04 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15d55Q-0000T2-00
	for parisc-linux@parisc-linux.org; Sat, 01 Sep 2001 08:21:00 +0100
Date: Sat, 1 Sep 2001 08:21:00 +0100
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20010901082100.J5126@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] Port space on Elroy
List-ID: <linux-parisc.vger.kernel.org>

I just took a look at /proc/ioports on my j7k (running 2.4.9-pa1) and
I'm a little confused by what I see:

willy@jagu:~$ cat /proc/ioports 
00000000-00001ffe : LBA PCI I/O Ports
  00000020-0000003e : pic1
  000000a0-000000be : pic2
  000002f8-000002ff : serial(auto)
  00000378-0000037a : parport0
  000003f8-000003ff : serial(auto)
  00000800-000008ff : sym53c8xx
  00001000-0000107f : tulip
00004000-00004007 : serial(auto)
00004100-00004107 : serial(auto)
00004200-00004207 : serial(auto)
00004300-00004307 : serial(auto)
00012000-00013ffe : LBA PCI I/O Ports
00024000-00025ffe : LBA PCI I/O Ports
00038000-00039ffe : LBA PCI I/O Ports
0004c000-0004dffe : LBA PCI I/O Ports

(the only pci card i have in there is a quad-serial card).

First, why do all the ioport ranges go to ffe?  Surely it should be fff?
If so, we should make this change:

@@ -1189,8 +1193,7 @@ lba_legacy_resources(struct parisc_devic
        r->name  = "LBA PCI I/O Ports";
        r->flags = IORESOURCE_IO;
        r->start = READ_REG32(pa_dev->hpa + LBA_IOS_BASE) & ~1L;
-       r->end   = r->start +
-           (READ_REG32(pa_dev->hpa + LBA_IOS_MASK) ^ (HBA_PORT_SPACE_SIZE - 1)) - 1;
+       r->end   = r->start + (READ_REG32(pa_dev->hpa + LBA_IOS_MASK) ^ (HBA_PORT_SPACE_SIZE - 1));
 
        /* Virtualize the I/O Port space ranges */
        lba_num = HBA_PORT_BASE(lba_dev->hba.hba_num);

And then, what are the four serial entries doing off by themselves?
Surely these should be underneath one of the elroys?  /proc/pci says
they're on bus2, so I guess they should be under the 00024000-00025ffe
range (25fff?  :-).  I think the problem is that the start/end pair
aren't getting updated in the bus fixup.  In which case, the patch looks
like this:

@@ -707,6 +707,7 @@ lba_fixup_bus(struct pci_bus *bus)
        u16 status;
 #endif
        struct lba_device *ldev = LBA_DEV(bus->sysdata);
+       int lba_portbase = HBA_PORT_BASE(ldev->hba.hba_num);
 #ifdef __LP64__
        int i;
 #endif
@@ -805,6 +806,9 @@ lba_fixup_bus(struct pci_bus *bus)
                                /* "Globalize" PCI address */
                                res->start |= ldev->lmmio_base;
                                res->end   |= ldev->lmmio_base;
+                       } else if (res->flags & IORESOURCE_IO) {
+                               res->start |= lba_portbase;
+                               res->end   |= lba_portbase;
                        }
                }
 #endif

comments, please.

-- 
Revolutions do not require corporate support.
