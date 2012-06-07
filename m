From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: [GIT PULL] parisc fixes for 3.4-rc1
Date: Thu, 07 Jun 2012 14:38:13 +0900
Message-ID: <1339047493.26595.7.camel@dabdike.int.hansenpartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Parisc List <linux-parisc@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is a set of three bug fixes for minor build breakages that got
introduced just before 3.4-rc1 was released.

The patches are here:

git://git.kernel.org/pub/scm/linux/kernel/git/jejb/parisc-2.6.git parisc-fixes

The short changelog is:

James Bottomley (3):
      fix code to find libgcc
      fix compile break in use of lib/strncopy_from_user.c
      fix missing TAINT_WARN problem

And the diffstat

 arch/parisc/Makefile           |    3 ++-
 arch/parisc/include/asm/Kbuild |    1 +
 arch/parisc/include/asm/bug.h  |    2 ++
 3 files changed, 5 insertions(+), 1 deletion(-)

Full diff is below.

James

---

diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index dbc3850..5707f1a 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -21,6 +21,7 @@ KBUILD_DEFCONFIG := default_defconfig
 
 NM		= sh $(srctree)/arch/parisc/nm
 CHECKFLAGS	+= -D__hppa__=1
+LIBGCC		= $(shell $(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name)
 
 MACHINE		:= $(shell uname -m)
 ifeq ($(MACHINE),parisc*)
@@ -79,7 +80,7 @@ kernel-y			:= mm/ kernel/ math-emu/
 kernel-$(CONFIG_HPUX)		+= hpux/
 
 core-y	+= $(addprefix arch/parisc/, $(kernel-y))
-libs-y	+= arch/parisc/lib/ `$(CC) -print-libgcc-file-name`
+libs-y	+= arch/parisc/lib/ $(LIBGCC)
 
 drivers-$(CONFIG_OPROFILE)		+= arch/parisc/oprofile/
 
diff --git a/arch/parisc/include/asm/Kbuild b/arch/parisc/include/asm/Kbuild
index 19a434f..4383707 100644
--- a/arch/parisc/include/asm/Kbuild
+++ b/arch/parisc/include/asm/Kbuild
@@ -1,3 +1,4 @@
 include include/asm-generic/Kbuild.asm
 
 header-y += pdc.h
+generic-y += word-at-a-time.h
diff --git a/arch/parisc/include/asm/bug.h b/arch/parisc/include/asm/bug.h
index 72cfdb0..62a3333 100644
--- a/arch/parisc/include/asm/bug.h
+++ b/arch/parisc/include/asm/bug.h
@@ -1,6 +1,8 @@
 #ifndef _PARISC_BUG_H
 #define _PARISC_BUG_H
 
+#include <linux/kernel.h>	/* for BUGFLAG_TAINT */
+
 /*
  * Tell the user there is some problem.
  * The offending file and line are encoded in the __bug_table section.
