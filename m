From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc stable patches for v3.9.x
Date: Thu, 20 Jun 2013 23:54:29 +0200
Message-ID: <20130620215429.GA18879@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: stable@vger.kernel.org, linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Greg,

could you please queue up the following upstream commits (in this order)
for the next v3.9.x stable kernel?

9372450cc22d185f708e5cc3557cf991be4b7dc5 parisc: add kernel stack overflow check
200c880420a2c02a0899120ce52d801fad705b90 parisc: implement irq stacks
cd85d5514d5c4d7e78abac923fc032457d0c5091 parisc: more irq statistics in /proc/interrupts
0fc537d1d655cdae69b489dbba46ad617cfc1373 parisc: tlb flush counting fix for SMP and UP
1ab4ce762370b82870834899e49c08129d7ae271 parisc: remove the second argument of kmap_atomic()
416821d3d68164909b2cbcf398e4ba0797f5f8a2 parisc: implement irq stacks - part 2 (v2)
949451b9b19da5e998778eb78929aafc73b5c227 parisc: add rp5470 entry to machine database
d0c3be806a3fe7f4abdb0f7e7287addb55e73f35 parisc: show number of FPE and unaligned access handler calls in /proc/interrupts
b63a2bbc0b9b106a93e11952ab057e2408f2eb02 parisc: make interrupt and interruption stack allocation reentrant
d96b51ec14650b490ab98e738bcc02309396e5bc parisc: fix irq stack on UP and SMP
3f108de96ba449a8df3d7e3c053bf890fee2cb95 parisc: memory overflow, 'name' length is too short for using
ae249b5fa27f9fba25aa59664d4338efc2dd2394 parisc: fix kernel BUG at arch/parisc/include/asm/mmzone.h:50
766039022a480ede847659daaa78772bdcc598ae parisc: rename "CONFIG_PA7100" to "CONFIG_PA7000"
ea99b1adf22abd62bdcf14b1c9a0a4d3664eefd8 parisc: kernel: using strlcpy() instead of strcpy()
4edb38695d9a3cd62739f8595e21f36f0aabf4c2 parisc: parport0: fix this legacy no-device port driver!
91ea8207168793b365322be3c90a4ee9e8b03ed4 parisc: fix kernel BUG at arch/parisc/include/asm/mmzone.h:50 (part 2)
9a66d1869d90f13fbaf83dcce5b1aeec86fbc699 parisc: fix serial ports on C8000 workstation
2cc7138f4347df939ce03f313e3d87794bab36f8 parisc: provide pci_mmap_page_range() for parisc

Those backports are necessary for the parisc architecture to reach a
similiar stability and security level as upstream v3.10 will have (for
example, without the irq stack we crashed badly because of stack
overflows).

All source files touched are only used by the parisc architecture.

Thanks,
Helge

----------
diffstat:
 arch/parisc/Kconfig                   |   8 ++
 arch/parisc/Kconfig.debug             |  11 ++
 arch/parisc/Makefile                  |   2 +-
 arch/parisc/include/asm/assembly.h    |   1 -
 arch/parisc/include/asm/hardirq.h     |  38 ++++++-
 arch/parisc/include/asm/mmzone.h      |   7 +-
 arch/parisc/include/asm/pci.h         |   5 +
 arch/parisc/include/asm/processor.h   |   4 -
 arch/parisc/include/asm/thread_info.h |   2 +-
 arch/parisc/include/asm/tlbflush.h    |   2 +
 arch/parisc/kernel/cache.c            |   6 +-
 arch/parisc/kernel/drivers.c          |   2 +-
 arch/parisc/kernel/entry.S            |  60 +++++++++--
 arch/parisc/kernel/hardware.c         |   2 +
 arch/parisc/kernel/irq.c              | 198 +++++++++++++++++++++++++++++++++-
 arch/parisc/kernel/pci.c              |  27 +++++
 arch/parisc/kernel/setup.c            |   3 +-
 arch/parisc/kernel/smp.c              |  14 +--
 arch/parisc/kernel/traps.c            |   1 +
 arch/parisc/kernel/unaligned.c        |   3 +
 arch/parisc/kernel/vmlinux.lds.S      |   2 +-
 arch/parisc/mm/init.c                 |   4 +-
 drivers/parisc/iosapic.c              |  66 ++++++++++++
 drivers/parport/parport_gsc.c         |   6 +-
 drivers/parport/parport_gsc.h         |   2 +-
 drivers/tty/serial/8250/8250_gsc.c    |  10 +-
 26 files changed, 437 insertions(+), 49 deletions(-)
