From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc architecture fixes for v4.9-rc1
Date: Tue, 11 Oct 2016 22:24:17 +0200
Message-ID: <20161011202417.GA3684@p100.box>
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

please pull some final updates and fixes for this merge window for the parisc architecture from:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.9-2

Changes include:
 
- Fix boot problems with new memblock allocator on rp3410 machine

- Increase initial kernel mapping size for 32- and 64-bit kernels, this allows
  to boot bigger kernels which have many modules built-in

- Fix kernel layout regarding __gp and move exception table into RO section

- Show trap names in crashes, use extable.h header instead of module.h

Thanks,
Helge

----------------------------------------------------------------
Helge Deller (5):
      parisc: Increase initial kernel mapping size
      parisc: Fix kernel memory layout regarding position of __gp
      parisc: Move exception table into read-only section
      parisc: Zero-initialize newly alloced memblock
      parisc: Show trap name in kernel crash

Paul Gortmaker (1):
      parisc: Migrate exception table users off module.h and onto extable.h

 arch/parisc/include/asm/pgtable.h |  6 +++---
 arch/parisc/include/asm/traps.h   |  1 +
 arch/parisc/kernel/traps.c        |  4 ++--
 arch/parisc/kernel/vmlinux.lds.S  | 14 +++++++++-----
 arch/parisc/mm/fault.c            | 19 ++++++++++++-------
 arch/parisc/mm/init.c             |  2 ++
 6 files changed, 29 insertions(+), 17 deletions(-)
