From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc architecture fixes for v4.11-rc3
Date: Sat, 18 Mar 2017 17:54:40 +0100
Message-ID: <20170318165440.GA24667@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Mikulas Patocka <mpatocka@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Linus,

please pull a few fixes for the parisc architecture for kernel 4.11-rc3 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.11-2

Changes are:
- Mikulas Patocka added support for R_PARISC_SECREL32 relocations in modules
  with CONFIG_MODVERSIONS.
- Dave Anglin optimized the cache flushing for vmap ranges.
- Arvind Yadav provided a fix for a potential NULL pointer dereference in the
  parisc perf code (and some code cleanups).
- I wired up the new statx system call, fixed some compiler warnings with the
  access_ok() macro and fixed shutdown code to really halt a system at shutdown
  instead of crashing & rebooting.

Thanks,
Helge

----------------------------------------------------------------
Arvind Yadav (1):
      parisc: perf: Fix potential NULL pointer dereference

Helge Deller (3):
      parisc: Wire up statx system call
      parisc: Avoid compiler warnings with access_ok()
      parisc: Fix system shutdown halt

John David Anglin (1):
      parisc: Optimize flush_kernel_vmap_range and invalidate_kernel_vmap_range

Mikulas Patocka (1):
      parisc: support R_PARISC_SECREL32 relocation in modules

 arch/parisc/include/asm/cacheflush.h  | 23 +--------
 arch/parisc/include/asm/uaccess.h     |  3 +-
 arch/parisc/include/uapi/asm/unistd.h |  3 +-
 arch/parisc/kernel/cache.c            | 22 ++++++++
 arch/parisc/kernel/module.c           |  8 +++
 arch/parisc/kernel/perf.c             | 94 ++++++++++++++++++-----------------
 arch/parisc/kernel/process.c          |  2 +
 arch/parisc/kernel/syscall_table.S    |  1 +
 8 files changed, 88 insertions(+), 68 deletions(-)
