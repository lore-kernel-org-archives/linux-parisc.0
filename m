From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc architecture fixes for 4.15-rc7
Date: Sun, 7 Jan 2018 17:21:23 +0100
Message-ID: <20180107162123.GA9715@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Richard Henderson <rth@twiddle.net>
To: Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Linus,

please pull a few fixes for the parisc architecture from:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.15-3

The fixes are:
- Many small fixes to show the real physical addresses of devices instead of
  hashed addresses.

- One important fix to unbreak 32-bit SMP support: We forgot to 16-byte align
  the spinlocks in the assembler code.

- Qemu support: The host will get a chance to sleep when the parisc guest is
  idle. We use the same mechanism as the power architecture by overlaying the
  "or %r10,%r10,%r10" instruction which is simply a nop on real hardware.

Thanks,
Helge

----------------------------------------------------------------
Helge Deller (6):
      parisc: Show unhashed hardware inventory
      parisc: Show initial kernel memory layout unhashed
      parisc: Show unhashed HPA of Dino chip
      parisc: Show unhashed EISA EEPROM address
      parisc: Fix alignment of pa_tlb_lock in assembly on 32-bit SMP kernel
      parisc: qemu idle sleep support

 arch/parisc/include/asm/ldcw.h |  2 ++
 arch/parisc/kernel/drivers.c   |  2 +-
 arch/parisc/kernel/entry.S     | 13 +++++++++++--
 arch/parisc/kernel/pacache.S   |  9 +++++++--
 arch/parisc/kernel/process.c   | 39 +++++++++++++++++++++++++++++++++++++++
 arch/parisc/mm/init.c          | 10 +++++-----
 drivers/parisc/dino.c          | 10 +++++-----
 drivers/parisc/eisa_eeprom.c   |  2 +-
 8 files changed, 71 insertions(+), 16 deletions(-)
