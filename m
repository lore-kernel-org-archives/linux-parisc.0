Return-Path: <soete.joel@tiscali.be>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id B89374852
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 22 Dec 2003 08:05:09 -0700 (MST)
Date: Mon, 22 Dec 2003 16:05:05 +0100
Message-ID: <3FB265EC00018428@ocpmta3.freegates.net>
In-Reply-To: <20031221051041.GC12969@colo.lackof.org>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: RE: [parisc-linux] DIFF 2.6.0-pa3 suckyio USB support (+ide-cdrom
	success)
To: "Grant Grundler" <grundler@parisc-linux.org>,
	parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: 
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi Grant,

Very great that was THE patch I am waiting for.

Success fully tested on the b2k with k-2.6.0-pa4 32bit (still have to see
for 64bit), that you could can guess as it is a model near c3k. What I test
also with success :)) is the ide-cdrom wich seems to works fine (find about
5245 file on a iso-cd, tar tzslpf a 41Mb tgz file, vi some other files, ...)

Here are the additional paramters I used:
#
# ATA/ATAPI/MFM/RLL support
#
CONFIG_IDE=y
CONFIG_BLK_DEV_IDE=y

#
# Please see Documentation/ide.txt for help/info on IDE drives
#
# CONFIG_BLK_DEV_IDEDISK is not set
CONFIG_BLK_DEV_IDECD=y

#
# IDE chipset support/bugfixes
#
CONFIG_BLK_DEV_IDEPCI=y
CONFIG_BLK_DEV_IDEDMA_PCI=y
CONFIG_BLK_DEV_ADMA=y
CONFIG_BLK_DEV_IDEDMA=y

Note that I have to add generic dma support because without I got following
errors:
 CC      drivers/ide/setup-pci.o
drivers/ide/setup-pci.c: In function `ide_hwif_setup_dma':
drivers/ide/setup-pci.c:511: warning: implicit declaration of function `ide_setup_dma'
  CC      drivers/ide/ide-proc.o
[snip]
  LD      .tmp_vmlinux1
drivers/built-in.o(.text.ide_hwif_setup_dma+0x150): In function `ide_hwif_setup_dma':
: undefined reference to `ide_setup_dma'
make: *** [.tmp_vmlinux1] Error 1.

hth,
    Joel


>-- Original Message --
>Date: Sat, 20 Dec 2003 22:10:41 -0700
>From: Grant Grundler <grundler@parisc-linux.org>
>To: parisc-linux@lists.parisc-linux.org
>Subject: [parisc-linux] DIFF 2.6.0-pa3 suckyio USB support
>
>
>Hi all,
I finally figured out why suckyio USB was broken...lots of little things.
I still can't start X11 but it's likely some other issue (.config
file options likely - I'll post a seperate mail on that)

Diff is at:
	ftp://ftp.parisc-linux.org/
>atches/diff-2.6.0-suckyio-03

I don't have time to testing this on all variants (a500 and c3k 64-bit).
Please test, comment, and commit if it's looking good. I'll be around
a bit but not really available to commit a final version until after
chris
>mas.

Comments on PCI Config space, diffstat, and comments on the diff follow.

FYA, the final problem was writes to PCI Configuration space.
PCI is by nature a 32-bit bus and byte writes to config space seems
to be broken. I'd like to blame suck
>io for this but not sure I can.
It might be broken for all systems with LBA. Or maybe my proto-C3K
(v2.1 Elroys) is just broken. And I just sent my only other production
C3000 to someone who is having a very happy christmas...
Anyway, using 32-bit 
>rites got everything working and seems safer.

grundler <514>diffstat ~/diff-2.6.0-suckyio-03 
 Makefile                         |    2 
 arch/parisc/kernel/firmware.c    |   63 +++++++++-
 arch/parisc/kernel/inventory.c   |   14 --
 drivers/net/
>ulip/media.c        |   10 +
 drivers/parisc/Kconfig           |    3 
 drivers/parisc/iosapic.c         |  154 ++++++++++++--------------
 drivers/parisc/iosapic_private.h |   20 +--
 drivers/parisc/sba_iommu.c       |   15 ++
 drivers/parisc/sup
>rio.c         |  231 +++++++++++++++++++--------------------
 include/asm-parisc/pci.h         |    1 
 include/asm-parisc/pdc.h         |    6 -
 include/asm-parisc/superio.h     |   42 ++++---
 12 files changed, 313 insertions(+), 248 deletions(-
>

Here's a summary of changes:
o properly document the fact that SuckyIO uses INTD of the USB device
  to get the interrupt routine for "Legacy IO" devices.
  Restructured the hacks in iosapic_fixup_irq(), superio_fixup_irq() and
  superio_init()
>to make the initialization sequence a bit more obvious.

o simplify the suckyio serial_init() to use static initializers.
  Registering each port is really only three lines of code now.

o fix iosapic bug where two EIR bits where getting allocated
>in the
  case where two "devices" used the same iosapic IRQ line.
  Only one was actually used.
  Simple check midway down in iosapic_fixup_irq() takes care of that.

  The two functions of built-in SCSI 53c896 on C3000 exposed this bug.
  Both u
>e INT A.
  Normally a multifuction device like 53c896 will use INT A and INT B.

o remove "vi_" prefix from iosapic vector fields.
  Code is a bit more readable now.
  (sorry - it itched really badly :^)

o moved pdc_io_reset_devices() call to s
>a code. It's only needed for
  SBA systems which are NOT PAT PDC. Does NOT interfere with serial
  or pdc console.

o added pdc_pci_config() accessor primitives but have not tested them.
  I thought I would need them but don't (yet). Left them in 
>lace
  in case someone cares to convert all the cruft in lba_pci.c
  to use PDC calls instead....PAT PDC has a different PDC interface
  but I can deal with that if someone takes care of "legacy PDC"
  systems.

o added gmmio_base field and adver
>ise MMIO resources above 4GB on
  64-bit systems. Not well tested and may want to back this out
  if it even smells like a problem.

o updated comments tulip/media.c and reduce timeout in
  tulip_select_media() to 1ms.

o updated Kconfig help fo
> unsupported CONFIG_PCI_EPIC (V-class only)

o added copyright notice to files I've touched.


enjoy!
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linu
>.org/mailman/listinfo/parisc-linux



-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr
