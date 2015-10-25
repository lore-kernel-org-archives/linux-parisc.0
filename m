From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc architecture updates for v4.3
Date: Sun, 25 Oct 2015 12:49:34 +0100
Message-ID: <20151025114934.GA11108@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Linus,

please pull some patches for the parisc architecture for kernel v4.3 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.3-2

The most important change is that we reduce L1_CACHE_BYTES to 16 bytes, for
which a trivial patch for XPS in the network layer was needed.
Then we wire up the sys_membarrier and userfaultfd syscalls and added two other
small cleanups.

Thanks,
Helge

----------------------------------------------------------------
Axel Lin (1):
      parisc: serial/mux: Convert to uart_console_device instead of open-coded

Helge Deller (3):
      parisc: Wire up userfaultfd syscall
      parisc: reduce syslog debug output
      net/xps: Fix calculation of initial number of xps queues

John David Anglin (1):
      parisc: Change L1_CACHE_BYTES to 16

Mathieu Desnoyers (1):
      parisc: allocate sys_membarrier system call number

 arch/parisc/include/asm/cache.h       | 18 +++++-------------
 arch/parisc/include/uapi/asm/unistd.h |  4 +++-
 arch/parisc/kernel/syscall_table.S    |  2 ++
 drivers/parisc/lba_pci.c              | 12 ++++++------
 drivers/tty/serial/mux.c              |  9 ++-------
 include/linux/netdevice.h             |  4 ++--
 6 files changed, 20 insertions(+), 29 deletions(-)
