From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc updates for v3.13
Date: Tue, 3 Dec 2013 23:51:35 +0100
Message-ID: <20131203225135.GA24347@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Linus,

please pull the latest parisc fixes from:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-3.13

The major changes are:
- a fix for the mmap(MAP_FIXED|MAP_SHARED) syscall to the same address which
  was already given in a previous call (fixes locale-gen on debian)
- change the memory layout of the kernel to avoid the need for the -mlong-calls
  compiler option (depends on commit 5ecbe3c - kernel/extable: fix
  address-checks for core_kernel and init areas)
- defconfig updates, e.g. use the SIL680 driver instead of the SIIMAGE driver
- add more parisc machine names to the machine database

Thanks,
Helge

----------------------------------------------------------------
Chen Gang (1):
      parisc: remove empty SERIAL_PORT_DFNS in serial.h

Helge Deller (6):
      parisc: fix mmap(MAP_FIXED|MAP_SHARED) to already mmapped address
      parisc: add some more machine names to hardware database
      parisc: use kernel_text_address() in unwind functions
      parisc: fix kernel memory layout in vmlinux.ld.S
      parisc: remove CONFIG_MLONGCALLS=y from defconfigs
      parisc: update 64bit defconfigs and use SIL680 instead of SIIMAGE driver

 arch/parisc/configs/c3000_defconfig         |   2 +-
 arch/parisc/configs/c8000_defconfig         |  36 +-------
 arch/parisc/configs/generic-64bit_defconfig |  39 +-------
 arch/parisc/include/asm/serial.h            |   2 -
 arch/parisc/kernel/hardware.c               |   7 +-
 arch/parisc/kernel/head.S                   |   6 +-
 arch/parisc/kernel/sys_parisc.c             |  25 +++--
 arch/parisc/kernel/unwind.c                 |   9 +-
 arch/parisc/kernel/vmlinux.lds.S            | 138 ++++++++++++----------------
 arch/parisc/mm/init.c                       |  19 +++-
 10 files changed, 110 insertions(+), 173 deletions(-)
