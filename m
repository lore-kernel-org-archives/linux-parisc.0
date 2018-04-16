From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc trivial build fix for 4.17
Date: Mon, 16 Apr 2018 22:52:09 +0200
Message-ID: <20180416205209.GA12361@ls3530.fritz.box>
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

please pull a trivial one-line build fix for the parisc architecture from:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.17-3

* Fix build error because of missing binfmt_elf32.o file which is still
  mentioned in the Makefile.

Thanks,
Helge

----------------------------------------------------------------
Helge Deller (1):
      parisc: Fix missing binfmt_elf32.o build error

 arch/parisc/kernel/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
