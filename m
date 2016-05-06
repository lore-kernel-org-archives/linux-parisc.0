From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc fix for 4.6-rc6
Date: Fri, 6 May 2016 19:15:28 +0200
Message-ID: <20160506171528.GA2520@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: "Dmitry V. Levin" <ldv@altlinux.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Linus,

Please pull one small ftrace kernel crash fix for the parisc architecture from 
  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.6-5

Patch from Dmitry V. Levin to fix a kernel crash when a straced process calls
the (invalid) syscall which is equal to value of __NR_Linux_syscalls.

Thanks,
Helge


----------------------------------------------------------------
Dmitry V. Levin (1):
      parisc: fix a bug when syscall number of tracee is __NR_Linux_syscalls

 arch/parisc/kernel/syscall.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
