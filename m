From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc fixes for v3.13
Date: Wed, 20 Nov 2013 17:21:04 +0100
Message-ID: <20131120162104.GA15157@ls3530.dhcp.wdf.sap.corp>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Linus,

Please pull the latest fixes for the parisc architecture from

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-3.13

which has the following fixes: 
- revert an access_ok() patch which broke 32bit userspace on 64bit kernels
- avoid a gcc miscompilation in two internal pa_memcpy() functions by not inlining those
- do not export the definition of SOCK_NONBLOCK via uapi header (fixes build of audit package)
- depending on the fault type we now correctly report either SIGBUS or SIGSEGV
- a small fix to not compare a size_t variable for < 0

Thanks,
Helge

----------------------------------------------------------------
Helge Deller (5):
      Revert "parisc: implement full version of access_ok()"
      parisc: do not inline pa_memcpy() internal functions
      parisc: break out SOCK_NONBLOCK define to own asm header file
      parisc: improve SIGBUS/SIGSEGV error reporting
      parisc: size_t is unsigned, so comparison size < 0 doesn't make sense.

 arch/parisc/include/asm/socket.h      | 11 +++++++++
 arch/parisc/include/asm/uaccess.h     | 46 +++--------------------------------
 arch/parisc/include/uapi/asm/socket.h | 11 +++------
 arch/parisc/lib/memcpy.c              |  6 ++---
 arch/parisc/mm/fault.c                | 22 +++++++++++++++--
 5 files changed, 41 insertions(+), 55 deletions(-)
 create mode 100644 arch/parisc/include/asm/socket.h
