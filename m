From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc architecture patches for v3.18
Date: Sat, 15 Nov 2014 23:00:48 +0100
Message-ID: <20141115220048.GA19278@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Linus,

please pull some patches for the parisc architecture for kernel 3.18 from 
  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-3.18-2

Changes include:
- wire up the bpf syscall
- Remove CONFIG_64BIT usage from some userspace-exported header files
- Use compat functions for msgctl, shmat, shmctl and semtimedop syscalls 

Thanks,
Helge

----------------------------------------------------------------
Helge Deller (4):
      parisc: Wire up bpf syscall
      parisc: Use BUILD_BUG() instead of undefined functions
      parisc: Use compat layer for msgctl, shmat, shmctl and semtimedop syscalls
      parisc: Avoid using CONFIG_64BIT in userspace exported headers

 arch/parisc/include/asm/uaccess.h          | 19 +++++++---------
 arch/parisc/include/uapi/asm/bitsperlong.h |  8 +------
 arch/parisc/include/uapi/asm/msgbuf.h      |  8 ++++---
 arch/parisc/include/uapi/asm/sembuf.h      |  6 +++--
 arch/parisc/include/uapi/asm/shmbuf.h      | 35 +++++++++++++-----------------
 arch/parisc/include/uapi/asm/signal.h      |  2 +-
 arch/parisc/include/uapi/asm/unistd.h      |  3 ++-
 arch/parisc/kernel/syscall_table.S         |  9 ++++----
 8 files changed, 41 insertions(+), 49 deletions(-)
