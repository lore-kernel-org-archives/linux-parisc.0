Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.riverrock.org (rrc.dsl.frii.net [216.17.137.11])
	by dsl2.external.hp.com (Postfix) with ESMTP id D4DDC482A
	for <parisc-linux@parisc-linux.org>; Sun, 12 May 2002 19:53:18 -0600 (MDT)
Received: from phantom.home (phantom.riverrock.org [199.254.238.242])
	by www.riverrock.org (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id TAA03827
	for <parisc-linux@parisc-linux.org>; Sun, 12 May 2002 19:53:17 -0600
Message-Id: <m17751Z-000KV7C@phantom.home>
To: parisc-linux@parisc-linux.org
Date: Sun, 12 May 2002 19:53:17 -0600
From: Paul Bame <bame@riverrock.org>
Subject: [parisc-linux] [PATCH] arch/parisc use standard AS rule (fwd)
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Guess this guy doesn't know about parisc-linux.org
	-P

------- Forwarded Message

Date: Sun, 12 May 2002 18:42:35 -0500 (CDT)
From: Kai Germaschewski <kai-germaschewski@uiowa.edu>
X-X-Sender: kai@chaos.physics.uiowa.edu
To: Linus Torvalds <torvalds@transmeta.com>
cc: bame@debian.org
Subject: [PATCH] arch/parisc use standard AS rule


Linus,

the parisc architecture seems to be unmaintained, on of the Makefiles uses
still pre-2.4 syntax, which means that parisc won't build, and did not for 
a long time. Anyway:

The appended patch updates arch/parisc to use the Rules.make provided
assembler rules.

- --Kai

diff -Nru a/arch/parisc/lib/Makefile b/arch/parisc/lib/Makefile
- --- a/arch/parisc/lib/Makefile	Sun May 12 18:27:18 2002
+++ b/arch/parisc/lib/Makefile	Sun May 12 18:27:18 2002
@@ -2,12 +2,12 @@
 # Makefile for parisc-specific library files..
 #
 
+USE_STANDARD_AS_RULE := true
 
 L_TARGET = lib.a
- -L_OBJS	= lusercopy.o bitops.o checksum.o
 
+obj-y := lusercopy.o bitops.o checksum.o
 
- -.S.o:
- -	$(CC) -D__ASSEMBLY__ $(AFLAGS) -traditional -c $< -o $*.o
+EXTRA_AFLAGS := -traditional
 
 include $(TOPDIR)/Rules.make
diff -Nru a/arch/parisc/tools/Makefile b/arch/parisc/tools/Makefile
- --- a/arch/parisc/tools/Makefile	Sun May 12 18:27:18 2002
+++ b/arch/parisc/tools/Makefile	Sun May 12 18:27:18 2002
@@ -7,11 +7,6 @@
 #
 TARGET	:= $(TOPDIR)/include/asm-$(ARCH)/offset.h
 
- -.S.s:
- -	$(CPP) $(CFLAGS) $< -o $*.s
- -.S.o:
- -	$(CC) $(CFLAGS) -c $< -o $*.o
- -
 all: $(TARGET)
 
 $(TARGET): offset.h

------- End of Forwarded Message
