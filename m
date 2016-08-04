From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc architecture updates for 4.8-rc1
Date: Thu, 4 Aug 2016 22:15:05 +0200
Message-ID: <20160804201505.GA22205@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: George Spelvin <linux@sciencehorizons.net>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Linus,

Please pull some parisc architecture updates for kernel 4.8-rc1 from 
  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.8-1

Changes in this patch set:
- added an optimized hash implementation for parisc (George Spelvin)
- C99 style cleanups in iomap.c (Amitoj Kaur Chawla)
- Added breaks to switch statement in PDC function (noticed by Dan Carpenter)

Thanks,
Helge

----------------------------------------------------------------
Amitoj Kaur Chawla (1):
      parisc: Change structure intialisation to C99 style in iomap.c

George Spelvin (1):
      parisc: Add <asm/hash.h>

Helge Deller (1):
      parisc: Add break statements to pdc_pat_io_pci_cfg_read()

 arch/parisc/Kconfig            |   1 +
 arch/parisc/include/asm/hash.h | 146 +++++++++++++++++++++++++++++++++++++++++
 arch/parisc/kernel/firmware.c  |   6 +-
 arch/parisc/lib/iomap.c        |  64 +++++++++---------
 4 files changed, 182 insertions(+), 35 deletions(-)
 create mode 100644 arch/parisc/include/asm/hash.h
