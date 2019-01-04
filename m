Return-Path: <SRS0=cK3J=PM=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2F4EC43387
	for <linux-parisc@archiver.kernel.org>; Fri,  4 Jan 2019 22:33:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7016721872
	for <linux-parisc@archiver.kernel.org>; Fri,  4 Jan 2019 22:33:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbfADWdM (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Fri, 4 Jan 2019 17:33:12 -0500
Received: from mout.gmx.net ([212.227.17.22]:33335 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726094AbfADWdM (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 4 Jan 2019 17:33:12 -0500
Received: from p100.box ([92.116.186.155]) by mail.gmx.com (mrgmx103
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0Lqyi7-1hIA9q3IQN-00eano; Fri, 04
 Jan 2019 23:32:57 +0100
Date:   Fri, 4 Jan 2019 23:32:53 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Cc:     Mike Hosken <mike@purple-cat.net>
Subject: [PATCH] parisc: Remap hugepage-aligned pages in set_kernel_text_rw()
Message-ID: <20190104223253.GA13982@p100.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Provags-ID: V03:K1:0sU590+FUnbWRTHRxhoNaJn1aCo7EKvDgsXPZ8vdFbjISAZb8+l
 TAz+mXIXW4AZm8AbXi3QmujEdz7Hcax9r9C/X6h54jdeJO+C3FA4++SMYYY/wThiEC1rM0E
 l/NZqR5iaYPSicw5wJB27iSPJn2aF2zDXi4dMlLQ9SbRlAvxNx0teHR2y5Rx+l1jtcXHSBw
 4K6kltlaGfCX8yaIql/Wg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1GnSWk06oDE=:zpojp6o79/z1PHQarruMoC
 XMcNx6x82Q2At5dKjv0CrCvh+rVlhRMyNwHAKW6MdCOEmSTDE9jPcoonKq2sFg4B7PJsJxjkX
 pgJGI9Uy5MImlt4tZzB5COwzDS2CKj4puPG5j8MHaS1McTVdMnM718lDAPIJivozZkwIG1p17
 9yN9z87l9Me4EI31Ax8MZHrs6tUrZkXb6BHzYFTD44kjb+l3nK3W5WWKO8EfP0VJlYfaZyORu
 pEcVBcNcGsW1ITKMS6HipIWBs3qsZQNdRaIGhZO4WIA2yHy7eznNyZxXIyduaA+B2eGMnvmFP
 k4QLT8Tw4n8ywULjh1bcnJjl1F0DK7aydCI1959i7gMYzkYuDdueJp8YiG2BMU09uAG1n1OTz
 iIKZo38PjkhY47bdI3y7jr6k7K2fzSrxwhz3ril459vDOYYZ/P7jFeusZK0T6AJpeJzCoa/o6
 i9jSJqNU0e3U/bmt83+6/0Ed8lLnSZD174eQE9p0Z9ryHOeeTS25UzQy8TLq3o0XfApWSnzP4
 hyHlejuLHMfrRzivf1d1lCZvrru/6K2msaNU9SmqCLj2lq2KrsKE6TUY41K2tC5zMbX9U0yYL
 sDo8wIAW/2uaBP3qgh8exbG9ArJFEUxQzeby/gxieweOCeWUid+V6jeOL/BwhTc4vFl6KfU20
 XMDsawDy96uzqdYTDWHNh0M8wzJL5ou2Nnf5qAsyaa1451bdsWUJrAncRYYNadcX1QtzDJMjc
 lqb2M3VB/0K/8Wnm3Mi1Qhg+hQt8Clmmc5cQbcUhImgc1XocCifdqtyhsTh5cEbiqH4zijsZN
 l3NHwYdE2pZv8r9O/57zF3RmmMgp8depPvHtG1/nLsG1SlcwVQosXMwNd/HZamtMTERvxOerZ
 5Fm0Gz82HISsov7QOrPMeONKM97HVGErSP7kye3tM=
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The alternative coding patch for parisc in kernel 4.20 broke booting
machines with PA8500-PA8700 CPUs. The problem is, that for such machines
the parisc kernel automatically utilizes huge pages to access kernel
text code, but the set_kernel_text_rw() function, which is used shortly
before applying any alternative patches, didn't used the correctly
hugepage-aligned addresses to remap the kernel text read-writeable.

Fixes: 3847dab77421 ("parisc: Add alternative coding infrastructure")
Cc: <stable@vger.kernel.org>	[4.20]
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index 2d7cffc..059187a 100644
--- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -512,8 +512,8 @@ static void __init map_pages(unsigned long start_vaddr,
 
 void __init set_kernel_text_rw(int enable_read_write)
 {
-	unsigned long start = (unsigned long)__init_begin;
-	unsigned long end   = (unsigned long)_etext;
+	unsigned long start = (unsigned long) _text;
+	unsigned long end   = (unsigned long) &data_start;
 
 	map_pages(start, __pa(start), end-start,
 		PAGE_KERNEL_RWX, enable_read_write ? 1:0);
