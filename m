From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc ftrace fixes for 4.6-rc4
Date: Fri, 15 Apr 2016 17:56:30 +0200
Message-ID: <20160415155630.GA17157@ls3530.dhcp.wdf.sap.corp>
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

This is (most likely) the last pull request for v4.6 for the parisc architecture.

It fixes the FTRACE feature for parisc, which is horribly broken since quite
some time and doesn't even compile.  This patch just fixes the bare minimum (it
actually removes more lines than it adds), so that the function tracer works
again on 32- and 64bit kernels.

I've queued up additional patches on top of this patch which e.g. add the
syscall tracer, but those have to wait for the merge window for v4.7.

Please pull from 
  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.6-4

Thanks,
Helge

----------------------------------------------------------------
Helge Deller (1):
      parisc: Fix ftrace function tracer

 arch/parisc/Kconfig              |   4 +-
 arch/parisc/Kconfig.debug        |   4 ++
 arch/parisc/Makefile             |   4 +-
 arch/parisc/include/asm/ftrace.h |  18 +----
 arch/parisc/kernel/Makefile      |   4 --
 arch/parisc/kernel/entry.S       |  93 ++++++++++++++++++++-----
 arch/parisc/kernel/ftrace.c      | 146 ++++++---------------------------------
 arch/parisc/kernel/head.S        |   9 +++
 8 files changed, 114 insertions(+), 168 deletions(-)
