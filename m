From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc fixes for v3.8-rc5
Date: Tue, 22 Jan 2013 22:11:08 +0100
Message-ID: <50FF006C.7070803@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: Linus <torvalds@linux-foundation.org>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	John David Anglin <dave.anglin@bell.net>,
	Linux Kernel Development <linux-kernel@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Linus,

please consider pulling the following 4 patches for 3.8-rc5 which improve
the stability of the linux kernel on the parisc architecture.

Only parisc arch-specfic files are changed.

Thanks,
Helge  


The following changes since commit d287b8750e47c1702dab0e37ac11012bb751ece0:

  Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs (2013-01-07 09:41:20 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git for-linus


----------------------------------------------------------------
John David Anglin (4):
      parisc: avoid undefined shift in cnv_float.h
      parisc: don't claim cpu irqs more than once
      parisc: improve ptrace support for gdb single-step
      parisc: sigaltstack doesn't round ss.ss_sp as required

 arch/parisc/kernel/entry.S       | 18 +++++++++++++-----
 arch/parisc/kernel/irq.c         |  6 ++++--
 arch/parisc/kernel/ptrace.c      |  2 +-
 arch/parisc/kernel/signal.c      |  4 +++-
 arch/parisc/math-emu/cnv_float.h | 11 +++++------
 5 files changed, 26 insertions(+), 15 deletions(-)

