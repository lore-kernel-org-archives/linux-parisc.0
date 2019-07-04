Return-Path: <SRS0=e3g5=VB=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82AF8C5B578
	for <linux-parisc@archiver.kernel.org>; Thu,  4 Jul 2019 01:44:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4CBE92187F
	for <linux-parisc@archiver.kernel.org>; Thu,  4 Jul 2019 01:44:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="FXP6i/ky"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726955AbfGDBoc (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Wed, 3 Jul 2019 21:44:32 -0400
Received: from mout.gmx.net ([212.227.15.15]:50445 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726736AbfGDBob (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 3 Jul 2019 21:44:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1562204663;
        bh=P0/Rc8XDprc+CfLKw/UqiP06D7XOvt+ud9BW3QLmPI0=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=FXP6i/kynlFE3qJpBXrSpEl4QYjQtSWn3Nac3HMm7kuVdjNMS92uqaxHZjoXndmuE
         fQOtrZIAFGBz4la3Z0k3qUv/3k9g2e3e9UESRMWYZhOqzwkf8g5PYEEb1CHKj3ywqJ
         hKOlleh7YqZJ7uLhdgP2/oEfkSn2quvvPtHWkdac=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.dellerweb.de ([92.116.183.112]) by mail.gmx.com
 (mrgmx002 [212.227.17.190]) with ESMTPSA (Nemesis) id
 0LwaMR-1ib6Uq0Amt-018MUk; Thu, 04 Jul 2019 03:44:23 +0200
Date:   Thu, 4 Jul 2019 03:44:17 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Ensure userspace privilege for ptraced processes in
 regset functions
Message-ID: <20190704014417.GA26392@ls3530.dellerweb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Provags-ID: V03:K1:jDrZFlAGIUmSWKAIQtLBnIm8fJAvDzN4uKLDxXx2sz/YlaKcSPy
 o7sGV9CHJiinPvF4UieO9HsGKQuxcmwk1RdYZIJ5+Q5pW/fzVwLJvgS7FD0/058H0FoN7wS
 S9LXoez3vVd4f2HpiIA0O9F+M8BKZZCPdkfudQgLAW699UOVgt7ygtOST5wJtZIC/dXYajx
 2i/ku2lO+BjGJ6LqtO7yg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:F4TcWEAliC0=:YjVRKINW+yU20QU0Qqznet
 GQSAGr3GSwU7mkUJVTIn9sX+CncCvPJiI5c++Xu/t243FdqQttV/I3sYjw9YLqu9TTsDKWFsJ
 4fTBc6N7AUfpiRbq5qNQCN6vXqkp2bdAsEJTU3gdoPJcgZkuVqDC8yyWPn19J6rSo43egwO/4
 aOuushBICsWspNjt/Uc6gHzKPBVHmYbEmQG5vHMyGOkNZ40Y4ntrh/xxyLfR9bRcA/F6kNLaI
 /Rb6u3DXrrrJ3RHW8bDNJ2uH6oPNf+JE741g0cYFqZe81CoLVUyb8vzp6ellQrNbtWtPdNZ1P
 XRzj4i6LTtxHv/IZicHVUSaK8X/Uj3TEyY++sATrjN7TFYob3yNBPmfzUKDLnopqkdo4Cc5OD
 Ay34ngt/sZVyP0/JkSruaPYpHHVoWctrbI8fMbABX2Gi12qOsgExmYzsZvt4RRpaJO7GlzQdS
 z5x1KgwKacUZUA8IWQ3yUCAzXc5AGoZA59edx5tthWw8lvP43GH9lvjo+O8Pyp13P0icUW+Wv
 hsWyPNxuQcLtoTw4c5dmPZK5pbi1lDWHuqkaEEE4SSK1mdkioHAr/8WJsi/cPWBzan2jONmSh
 m5cHiSbTQg1ZXZ0WeGFOFZR9QFMg2QN2WAuQ1N3BHNSWBia3wp52ogpWk+SMJIGhlPhAxBX4H
 25vCULH63IXmVRz8SkjeB0zOd4xnSbHfIguXHZUrmEj5m5zYTce0w6XLSwcPRIKS3NMsqcUTg
 AsTWsnptY4kI07jXCZzy0Fscz+/tiSstirNRgNchnz1YcZXEP7LZMV8hn64f/1vlAWoGNuN19
 4QHUvVU/pWT3T8WSsrjL/WLIfE5muDZWPm6hLOFFG+TmMhvVcz7l0AmyCTmfUtGGgYNJOwK+B
 O/bIJ0jIt6aVA8Mb3emJimNEWFguwTxnQ32usAvSqvR1suAGZ39FkoVoscFRAkfUK4UpAArhI
 9BKxXx/p3ZU+aFE+fFyN1lBuy2NYq0dHBJERxkB4Dj74fTZuLl/OmS5tEyEQVXtZzvz3HE8o9
 fKspWbcILO7i1xphddkW6rpt4Usj7fjknDdGeSVYko0Kcfqi+telSqWSs5L/3wkLjw==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On parisc the privilege level of a process is stored in the lowest two bits of
the instruction pointers (IAOQ0 and IAOQ1). On Linux we use privilege level 0
for the kernel and privilege level 3 for user-space. So userspace should not be
allowed to modify IAOQ0 or IAOQ1 of a ptraced process to change it's privilege
level to e.g. 0 to try to gain kernel privileges.

This patch prevents such modifications in the regset support functions by
always setting the two lowest bits to one (which relates to privilege level 3
for user-space) if IAOQ0 or IAOQ1 are modified via ptrace regset calls.

Link: https://bugs.gentoo.org/481768
Cc: <stable@vger.kernel.org> # v4.7+
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/ptrace.c b/arch/parisc/kernel/ptrace.c
index c60229075a33..4fa0d4c07521 100644
--- a/arch/parisc/kernel/ptrace.c
+++ b/arch/parisc/kernel/ptrace.c
@@ -502,7 +510,8 @@ static void set_reg(struct pt_regs *regs, int num, unsigned long val)
 			return;
 	case RI(iaoq[0]):
 	case RI(iaoq[1]):
-			regs->iaoq[num - RI(iaoq[0])] = val;
+			/* set 2 lowest bits to ensure userspace privilege: */
+			regs->iaoq[num - RI(iaoq[0])] = val | 3;
 			return;
 	case RI(sar):	regs->sar = val;
 			return;

