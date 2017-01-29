From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc architecture fixes for v4.10-rc6
Date: Sun, 29 Jan 2017 18:30:54 +0100
Message-ID: <20170129173054.GA1089@p100.box>
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

please pull two fixes for the parisc architecture for kernel 4.10-rc6 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.10-3

One fix to avoid usage of BITS_PER_LONG in user-space exported swab.h header
which breaks compiling qemu, and one trivial fix for printk continuation in the
parisc parport driver.

Thanks,
Helge

----------------------------------------------------------------
Helge Deller (2):
      parisc, parport_gsc: Fixes for printk continuation lines
      parisc: Don't use BITS_PER_LONG in userspace-exported swab.h header

 arch/parisc/include/asm/bitops.h           | 8 +++++++-
 arch/parisc/include/uapi/asm/bitsperlong.h | 2 --
 arch/parisc/include/uapi/asm/swab.h        | 5 +++--
 drivers/parport/parport_gsc.c              | 8 ++++----
 4 files changed, 14 insertions(+), 9 deletions(-)
