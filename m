From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc fix for v3.12
Date: Sun, 27 Oct 2013 16:53:40 +0100
Message-ID: <20131027155340.GA30470@p100.box>
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

Please pull the one important fix for the parisc architecture from

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-3.12

This is a 2-line patch to save the CPU register which holds our task thread
info pointer before calling a firmware function and then to restore it again
afterwards. This is necessary because on some 64bit machines the high-order
32bits are being clobbered by the firmware call, and thus we failed to bring up
secondary CPUs (and instead crashed the kernel) in some situations e.g. if we
had more than 4GB RAM.  This patch fixes a bug which has been since ever in the
parisc linux kernel and which prevented some people to use a 64bit kernel.

Thanks,
Helge

----------------------------------------------------------------
Helge Deller (1):
      parisc: Do not crash 64bit SMP kernels on machines with >= 4GB RAM

 arch/parisc/kernel/head.S | 4 ++++
 1 file changed, 4 insertions(+)
