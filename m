From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc architecture updates for v4.4
Date: Mon, 9 Nov 2015 15:50:05 +0100
Message-ID: <20151109145005.GA12624@ls3530.box>
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

please pull latest patches for the parisc architecture for kernel v4.4 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.4-1

We have two patches in here:

1. The parisc uapi headers have been screwed up since quite some time. This
patch fixes some bugs (e.g. endianess not respected in compat_semid64_ds) and
cleans them up (e.g. uid_t was used instead of __kernel_uid_t) so that they can
be used by userspace again. This patch has been reviewed by Arnd Bergmann and
is scheduled for stable kernel series.

2. Drop the hpux_stat64 struct from stat.h, we do not support HP-UX binaries
since kernel 4.0.

Thanks,
Helge

----------------------------------------------------------------
Helge Deller (2):
      parisc: Drop hpux_stat64 struct from stat.h header file
      parisc: Fixes and cleanups in kernel uapi header files

 arch/parisc/include/asm/compat.h           |  4 ++--
 arch/parisc/include/uapi/asm/ipcbuf.h      | 19 +++++++++++-------
 arch/parisc/include/uapi/asm/msgbuf.h      | 10 +++++-----
 arch/parisc/include/uapi/asm/posix_types.h |  2 ++
 arch/parisc/include/uapi/asm/sembuf.h      |  6 +++---
 arch/parisc/include/uapi/asm/shmbuf.h      |  8 ++++----
 arch/parisc/include/uapi/asm/stat.h        | 31 ------------------------------
 arch/parisc/mm/init.c                      | 16 +++++++++++++++
 8 files changed, 44 insertions(+), 52 deletions(-)
