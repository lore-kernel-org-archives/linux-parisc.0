From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc section mismatch fixes for 4.17-rc6
Date: Sun, 20 May 2018 21:34:14 +0200
Message-ID: <20180520193414.GA6452@ls3530.fritz.box>
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

please pull three small section mismatch fixes for the parisc architecture from:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.17-5

Three small section mismatch fixes, one of them was found by 0-day test
infrastructure.

Thanks,
Helge

----------------------------------------------------------------
Helge Deller (3):
      parisc: Move find_pa_parent_type() out of init section
      parisc: Move setup_profiling_timer() out of init section
      parisc: Move ccio_cujo20_fixup() into init section

 arch/parisc/kernel/drivers.c | 2 +-
 arch/parisc/kernel/smp.c     | 3 +--
 drivers/parisc/ccio-dma.c    | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)
