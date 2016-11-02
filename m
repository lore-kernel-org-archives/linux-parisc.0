From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc architecture fixes and updates for 4.9-rc3
Date: Wed, 2 Nov 2016 23:36:06 +0100
Message-ID: <20161102223606.GA24415@ls3530>
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

Please pull some updates and fixes for the parisc architecture for v4.9-rc3 from
  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.9-3

The first three patches are trivial and add some required KERN_CONT, ignore the new
pkey syscalls on parisc and use the LINUX_GATEWAY_ADDR define instead of hardcoded
values.

The two patches from Dave Anglin are important. The first one avoids trashing
the sr2 and sr3 space registers in the Light-weight syscall path. Especially
the usage of sr3 is critical since it may get trashed by the interrupt handler.
The second patch is even more important and tagged for stable series. It
protects one critical section in the syscall entry path by disabling local
interrupts. Without disabling interrupts, the sr7 space register may not be in
sync with the current stack setup and thus an incoming hardware interrupt may
destroy memory in random userspace areas. 

Thanks,
Helge
----------------------------------------------------------------
Helge Deller (3):
      parisc: use KERN_CONT when printing device inventory
      parisc: Use LINUX_GATEWAY_ADDR define instead of hardcoded value
      parisc: Ignore the pkey system calls for now

John David Anglin (2):
      parisc: Avoid trashing sr2 and sr3 in LWS code
      parisc: Ensure consistent state when switching to kernel stack at syscall entry

 arch/parisc/include/uapi/asm/unistd.h |  4 ++-
 arch/parisc/kernel/drivers.c          |  6 ++--
 arch/parisc/kernel/syscall.S          | 66 ++++++++++++++++++-----------------
 3 files changed, 40 insertions(+), 36 deletions(-)
