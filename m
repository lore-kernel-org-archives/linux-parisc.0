From: Helge Deller <deller@gmx.de>
Subject: parisc: select ARCH_WANT_FRAME_POINTERS
Date: Wed, 27 Feb 2013 23:13:43 +0100
Message-ID: <20130227221343.GA2813@p100.box>
References: <20130227221137.GA2806@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130227221137.GA2806@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

commit 31a54684da3c14384168889035c54d5cb3c6d32a
Author: Helge Deller <deller@gmx.de>
Date:   Wed Feb 27 00:37:12 2013 +0100

Avoid the following warning when configuring the kernel for parisc:
warning: (LOCKDEP && FAULT_INJECTION_STACKTRACE_FILTER && LATENCYTOP && KMEMCHECK) selects FRAME_POINTER \
which has unmet direct dependencies (DEBUG_KERNEL && (CRIS || M68K || FRV || UML || AVR32 || SUPERH ||  \
BLACKFIN || MN10300) || ARCH_WANT_FRAME_POINTERS)

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 7f9b3c5..313cce5 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -5,6 +5,7 @@ config PARISC
 	select HAVE_FUNCTION_TRACER if 64BIT
 	select HAVE_FUNCTION_GRAPH_TRACER if 64BIT
 	select HAVE_FUNCTION_TRACE_MCOUNT_TEST if 64BIT
+	select ARCH_WANT_FRAME_POINTERS
 	select RTC_CLASS
 	select RTC_DRV_GENERIC
 	select INIT_ALL_POSSIBLE
