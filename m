From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc architecture fixes for 4.7-rc2
Date: Sun, 5 Jun 2016 14:20:16 +0200
Message-ID: <20160605121956.GA25354@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Mikulas Patocka <mpatocka@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Linus,

Please pull some parisc architecture fixes for kernel 4.7-rc2 from 
  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.7-2

Changes in this patch set:

- Fix printk time stamps on SMP systems which got wrong due to a patch which
  was added during the merge window
- Fix two bugs in the stack backtrace code: Races in module unloading and
  possible invalid accesses to memory due to wrong instruction decoding
  (Mikulas Patocka)
- Fix userspace crash when syscalls access invalid unaligned userspace
  addresses. Those syscalls will now return EFAULT as expected. (tagged for
  stable kernel series)

Thanks,
Helge

----------------------------------------------------------------
Helge Deller (3):
      parisc: Fix printk time during boot
      parisc: Fix pagefault crash in unaligned __get_user() call
      parisc: Move die_if_kernel() prototype into traps.h header

Mikulas Patocka (1):
      parisc: Fix backtrace on PA-RISC

 arch/parisc/include/asm/traps.h |  2 ++
 arch/parisc/kernel/processor.c  |  5 +++--
 arch/parisc/kernel/time.c       |  5 -----
 arch/parisc/kernel/unaligned.c  | 13 ++++++++++---
 arch/parisc/kernel/unwind.c     | 22 ++++++++++++++--------
 5 files changed, 29 insertions(+), 18 deletions(-)
