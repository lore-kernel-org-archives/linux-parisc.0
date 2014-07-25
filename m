From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc fixes for v3.16
Date: Fri, 25 Jul 2014 22:11:26 +0200
Message-ID: <20140725201126.GA1381@p100.box>
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

please pull the latest parisc architecture fixes for kernel 3.16 from 
  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-3.16-6

We have two trivial patches in here. One removes the SA_RESTORER #define since
on parisc we don't have the sa_restorer field in struct sigaction, the other
patch removes an unnecessary memset(). The SA_RESTORER removal patch is
scheduled for stable trees, since without it some userspace apps don't build.
 
Thanks,
Helge

----------------------------------------------------------------
HIMANGI SARAOGI (1):
      parisc: Eliminate memset after alloc_bootmem_pages

John David Anglin (1):
      parisc: Remove SA_RESTORER define

 arch/parisc/include/uapi/asm/signal.h | 2 --
 arch/parisc/mm/init.c                 | 1 -
 2 files changed, 3 deletions(-)
