From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc fixes for v4.0
Date: Fri, 27 Mar 2015 23:23:28 +0100
Message-ID: <20150327222328.GA4014@ls3530.box>
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

Please pull three patches for kernel-4.0 for the parisc architecture from

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.0-1

One patch from Mikulas fixes a bug on parisc by artifically incrementing the
counter in pmd_free when the kernel tries to free the preallocated pmd.
Other than that we now prevent that syscalls gets added without incrementing
__NR_Linux_syscalls and fix the initial pmd setup code if a default page size
greater than 4k has been selected. 

Thanks,
Helge


----------------------------------------------------------------
Helge Deller (2):
      parisc: Add compile-time check when adding new syscalls
      parisc: Fix pmd code to depend on PT_NLEVELS value, not on CONFIG_64BIT

Mikulas Patocka (1):
      parisc: mm: don't count preallocated pmds

 arch/parisc/include/asm/pgalloc.h  | 17 ++++++++++-------
 arch/parisc/kernel/syscall_table.S |  9 ++++++---
 2 files changed, 16 insertions(+), 10 deletions(-)
