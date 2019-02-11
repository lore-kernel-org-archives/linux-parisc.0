Return-Path: <SRS0=rov3=QS=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 111EEC169C4
	for <linux-parisc@archiver.kernel.org>; Mon, 11 Feb 2019 20:25:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DBE7C218A4
	for <linux-parisc@archiver.kernel.org>; Mon, 11 Feb 2019 20:25:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727199AbfBKUZn (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Mon, 11 Feb 2019 15:25:43 -0500
Received: from mout.gmx.net ([212.227.15.15]:49641 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727082AbfBKUZn (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 11 Feb 2019 15:25:43 -0500
Received: from ls3530.dellerweb.de ([92.116.163.173]) by mail.gmx.com
 (mrgmx003 [212.227.17.190]) with ESMTPSA (Nemesis) id
 0MN1C4-1gzriI2DrU-006fKm; Mon, 11 Feb 2019 21:25:34 +0100
Date:   Mon, 11 Feb 2019 21:25:31 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Add constant for PDC_PAT_COMPLEX firmware call
Message-ID: <20190211202530.GA19299@ls3530.dellerweb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Provags-ID: V03:K1:y/KzgzBWnQaLTijDzzjtx1ARI6+IoMlQ3p79W9q1trIdY/JGdHv
 j0TiJ/30532xa8GeLfVdaL3oGNG6vQV+BSBuINk8N5+SHIw0pCui2mXBuc4XoC1kQXNZd6P
 aiN0nfXadqPjyqVVwdaSFPMxGGsVmBooyHs5wAOOyJGcdVQJWYNt7eCBxaircCV+COldMcM
 LugSP+SJ0fYxY37XaMCcA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9t49iibbJLE=:PD/nLn+iEhXfcfon+k4Asv
 IFRDVScSzLyX7ORfJistTNjAQO4lFSuZUvQaFjbmp0lSwJCy+7q4swpPxDE1DnPYZ3NjBrBDb
 yNcsnsL9lw5LrmwO1IITxna3r07Jkx1IpROn7VmtulEF4x9htxTK8d67x3+JHVA6WasBZdlS4
 ql1LymLCJhw3DjRRoIFL2NTuS8d1oxEQC0GREWSsp96TP2MBu/OIb2rgQS2ICfLtGRsY5KGPt
 nZHaRzVCO94b8pn6+hU5azLQehlVEb2vx1OV0sBFgGWyNvN/yYTvrbNA7PAP92+zVrJLeKDsu
 BWhwLkSb/esv1HqMSHVkjRw9Co8vcvMmJ05JNGJss3HkPjVJsQZ2EDwgbo/9HJtz+ccyO88ba
 7nppHx0VODcKSLd2FhEKqP4ucwg1PVw9BtkKOxCnKpUvTQL/n5Y/k6ZEZEPrFG2nj12x9afN7
 bVJ6Afa1RkJOGDDxtU9JuaaRNB8P6UtTO3BtMIclSKw6+ruh7kvjxS+uKtyykKK+vLXhRzoSZ
 fsm/0UtUZTjU5e6vVp0eSFOzn6bc/3nhOFppfWaqBQedOEVT3NVZ1pDrLGd5VyafPoW/PLIXX
 aZSR2hwZPyXLgbr2/WPX0TPC7PsXrjBDh7VYah51GLISZ0uYmTu1cWE7EUmyMNxGYidtZ57jI
 gZFl4aqWABz//Bbl+fFYSvGIHfsJO268Y6dj4UGF2D4Q8ran9LuSVIk0APesCNE8rompAm2HY
 le/Tf+0ZWnCnKFcYxcI/lngYBazdBcZhQ1x1ldeZLZam3K5W6izIMbebG6VPyfHlLHiY1zZF4
 IsK0oVU+bPmE+aYZfFCtTB/93yazGuS0aLiJaxKY8RIjUS2e5OwYsbxSYrIc2scpfc47w44uk
 KztaNcHYqKZSJH2/Mv8RN95J5wZi/ixpblSd8lBoHVUBpPeN9vjitjry+xJEFW
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/pdcpat.h b/arch/parisc/include/asm/pdcpat.h
index bce9ee1c1c99..24355ed1453a 100644
--- a/arch/parisc/include/asm/pdcpat.h
+++ b/arch/parisc/include/asm/pdcpat.h
@@ -67,6 +67,10 @@
 #define PDC_PAT_CHASSIS_READ_LOG     	1L /* Read  Log Entry */
 
 
+/* PDC PAT COMPLEX */
+
+#define PDC_PAT_COMPLEX			66L
+
 /* PDC PAT CPU  -- CPU configuration within the protection domain */
 
 #define PDC_PAT_CPU                	67L
