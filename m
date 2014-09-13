From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc fixes for v3.17
Date: Sat, 13 Sep 2014 23:28:19 +0200
Message-ID: <20140913212819.GA15022@p100.box>
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

please pull the latest parisc architecture fixes for kernel 3.17 from 
  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-3.17-1

Most important patch is a new Light Weigth Syscall (LWS) for 8, 16, 32 and 64
bit atomic CAS operations which is required in order to be able to implement
the atomic gcc builtins on our platform.
Other than that, we wire up the seccomp, getrandom and memfd_create syscalls,
fixes a minor off-by-one bug and a wrong printk string.
 
Thanks,
Helge

----------------------------------------------------------------
Dan Carpenter (1):
      parisc: sys_hpux: NUL terminator is one past the end

Guy Martin (1):
      parisc: Implement new LWS CAS supporting 64 bit operations.

Hans Wennborg (1):
      parisc: dino: fix %d confusingly prefixed with 0x in format string

Helge Deller (1):
      parisc: Wire up seccomp, getrandom and memfd_create syscalls

 arch/parisc/Kconfig                   |  16 +++
 arch/parisc/hpux/sys_hpux.c           |   2 +-
 arch/parisc/include/asm/seccomp.h     |  16 +++
 arch/parisc/include/asm/thread_info.h |   5 +-
 arch/parisc/include/uapi/asm/unistd.h |   5 +-
 arch/parisc/kernel/ptrace.c           |   6 +
 arch/parisc/kernel/syscall.S          | 233 +++++++++++++++++++++++++++++++++-
 arch/parisc/kernel/syscall_table.S    |   3 +
 drivers/parisc/dino.c                 |   2 +-
 9 files changed, 280 insertions(+), 8 deletions(-)
 create mode 100644 arch/parisc/include/asm/seccomp.h
