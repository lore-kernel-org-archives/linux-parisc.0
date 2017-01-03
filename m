From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc architecture updates for v4.10-rc3
Date: Tue, 3 Jan 2017 17:38:34 +0100
Message-ID: <20170103163834.GA1129@p100.box>
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

please pull three updates for the parisc architecture for kernel 4.10-rc3 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.10-2

Changes include:

- Limit usage of processor-internal cr16 clocksource to UP systems only
- Segfault info lines in syslog were too long, split those up
- Drop own TIF_RESTORE_SIGMASK flag and switch to generic code

Thanks,
Helge

----------------------------------------------------------------
Helge Deller (3):
      parisc: Mark cr16 clocksource unstable on SMP systems
      parisc: Drop TIF_RESTORE_SIGMASK and switch to generic code
      parisc: Add line-break when printing segfault info

 arch/parisc/include/asm/thread_info.h |  1 -
 arch/parisc/kernel/time.c             | 23 ++++++++++++++++++++---
 arch/parisc/mm/fault.c                |  2 +-
 3 files changed, 21 insertions(+), 5 deletions(-)
