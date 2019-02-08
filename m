Return-Path: <SRS0=p2uU=QP=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10D9FC169C4
	for <linux-parisc@archiver.kernel.org>; Fri,  8 Feb 2019 08:12:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DE0FB21916
	for <linux-parisc@archiver.kernel.org>; Fri,  8 Feb 2019 08:12:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727273AbfBHIM1 (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Fri, 8 Feb 2019 03:12:27 -0500
Received: from mout.gmx.net ([212.227.17.20]:33247 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727231AbfBHIM1 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 8 Feb 2019 03:12:27 -0500
Received: from ls3530.dellerweb.de ([92.116.178.5]) by mail.gmx.com (mrgmx102
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0MFR2O-1gvGvG2e6m-00EMf2; Fri, 08
 Feb 2019 09:12:18 +0100
Date:   Fri, 8 Feb 2019 09:12:14 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Add assmbly implementation for memset()
Message-ID: <20190208081205.GA25730@ls3530.dellerweb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Provags-ID: V03:K1:ayW7FhaY15+NbbhOm5oYVoMGEQbritg+hdO5lB8xJOVAbsgLoKN
 KKY0MALY0bVqG4n2vuWCtKdCGr8V6Fa/sktopEPjaWNpalqM6CJtPlZrw69kgWUbkOirkXY
 RU2e50ZtS6fJiIklXawiLcJ0Z23LKCfj9bLpGcEO9AgFukMKJrsI5bKAHXEVXCEGrxPWMLY
 j8eSmACwvroSWK0vRJ8mg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lFeXYfOJ8G8=:9DeQyUsnU8hirRZPTUliUs
 n7iAZSkii8maInVqRDMCNEtluJhMsQcv6AORiuv1U4DDlp9nkpkwfQx+Y1FxXGdZhwSdXw4Jm
 QojfUJtu0kAmrmcz/jwQAp1+WTb9c9I7OykZua8qZZwFJVRRGvGSOzO+ZpXOWwlB/zELHJ7si
 3Mzn7dAan3VUEDnG6oc+9d5x15MhbLxKUbfeK2dq5KBOUaP8qPafJu3U6jdcvoyoj58sWN/86
 X5FUQkG05QBewvN1aJNeZuYa87EgTyMs6gKcQL8UNfN5wX851aDDNSMZ7sljVQYrwhrmizBZf
 6GEGt08ILu5Fvf8oIwhw77x7W8FXYz1hShpis0y2PWKcuQ/Nfp9SweTap3yFeOKvtpKMx+6fx
 +b2UxfjIheKrF9zLfz8/qp8x0zwqf2/jlL7uUkNUcTLkasmyG2ViUSt7Z+QRjaa6LOWEatlNY
 K6tnZ4vPFY9wV89r/pag1tQHJ2hXzg4BLOUXfjJ2jBRginHkEzburcfsgHpYfeVG4oggekwSY
 DGaXhTyYNGeYHWky9M1ezAK1+4V+Ya9K5y+KL/2SDlc7vLqxDralab/ryremRp78b6ChmiaP7
 AN7xnoGa5tsyoYTFi9p26U78A4RJV+KjrKrB3Ow9tySVhDltLCyTk1wQnQVlv1sepYIuzph8K
 s2O2ruvuJkdPUJ9gs6rOv7AJDADqBv3RUnUuQXAQfjS7qR7mEQ9HzJHr1fFQyn7R0xTc80V0u
 vU2vHT1FTlgtb5TwXEc11a46p2PPULk+oYCTCLPIU+WEhwVk7PdKzqn9PS/AGPGyI5L8Hyo1u
 7h26ahQlV8zlUgLe3bwK6W5IYhqc8IPO7X0qZ7t28nL2jnj2YSviaiek2NfwF31i3Dx/H9EL6
 54IPd44UWEsl/KsfLxAt7nhY7eEbsy0doHm+algYhdoHn1iHrzEQZWOtrkd2VW
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/string.h b/arch/parisc/include/asm/string.h
index 62a9be5e55b2..4a0c9dbd62fd 100644
--- a/arch/parisc/include/asm/string.h
+++ b/arch/parisc/include/asm/string.h
@@ -20,4 +20,7 @@ extern char *strncpy(char *dest, const char *src, size_t count);
 #define __HAVE_ARCH_STRCAT
 extern char *strcat(char *dest, const char *src);
 
+#define __HAVE_ARCH_MEMSET
+extern void *memset(void *, int, size_t);
+
 #endif
diff --git a/arch/parisc/lib/Makefile b/arch/parisc/lib/Makefile
index c2d266358358..ad0a73fff324 100644
--- a/arch/parisc/lib/Makefile
+++ b/arch/parisc/lib/Makefile
@@ -2,7 +2,7 @@
 # Makefile for parisc-specific library files
 #
 
-lib-y	:= lusercopy.o bitops.o checksum.o io.o memset.o memcpy.o \
+lib-y	:= lusercopy.o bitops.o checksum.o io.o memcpy.o \
 	   ucmpdi2.o delay.o string.o
 
 obj-y	:= iomap.o
diff --git a/arch/parisc/lib/memset.c b/arch/parisc/lib/memset.c
deleted file mode 100644
index 1d7929bd7642..000000000000
--- a/arch/parisc/lib/memset.c
+++ /dev/null
@@ -1,91 +0,0 @@
-/* Copyright (C) 1991, 1997 Free Software Foundation, Inc.
-   This file is part of the GNU C Library.
-
-   The GNU C Library is free software; you can redistribute it and/or
-   modify it under the terms of the GNU Lesser General Public
-   License as published by the Free Software Foundation; either
-   version 2.1 of the License, or (at your option) any later version.
-
-   The GNU C Library is distributed in the hope that it will be useful,
-   but WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-   Lesser General Public License for more details.
-
-   You should have received a copy of the GNU Lesser General Public
-   License along with the GNU C Library; if not, write to the Free
-   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
-   02111-1307 USA.  */
-
-/* Slight modifications for pa-risc linux - Paul Bame <bame@debian.org> */
-
-#include <linux/types.h>
-#include <asm/string.h>
-
-#define OPSIZ (BITS_PER_LONG/8)
-typedef unsigned long op_t;
-
-void *
-memset (void *dstpp, int sc, size_t len)
-{
-  unsigned int c = sc;
-  long int dstp = (long int) dstpp;
-
-  if (len >= 8)
-    {
-      size_t xlen;
-      op_t cccc;
-
-      cccc = (unsigned char) c;
-      cccc |= cccc << 8;
-      cccc |= cccc << 16;
-      if (OPSIZ > 4)
-	/* Do the shift in two steps to avoid warning if long has 32 bits.  */
-	cccc |= (cccc << 16) << 16;
-
-      /* There are at least some bytes to set.
-	 No need to test for LEN == 0 in this alignment loop.  */
-      while (dstp % OPSIZ != 0)
-	{
-	  ((unsigned char *) dstp)[0] = c;
-	  dstp += 1;
-	  len -= 1;
-	}
-
-      /* Write 8 `op_t' per iteration until less than 8 `op_t' remain.  */
-      xlen = len / (OPSIZ * 8);
-      while (xlen > 0)
-	{
-	  ((op_t *) dstp)[0] = cccc;
-	  ((op_t *) dstp)[1] = cccc;
-	  ((op_t *) dstp)[2] = cccc;
-	  ((op_t *) dstp)[3] = cccc;
-	  ((op_t *) dstp)[4] = cccc;
-	  ((op_t *) dstp)[5] = cccc;
-	  ((op_t *) dstp)[6] = cccc;
-	  ((op_t *) dstp)[7] = cccc;
-	  dstp += 8 * OPSIZ;
-	  xlen -= 1;
-	}
-      len %= OPSIZ * 8;
-
-      /* Write 1 `op_t' per iteration until less than OPSIZ bytes remain.  */
-      xlen = len / OPSIZ;
-      while (xlen > 0)
-	{
-	  ((op_t *) dstp)[0] = cccc;
-	  dstp += OPSIZ;
-	  xlen -= 1;
-	}
-      len %= OPSIZ;
-    }
-
-  /* Write the last few bytes.  */
-  while (len > 0)
-    {
-      ((unsigned char *) dstp)[0] = c;
-      dstp += 1;
-      len -= 1;
-    }
-
-  return dstpp;
-}
diff --git a/arch/parisc/lib/string.S b/arch/parisc/lib/string.S
index 614ba04f7b05..1521ef8484bb 100644
--- a/arch/parisc/lib/string.S
+++ b/arch/parisc/lib/string.S
@@ -104,4 +104,39 @@ ENTRY_CFI(strcat)
 	bv,n	r0(rp)
 ENDPROC_CFI(strcat)
 
+
+       .align 16
+ENTRY_CFI(memset, FRAME=0)
+	copy	arg0,ret0
+	cmpb,COND(=) r0,arg0,4f
+	copy	arg0,t2
+	cmpb,COND(=) r0,arg2,4f
+	ldo	-1(arg2),arg3
+	subi	-1,arg3,t0
+	subi	0,t0,t1
+	cmpiclr,COND(>=) 0,t1,arg2
+	ldo	-1(t1),arg2
+	extru arg2,31,2,arg0
+2:	stb	arg1,0(t2)
+	ldo	1(t2),t2
+	addib,>= -1,arg0,2b
+	ldo	-1(arg3),arg3
+	cmpiclr,COND(<=) 4,arg2,r0
+	b,l,n	4f,r0
+#ifdef CONFIG_64BIT
+	depd,*	r0,63,2,arg2
+#else
+	depw	r0,31,2,arg2
+#endif
+	ldo	1(t2),t2
+3:	stb	arg1,-1(t2)
+	stb	arg1,0(t2)
+	stb	arg1,1(t2)
+	stb	arg1,2(t2)
+	addib,COND(>) -4,arg2,3b
+	ldo	4(t2),t2
+4:	bv,n	r0(rp)
+ENDPROC_CFI(memset)
+
+        .end
 	.end
