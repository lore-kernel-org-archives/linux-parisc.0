From: Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>
Subject: [RFC patch 5/9] PARISC remove -traditional
Date: Tue, 22 Apr 2008 13:24:09 -0400
Message-ID: <20080422172842.036035445@polymtl.ca>
References: <20080422172404.502954084@polymtl.ca>
Cc: Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>,
	kyle@parisc-linux.org, matthew@wil.cx, grundler@parisc-linux.org,
	linux-parisc@vger.kernel.org
To: Sam Ravnborg <sam@ravnborg.org>, akpm@linux-foundation.org,
	Ingo Molnar <mingo@elte.hu>, linux-kernel@vger.kernel.org
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1762751AbYDVRdW@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Subject: [RFC patch 5/9] Re: [PATCH] Stringify support commas
 > This is a no-no for those archs that still use -traditional.
 > > I dunno if this is a problem for you at the moment and the
 > > right fix is anyway to nuke -traditional.
 > > 
 > >     Sam

Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>
CC: Sam Ravnborg <sam@ravnborg.org>
CC: kyle@parisc-linux.org
CC: matthew@wil.cx
CC: grundler@parisc-linux.org
CC: linux-parisc@vger.kernel.org
---
 arch/parisc/kernel/Makefile |    3 ---
 1 file changed, 3 deletions(-)

Index: linux-2.6-lttng/arch/parisc/kernel/Makefile
===================================================================
--- linux-2.6-lttng.orig/arch/parisc/kernel/Makefile	2008-04-21 10:01:47.000000000 -0400
+++ linux-2.6-lttng/arch/parisc/kernel/Makefile	2008-04-21 10:01:56.000000000 -0400
@@ -4,9 +4,6 @@
 
 extra-y			:= init_task.o head.o vmlinux.lds
 
-AFLAGS_entry.o	:= -traditional
-AFLAGS_pacache.o := -traditional
-
 obj-y	     	:= cache.o pacache.o setup.o traps.o time.o irq.o \
 		   pa7300lc.o syscall.o entry.o sys_parisc.o firmware.o \
 		   ptrace.o hardware.o inventory.o drivers.o semaphore.o \

-- 
Mathieu Desnoyers
Computer Engineering Ph.D. Student, Ecole Polytechnique de Montreal
OpenPGP key fingerprint: 8CD5 52C3 8E3C 4140 715F  BA06 3F25 A8FE 3BAE 9A68
