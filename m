From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 173/199] arch/parisc/kernel/sys32.h: Checkpatch cleanup
Date: Sun, 23 May 2010 22:02:00 +0200
Message-ID: <1274644930-26600-16-git-send-email-andrea.gelmini@gelma.net>
References: <1274644930-26600-1-git-send-email-andrea.gelmini@gelma.net>
Cc: Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: andrea.gelmini@gelma.net
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1274644930-26600-1-git-send-email-andrea.gelmini@gelma.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

arch/parisc/kernel/sys32.h:1: ERROR: trailing whitespace
arch/parisc/kernel/sys32.h:33: WARNING: space prohibited between function name and open parenthesis '('

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/parisc/kernel/sys32.h |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/parisc/kernel/sys32.h b/arch/parisc/kernel/sys32.h
index 06c2090..4bcda8d 100644
--- a/arch/parisc/kernel/sys32.h
+++ b/arch/parisc/kernel/sys32.h
@@ -1,4 +1,4 @@
-/* 
+/*
  *    Copyright (C) 2002 Richard Hirst <rhirst at parisc-linux.org>
  *    Copyright (C) 2003 James Bottomley <jejb at parisc-linux.org>
  *    Copyright (C) 2003 Randolph Chung <tausq with parisc-linux.org>
@@ -30,7 +30,7 @@
     mm_segment_t old_fs = get_fs(); \
     set_fs(KERNEL_DS); \
     ret = syscall(args); \
-    set_fs (old_fs); \
+    set_fs(old_fs); \
 }
 
 #ifdef CONFIG_COMPAT
-- 
1.7.1.251.gf80a2

