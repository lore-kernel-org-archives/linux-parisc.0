From: Huang Weiyi <weiyi.huang@gmail.com>
Subject: [PATCH] parisc: remove duplicated #include
Date: Sat, 10 Oct 2009 14:56:45 +0800
Message-ID: <1255157805-1840-1-git-send-email-weiyi.huang@gmail.com>
Cc: linux-parisc@vger.kernel.org, Huang Weiyi <weiyi.huang@gmail.com>
To: kyle@mcmartin.ca
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Remove duplicated #include('s) in
  arch/parisc/kernel/signal.c

Signed-off-by: Huang Weiyi <weiyi.huang@gmail.com>
---
 arch/parisc/kernel/signal.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/arch/parisc/kernel/signal.c b/arch/parisc/kernel/signal.c
index e8467e4..fb37ac5 100644
--- a/arch/parisc/kernel/signal.c
+++ b/arch/parisc/kernel/signal.c
@@ -26,7 +26,6 @@
 #include <linux/stddef.h>
 #include <linux/compat.h>
 #include <linux/elf.h>
-#include <linux/tracehook.h>
 #include <asm/ucontext.h>
 #include <asm/rt_sigframe.h>
 #include <asm/uaccess.h>
-- 
1.6.1.3

