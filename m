From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc architecture fixes for v4.13-rc3
Date: Thu, 27 Jul 2017 21:21:21 +0200
Message-ID: <20170727192121.GA14162@p100.box>
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

please pull important fixes and updates for the parisc architecture for 4.13-rc3 from

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.13-3

Changes:

The majority of lines changed are due to regenerated defconfig files.

The support for the Page Deallocation Table (PDT) which was merged in the merge
window for 4.13 contained a bug which crashes the kernel if a bad page is
reported by firmware. This is now fixed and the kernel messages will show which
memory slot holds the broken DIMM.

Commit 3a166fc2d4ef ("kbuild: handle libs-y archives separately from built-in.o
archives") broke linking the parisc kernel due to millicode symbols which can't
be reached then any longer.  This was fixed by modifying the parisc vmlinux.lds
linker script.

If the stack checker panics on stack overflow, avoid recursive panics.

Some parisc machines can't physically power off and thus instead start after
some time to flood the console by presumably detected soft lockups. Avoid this
by disabling the lockup detectors before entering the endless for-next loop.

Dave Anglin provided fixes which prevents TLB speculation on flushed pages
on PA8800/PA9000 CPUs.

Arvind Yadav sent a trivial patch to constify the attribute_group structure in
our firmware on-board-flash storage driver (pdc_stable.c).

Thanks,
Helge

----------------------------------------------------------------
Arvind Yadav (1):
      parisc: pdc_stable: constify attribute_group structures.

Helge Deller (7):
      parisc: Disable further stack checks when panic occurs during stack check
      parisc: Merge millicode routines via linker script
      parisc: regenerate defconfig files
      parisc: Fix crash when calling PDC_PAT_MEM PDT firmware function
      parisc: Add function to return DIMM slot of physical address
      parisc: Show DIMM slot number which holds broken memory module
      parisc: Suspend lockup detectors before system halt

John David Anglin (2):
      parisc: Prevent TLB speculation on flushed pages on CPUs that only support equivalent aliases
      parisc: Extend disabled preemption in copy_user_page

 arch/parisc/configs/712_defconfig           | 41 ++++++-----------------
 arch/parisc/configs/a500_defconfig          | 50 +++++++----------------------
 arch/parisc/configs/b180_defconfig          | 17 ++--------
 arch/parisc/configs/c3000_defconfig         | 38 ++++------------------
 arch/parisc/configs/c8000_defconfig         | 17 ++--------
 arch/parisc/configs/default_defconfig       | 49 +++++++---------------------
 arch/parisc/configs/generic-32bit_defconfig | 21 +-----------
 arch/parisc/configs/generic-64bit_defconfig | 48 +++++++++------------------
 arch/parisc/include/asm/pdcpat.h            | 16 ++++++++-
 arch/parisc/kernel/cache.c                  | 36 +++++++++------------
 arch/parisc/kernel/firmware.c               | 36 +++++++++++++++++++--
 arch/parisc/kernel/irq.c                    |  8 ++++-
 arch/parisc/kernel/pdt.c                    | 23 +++++++++----
 arch/parisc/kernel/process.c                |  2 ++
 arch/parisc/kernel/vmlinux.lds.S            |  2 ++
 drivers/parisc/pdc_stable.c                 |  2 +-
 16 files changed, 152 insertions(+), 254 deletions(-)
