From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: do not inline pa_memcpy()
Date: Sun, 17 Nov 2013 22:03:11 +0100
Message-ID: <20131117210311.GA2980@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

gcc (4.8.x) creates wrong code when pa_memcpy() is inlined.
Especially in 32bit builds it calculates wrong return values if we
encounter a fault during execution of the memcpy.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/lib/memcpy.c b/arch/parisc/lib/memcpy.c
index b5507ec..e2285e1 100644
--- a/arch/parisc/lib/memcpy.c
+++ b/arch/parisc/lib/memcpy.c
@@ -460,7 +460,7 @@ handle_store_error:
 
 
 /* Returns 0 for success, otherwise, returns number of bytes not transferred. */
-static unsigned long pa_memcpy(void *dstp, const void *srcp, unsigned long len)
+static noinline unsigned long pa_memcpy(void *dstp, const void *srcp, unsigned long len)
 {
 	unsigned long ret, fault_addr, reference;
 	struct exception_data *d;
