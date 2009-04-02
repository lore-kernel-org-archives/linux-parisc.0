From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [git patches] rtc{,-parisc} patches for 2.6.30
Date: Thu, 2 Apr 2009 15:03:54 +0000
Message-ID: <20090402150354.GA2220@hera.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Geert.Uytterhoeven@sonycom.com, a.zummo@towertech.it,
	David.Woodhouse@intel.com, benh@kernel.crashing.org, dannf@hp.com,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kyle@mcmartin.ca
To: torvalds@linux-foundation.org
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1764993AbZDBPIH@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The following changes since commit 833bb3046b6cb320e775ea2160ddca87d53260d5:
  Alexey Dobriyan (1):
        serial: fixup /proc/tty/driver/serial after proc_fops conversion

are available in the git repository at:

  master.kernel.org:/pub/scm/linux/kernel/git/kyle/rtc-parisc.git master

Geert Uytterhoeven (7):
      parisc: rtc: get_rtc_time() returns unsigned int
      parisc: rtc: platform_driver_probe() fixups
      parisc: rtc: Add missing module alias
      parisc: rtc: Rename rtc-parisc to rtc-generic
      m68k: Hook up rtc-generic
      powerpc: Hook up rtc-generic, and kill rtc-ppc
      powerpc/ps3: Add rtc-ps3

 arch/m68k/include/asm/rtc.h           |    7 ++-
 arch/m68k/kernel/time.c               |   18 ++++++
 arch/parisc/Kconfig                   |    2 +-
 arch/parisc/kernel/time.c             |    6 +-
 arch/powerpc/include/asm/ps3.h        |    3 +
 arch/powerpc/kernel/time.c            |   16 +++++
 arch/powerpc/platforms/ps3/os-area.c  |    2 +
 arch/powerpc/platforms/ps3/platform.h |    2 -
 arch/powerpc/platforms/ps3/setup.c    |    2 -
 arch/powerpc/platforms/ps3/time.c     |   26 ++++-----
 drivers/rtc/Kconfig                   |   31 +++++-----
 drivers/rtc/Makefile                  |    4 +-
 drivers/rtc/rtc-generic.c             |   84 ++++++++++++++++++++++++++
 drivers/rtc/rtc-parisc.c              |   86 ---------------------------
 drivers/rtc/rtc-ppc.c                 |   69 ----------------------
 drivers/rtc/rtc-ps3.c                 |  104 +++++++++++++++++++++++++++++++++
 16 files changed, 267 insertions(+), 195 deletions(-)
 create mode 100644 drivers/rtc/rtc-generic.c
 delete mode 100644 drivers/rtc/rtc-parisc.c
 delete mode 100644 drivers/rtc/rtc-ppc.c
 create mode 100644 drivers/rtc/rtc-ps3.c
