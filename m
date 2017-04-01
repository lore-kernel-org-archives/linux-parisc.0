From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc architecture fixes for 4.11-rc5
Date: Sat, 1 Apr 2017 21:10:31 +0200
Message-ID: <20170401191031.GA18005@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Al Viro <viro@ZenIV.linux.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Linus,

Please pull three fixes for the parisc architecture for v4.11-rc5 from
  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.11-3

Al Viro reported that - in case of read faults - our copy_from_user()
implementation may claim to have copied more bytes than it actually did. In
order to fix this bug and because of the way how gcc optimizes register usage
for inline assembly in C code, we had to replace our pa_memcpy() function with
a pure assembler implementation.

While fixing the memcpy bug we noticed some other issues with our get_user()
and put_user() functions, e.g. nested faults may return wrong data. This is now
fixed by a common fixup handler for get_user/put_user in the exception handler
which additionally makes generated code smaller and faster.

The third patch is a trivial one-line fix for a patch which went in during
4.11-rc and which avoids stalled CPU warnings after power shutdown (for parisc
machines which can't plug power off themselves).

Due to the rewrite of pa_memcpy() into assembly this patch got bigger than what
I wanted to have sent at this stage.

Those patches have been running in production during the last few days on our
debian build servers without any further issues.

Thanks,
Helge

----------------------------------------------------------------
Helge Deller (3):
      parisc: Fix access fault handling in pa_memcpy()
      parisc: Clean up fixup routines for get_user()/put_user()
      parisc: Avoid stalled CPU warnings after system shutdown

 arch/parisc/include/asm/uaccess.h |  59 ++---
 arch/parisc/kernel/parisc_ksyms.c |  10 -
 arch/parisc/kernel/process.c      |   2 +
 arch/parisc/lib/Makefile          |   2 +-
 arch/parisc/lib/fixup.S           |  98 --------
 arch/parisc/lib/lusercopy.S       | 318 ++++++++++++++++++++++++++
 arch/parisc/lib/memcpy.c          | 461 +-------------------------------------
 arch/parisc/mm/fault.c            |  17 ++
 8 files changed, 375 insertions(+), 592 deletions(-)
 delete mode 100644 arch/parisc/lib/fixup.S
