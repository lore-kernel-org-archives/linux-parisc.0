From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc architecture fixes for kernel v4.20
Date: Mon, 29 Oct 2018 22:04:47 +0100
Message-ID: <20181029210447.GA17383@ls3530.fritz.box>
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

please pull three small patches for the parisc architecture for 4.20-rc1 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.20-2

Three small patches:

- A boot fix for A500 machines, crash was caused by the new alternative
  patching code from this merge window (by Dave)
- Change __kernel_suseconds_t to match glibc on 64-bit parisc (by Arnd)
- Use constants instead of hard-coded numbers (by me)

Thanks,
Helge

----------------------------------------------------------------
Arnd Bergmann (1):
      parisc64: change __kernel_suseconds_t to match glibc

Helge Deller (1):
      parisc: Use LINUX_GATEWAY_SPACE constant in entry.S

John David Anglin (1):
      parisc: Fix A500 boot crash

 arch/parisc/include/uapi/asm/posix_types.h |  3 ---
 arch/parisc/kernel/entry.S                 |  5 +++--
 arch/parisc/mm/init.c                      | 10 ++++------
 3 files changed, 7 insertions(+), 11 deletions(-)
