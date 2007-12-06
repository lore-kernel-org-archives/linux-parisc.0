From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [git patches] parisc fixes for 2.6.24
Date: Thu, 6 Dec 2007 20:19:28 +0000
Message-ID: <20071206201928.GA8778@hera.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: torvalds@linux-foundation.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The following changes since commit 09b56adc98e0f8a21644fcb4d20ad367c3fceb55:
  Linus Torvalds (1):
        Linux 2.6.24-rc4

are available in the git repository at:

  /pub/scm/linux/kernel/git/kyle/parisc-2.6.git master

Kyle McMartin (5):
      Revert "[PARISC] import necessary bits of libgcc.a"
      [PARISC] timer interrupt should not be IRQ_DISABLED
      [PARISC] Update parisc-linux MAINTAINERS entries
      [PARISC] print more than one character at a time for pdc console
      [PARISC] lba_pci: pci_claim_resources disabled expansion roms

 MAINTAINERS                           |   10 +-
 arch/parisc/Makefile                  |    2 +-
 arch/parisc/kernel/firmware.c         |   88 +-
 arch/parisc/kernel/irq.c              |    2 +-
 arch/parisc/kernel/parisc_ksyms.c     |   22 +
 arch/parisc/kernel/pdc_cons.c         |   11 +-
 arch/parisc/lib/Makefile              |    2 +-
 arch/parisc/lib/libgcc/Makefile       |    4 -
 arch/parisc/lib/libgcc/__ashldi3.c    |   19 -
 arch/parisc/lib/libgcc/__ashrdi3.c    |   19 -
 arch/parisc/lib/libgcc/__clzsi2.c     |   30 -
 arch/parisc/lib/libgcc/__divdi3.c     |   23 -
 arch/parisc/lib/libgcc/__divsi3.c     |   23 -
 arch/parisc/lib/libgcc/__lshrdi3.c    |   19 -
 arch/parisc/lib/libgcc/__moddi3.c     |   23 -
 arch/parisc/lib/libgcc/__modsi3.c     |   23 -
 arch/parisc/lib/libgcc/__muldi3.c     |   22 -
 arch/parisc/lib/libgcc/__udivdi3.c    |    7 -
 arch/parisc/lib/libgcc/__udivmoddi4.c |   31 -
 arch/parisc/lib/libgcc/__udivmodsi4.c |   31 -
 arch/parisc/lib/libgcc/__udivsi3.c    |    7 -
 arch/parisc/lib/libgcc/__umoddi3.c    |   10 -
 arch/parisc/lib/libgcc/__umodsi3.c    |   10 -
 arch/parisc/lib/libgcc/__umulsidi3.c  |   46 -
 arch/parisc/lib/libgcc/libgcc.h       |   32 -
 arch/parisc/lib/milli/Makefile        |    1 -
 arch/parisc/lib/milli/divI.S          |  254 ----
 arch/parisc/lib/milli/divU.S          |  235 ----
 arch/parisc/lib/milli/div_const.S     |  682 -----------
 arch/parisc/lib/milli/dyncall.S       |   32 -
 arch/parisc/lib/milli/milli.S         | 2071 ---------------------------------
 arch/parisc/lib/milli/milli.h         |  165 ---
 arch/parisc/lib/milli/mulI.S          |  474 --------
 arch/parisc/lib/milli/remI.S          |  185 ---
 arch/parisc/lib/milli/remU.S          |  148 ---
 drivers/parisc/lba_pci.c              |   10 +-
 include/asm-parisc/pdc.h              |    3 +-
 37 files changed, 73 insertions(+), 4703 deletions(-)
 delete mode 100644 arch/parisc/lib/libgcc/Makefile
 delete mode 100644 arch/parisc/lib/libgcc/__ashldi3.c
 delete mode 100644 arch/parisc/lib/libgcc/__ashrdi3.c
 delete mode 100644 arch/parisc/lib/libgcc/__clzsi2.c
 delete mode 100644 arch/parisc/lib/libgcc/__divdi3.c
 delete mode 100644 arch/parisc/lib/libgcc/__divsi3.c
 delete mode 100644 arch/parisc/lib/libgcc/__lshrdi3.c
 delete mode 100644 arch/parisc/lib/libgcc/__moddi3.c
 delete mode 100644 arch/parisc/lib/libgcc/__modsi3.c
 delete mode 100644 arch/parisc/lib/libgcc/__muldi3.c
 delete mode 100644 arch/parisc/lib/libgcc/__udivdi3.c
 delete mode 100644 arch/parisc/lib/libgcc/__udivmoddi4.c
 delete mode 100644 arch/parisc/lib/libgcc/__udivmodsi4.c
 delete mode 100644 arch/parisc/lib/libgcc/__udivsi3.c
 delete mode 100644 arch/parisc/lib/libgcc/__umoddi3.c
 delete mode 100644 arch/parisc/lib/libgcc/__umodsi3.c
 delete mode 100644 arch/parisc/lib/libgcc/__umulsidi3.c
 delete mode 100644 arch/parisc/lib/libgcc/libgcc.h
 delete mode 100644 arch/parisc/lib/milli/Makefile
 delete mode 100644 arch/parisc/lib/milli/divI.S
 delete mode 100644 arch/parisc/lib/milli/divU.S
 delete mode 100644 arch/parisc/lib/milli/div_const.S
 delete mode 100644 arch/parisc/lib/milli/dyncall.S
 delete mode 100644 arch/parisc/lib/milli/milli.S
 delete mode 100644 arch/parisc/lib/milli/milli.h
 delete mode 100644 arch/parisc/lib/milli/mulI.S
 delete mode 100644 arch/parisc/lib/milli/remI.S
 delete mode 100644 arch/parisc/lib/milli/remU.S
