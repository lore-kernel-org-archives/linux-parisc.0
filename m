From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: [PATCH 0/4] Add all the missing syscalls
Date: Fri, 15 Apr 2011 08:55:43 -0700
Message-ID: <1302882947-3739-1-git-send-email-James.Bottomley@HansenPartnership.com>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

I've been neglecting our growing pile of missing syscalls, so this
wires up all those that have been added recently.  The only slightly
different one is fanotify_mark, which has a u64 argument which
currently requires an architecture specific compat call.

James Bottomley (4):
  parisc: wire up fanotify syscalls
  parisc: wire up clock_adjtime syscall
  parisc: wire up the fhandle syscalls
  parisc: wire up syncfs syscall

 arch/parisc/include/asm/unistd.h   |    8 +++++++-
 arch/parisc/kernel/sys_parisc32.c  |    8 ++++++++
 arch/parisc/kernel/syscall_table.S |    6 ++++++
 3 files changed, 21 insertions(+), 1 deletions(-)

-- 
1.7.2.3

