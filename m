From: Davidlohr Bueso <davidlohr@hp.com>
Subject: [PATCH 0/2] locking/rwsem: disable optimistic spinning for PA-RISC
Date: Fri,  6 Jun 2014 08:55:38 -0700
Message-ID: <1402070140-15090-1-git-send-email-davidlohr@hp.com>
Cc: mpatocka@redhat.com, torvalds@linux-foundation.org,
	jason.low2@hp.com, waiman.long@hp.com, jejb@parisc-linux.org,
	paulmck@linux.vnet.ibm.com, dave.anglin@bell.net, aswin@hp.com,
	davidlohr@hp.com, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org
To: peterz@infradead.org, mingo@kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Patch 1 adds a much needed CONFIG_RWSEM_SPIN_ON_OWNER option.
Patch 2 is a quick fix to disable optimistic spinning on PA-RISC.

Thanks!

Davidlohr Bueso (2):
  locking/rwsem: Add CONFIG_RWSEM_SPIN_ON_OWNER
  locking/rwsem: Disable optimistic spinning for PA-RISC

 include/linux/rwsem.h  | 4 ++--
 kernel/Kconfig.locks   | 4 ++++
 kernel/locking/rwsem.c | 2 +-
 3 files changed, 7 insertions(+), 3 deletions(-)

-- 
1.8.1.4

