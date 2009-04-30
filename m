From: Tim Abbott <tabbott@MIT.EDU>
Subject: [PATCH 0/5] section name cleanup for parisc
Date: Thu, 30 Apr 2009 19:55:14 -0400
Message-ID: <1241135719-9286-1-git-send-email-tabbott@mit.edu>
Cc: Linux kernel mailing list <linux-kernel@vger.kernel.org>,
	Anders Kaseorg <andersk@mit.edu>,
	Waseem Daher <wdaher@mit.edu>,
	Denys Vlasenko <vda.linux@googlemail.com>,
	Jeff Arnold <jbarnold@mit.edu>,
	Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>,
	linux-parisc@vger.kernel.org, Tim Abbott <tabbott@mit.edu>
To: Sam Ravnborg <sam@ravnborg.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This patch series cleans up the section names on the parisc
architecture.  It requires the architecture-independent macro
definitions from this patch series:

<http://www.spinics.net/lists/mips/msg33499.html>

The long-term goal here is to add support for building the kernel with
-ffunction-sections -fdata-sections.  This requires renaming all the
magic section names in the kernel of the form .text.foo, .data.foo,
.bss.foo, and .rodata.foo to not have collisions with sections
generated for code like:

static int nosave = 0; /* -fdata-sections places in .data.nosave */
static void head(); /* -ffunction-sections places in .text.head */

Note that these patches have not been boot-tested (aside from testing
the analogous changes on x86), since I don't have access to the
appropriate hardware.

	-Tim Abbott


Tim Abbott (5):
  parisc: use NOSAVE_DATA macro for .data.nosave section.
  parisc: use new macro for .data.cacheline_aligned section.
  parisc: use new macros for .data.init_task.
  parisc: use new macro for .data.read_mostly section.
  parisc: convert to new generic read_mostly support.

 arch/parisc/Kconfig              |    3 +++
 arch/parisc/include/asm/cache.h  |    2 --
 arch/parisc/kernel/head.S        |    3 ++-
 arch/parisc/kernel/init_task.c   |    2 +-
 arch/parisc/kernel/vmlinux.lds.S |   36 +++++-------------------------------
 5 files changed, 11 insertions(+), 35 deletions(-)

