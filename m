Return-Path: <SRS0=TiJ5=S5=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20F4CC43218
	for <linux-parisc@archiver.kernel.org>; Sat, 27 Apr 2019 21:58:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D20FA206E0
	for <linux-parisc@archiver.kernel.org>; Sat, 27 Apr 2019 21:58:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="JtWf6d2Z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726062AbfD0V6B (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Sat, 27 Apr 2019 17:58:01 -0400
Received: from mout.gmx.net ([212.227.15.19]:42703 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726049AbfD0V6B (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 27 Apr 2019 17:58:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1556402273;
        bh=5CjKWCPAkkdib2eR4HWH7mpm27fXHdUNIF2MlcdHTeU=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=JtWf6d2ZOGCG5AMZUSW7juEjI+C/4aqL9eDP5zLeRj9BHycKVy5fIcrEosDgxqHOK
         qklVecSGWnsvVr6EHJMRdhJbJUgsjk8A2CXP7pFxdWU2YCI3v82GN0gtBcJ+n4ISMf
         TC7Ft2M5PwFcBtVZD2QXEFvtkcUCnmpVXy8DQXfI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.dellerweb.de ([92.116.137.157]) by mail.gmx.com
 (mrgmx003 [212.227.17.190]) with ESMTPSA (Nemesis) id
 0M4Gyx-1gUKW33gDD-00rmN8; Sat, 27 Apr 2019 23:57:52 +0200
Date:   Sat, 27 Apr 2019 23:57:49 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Add memory barrier to asm pdc and sync instructions
Message-ID: <20190427215749.GA19050@ls3530.dellerweb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Provags-ID: V03:K1:KeVop6xbdOI0Y1eBN+KrhXhYJ18OegY9C204ZGEH/kJEgUImYF2
 OC5MtYsN+kcP9k0BykatYAkhAwr6ufeLsaQ+8sofR7SEmPpTut7n5sZCIea/dQCWsaMDXGW
 nVgFBS3Meu4HtVmXY5z5wyfgy1WDoDy7beLHqFmWUJf52T6rFXjngkbCdvT0KoasGa9FDS1
 83ktfmiimJtptQz7M+5+w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Gs6yptY8XAg=:06F8BeeU1zwSML7lwKMtxP
 w1s2kN/HXxbySjLaVkV+fYOlbbItYbLvsUzZchTmuRxk21kecBixP9lh+RA7x2VgaVtLvmyYs
 a4ejI9wYxd50zlcQeES1YRJfrijrIZyxriG1HgRVqOMc+DSO1dP9A+ire41L/sjTUC3HWKvjw
 dKRsP8gs0/Y58TJUk2hqwCcvb5/ZXvSoPyQBCMZAct+jR98jctXp4GjsvPzSfH2w/aMgFJfyi
 bchw03yvg0xhXABSBply8eXoLl54zz7DrO1eRU2Xu1KGLWP1H4ZIFDcnFBnnN/YG8gWVM2Umi
 a6tbeUPRAATz248d7a/ZN01bUlGY4q6rPTRVmPXuQKjIjVdXPp6jGOKfmrsypaPB6PYiHsbGv
 v0m/EWU/pRTE927aNmEVrzquydYusN4EUaAKtSc3zT6rBNAsLK05wl04ngdtWcBM9pROdIaGD
 rNTJU+Ury9sSc6FNpEvu9MI0hgcd5Kbomj/uU6GJxmPDJVIH7gnbc+m/t5vvoRYvt6eZ8KDek
 VDAfc1wXSHAldOCb0W+D2giL60xxhyMVGAit9d69fz4fhqLZIm376HOxmc+Ul/f6QZrUtOd0F
 6zd8jEewFSp7NNy65s4CrHK7Ecpl1wAPYsl5slQspTyr4fcjd+mv9FR0Km4UwjZQf16wP4Q0q
 K2V24K2ZKrhI4XVQjZxnibqJCwJfuZ8/KdVazsZ99Ts2KG/KejmrNoOrQr9s/5lVuGK6QVQX/
 Cr399ispG1GH5lswsldrcelix+eHm4Wjd6mH1k1DzbjOFlSdbFkzuAtlyH3lTm3eVgXQgdgtv
 zboEhvr3/l1dLwQMQ7aiIUWmEExG0zqctwGA5wA7skqLg3kW4zFeo3FqtiPMtpbMosjS24QVY
 ZOyJ9PvD3byNmnYS3oLueLteluDWclBGOUHAAu1tDWo2tBAp2MOUzelAKBgFMR
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Add compiler memory barriers to ensure the compiler doesn't reorder memory
operations around these instructions.

Cc: stable@vger.kernel.org # v4.20+
Fixes: 3847dab77421 ("parisc: Add alternative coding infrastructure")
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/cache.h b/arch/parisc/include/asm/cac=
he.h
index c18351cf5876..4016fe1c65a9 100644
=2D-- a/arch/parisc/include/asm/cache.h
+++ b/arch/parisc/include/asm/cache.h
@@ -56,10 +56,10 @@ void parisc_setup_cache_timing(void);
 #define asm_io_fdc(addr) asm volatile("fdc %%r0(%0)" \
 			ALTERNATIVE(ALT_COND_NO_DCACHE, INSN_NOP) \
 			ALTERNATIVE(ALT_COND_NO_IOC_FDC, INSN_NOP) \
-			: : "r" (addr))
+			: : "r" (addr) : "memory")
 #define asm_io_sync()	asm volatile("sync" \
 			ALTERNATIVE(ALT_COND_NO_DCACHE, INSN_NOP) \
-			ALTERNATIVE(ALT_COND_NO_IOC_FDC, INSN_NOP) :: )
+			ALTERNATIVE(ALT_COND_NO_IOC_FDC, INSN_NOP) :::"memory")

 #endif /* ! __ASSEMBLY__ */

