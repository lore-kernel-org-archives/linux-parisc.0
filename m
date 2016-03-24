From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc updates for v4.6 rc1
Date: Thu, 24 Mar 2016 22:26:02 +0100
Message-ID: <20160324212602.GA5013@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Linus,

please pull the latest parisc architecture patches for rc1 from:

  http://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.6-1

This patchset adds stack usage debug info for parisc and metag (on both the
stack grows upwards), switches to the new generic realative extable search and
sort routines,  drops the long time ago removed syscalls alloc_hugepages and
free_hugepages and wires up the new preadv2 and pwritev2 syscalls.

Thanks,
Helge

----------------------------------------------------------------
Aaro Koskinen (1):
      parisc: Panic immediately when panic_on_oops

Helge Deller (4):
      parisc: Drop alloc_hugepages and free_hugepages syscalls
      parisc,metag: Implement CONFIG_DEBUG_STACK_USAGE option
      parisc: Use generic extable search and sort routines
      parisc: Wire up preadv2 and pwritev2 syscalls

 arch/parisc/Kconfig                   |  1 +
 arch/parisc/include/asm/assembly.h    |  2 +-
 arch/parisc/include/asm/uaccess.h     |  7 ++++---
 arch/parisc/include/uapi/asm/unistd.h |  8 +++++---
 arch/parisc/kernel/sys_parisc.c       | 10 ----------
 arch/parisc/kernel/syscall_table.S    |  6 ++++--
 arch/parisc/kernel/traps.c            |  5 +----
 arch/parisc/mm/fault.c                |  9 ++-------
 include/linux/sched.h                 |  8 ++++++++
 lib/Kconfig.debug                     |  2 +-
 scripts/sortextable.c                 |  1 +
 11 files changed, 28 insertions(+), 31 deletions(-)
