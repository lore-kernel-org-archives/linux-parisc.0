Return-Path: <SRS0=0R8f=SI=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95023C282DC
	for <linux-parisc@archiver.kernel.org>; Sat,  6 Apr 2019 23:09:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5A71021019
	for <linux-parisc@archiver.kernel.org>; Sat,  6 Apr 2019 23:09:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="fIcFPJrg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726713AbfDFXJf (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Sat, 6 Apr 2019 19:09:35 -0400
Received: from mout.gmx.net ([212.227.15.18]:47329 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726633AbfDFXJf (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 6 Apr 2019 19:09:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1554592166;
        bh=+Zm08DoAooomgpyHGsYjUJBqHgo4LPlllKkB73n2GqM=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=fIcFPJrgi8p/e28fjTc82gL6/GXrieUWy3hGkLTX4/Ua3xK8CNRTE6MNxG1oH/2lr
         xi/GYAgef2nFh5WmJuAzgFCFDHZPGLPhV58xRlQ/BVNnIw61TyaVubWhTuEwE1N+wV
         hlVgRpM3xBcSjMZywzOHGPG/qDqCuZq+/lAB8ljw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.dellerweb.de ([92.116.164.5]) by mail.gmx.com (mrgmx002
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0LmKOI-1geOto0pBC-00ZxOc; Sun, 07
 Apr 2019 01:09:26 +0200
Date:   Sun, 7 Apr 2019 01:09:23 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: PA-Linux requires at least 32 MB RAM
Message-ID: <20190406230923.GA20080@ls3530.dellerweb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Provags-ID: V03:K1:GnbgLxJInBk+IPvdRM6jSVfFyGn3JsmSz2DuassaMMC9THgPqVT
 HZ6AkmqSEt85WVUmuoEjGn06yNu5bOvHHTLYyiKjyzKBws9svv56fUN0YM+JfTeywpJCVLd
 llP5ygyMRsUiAyhD9+c8tEA5b7oFSCPRBo3/ZvRzTIJXtCQP8KGZvrX6RazydRpSOrp+qtb
 l2Xu+vtp+EdLzrLia0BJA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MX5TVKj8So4=:+t9/uG+bT1E5wc1rxSz8Zt
 qsRT1XBEhOQjRuk4QaH06l94b3L/PWPBfkdFDSNi1/7Z9+5bWJuZdglwFlGoh3WpcvsJiT44X
 fAQetbNhC5x8qEFaVhYx3vB0EriY1fvdXn1kEzvK6NBXbHPXDpJ+fs2R6usXxfGc2CTlG4orK
 sgBPB0ULnCa302LsYTsClWw3JdNZn9vo/KK1IbdfHH2WwSR1NNDl0MW3RcWry8tKctLK5udRU
 Gm7GGSraOFwaOj5hHG6aXPG6SuEVpVPz3vdV0+LkVtfm7j8/HagJbK5gVss2dGjrbg8jpKb31
 tyZMmblQ1xx0aMrEISKdIK7fWIXrDPeoyUMxRvCi+hu+VnP7xsVyo0b9c1GHeDBfpnI5Zo6ku
 ODd6qTOlsfmx8+3KwlLJzmwSF6GmaqIJqp9MeXOjqkE33054fcKW8H2e2lk5TSXgDNXTw4O2k
 hGUR0YEo3nUixObluJB/ltI6yRMhXpbb+Jzv4VttPj4hf4UBRvG8hREQQgOUJpXk+MIcXqBE8
 ILfIbLar5QHvXucYL/S1jjrDst3U6Lx1td75zDh0d+AXkgkLHmnUGZNVoeAQVVsO4ytyPtb9j
 LTfUHkvhK/tfQ+hKguqpodR20hHgqwlBC25whWkJv2y1g9m35OFjdNiPlPl+IEGXxMNgwvr7v
 cAdQB8U9g+COMzh8rpXsg2KjcSrcIzYyMl4bLr/mUu7JsH15KqcW78T/rbQ1uzjA/8BqxtnBo
 /r7yAKXC6jszugzwn9BDZbJmgh7FHfbS25BJ/gAfSf1haiXM6p5qOF/OCaLqprxcwlnFyFVJH
 6h63golTILcZBXG32LwiMxUxXWHIu5lzkyntkjcKDXfu+A6f8tHV3t5p7Naft/OerfjK6gOtL
 6z83MBqncRKtB1VLySSiLKiM7brUBy8O+VfzPD4wU1XtL2UByr4ibj/BrKcrDQ
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Even a 32-bit kernel requires at least 27 MB to decompress itself, so
halt the system with a message if the system has less memory than 32 MB.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/boot/compressed/misc.c b/arch/parisc/boot/compres=
sed/misc.c
index 2556bb181813..2d395998f524 100644
=2D-- a/arch/parisc/boot/compressed/misc.c
+++ b/arch/parisc/boot/compressed/misc.c
@@ -145,14 +145,13 @@ static int putchar(int c)

 void __noreturn error(char *x)
 {
-	puts("\n\n");
-	puts(x);
-	puts("\n\n -- System halted");
+	if (x) puts(x);
+	puts("\n -- System halted\n");
 	while (1)	/* wait forever */
 		;
 }

-static int print_hex(unsigned long num)
+static int print_num(unsigned long num, int base)
 {
 	const char hex[] =3D "0123456789abcdef";
 	char str[40];
@@ -160,12 +159,14 @@ static int print_hex(unsigned long num)

 	str[i--] =3D '\0';
 	do {
-		str[i--] =3D hex[num & 0x0f];
-		num >>=3D 4;
+		str[i--] =3D hex[num % base];
+		num =3D num / base;
 	} while (num);

-	str[i--] =3D 'x';
-	str[i] =3D '0';
+	if (base =3D=3D 16) {
+		str[i--] =3D 'x';
+		str[i] =3D '0';
+	} else i++;
 	puts(&str[i]);

 	return 0;
@@ -187,8 +188,9 @@ int printf(const char *fmt, ...)

 		if (fmt[++i] =3D=3D '%')
 			goto put;
+		print_num(va_arg(args, unsigned long),
+			fmt[i] =3D=3D 'x' ? 16:10);
 		++i;
-		print_hex(va_arg(args, unsigned long));
 	}

 	va_end(args);
@@ -327,8 +329,15 @@ unsigned long decompress_kernel(unsigned int started_=
wide,
 		free_mem_end_ptr =3D rd_start;
 #endif

-	if (free_mem_ptr >=3D free_mem_end_ptr)
-		error("Kernel too big for machine.");
+	if (free_mem_ptr >=3D free_mem_end_ptr) {
+		int free_ram;
+		free_ram =3D (free_mem_ptr >> 20) + 1;
+		if (free_ram < 32)
+			free_ram =3D 32;
+		printf("\nKernel requires at least %d MB RAM.\n",
+			free_ram);
+		error(NULL);
+	}

 #ifdef DEBUG
 	printf("\n");
