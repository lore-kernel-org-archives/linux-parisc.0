From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc late fix for v3.17
Date: Thu, 2 Oct 2014 20:39:03 +0200
Message-ID: <20141002183903.GA1250@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Linus,

can you please pull 
  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-3.17-8

to fetch one late but trivial patch to fix the serial console on parisc
machines which got broken during the 3.17 release cycle?

Thanks,
Helge

Changelog:
Fix serial console for machines with serial port on superio chip

----------------------------------------------------------------
Helge Deller (1):
      parisc: Fix serial console for machines with serial port on superio chip

 drivers/parisc/superio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
