Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from freya.yggdrasil.com (h-64-105-136-52.SNVACAID.covad.net [64.105.136.52])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3B3A84829
	for <parisc-linux@lists.parisc-linux.org>; Sat,  9 Nov 2002 18:50:54 -0700 (MST)
From: "Adam J. Richter" <adam@yggdrasil.com>
Date: Sat, 9 Nov 2002 17:50:42 -0800
Message-Id: <200211100150.RAA27228@baldur.yggdrasil.com>
To: grundler@dsl2.external.hp.com
Subject: Re: [parisc-linux] Untested port of parisc_device to generic device interface
Cc: andmike@us.ibm.com, hch@lst.de, James.Bottomley@steeleye.com,
	linux-kernel@vger.kernel.org, mochel@osdl.org,
	parisc-linux@lists.parisc-linux.org
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
