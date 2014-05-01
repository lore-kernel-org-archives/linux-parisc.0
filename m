From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc updates for v3.15
Date: Thu, 1 May 2014 20:38:22 +0200
Message-ID: <20140501183822.GA24823@p100.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Linus,

please pull the latest parisc architecture fixes for kernel 3.15 from: 
  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-3.15-2

There are two fixes in this patchset:
- Drop the architecture-specifc value for_STK_LIM_MAX to fix stack related
  problems with GNU make.
- Make mmap() behave similiar to other architectures: If a file hasn't been
  mapped yet, we can now map it at any given page-aligned address.

Thanks,
Helge

----------------------------------------------------------------
Helge Deller (2):
      parisc: Use generic uapi/asm/resource.h file
      mm,parisc: keep track of last mmap'ed address

John David Anglin (1):
      parisc: remove _STK_LIM_MAX override

 arch/parisc/Kconfig                     | 3 +++
 arch/parisc/include/uapi/asm/Kbuild     | 3 ++-
 arch/parisc/include/uapi/asm/resource.h | 7 -------
 arch/parisc/kernel/sys_parisc.c         | 8 ++++----
 include/linux/fs.h                      | 3 +++
 mm/mmap.c                               | 7 ++++++-
 6 files changed, 18 insertions(+), 13 deletions(-)
 delete mode 100644 arch/parisc/include/uapi/asm/resource.h
