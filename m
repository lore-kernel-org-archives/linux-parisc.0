From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc architecture fixes for 4.8-rc3
Date: Sat, 20 Aug 2016 20:02:20 +0200
Message-ID: <20160820180220.GA5144@ls3530.box>
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

Please pull two fixes for the parisc architecture for kernel 4.8-rc3 from 
  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.8-2

The first patch ensures that the high-res cr16 clocksource (which was added in
kernel 4.7) gets choosen as default clocksource for parisc.

The second patch moves the #define of EREFUSED down inside errno.h and thus
unbreaks building the gccgo compiler.

Thanks,
Helge

----------------------------------------------------------------
Helge Deller (2):
      parisc: Fix automatic selection of cr16 clocksource
      parisc: Fix order of EREFUSED define in errno.h

 arch/parisc/include/uapi/asm/errno.h |  4 ++--
 arch/parisc/kernel/processor.c       |  8 --------
 arch/parisc/kernel/time.c            | 12 ------------
 3 files changed, 2 insertions(+), 22 deletions(-)
