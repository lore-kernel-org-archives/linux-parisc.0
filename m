From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc architecture fixes for 4.14
Date: Thu, 19 Oct 2017 20:22:58 +0200
Message-ID: <20171019182258.GA8290@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Linus,

please pull three small but important fixes for the parisc architecture for kernel 4.14 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.14-3

Three small important fixes for the parisc architecture:

- Export __cmpxchg_u64() symbol on 32bit kernel too. This unbreaks building the
  kernel with ixgbe kernel module. From Guenter Roeck.

- Fix 64-bit atomic cmpxchg kernel helper function for 32-bit kernel in LWS
  code for userspace. This unbreaks e.g. the 64-bit variant of the glibc
  function __sync_fetch_and_add() with a 32-bit parisc kernel. From John
  David Anglin, tagged for backport to v3.13+.

- Detect nonsynchronous CPU-internal cr16 cycle counters more reliable. This
  avoids stalled CPU warnings by the kernel soft lockup detector. From me,
  tagged for backport to v4.13+.

Thanks,
Helge

----------------------------------------------------------------
Guenter Roeck (1):
      parisc: Export __cmpxchg_u64 unconditionally

Helge Deller (1):
      parisc: Fix detection of nonsynchronous cr16 cycle counters

John David Anglin (1):
      parisc: Fix double-word compare and exchange in LWS code on 32-bit kernels

 arch/parisc/kernel/parisc_ksyms.c | 2 +-
 arch/parisc/kernel/syscall.S      | 6 +++---
 arch/parisc/kernel/time.c         | 5 ++++-
 3 files changed, 8 insertions(+), 5 deletions(-)
