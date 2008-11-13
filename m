From: Helge Deller <deller@gmx.de>
Subject: [PATCH] fix cpumask build breakage on parisc
Date: Thu, 13 Nov 2008 18:55:54 +0100
Message-ID: <200811131855.55450.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
To: linux-kernel@vger.kernel.org,
	Rusty Russell <rusty@rustcorp.com.au>,
	akpm@linux-foundation.org, torvalds@linux-foundation.org,
	Kyle Mc Martin <kyle@hera.kernel.org>,
	linux-parisc@vge
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This commit:
	2d3854a37e8b767a51aba38ed6d22817b0631e33
	cpumask: introduce new API, without changing anything

introduced a build breakage on parisc.

This trivial patch fixes it.


Signed-off-by: Helge Deller <deller@gmx.de>
CC:	Rusty Russell <rusty@rustcorp.com.au>
CC:	akpm@linux-foundation.org
CC:	torvalds@linux-foundation.org
CC:	Kyle Mc Martin <kyle@hera.kernel.org>
	

--- a/arch/parisc/include/asm/smp.h
+++ b/arch/parisc/include/asm/smp.h
@@ -44,8 +44,6 @@ extern void arch_send_call_function_ipi(cpumask_t mask);
  
 #define PROC_CHANGE_PENALTY	15		/* Schedule penalty */
 
-extern unsigned long cpu_present_mask;
