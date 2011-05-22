From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: [GIT PULL] parisc updates for the 2.6.38 merge window
Date: Sun, 22 May 2011 11:07:25 +0400
Message-ID: <1306048045.4092.3.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Parisc List <linux-parisc@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

There are is one major fix in this: hopefully a final end to some of the
segfault issues on the platform caused by aggressive icache speculation.
Also, all of the currently missing syscalls on the platform are wired up

The patch is available here:

master.kernel.org:/pub/scm/linux/kernel/git/jejb/parisc-2.6.git#for-linus

The short changelog is:

James Bottomley (6):
      [PARISC] wire up syncfs syscall
      [PARISC] wire up the fhandle syscalls
      [PARISC] wire up clock_adjtime syscall
      [PARISC] wire up fanotify syscalls
      [PARISC] prevent speculative re-read on cache flush
      [PARISC] only make executable areas executable

Meelis Roos (1):
      [PARISC] fix pacache .size with new binutils

And the diffstat:

 arch/parisc/include/asm/cacheflush.h |    5 +-
 arch/parisc/include/asm/pgtable.h    |    9 +-
 arch/parisc/include/asm/unistd.h     |    8 +-
 arch/parisc/kernel/cache.c           |   13 ++-
 arch/parisc/kernel/entry.S           |    3 +
 arch/parisc/kernel/head.S            |    5 +-
 arch/parisc/kernel/module.c          |   10 ++-
 arch/parisc/kernel/pacache.S         |    6 +-
 arch/parisc/kernel/sys_parisc32.c    |    8 +
 arch/parisc/kernel/syscall_table.S   |    6 +
 arch/parisc/kernel/vmlinux.lds.S     |    1 +
 arch/parisc/mm/init.c                |  260 +++++++++++++++++++---------------
 12 files changed, 205 insertions(+), 129 deletions(-)

James


