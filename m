From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc fixes for v4.2
Date: Sun, 19 Jul 2015 09:08:54 +0200
Message-ID: <20150719070854.GA3099@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Christophe Jaillet <christophe.jaillet@wanadoo.fr>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Linus,

please pull the latest fixes for the parisc architecture for v4.2 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.2-2

A memory leak fix from Christophe Jaillet which was introduced with kernel 4.0
and which leads to kernel crashes on parisc after 1-3 days.

Thanks,
Helge

----------------------------------------------------------------
Christophe Jaillet (1):
      parisc: mm: Fix a memory leak related to pmd not attached to the pgd

 arch/parisc/include/asm/pgalloc.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
