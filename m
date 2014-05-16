From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc updates for v3.15
Date: Fri, 16 May 2014 22:01:12 +0200
Message-ID: <20140516200112.GA1315@p100.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Linus,

please pull the latest parisc architecture fixes for kernel 3.15 from 
  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-3.15-4

There are two patches in here:

The first patch greatly improves latency and corrects the memory ordering in
our light-weight atomic locking syscall.

The second patch ratelimits printing of userspace segfaults in the same way as
it's done on other platforms. This fixes a possible DOS on parisc since it
prevents the syslog to grow too fast. For example, when the debian acl2 package
was built on our debian buildd servers, this package produced lots of gigabytes
in syslog in very short time and thus filled our harddisks, which then turned
the server nearly completely unaccessible and unresponsive.

Thanks,
Helge

----------------------------------------------------------------
Helge Deller (1):
      parisc: ratelimit userspace segfault printing

John David Anglin (1):
      parisc: Improve LWS-CAS performance

 arch/parisc/Kconfig          |  1 +
 arch/parisc/kernel/syscall.S | 12 +++++++---
 arch/parisc/kernel/traps.c   | 54 ++++++++++++++++++++------------------------
 arch/parisc/mm/fault.c       | 44 ++++++++++++++++++++++++------------
 4 files changed, 65 insertions(+), 46 deletions(-)
