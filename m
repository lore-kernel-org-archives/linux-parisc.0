Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id CE2E54852
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 20 Dec 2003 22:10:42 -0700 (MST)
Received: from localhost (localhost [127.0.0.1])
	by colo.lackof.org (Postfix) with ESMTP id 6D9C2298044
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 20 Dec 2003 22:10:42 -0700 (MST)
Received: from colo.lackof.org ([127.0.0.1])
	by localhost (colo [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 12997-10 for <parisc-linux@lists.parisc-linux.org>;
	Sat, 20 Dec 2003 22:10:41 -0700 (MST)
Date: Sat, 20 Dec 2003 22:10:41 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20031221051041.GC12969@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] DIFF 2.6.0-pa3 suckyio USB support
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi all,
I finally figured out why suckyio USB was broken...lots of little things.
I still can't start X11 but it's likely some other issue (.config
file options likely - I'll post a seperate mail on that)

Diff is at:
	ftp://ftp.parisc-linux.org/patches/diff-2.6.0-suckyio-03

I don't have time to testing this on all variants (a500 and c3k 64-bit).
Please test, comment, and commit if it's looking good. I'll be around
a bit but not really available to commit a final version until after
christmas.

Comments on PCI Config space, diffstat, and comments on the diff follow.

FYA, the final problem was writes to PCI Configuration space.
PCI is by nature a 32-bit bus and byte writes to config space seems
to be broken. I'd like to blame suckyio for this but not sure I can.
It might be broken for all systems with LBA. Or maybe my proto-C3K
(v2.1 Elroys) is just broken. And I just sent my only other production
C3000 to someone who is having a very happy christmas...
Anyway, using 32-bit writes got everything working and seems safer.

grundler <514>diffstat ~/diff-2.6.0-suckyio-03 
 Makefile                         |    2 
 arch/parisc/kernel/firmware.c    |   63 +++++++++-
 arch/parisc/kernel/inventory.c   |   14 --
 drivers/net/tulip/media.c        |   10 +
 drivers/parisc/Kconfig           |    3 
 drivers/parisc/iosapic.c         |  154 ++++++++++++--------------
 drivers/parisc/iosapic_private.h |   20 +--
 drivers/parisc/sba_iommu.c       |   15 ++
 drivers/parisc/superio.c         |  231 +++++++++++++++++++--------------------
 include/asm-parisc/pci.h         |    1 
 include/asm-parisc/pdc.h         |    6 -
 include/asm-parisc/superio.h     |   42 ++++---
 12 files changed, 313 insertions(+), 248 deletions(-)

Here's a summary of changes:
o properly document the fact that SuckyIO uses INTD of the USB device
  to get the interrupt routine for "Legacy IO" devices.
  Restructured the hacks in iosapic_fixup_irq(), superio_fixup_irq() and
  superio_init() to make the initialization sequence a bit more obvious.

o simplify the suckyio serial_init() to use static initializers.
  Registering each port is really only three lines of code now.

o fix iosapic bug where two EIR bits where getting allocated in the
  case where two "devices" used the same iosapic IRQ line.
  Only one was actually used.
  Simple check midway down in iosapic_fixup_irq() takes care of that.

  The two functions of built-in SCSI 53c896 on C3000 exposed this bug.
  Both use INT A.
  Normally a multifuction device like 53c896 will use INT A and INT B.

o remove "vi_" prefix from iosapic vector fields.
  Code is a bit more readable now.
  (sorry - it itched really badly :^)

o moved pdc_io_reset_devices() call to sba code. It's only needed for
  SBA systems which are NOT PAT PDC. Does NOT interfere with serial
  or pdc console.

o added pdc_pci_config() accessor primitives but have not tested them.
  I thought I would need them but don't (yet). Left them in place
  in case someone cares to convert all the cruft in lba_pci.c
  to use PDC calls instead....PAT PDC has a different PDC interface
  but I can deal with that if someone takes care of "legacy PDC"
  systems.

o added gmmio_base field and advertise MMIO resources above 4GB on
  64-bit systems. Not well tested and may want to back this out
  if it even smells like a problem.

o updated comments tulip/media.c and reduce timeout in
  tulip_select_media() to 1ms.

o updated Kconfig help for unsupported CONFIG_PCI_EPIC (V-class only)

o added copyright notice to files I've touched.


enjoy!
grant
