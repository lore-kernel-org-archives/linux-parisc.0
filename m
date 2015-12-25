From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc syscall restart fix for v4.4
Date: Fri, 25 Dec 2015 13:19:27 +0100
Message-ID: <20151225121927.GA6170@ls3530.box>
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

please pull one late patch for the parisc architecture for kernel v4.4 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.4-4

The architectural design of parisc always uses two instructions to call kernel
syscalls (delayed branch feature). This means that the instruction following
the branch (located in the delay slot of the branch instruction) is executed
before control passes to the branch destination.
Depending on which assembler instruction and how it is used in usersapce in
the delay slot, this sometimes made restarted syscalls like futex() and poll()
failing with -ENOSYS.

Thanks,
Helge

----------------------------------------------------------------
Helge Deller (1):
      parisc: Fix syscall restarts

 arch/parisc/kernel/signal.c | 64 ++++++++++++++++++++++++++++++++++++---------
 1 file changed, 52 insertions(+), 12 deletions(-)
