From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: [GIT PULL] parisc updates for the 3.3+ merge window
Date: Sat, 31 Mar 2012 08:36:18 +0100
Message-ID: <1333179378.2994.18.camel@dabdike.sthat4.btopenzone.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Parisc List <linux-parisc@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is a couple of minor updates (fixing lws futex locking and removing
some obsolete cpu_*_map calls).

The update is available here:

git://git.kernel.org/pub/scm/linux/kernel/git/jejb/parisc-2.6.git parisc-misc

The short changelog is:

John David Anglin (1):
      [PARISC] futex: Use same lock set as lws calls

Rusty Russell (1):
      [PARISC] remove references to cpu_*_map.

And the diffstat:

 arch/parisc/include/asm/futex.h |   31 +++++++++++++++++++++++++++----
 arch/parisc/kernel/smp.c        |    3 +--
 2 files changed, 28 insertions(+), 6 deletions(-)

James


