From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc architecture fix for v4.11
Date: Mon, 17 Apr 2017 22:15:41 +0200
Message-ID: <20170417201541.GA1292@p100.box>
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

please pull one important fix for the parisc architecture for kernel 4.11 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.11-5

One patch which fixes get_user() for 64-bit values on 32-bit kernels. Up
to now we lost the upper 32-bits of the returned 64-bit value.

Thanks,
Helge

----------------------------------------------------------------
Helge Deller (1):
      parisc: Fix get_user() for 64-bit value on 32-bit kernel

 arch/parisc/include/asm/uaccess.h | 86 +++++++++++++++++++++++++--------------
 1 file changed, 55 insertions(+), 31 deletions(-)
