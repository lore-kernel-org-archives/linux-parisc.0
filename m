Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA29442
	for <parisc-linux@puffin.external.hp.com>; Mon, 21 Feb 2000 11:59:30 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by atlrel2.hp.com (Postfix) with ESMTP id A11D2493
	for <parisc-linux@thepuffingroup.com>; Mon, 21 Feb 2000 13:00:19 -0500 (EST)
Received: from localhost (grundler@localhost [127.0.0.1]) by milano.cup.hp.com with SMTP (8.8.6 (PHNE_14041)/8.7.3 TIS 5.0.1) id KAA13098 for <parisc-linux@thepuffingroup.com>; Mon, 21 Feb 2000 10:01:27 -0800 (PST)
Message-Id: <200002211801.KAA13098@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Date: Mon, 21 Feb 2000 10:01:27 -0800
From: Grant Grundler <grundler@cup.hp.com>
Subject: [parisc-linux] 64-bit BARs in 2.3.42 and more
List-ID: <linux-parisc.vger.kernel.org>


Hi all,
Appended is a reformatted version of an e-mail exchange with Martin Mares,
the "generic" PCI code owner for linux.  I'm posting this so it (a) gets
archived and (b) more folks are aware of the issues for L-class.

I've split the exchanges into the four topics I started with.
A "fifth" item (SERR/PERR support) came up later.

enjoy!
grant


gg1: Date: Mon, 7 Feb 2000 16:38:58 -0800 (PST)
gg1: Subject: 64-bit BARs in 2.3.42 and more
gg1:
gg1:
gg1: Martin,
gg1: Mathew Wilcox (willy@thepuffingroup.com) encouraged me to write to
gg1: you about the linux-2.3.42 PCI support.  I have some comments/questions
gg1: about the following issues for the PA-Risc port:
gg1: 
gg1: 1) Bugs in NCR/Symbios/Emulex 896 SCSI chip (has 64-bit BARs)
gg1: 2) Differentiating 32-bit from 64-bit BARs in the resource list.
gg1: 3) removing "static" from pci_lock declaration
gg1:    (or better: move the locking into PCI bus adapter code)
gg1: 4) warning about sizing BARs
gg1: 
gg1: 
gg1: FWIW, I worked on HP-UX PCI subsystem for about two years and
gg1: rearchitected the it to support N-class (8-way SMP, 12 4X-PCI slots).
gg1: As a result, I know the HP PCI bus adapters (GSCtoPCI, LBA, EPIC)
gg1: fairly well.  I'm currently helping the puffin group (Alex "puffin"
gg1: Devries, Chris "nym" Beard, Mathew "willy" Wilcox, et al) port
gg1: linux to PA-Risc platforms.
gg1: 
gg1: (Current status is at http://www.thepuffingroup.com/parisc/)

mm1: Date: Tue, 8 Feb 2000 11:15:09 +0100
mm1:
mm1: Hello Grant,
mm1: 
mm1:   Thanks a lot for your comments!

gg2: Date: Tue, 08 Feb 2000 18:51:37 -0800
gg2:
gg2: Martin,
gg2: Welcome!
gg2: and thanks for the quick reply.

mm2: Date: Wed, 9 Feb 2000 12:15:36 +0100
mm2:
mm2: Hello!

============================================================================
gg1: 1) Bugs in NCR/Symbios/Emulex 896 SCSI chip (has 64-bit BARs)
gg1: 
gg1: The 896 SCSI chip has 64-bit BARs. HP's "BIOS" (aka PDC) for N-class
gg1: attempted to program an address into those BARs and it didn't work.
gg1: It turned out HP's "lba" bus adapter behaved slightly different (but
gg1: still with-in PCI spec) than Symbios's PCI emulator/test board. Symbios
gg1: agreed it was a bug in their chip and would roll the chip. But the
gg1: OS has to make sure those devices get assigned a 32-Bit MMIO
gg1: address for 896's shipped in the first systems.
gg1: 
gg1: (FWIW, at the time Symbios didn't have any PC customers which actually
gg1: used a 64-bit MMIO address in their platforms - HP was the first).
gg1: 
gg1: I'd like to discourage putting a kluge in generic pci services to
gg1: accommodate a buggy chip (happened to HP-UX despite my objections).
gg1: I'm thinking the Symbios driver support will need a method (ie interface)
gg1: to deallocate a 64-bit MMIO resource, allocate a 32-bit MMIO resource,
gg1: and reprogram it's BAR.  And I didn't see anything for the first two
gg1: steps which leads me to #2.

mm1:    Unfortunately, during driver startup it's too late to change anything
mm1: - all buses have already been assigned their address ranges and the bridges
mm1: have been programmed accordingly. Also, fixes for devices with buggy
mm1: address decoding (I'm not sure this is the case, but I assume so) should
mm1: be worked around even if their driver is not loaded, so that they don't
mm1: collide with addresses of other devices.

gg2: Ok. PCI Online addition *behind* a bridge can run into the same problem.
gg2: HP-UX has the same weakness. It makes no attempt to reprogram bridges
gg2: either.
gg2: 
gg2: But behind a PCI-PCI bridge, only *one* MMIO range can be assigned. And for
gg2: the 21152 (iirc) that will be a 32-bit MMIO address since that's all the
gg2: bridge can forward. Only *prefetchable* MMIO addresses are 64-bit on the
gg2: DEC bridge which is not suitable for device registers on the Symbios 896.

mm2: You're right, but I would still prefer to do all the broken address
mm2: decode fixups the same way.

mm1:    This leads me to a conclusion that we should really handle it in the
mm1: global PCI fixup (drivers/pci/quirks.c) in similar way to the S3 fixup
mm1: we already do there (i.e., just reset the problematic resources and let
mm1: the architecture specific code assign the right address; here we also
mm1: need to touch the 64-bit flag -- see below).

gg2: Ok. That makes sense. I'll be working on this in the next couple of weeks.
gg2: (pa-risc tree is going through 2.3.42 merge turmoil).


=============================================================================
gg1: 2) Differentiating 32-bit from 64-bit BARs in the resource list.
gg1: 
gg1: pci_resource_flags() only returns one type of MMIO MEM resource:
gg1:   IORESOURCE_MEM.
gg1: This makes it difficult to differentiate between resources which represent
gg1: 64-bit MMIO BARs and resources which represent 32-bit MMIO BARs.
gg1: The code could read the BAR again in order to examine it's flags
gg1: directly but I find that a bit klugey.
gg1: Any interest in adding another flag? IORESOURCE_64BIT?

mm1:   For PCI resources, the lowest 4 bits of resource flags contain the
mm1: usual PCI resource type, so you'll find the 64-bit flag there.

gg2: ok. Sorry I missed that and it's what I was looking for.


=============================================================================
gg1: 3) Removing "static" from pci_lock declaration
gg1: 
gg1: HP PA-Risc boxes typically have more than one PCI bus adapter.
gg1: They could have as many as 12 (eg N-class) and they can be added
gg1: as expansion cards to older machines (ie "card-mode" Dino).
gg1: 
gg1: My impression is the pci_lock serves to avoid collisions between
gg1: processors wishing to access PCI configuration space. Well, Dino
gg1: and LBA have to make multiple register accesses in order to generate
gg1: one configuration cycle. Thus, pci_lock makes the accesses "atomic"
gg1: by serializing access to configuration space.
gg1: 
gg1: The problem is Dino needs to use one of the same registers when
gg1: generating I/O Port space accesses as well.  (Yes - performance sucks
gg1: in this path - HP-UX uses MMIO almost exclusively). And under
gg1: LBA, the outb/d/l path needs to include a read to force the
gg1: write down to PCI bus. In short, pci_lock would work nicely
gg1: to provide syncronization for configuration space *and* I/O port
gg1: space.
gg1: 
gg1: Could the "static" keyword be removed from pci_lock declaration?
gg1: 
gg1: PA-Risc boxes would get a performance benefit if this is taken
gg1: a step further: move PCI syncronization out of generic PCI code
gg1: and into PCI bus adapter code.  Each PA-RISC PCI bus adapter is
gg1: different PCI segment. (Well, except under LBA...but that's
gg1: another story).  Each bus adapter could use it's own spinlock to allow
gg1: independent access to it's PCI segment. PC's could continue to use
gg1: a global pci_lock in their code.
gg1: 
gg1: Could the "pci_lock" syncronization be pushed down to pcibios_xxx
gg1: and pci_read/write_xxx() level?

mm1: When I was designing these functions, I was thinking a lot about what
mm1: the right granularity of locking is and I decided that the configuration
mm1: accesses are not performance critical at all, so it's better to strive
mm1: for simplicity of their locking, not speed. This has lead to a single
mm1: global lock guarding all PCI configuration space operations, not
mm1: depending on whether they really can collide or not.

gg2: Agreed. Only time this might become an issue is on *very* large systems.
gg2: Being able to scan PCI busses in parallel would speed up boot time.
gg2: I'm talking about systems with 100+ PCI slots and dozens of busses.

mm2:  Historically, Linux did scan the whole 64K PCI device ID space by brute
mm2: force and it took a fraction of a second, so it probably doesn't matter.

mm1:    About using the pci_lock for other purposes: I'd rather like to avoid
mm1: overloading the pci_lock with other functions. I/O port accesses should use
mm1: their own lock, even if it makes the pci_lock in fact useless.

gg2: Ok. I'll avoid using pci_lock for platform specific code then.
gg2: 
gg2: I had poked Alan Cox earlier about this and I'm glad I ask you.
gg2: His reply was:
gg2: | >   Alan, could you comment on why drivers/pci/pci.c:pci_lock is static?
gg2: | >   (ie Could the static qualifier be removed in linux-2.3?)
gg2: | 
gg2: | because nobody else needs it (well until you did)
gg2: 
gg2: Several people who saw this reply understood he meant to make pci_lock
gg2: a regular global.


gg1: Along the same line, iomem_resource and ioport_resource should really
gg1: be declared for each PCI bus segment. For PA-Risc, I think it would be
gg1: easiest to fold the MMIO and I/O port resource management into the
gg1: struct pci_bus *pci_root tree. Perhaps they could be parameters
gg1: to pci_scan_bus() like "sysdata".

mm1: Actually, it's already here :-)

gg2: /me rolls his eyes. :^)

mm1: The iomem and ioport resources control global assignment of port and
mm1: memory addresses, but it's perfectly OK to define a set of local
mm1: resources (allocated from the global pool, of course) for a particular
mm1: PCI bus (by making pci_bus->resource[] point to them), the PCI layer
mm1: will use them instead (see pci_find_parent_resource()).

gg2: Ok. Thanks for the clarification. I have to do that for the next parisc
gg2: platform (L-class) I have to write code for. I expect to have code
gg2: published some time in March for that.

mm2: If you want any help, feel free to ask me.


=============================================================================
gg1: 4) warning about pci_read_bases()
gg1: 
gg1: I'm not sure this is a problem for Linux. Just something to avoid.
gg1: The calling tree to get to pci_read_bases() looks like:
gg1: ...
gg1:	pci_scan_bus()
gg1:		pci_do_scan_bus()
gg1:			pci_scan_slot()
gg1:				pci_scan_device()
gg1:					pci_setup_device()
gg1:						pci_read_bases()
gg1:
gg1: I didn't see any tests to make sure pci_scan_bus() wasn't called for
gg1: a given bus already. I did look for other paths and didn't find any.
gg1: (Could be hidden in a macro).
gg1: 
gg1: The problem I'm trying to avoid is pci_read_bases() will temporarily
gg1: disable the device from responding to MMIO or I/O Port accesses.
gg1: There is no mechanism to prevent another processor from attempting
gg1: to access the device (through MMIO at least) and causing the system
gg1: to crash.

mm1:   This should never happen -- we scan the buses only during system boot
mm1:and during insertion of new devices and in both cases no drivers can be
mm1:running for devices on the bus being scanned.

gg2: ok. That's what I suspected but didn't know (and couldn't verify).


gg1: For PCI "On-Line Addition", is only the "slot" rescanned? 
gg1: 
gg1: FWIW, HP-UX platforms allow the _bus_ to be rescanned and was designed
gg1: to support a "smart" expansion chassis which had one bus with
gg1: per-slot power control. The method there was to power-on a new slot
gg1: and then re-scan the entire bus.

mm1:   I plan support for such things for Linux 2.5 -- we already have most
mm1:parts of the hot-plug architecture in the kernel (we use it for CardBus
mm1:devices).

gg2: Ok.
gg2: 
gg2: FWIW, HP's L- and N-class has HW support for PCI OL-A/R (addition/removal).
gg2: And when the OS boots, it has to configure all PCI devices except console
gg2: and boot interface (ie SCSI or 100BT networking). "PDC" (aka BIOS) has
gg2: calls to return resource layouts (irq routing, MMIO available, bus numbers,
gg2: etc). So I'm interested in the 2.5 work once parisc-linux becomes
gg2: self-hosting.

gg1: The solution I implemented in HP-UX is rather obvious: Check if we
gg1: already know about the device in the slot *before* sizing the BARs.
gg1: Not fool proof, but it seems to be working.
gg1: 
gg1: If you have any questions about PA-Risc PCI implementations, it's
gg1: very likely I can answer and would be happy to do so.


=============================================================================
gg2: Last question (for now :^): I didn't see any mention of SERR/PERR command
gg2: bits in the Documentation/pci.txt. Any thoughts on "who" (ie driver/OS
gg2: /BIOS) should be setting/clearing those bits?
gg2: (Similar thoughts on FBB?)
gg2: 
gg2: For parisc platforms, I want to set both bits by default.  Graphics
gg2: and similar adapters which just don't care could clear those bits.
gg2:
gg2: FWIW, one of the HW performance gods here in HP has concluded that FBB
gg2: just isn't that important for our boxes. The improvement was within
gg2: the "noise" level (< ~2%) of what we can measure.

mm2: Currently there exists no support for SERR/PERR in Linux, the main
mm2: reason being that many host bridges don't have any reasonable
mm2: mechanism of reporting such errors to the CPU. The current policy
mm2: is "handle SERR/PERR in machine dependent code, turn errors during
mm2: configuration space accesses to error returns of the access functions
mm2: and just log the other errors without telling the drivers anything".
