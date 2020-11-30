Return-Path: <linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9F12C71155
	for <linux-parisc@archiver.kernel.org>; Mon, 30 Nov 2020 17:31:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7A7422073C
	for <linux-parisc@archiver.kernel.org>; Mon, 30 Nov 2020 17:31:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387571AbgK3RbZ (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Mon, 30 Nov 2020 12:31:25 -0500
Received: from out03.mta.xmission.com ([166.70.13.233]:34036 "EHLO
        out03.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387570AbgK3RbZ (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 30 Nov 2020 12:31:25 -0500
Received: from in02.mta.xmission.com ([166.70.13.52])
        by out03.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1kjn0a-004dt6-HG; Mon, 30 Nov 2020 10:30:40 -0700
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95] helo=x220.xmission.com)
        by in02.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1kjn0U-001x1h-Rk; Mon, 30 Nov 2020 10:30:40 -0700
From:   ebiederm@xmission.com (Eric W. Biederman)
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Collingbourne <pcc@google.com>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>
References: <20201127200457.1ffb6aaf@canb.auug.org.au>
        <155a20fd-09c4-df35-9cc6-8526a89c2933@infradead.org>
        <20201128084414.3daa87d2@canb.auug.org.au>
        <87pn3unbtv.fsf@x220.int.ebiederm.org>
Date:   Mon, 30 Nov 2020 11:30:05 -0600
In-Reply-To: <87pn3unbtv.fsf@x220.int.ebiederm.org> (Eric W. Biederman's
        message of "Mon, 30 Nov 2020 08:44:44 -0600")
Message-ID: <87blfen46a.fsf_-_@x220.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1kjn0U-001x1h-Rk;;;mid=<87blfen46a.fsf_-_@x220.int.ebiederm.org>;;;hst=in02.mta.xmission.com;;;ip=68.227.160.95;;;frm=ebiederm@xmission.com;;;spf=neutral
X-XM-AID: U2FsdGVkX18RelCMmMbZtHThwNkcw42rNjvm/YjAkTk=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
Subject: [PATCH] signal/parics: Remove parsic specific definition of __ARCH_UAPI_SA_FLAGS
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


Randy Dunlap wrote:
> On 11/27/20 10:43 AM, Randy Dunlap wrote:
>
> > on parisc, _SA_SIGGFAULT is undefined and causing build errors.
> >
> > commit 23acdc76f1798b090bb9dcc90671cd29d929834e
> > Author: Peter Collingbourne <pcc@google.com>
> > Date:   Thu Nov 12 18:53:34 2020 -0800
> >
> >     signal: clear non-uapi flag bits when passing/returning sa_flags
> >
> >
> >
> > _SA_SIGGFAULT is not used or defined anywhere else in the
> > kernel source tree.
>
>
> Here is the build error (although it should be obvious):
>
> ../kernel/signal.c: In function 'do_sigaction':
> ../arch/parisc/include/asm/signal.h:24:30: error: '_SA_SIGGFAULT' undeclared (first use in this function)
>    24 | #define __ARCH_UAPI_SA_FLAGS _SA_SIGGFAULT
>       |                              ^~~~~~~~~~~~~

Stephen Rothwell pointed out:
> _SA_SIGGFAULT was removed by commit
>
>   41f5a81c07cd ("parisc: Drop HP-UX specific fcntl and signal flags")
>
> which was added to Linus' tree in v5.10-rc1.

Solve this by removing the the parisc specific definition of
__ARCH_UAPI_SA_FLAGS that was just added.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Fixes: 23acdc76f179 ("signal: clear non-uapi flag bits when passing/returning sa_flags")
Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>
---
 arch/parisc/include/asm/signal.h | 2 --
 1 file changed, 2 deletions(-)

I am applying this trivial fix to my signal-for-v5.11 branch.  Catalin
you shouldn't need to do anything unless someone tests your tree on
parisc.

diff --git a/arch/parisc/include/asm/signal.h b/arch/parisc/include/asm/signal.h
index 30dd1e43ef88..715c96ba2ec8 100644
--- a/arch/parisc/include/asm/signal.h
+++ b/arch/parisc/include/asm/signal.h
@@ -21,8 +21,6 @@ typedef struct {
 	unsigned long sig[_NSIG_WORDS];
 } sigset_t;
 
-#define __ARCH_UAPI_SA_FLAGS	_SA_SIGGFAULT
-
 #include <asm/sigcontext.h>
 
 #endif /* !__ASSEMBLY */
-- 
2.20.1

