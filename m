Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6FF26482A
	for <parisc-linux@parisc-linux.org>; Fri,  1 Feb 2002 23:34:18 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id ajzflaaa for parisc-linux@parisc-linux.org; Fri, 1 Feb 2002 23:34:09 -0700
Date: Fri, 1 Feb 2002 22:34:08 -0800
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20020202063408.GA604@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Proposed change to arch/parisc/Makefile and generation of offset.h
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

I'd like to check this change in to change how we clean up and
regenerate include/asm-parisc/offset.h. This will let us ship a working
offset.h in our kernel-headers package to be used by glibc builds, and
will also allow things like gdb to build.

(basically, the problem right now is that offset.h is removed after a
'make clean')

With this change, 'make dep' will regenerate the offset.h and allow the
kernel dependency mechanism to kick in. 'make mrproper' will remove the
offset.h file, but 'make clean' will not.

comments?

randolph

Index: arch/parisc/Makefile
===================================================================
RCS file: /var/cvs/linux/arch/parisc/Makefile,v
retrieving revision 1.28
diff -u -p -r1.28 Makefile
--- arch/parisc/Makefile	2001/07/14 04:53:24	1.28
+++ arch/parisc/Makefile	2002/02/02 06:31:54
@@ -32,6 +32,7 @@ CROSS_COMPILE := hppa-linux-
 endif
 endif
 
+OFFSET_H := $(TOPDIR)/include/asm-parisc/offset.h
 FINAL_LD=$(CROSS_COMPILE)ld --warn-common --warn-section-align 
 
 CPP=$(CC) -E
@@ -79,7 +80,7 @@ SUBDIRS := $(SUBDIRS) $(addprefix arch/p
 CORE_FILES :=  $(addprefix arch/parisc/, kernel/pdc_cons.o kernel/process.o \
 	lib/lib.a mm/mm.o kernel/kernel.o hpux/hpux.o) \
 	$(CORE_FILES) arch/parisc/kernel/init_task.o
-CLEAN_FILES := $(CLEAN_FILES) arch/parisc/tools/offset.[hs] include/asm-parisc/offset.h*
+CLEAN_FILES := $(CLEAN_FILES) arch/parisc/tools/offset.[hs] 
 
 ifdef CONFIG_PARISC64
 HEAD := arch/parisc/kernel/head64.o
@@ -122,8 +123,14 @@ compressed: zImage
 
 install: 
 
+archmrproper:
+	rm -f $(OFFSET_H)
+
 archclean:
 
-archmrproper:
+archdep: $(OFFSET_H)
+
+$(OFFSET_H): include/linux/version.h
+	$(MAKE) -C $(TOPDIR)/arch/$(ARCH)/tools all
 
-archdep:
+.PHONY: archdep $(OFFSET_H)

-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
