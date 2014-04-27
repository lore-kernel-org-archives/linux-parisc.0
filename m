From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: remove _STK_LIM_MAX override
Date: Sun, 27 Apr 2014 16:20:47 -0400
Message-ID: <BLU0-SMTP61D9E1AAC7E9DE17FA604F97440@phx.gbl>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: multipart/mixed; boundary="Apple-Mail-23--583946909"
Cc: Helge Deller <deller@gmx.de>,
	James Bottomley <James.Bottomley@HansenPartnership.com>
To: linux-parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Apple-Mail-23--583946909
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

There are only a couple of architectures that override _STK_LIM_MAX to  
a non-infinity value.
This changes the stack allocation semantics in subtle ways.  For  
example, make changes its
stack allocation to the hard maximum defined by _STK_LIM_MAX.  As a  
results, threads executed
by processes running under make are allocated a stack size of  
_STK_LIM_MAX rather than
a sensible default value.  This causes various thread stress tests to  
fail when they can't muster
more than about 50 threads.

The attached change implements the default behavior used by the  
majority of architectures.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---


--Apple-Mail-23--583946909
Content-Disposition: attachment; filename="resource.d.txt"
Content-Type: text/plain; x-unix-mode=0644; name="resource.d.txt"
Content-Transfer-Encoding: 7bit

diff --git a/arch/parisc/include/uapi/asm/resource.h b/arch/parisc/include/uapi/asm/resource.h
index 8b06343..090483c 100644
--- a/arch/parisc/include/uapi/asm/resource.h
+++ b/arch/parisc/include/uapi/asm/resource.h
@@ -1,7 +1,6 @@
 #ifndef _ASM_PARISC_RESOURCE_H
 #define _ASM_PARISC_RESOURCE_H
 
-#define _STK_LIM_MAX	10 * _STK_LIM
 #include <asm-generic/resource.h>
 
 #endif

--Apple-Mail-23--583946909
Content-Type: text/plain; charset="US-ASCII"; format=flowed
Content-Transfer-Encoding: 7bit



--
John David Anglin	dave.anglin@bell.net


--Apple-Mail-23--583946909--
