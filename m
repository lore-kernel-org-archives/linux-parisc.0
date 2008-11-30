From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [git patches] parisc fixes for v2.6.28
Date: Sun, 30 Nov 2008 21:41:57 +0000
Message-ID: <20081130214157.GA27136@hera.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: akpm@linux-foundation.org, linux-parisc@vger.kernel.org
To: torvalds@linux-foundation.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The following changes since commit ed313489badef16d700f5a3be50e8fd8f8294bc8:
  Linus Torvalds (1):
        Merge master.kernel.org:/home/rmk/linux-2.6-arm

are available in the git repository at:

  master.kernel.org:/pub/scm/linux/kernel/git/kyle/parisc-2.6.git master

Geert Uytterhoeven (1):
      parisc: __kernel_time_t is always long

Helge Deller (1):
      parisc: fix kernel crash when unwinding a userspace process

Kay Sievers (1):
      parisc: struct device - replace bus_id with dev_name(), dev_set_name()

 arch/parisc/include/asm/parisc-device.h |    4 +-
 arch/parisc/include/asm/posix_types.h   |    3 +-
 arch/parisc/kernel/drivers.c            |    6 +++-
 arch/parisc/kernel/traps.c              |   43 +++++++++++++++----------------
 4 files changed, 28 insertions(+), 28 deletions(-)
