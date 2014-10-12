From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc architecture patch for v3.18
Date: Sun, 12 Oct 2014 12:08:37 +0200
Message-ID: <20141012100837.GA1553@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>,
	Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Linus,

please pull one patch for the parisc architecture for kernel 3.18 from 
  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-3.18-1

This patch intentionally breaks the ABI on PARISC Linux!

It assigns new numbers to SIGSTKFLT, SIGXCPU, SIGXFSZ and SIGSYS so that
those are below 32 and thus leaves us with 32 RT signals like other
Linux architectures (SIGRTMIN now becomes 32 instead of 37).

Even if it breaks the ABI, it doesn't seem to have any visible impact on
existing userspace applications. I was able to mix new kernel and/or
glibc without impacting normal bootup.  So, even if it breaks the ABI,
the benefits (e.g. being able to use systemd on PARISC Linux)
outperforms the minimal (if any) impact it gives.

The patch has been discussed on the parisc kernel mailing list and the
coresponding glibc patch will be committed by the parisc glibc
maintainer after this patch went into 3.18.

Some more background information about this patch is in the commit
message.

Thanks,
Helge 

----------------------------------------------------------------
Helge Deller (1):
      parisc: Reduce SIGRTMIN from 37 to 32 to behave like other Linux architectures

 arch/parisc/include/uapi/asm/signal.h | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)
