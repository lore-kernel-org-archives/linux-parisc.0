From: "Adam J. Richter" <adam@yggdrasil.com>
Subject: Re: [parisc-linux] Untested port of parisc_device to generic device interface
Date: Sat, 9 Nov 2002 17:50:42 -0800
Message-ID: <200211100150.RAA27228__42279.1130179123$1416621896$gmane$org@baldur.yggdrasil.com>
Cc: andmike@us.ibm.com, hch@lst.de, James.Bottomley@steeleye.com,
	linux-kernel@vger.kernel.org, mochel@osdl.org,
	parisc-linux@lists.parisc-linux.org
To: grundler@dsl2.external.hp.com
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Grant Grundler writes:
>Documentation/driver-model/overview.txt:
>| Note also that it is at the _end_ of struct pci_dev. This is
>| to make people think about what they're doing when switching between the bus
>| driver and the global driver; and to prevent against mindless casts between
>| the two.
>
>Until this changes, I don't see this as a useful replacement for
>either PCI or parisc devices. The "mindless casts" can be fixed.
>But without the ability to easily go from generic device type to
>bus specific type, people will just get lost in the maze of pointers.

	linux-2.5.46/include/linux/kernel.h already defines
container_of(ptr_to_element, parent_struct, element_name).

>From <linux/pci.h>:
#define to_pci_dev(n) container_of(n, struct pci_dev, dev)

>From <linux/usb.h>:
#define to_usb_device(d) container_of(d, struct usb_device, dev)

>From <asm-parisc/hardware.h> with my parisc device patch:
static inline struct parisc_device *to_parisc_dev(struct device *dev)
{
        return container_of(dev, struct parisc_device, device);
}

Adam J. Richter     __     ______________   575 Oroville Road
adam@yggdrasil.com     \ /                  Miplitas, California 95035
+1 408 309-6081         | g g d r a s i l   United States of America
                         "Free Software For The Rest Of Us."
