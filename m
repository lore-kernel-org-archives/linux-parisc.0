Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: "Adam J. Richter" <adam@yggdrasil.com>
Cc: andmike@us.ibm.com, hch@lst.de, James.Bottomley@steeleye.com,
	linux-kernel@vger.kernel.org, mochel@osdl.org,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Untested port of parisc_device to generic device interface 
In-Reply-To: Message from "Adam J. Richter" <adam@yggdrasil.com>
   of "Fri, 08 Nov 2002 20:51:28 PST." <200211090451.UAA26160@baldur.yggdrasil.com>
References: <200211090451.UAA26160@baldur.yggdrasil.com> 
Date: Sat, 09 Nov 2002 11:04:48 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20021109180448.C41144829@dsl2.external.hp.com>
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

"Adam J. Richter" wrote:
> Please do not throw the baby out with the bath water.  The generic
> driver interface in its present form really can make parisc smaller
> and cleaner.

I hope that's true. I was just as disappointed as willy.

Documentation/driver-model/overview.txt:
| Note also that it is at the _end_ of struct pci_dev. This is
| to make people think about what they're doing when switching between the bus
| driver and the global driver; and to prevent against mindless casts between
| the two.

Until this changes, I don't see this as a useful replacement for
either PCI or parisc devices. The "mindless casts" can be fixed.
But without the ability to easily go from generic device type to
bus specific type, people will just get lost in the maze of pointers.

Common code needs to take a common parameter.  Operations on the tree
(eg probe) often require calls to bus specific (or arch or platform
specific) code which may in turn need to make other IO tree operations.
Those code paths convert back and forth between types regularly.
That's why I want to make it as simple as possible at the risk
a few people will get it wrong.

HPUX has had a "unified" IO tree since 10.0 in ~1994. Previous
releases had an IO tree for "Server IO" but not the PA-RISC
workstations. I've work on HPUX IO subsystem 6 years (PCI Code owner for
2 years) and it had several key features:
  (a) traverse the complete tree (from "central bus" to SCSI LUN)
      with shared code,
  (b) determine which type of bus any node was "on",
  (c) associate arbitrary local data with any node.
       (this includes bus *operations*! eg probe, dma, irq setup)

Maybe I'm not seeing it, but (b) and (c) are missing from basic
design or not well described in driver-model/overview.txt.

BTW, I couldn't find Documentation/filesystems/driverfs.txt.

Lastly, the example of an "irq" entry in overview.txt is interesting.
iosapic code "owns" the IRQ. And it could make visible other info
regarding IRQs - eg type and which CPU it's directed at.
But I get the feeling only bus specific code can do that since
it "owns" the directory. Do I misunderstand?

thanks,
grant
