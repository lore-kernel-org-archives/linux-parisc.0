From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc updates for v3.15
Date: Thu, 17 Apr 2014 21:07:40 +0200
Message-ID: <20140417190740.GA1254@p100.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Linus,

please pull the latest parisc architecture fixes from: 
  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-3.15

There are two major changes in this patchset:
The major fix is that the epoll_pwait() syscall for 32bit userspace was not
using the compat wrapper on a 64bit kernel.
Secondly we changed the value of SHMLBA from 4MB to PAGE_SIZE to reflect
that we can actually mmap to any multiple of PAGE_SIZE. The only thing
which needs care is that shared mmaps need to be mapped at the same
offset inside the 4MB cache window.

Thanks,
Helge

----------------------------------------------------------------
Christoph Lameter (1):
      parisc: Replace __get_cpu_var uses for address calculation

Helge Deller (2):
      parisc: change value of SHMLBA from 0x00400000 to PAGE_SIZE
      parisc: fix epoll_pwait syscall on compat kernel

 arch/parisc/include/asm/shmparam.h |  5 ++---
 arch/parisc/kernel/cache.c         |  3 ++-
 arch/parisc/kernel/sys_parisc.c    | 14 +++++++-------
 arch/parisc/kernel/syscall_table.S |  2 +-
 arch/parisc/lib/memcpy.c           |  2 +-
 arch/parisc/mm/fault.c             |  2 +-
 6 files changed, 14 insertions(+), 14 deletions(-)
