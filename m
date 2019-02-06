Return-Path: <SRS0=MUrV=QN=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B50C169C4
	for <linux-parisc@archiver.kernel.org>; Wed,  6 Feb 2019 22:21:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 543EE218D9
	for <linux-parisc@archiver.kernel.org>; Wed,  6 Feb 2019 22:21:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725981AbfBFWVX (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Wed, 6 Feb 2019 17:21:23 -0500
Received: from mout.gmx.net ([212.227.17.21]:45317 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725928AbfBFWVW (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 6 Feb 2019 17:21:22 -0500
Received: from ls3530.dellerweb.de ([92.116.131.128]) by mail.gmx.com
 (mrgmx103 [212.227.17.168]) with ESMTPSA (Nemesis) id
 0MPUFR-1gmobA40sT-004mtS; Wed, 06 Feb 2019 23:21:14 +0100
Date:   Wed, 6 Feb 2019 23:21:10 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Add assembly implementations for strlen, strcpy,
 strncpy and strcat
Message-ID: <20190206222110.GA19527@ls3530.dellerweb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Provags-ID: V03:K1:Dg1FogALqesGXwlpbViE/Yw2Vs79rTNV1U+ibgcaRbrYzQmMHHt
 LNLOb6cEA9yCy1GI607pSKPF1pabTAfavuVQ0Ue46m+9KUdeK48KFwgKlHZmAIGnBvykdJp
 DV6xcolSmMf8NOvT87X5S5ABssPW+Xc8GtxVsS6py/EgwGx/fEe9NDpqLNMEXr7YStDJA/J
 lqkhBwEdK8rXxzfo0+yLA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mRoY7x3Jo/I=:4gAMR90343orIyGv2bmiG9
 n6r9rTImWWHAXwb/5N2Su40wgIQcTSoT3IQoa7jwwAjxBOIBSAG0o048k6U2WePh7H6I8HhRW
 zxgHjfkxjU0S/TaRnFYePAtk3tuFK1i6oBDa2Uf3lzgrf6PQ0XPRYdiLgoZmBiMsjvXtitswO
 NcwjysOOhnzdJwEySfQwdgE+vu50UBIoZvsSSvY0JFbJokyHTl57fq68KITjUmZz/J7EGOw8J
 ZMUTM8DFrC+dESQfrVuOfO6Golvb+1AQdOTT87acD2In048qr2XpVpyEwRCJkBpY1SCKvoWzn
 DiKR2ZeCRyO1MykYbTLlrvTdqkPWbOFe7fqQ2wCYf1XfOGl2XwP6t1bdfcLWeg4CvIMwNiT+o
 lW3Ks2ceNZWwAYHQJSKLdOEQguRzO5aPWsrPUvKNN/iqGJlskfOYdXfv3FKF7IWGx0Q3F4HlA
 qtv9Gy65FxWocQGmRFfscxi0ftPcHWuuBG14lusYcfYfR1B5g5nCK+yTG3e4uIoG8fhtV0AZW
 aLDGchDYPqrrqC0ATGQt+7T5b4lpdub9pIwy/81zV+XChd4OO4e2KROhLhCr/fWEZLTPbNRpW
 Lp+jNx8ThRzkMlN9xZ7q1mUbwZxkMXt6xb4RLi15XyghqyZrKAqK2x1f6JUqCmadiHWWzafi5
 Dx/K3zwbXNdCF6MgTrwPjF/Z3bacIFwakeCuSPFhiu8NgcBGBl84pGJGzMEwvrgv/R9Yvs5k3
 v8TAaCSQKQwamT006ZYUHtjWaDjyr+SEbur3bxIpnGVq1OoJ+5ESEYAp3Xu1qK58Xdjq50W03
 VFnV69LFcY48JWjfavEAg2/NoJj5sEmq+36uBA08RclMhF98QWcP8U66KAlyrgAq5ZNPtOwTV
 BA2kKd2DFPuHF2qN2Bqi4VSggLn1xx7ruh5nxaIbbrrJf7InJdZgVYhDV9589A
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Add performance-optimized versions of the strlen, strcpy, strncpy and
strcat string functions.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/string.h b/arch/parisc/include/asm/string.h
index f6e1132f4e35..62a9be5e55b2 100644
--- a/arch/parisc/include/asm/string.h
+++ b/arch/parisc/include/asm/string.h
@@ -8,4 +8,16 @@ extern void * memset(void *, int, size_t);
 #define __HAVE_ARCH_MEMCPY
 void * memcpy(void * dest,const void *src,size_t count);
 
+#define __HAVE_ARCH_STRLEN
+extern size_t strlen(const char *s);
+
+#define __HAVE_ARCH_STRCPY
+extern char *strcpy(char *dest, const char *src);
+
+#define __HAVE_ARCH_STRNCPY
+extern char *strncpy(char *dest, const char *src, size_t count);
+
+#define __HAVE_ARCH_STRCAT
+extern char *strcat(char *dest, const char *src);
+
 #endif
diff --git a/arch/parisc/kernel/parisc_ksyms.c b/arch/parisc/kernel/parisc_ksyms.c
index 7baa2265d439..9a72823e939c 100644
--- a/arch/parisc/kernel/parisc_ksyms.c
+++ b/arch/parisc/kernel/parisc_ksyms.c
@@ -30,6 +30,10 @@
 
 #include <linux/string.h>
 EXPORT_SYMBOL(memset);
+EXPORT_SYMBOL(strlen);
+EXPORT_SYMBOL(strcpy);
+EXPORT_SYMBOL(strncpy);
+EXPORT_SYMBOL(strcat);
 
 #include <linux/atomic.h>
 EXPORT_SYMBOL(__xchg8);
diff --git a/arch/parisc/lib/Makefile b/arch/parisc/lib/Makefile
index f2dac4d73b1b..c2d266358358 100644
--- a/arch/parisc/lib/Makefile
+++ b/arch/parisc/lib/Makefile
@@ -3,6 +3,6 @@
 #
 
 lib-y	:= lusercopy.o bitops.o checksum.o io.o memset.o memcpy.o \
-	   ucmpdi2.o delay.o
+	   ucmpdi2.o delay.o string.o
 
 obj-y	:= iomap.o
diff --git a/arch/parisc/lib/string.S b/arch/parisc/lib/string.S
new file mode 100644
index 000000000000..35b555b11c76
--- /dev/null
+++ b/arch/parisc/lib/string.S
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *    PA-RISC assembly string functions
+ *
+ *    Copyright (C) 2019 Helge Deller <deller@gmx.de>
+ */
+
+#include <asm/assembly.h>
+#include <linux/linkage.h>
+
+	.text
+	.level LEVEL
+
+	t0 = r20
+	t1 = r21
+	t2 = r22
+
+	.align 16
+ENTRY_CFI(strlen)
+	or,COND(<>) arg0,r0,ret0
+	b,l,n	.Lstrlen_null_ptr,r0
+	depwi	0,31,2,ret0
+	cmpb,COND(<>) arg0,ret0,.Lstrlen_not_aligned
+	ldw,ma	4(ret0),t0
+	cmpib,tr 0,r0,.Lstrlen_loop
+	uxor,nbz r0,t0,r0
+.Lstrlen_not_aligned:
+	uaddcm	arg0,ret0,t1
+	shladd	t1,3,r0,t1
+	mtsar	t1
+	depwi	-1,%sar,32,t0
+	uxor,nbz r0,t0,r0
+.Lstrlen_loop:
+	b,l,n	.Lstrlen_end_loop,r0
+	ldw,ma	4(ret0),t0
+	cmpib,tr 0,r0,.Lstrlen_loop
+	uxor,nbz r0,t0,r0
+.Lstrlen_end_loop:
+	extrw,u,<> t0,7,8,r0
+	addib,tr,n -3,ret0,.Lstrlen_out
+	extrw,u,<> t0,15,8,r0
+	addib,tr,n -2,ret0,.Lstrlen_out
+	extrw,u,<> t0,23,8,r0
+	addi	-1,ret0,ret0
+.Lstrlen_out:
+	bv r0(rp)
+	uaddcm ret0,arg0,ret0
+.Lstrlen_null_ptr:
+	bv,n r0(rp)
+ENDPROC_CFI(strlen)
+
+
+	.align 16
+ENTRY_CFI(strcpy)
+	ldb	0(arg1),t0
+	stb	t0,0(arg0)
+	ldo	0(arg0),ret0
+	ldo	1(arg1),t1
+	cmpb,=	r0,t0,2f
+	ldo	1(arg0),t2
+1:	ldb	0(t1),arg1
+	stb	arg1,0(t2)
+	ldo	1(t1),t1
+	cmpb,<> r0,arg1,1b
+	ldo	1(t2),t2
+2:	bv,n	r0(rp)
+ENDPROC_CFI(strcpy)
+
+
+	.align 16
+ENTRY_CFI(strncpy)
+	ldb	0(arg1),t0
+	stb	t0,0(arg0)
+	ldo	1(arg1),t1
+	ldo	0(arg0),ret0
+	cmpb,=	r0,t0,2f
+	ldo	1(arg0),arg1
+1:	ldo	-1(arg2),arg2
+	cmpb,COND(=),n r0,arg2,2f
+	ldb	0(t1),arg0
+	stb	arg0,0(arg1)
+	ldo	1(t1),t1
+	cmpb,<> r0,arg0,1b
+	ldo	1(arg1),arg1
+2:	bv,n	r0(rp)
+ENDPROC_CFI(strncpy)
+
+
+	.align 16
+ENTRY_CFI(strcat)
+	ldb	0(arg0),t0
+	cmpb,=	t0,r0,2f
+	ldo	0(arg0),ret0
+	ldo	1(arg0),arg0
+1:	ldb	0(arg0),t1
+	cmpb,<>,n r0,t1,1b
+	ldo	1(arg0),arg0
+2:	ldb	0(arg1),t2
+	stb	t2,0(arg0)
+	ldo	1(arg0),arg0
+	ldb	0(arg1),t0
+	cmpb,<>	r0,t0,2b
+	ldo	1(arg1),arg1
+	bv,n	r0(rp)
+ENDPROC_CFI(strcat)
+
+	.end
