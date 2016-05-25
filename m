From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc architecture updates for 4.7-rc1
Date: Wed, 25 May 2016 16:44:12 +0200
Message-ID: <20160525144412.GA1486@ls3530.dhcp.wdf.sap.corp>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Paul Moore <pmoore@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Linus,

Please pull the parisc architecture patches for the kernel 4.7 merge window from 
  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.7-1

Changes in this patch set:

- Add native high-resolution timing code for sched_clock() and other timing
  functions based on the processor internal cr16 cycle counters
- Add syscall tracepoint support
- Add regset support
- Speed up get_user() and put_user() functions
- Updated futex.h to match generic implementation - by John David Anglin
- A few smaller ftrace build fixes
- Fixed thuge-gen kernel self test to utilize architectured MAP_HUGETLB value
- Added parisc architecture to seccomp_bpf kernel self test
- Various typo fixes - by Andrea Gelmini

Thanks,
Helge

----------------------------------------------------------------
Andrea Gelmini (4):
      parisc: Fix typo in pdc.h
      parisc: Fix typo in ldcw.h
      parisc: Fix typos in eisa_eeprom.h
      parisc: Fix typo in fpudispatch.c

Helge Deller (9):
      parisc: Add syscall tracepoint support
      parisc: Simplify and speed up get_user() and put_user()
      parisc: Add 64bit get_user() and put_user() for 32bit kernel
      parisc: Add ARCH_TRACEHOOK and regset support
      parisc: Add native high-resolution sched_clock() implementation
      selftests/thuge-gen: Use platform specific MAP_HUGETLB value
      parisc: Merge ftrace C-helper and assembler functions into .text.hot section
      parisc: Use long jump to reach ftrace_return_to_handler()
      parisc: Whitespace cleanups in unistd.h

John David Anglin (1):
      parisc: Update futex.h to match generic implementation

 arch/parisc/Kconfig                           |   3 +
 arch/parisc/include/asm/cmpxchg.h             |   9 +-
 arch/parisc/include/asm/eisa_eeprom.h         |   4 +-
 arch/parisc/include/asm/ftrace.h              |   2 +
 arch/parisc/include/asm/futex.h               |  70 ++---
 arch/parisc/include/asm/ldcw.h                |   2 +-
 arch/parisc/include/asm/syscall.h             |   9 +
 arch/parisc/include/asm/thread_info.h         |   4 +-
 arch/parisc/include/asm/uaccess.h             |  91 +++----
 arch/parisc/include/uapi/asm/pdc.h            |   2 +-
 arch/parisc/include/uapi/asm/ptrace.h         |  48 ++++
 arch/parisc/include/uapi/asm/unistd.h         |  34 ++-
 arch/parisc/kernel/entry.S                    |  13 +-
 arch/parisc/kernel/ftrace.c                   |   7 +-
 arch/parisc/kernel/ptrace.c                   | 368 +++++++++++++++++++++++++-
 arch/parisc/kernel/syscall.S                  |   1 +
 arch/parisc/kernel/time.c                     |  63 ++++-
 arch/parisc/lib/bitops.c                      |   6 +-
 arch/parisc/math-emu/fpudispatch.c            |   2 +-
 tools/testing/selftests/seccomp/seccomp_bpf.c |   8 +-
 tools/testing/selftests/vm/thuge-gen.c        |   2 +
 21 files changed, 610 insertions(+), 138 deletions(-)
