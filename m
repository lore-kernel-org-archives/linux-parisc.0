From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc architecture fixes for 4.9
Date: Thu, 8 Dec 2016 22:58:36 +0100
Message-ID: <20161208215836.GA23993@ls3530>
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

Please pull three important fixes for the parisc architecture for v4.9 from
  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.9-5

Dave provided two patches: One which purges the TLB before setting a PTE entry
and a second one which drops unnecessary TLB flushes. Both patches have been
tested for one week on the debian buildd servers and prevent random
segmentation faults. 

The patch from me fixes a crash at boot inside the TLB measuring code on SMP
machines with PA8000-PA8700 CPUs (specifically A500-44 and J5000 servers).

Thanks,
Helge

----------------------------------------------------------------
Helge Deller (1):
      parisc: Fix TLB related boot crash on SMP machines

John David Anglin (2):
      parisc: Purge TLB before setting PTE
      parisc: Remove unnecessary TLB purges from flush_dcache_page_asm and flush_icache_page_asm

 arch/parisc/include/asm/pgtable.h |  8 ++++----
 arch/parisc/kernel/cache.c        | 11 +++++++++++
 arch/parisc/kernel/pacache.S      | 22 +---------------------
 3 files changed, 16 insertions(+), 25 deletions(-)
