From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc fix for v3.19
Date: Fri, 26 Dec 2014 12:56:53 +0100
Message-ID: <20141226115653.GA1050@p100.box>
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

please pull one patch for the parisc architecture for kernel 3.19 from 

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-3.19-1

This patch unbreaks the kernel compilation on parisc with gcc-4.9.

Thanks,
Helge

----------------------------------------------------------------
John David Anglin (1):
      parisc: fix out-of-register compiler error in ldcw inline assembler function

 arch/parisc/include/asm/ldcw.h | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)
