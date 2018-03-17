From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc architecture fix for 4.16-rc6
Date: Sat, 17 Mar 2018 12:10:50 +0100
Message-ID: <20180317111050.GA30481@ls3530.fritz.box>
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

please pull one patch for the parisc architecture from:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.16-2

flush_cache_range() may be called without context, which then triggers a BUG().
This patch by Dave Anglin adds code to correctly handle this case.

Thanks,
Helge

----------------------------------------------------------------
John David Anglin (1):
      parisc: Handle case where flush_cache_range is called with no context

 arch/parisc/kernel/cache.c | 41 ++++++++++++++++++++++++++++++++---------
 1 file changed, 32 insertions(+), 9 deletions(-)
