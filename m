From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc fixes for v3.17
Date: Tue, 23 Sep 2014 21:43:34 +0200
Message-ID: <20140923194334.GA18179@p100.box>
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

please pull a few late fixes for the parisc architecture for kernel 3.17 from 
  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-3.17-7

We avoid using -mfast-indirect-calls for 64bit kernel builds to prevent
building an unbootable kernel due to latest gcc changes. In the
pdc_stable/firmware-access driver we fix a few possible stack overflows
and we now call secure_computing_strict() instead of secure_computing()
which fixes upcoming SECCOMP patches in the for-next trees.
 
Thanks,
Helge

----------------------------------------------------------------
Helge Deller (2):
      parisc: ptrace: use secure_computing_strict()
      parisc: pdc_stable.c: Avoid potential stack overflows

John David Anglin (1):
      parisc: Only use -mfast-indirect-calls option for 32-bit kernel builds

Rickard Strandqvist (1):
      parisc: pdc_stable.c: Cleaning up unnecessary use of memset in conjunction with strncpy

 arch/parisc/Makefile        |  7 ++++++-
 arch/parisc/kernel/ptrace.c |  6 ++----
 drivers/parisc/pdc_stable.c | 15 +++++++++------
 3 files changed, 17 insertions(+), 11 deletions(-)
