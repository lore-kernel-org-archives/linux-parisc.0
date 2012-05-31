From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: [GIT PULL] parisc updates for the 3.4+ merge window
Date: Thu, 31 May 2012 11:57:20 +0100
Message-ID: <1338461840.3073.15.camel@dabdike.int.hansenpartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Parisc List <linux-parisc@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is a couple of updates to complete our fixes and one to fix a
compile failure caused during the merge window.  Additionally, we now
switch to the generic strncopy_from_user.

The update is available here:

git://git.kernel.org/pub/scm/linux/kernel/git/jejb/parisc-2.6.git parisc-misc

The short changelog is:

James Bottomley (3):
      [PARISC] update parisc to use generic strncpy_from_user()
      [PARISC] Fix parisc compile failure after smp: Add task_struct argument to __cpu_up()
      [PARISC] fix TLB fault path on PA2.0 narrow systems

John David Anglin (1):
      [PARISC] fix boot failure on 32-bit systems caused by branch stubs placed before .text

And the diffstat:

 arch/parisc/Kconfig               |    1 +
 arch/parisc/include/asm/smp.h     |    2 --
 arch/parisc/include/asm/uaccess.h |    5 ++---
 arch/parisc/kernel/entry.S        |   30 +++++++++++++++------------
 arch/parisc/kernel/parisc_ksyms.c |    1 -
 arch/parisc/kernel/vmlinux.lds.S  |    6 ++++--
 arch/parisc/lib/lusercopy.S       |   41 -------------------------------------
 7 files changed, 24 insertions(+), 62 deletions(-)

James


