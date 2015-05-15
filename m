From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc fixes for v4.1
Date: Fri, 15 May 2015 19:13:11 +0200
Message-ID: <20150515171311.GA5100@ls3530.box>
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

please pull the latest fixes for the parisc architecture for v4.1-rc4 from:

  http://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.1-2

One important patch which fixes crashes due to stack randomization on
architectures where the stack grows upwards (currently parisc and metag only).
This bug went unnoticed on parisc since kernel 3.14 where the flexible mmap
memory layout support was added by commit 9dabf60. The changes in fs/exec.c are
inside an #ifdef CONFIG_STACK_GROWSUP section and will not affect other
platforms.
The other two patches rename args of the kthread_arg() function and fixes a
printk output.

Thanks,
Helge

----------------------------------------------------------------
Alex Dowad (1):
      parisc: copy_thread(): rename 'arg' argument to 'kthread_arg'

Helge Deller (1):
      parisc,metag: Fix crashes due to stack randomization on stack-grows-upwards architectures

Scott Wood (1):
      parisc: %pf is only for function pointers

 arch/parisc/include/asm/elf.h   |  4 ++++
 arch/parisc/kernel/process.c    | 10 ++++++----
 arch/parisc/kernel/sys_parisc.c |  3 +++
 drivers/parisc/superio.c        |  2 +-
 fs/exec.c                       |  3 +++
 5 files changed, 17 insertions(+), 5 deletions(-)
