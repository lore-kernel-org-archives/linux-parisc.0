From: Tim Abbott <tabbott@ksplice.com>
Subject: [PATCH v2 0/2] Linker script cleanup patches for parisc
Date: Fri, 18 Sep 2009 16:34:36 -0400
Message-ID: <1253306078-7066-1-git-send-email-tabbott@ksplice.com>
Cc: Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Sam Ravnborg <sam@ravnborg.org>,
	Tim Abbott <tabbott@ksplice.com>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is an updated version of the patch series I sent on September 6
cleaning up the parisc architecture's linker scripts.  It differs from
the previous version only in having been rebased on top of Linus'
current master (and is a complete rewrite of the version that got some
review back in May:
<http://linux.derkeiler.com/Mailing-Lists/Kernel/2009-05/msg00095.html>).

This cross-architecture linker script cleanup project is in
preparation for adding support for building the kernel with
-ffunction-sections -fdata-sections, which is a prerequisite for
Ksplice.

	-Tim Abbott

Tim Abbott (2):
  parisc: Clean up linker script using new linker script macros.
  parisc: Remove useless altinstructions code copied from x86.

 arch/parisc/kernel/vmlinux.lds.S |  104 ++------------------------------------
 1 files changed, 4 insertions(+), 100 deletions(-)

