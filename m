From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] [PATCH] [PARISC] Drop -traditional for
	arch/parisc/kernel
Date: Sun, 27 May 2007 21:49:21 +0200
Message-ID: <200705272149.21634.deller__14588.326533749$1416624371$gmane$org@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

[PARISC] Drop -traditional for arch/parisc/kernel

Follows i386 & x86_64. Clean up whitespace indenting as well.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/Makefile b/arch/parisc/kernel/Makefile
index 27827bc..cdd0aa8 100644
--- a/arch/parisc/kernel/Makefile
+++ b/arch/parisc/kernel/Makefile
@@ -2,12 +2,9 @@
 # Makefile for arch/parisc/kernel
 #
 
-extra-y			:= init_task.o head.o vmlinux.lds
+extra-y		:= init_task.o head.o vmlinux.lds
 
-AFLAGS_entry.o	:= -traditional
-AFLAGS_pacache.o := -traditional
