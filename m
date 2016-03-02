From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc architecture updates for v4.5
Date: Wed, 2 Mar 2016 18:24:58 +0100
Message-ID: <20160302172458.GA2489@ls3530.box>
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

please pull three patches for the parisc architecture for kernel v4.5 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.5-2

We wire up the copy_file_range syscall, fix two bugs in the parisc ptrace code
and have a trivial fix for floppy.h to clarify an expression with parentheses.

Thanks,
Helge

----------------------------------------------------------------
Helge Deller (3):
      parisc: Use parentheses around expression in floppy.h
      parisc: Fix ptrace syscall number and return value modification
      parisc: Wire up copy_file_range syscall

 arch/parisc/include/asm/floppy.h      |  2 +-
 arch/parisc/include/uapi/asm/unistd.h |  3 ++-
 arch/parisc/kernel/ptrace.c           | 16 +++++++++++-----
 arch/parisc/kernel/syscall.S          |  5 ++++-
 arch/parisc/kernel/syscall_table.S    |  1 +
 5 files changed, 19 insertions(+), 8 deletions(-)
