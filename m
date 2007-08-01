From: Michal Piotrowski <michal.k.k.piotrowski@gmail.com>
Subject: [parisc-linux] [RFC][PATCH] Coding style fix
	include/asm-parisc/compat_rt_sigframe.h
Date: Wed, 01 Aug 2007 16:55:00 +0200
Message-ID: <46B09EC4.2010704__1644.91336695409$1416624640$gmane$org@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-2
To: Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <matthew@wil.cx>,
 Grant Grundler <grundler@parisc-linux.org>,
 Kyle McMartin <kyle@parisc-linux.org>,
 parisc-linux@parisc-linux.org,
 LKML <linux-kernel@vger.kernel.org>
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

Hi,

Coding style fix

Regards,
Michal

--
LOG
http://www.stardust.webpages.pl/log/

Signed-off-by: Michal Piotrowski <michal.k.k.piotrowski@gmail.com>

--- linux-mm-clean/include/asm-parisc/compat_rt_sigframe.h	2007-07-09 01:32:17.000000000 +0200
+++ linux-mm/include/asm-parisc/compat_rt_sigframe.h	2007-08-01 16:51:57.000000000 +0200
@@ -1,6 +1,6 @@
-#include<linux/compat.h>
-#include<linux/compat_siginfo.h>
-#include<asm/compat_ucontext.h>
+#include <linux/compat.h>
+#include <linux/compat_siginfo.h>
+#include <asm/compat_ucontext.h>
 
 #ifndef _ASM_PARISC_COMPAT_RT_SIGFRAME_H
 #define _ASM_PARISC_COMPAT_RT_SIGFRAME_H
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
