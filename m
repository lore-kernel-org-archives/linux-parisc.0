From: Helge Deller <deller@gmx.de>
Subject: queued parisc patches on top of kernel 3.9
Date: Wed, 24 Apr 2013 00:16:11 +0200
Message-ID: <20130423221611.GA7841@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: will@willdeacon.co.uk
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hello everyone,

I've queued up a few patches which I think would be really nice to get
into kernel 3.9 (which isn't that likely since 3.9 is pretty much
closed). Nevertheless, with those patches all my machines have survived
all my tests, including hackbench, using sysrq-t and an load of > 300.

If you want to try, I suggest that you pull the "fixes-3.9-urgent" branch of:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git 

----------------------------------------------------------------
Helge Deller (2):
      parisc: increase kernel stack size to 32k
      parisc: disable -mlong-calls compiler option for kernel modules

John David Anglin (3):
      parisc: Provide __ucmpdi2 to resolve undefined references in 32 bit builds.
      parisc: Change kunmap macro to static inline function
      parisc: use spin_lock_irqsave/spin_unlock_irqrestore for PTE updates

Will Deacon (1):
      parisc: uaccess: fix compiler warnings caused by __put_user casting

 arch/parisc/Makefile                  |  6 +++--
 arch/parisc/include/asm/cacheflush.h  |  5 +++-
 arch/parisc/include/asm/pgtable.h     | 47 +++++++++++++++++++----------------
 arch/parisc/include/asm/thread_info.h |  2 +-
 arch/parisc/include/asm/uaccess.h     | 14 +++--------
 arch/parisc/kernel/cache.c            |  5 +---
 arch/parisc/kernel/parisc_ksyms.c     |  2 ++
 arch/parisc/lib/Makefile              |  3 ++-
 arch/parisc/lib/ucmpdi2.c             | 25 +++++++++++++++++++
 9 files changed, 68 insertions(+), 41 deletions(-)
 create mode 100644 arch/parisc/lib/ucmpdi2.c
