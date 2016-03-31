From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc fixes for v4.6 rc2
Date: Thu, 31 Mar 2016 14:49:44 +0200
Message-ID: <20160331124944.GA6181@ls3530.box>
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

please pull two fixes for the parisc architecture from:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.6-2

Fix seccomp filter support and SIGSYS signals on compat kernel. Both patches
are tagged for v4.5 stable kernel. 

Thanks,
Helge

----------------------------------------------------------------
Helge Deller (2):
      parisc: Fix SIGSYS signals in compat case
      parisc: Fix and enable seccomp filter support

 arch/parisc/Kconfig               |  1 +
 arch/parisc/include/asm/compat.h  |  7 +++++++
 arch/parisc/include/asm/syscall.h | 13 +++++++++++++
 arch/parisc/kernel/ptrace.c       |  9 +++++++--
 arch/parisc/kernel/signal32.c     |  5 +++++
 arch/parisc/kernel/syscall.S      |  2 ++
 6 files changed, 35 insertions(+), 2 deletions(-)
