Return-Path: <SRS0=nAaT=NU=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D8D3C43441
	for <linux-parisc@archiver.kernel.org>; Fri,  9 Nov 2018 21:04:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 26ABA20827
	for <linux-parisc@archiver.kernel.org>; Fri,  9 Nov 2018 21:04:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26ABA20827
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-parisc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726166AbeKJGrC (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Sat, 10 Nov 2018 01:47:02 -0500
Received: from mout.gmx.net ([212.227.17.21]:57851 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725799AbeKJGrB (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 10 Nov 2018 01:47:01 -0500
Received: from ls3530.dellerweb.de ([92.116.184.208]) by mail.gmx.com
 (mrgmx103 [212.227.17.168]) with ESMTPSA (Nemesis) id
 0LrNoG-1fMUYR1P2K-01335G; Fri, 09 Nov 2018 22:04:35 +0100
Date:   Fri, 9 Nov 2018 22:04:31 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Replace sync instruction by nop on UP kernel
Message-ID: <20181109210431.GA25285@ls3530.dellerweb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Provags-ID: V03:K1:s9EtVtxVNzApoOuchhHfwzbfI0J+Te7Ic+bWNC9WTS2JvUJFEig
 ysRA//DAhG0tc8IQILgFG/QC5brJvuxH9GtKyDAMhWCY5JUgIgi34rGReJhoLna+ksTlaQj
 XnM4ZvJeUP2KVTkLdKR+tBm9zlpfyYbpD7PbWgkCVE4yr7oRcItRsZpvHnHpkYkofI0eYT0
 aGx5+Mx3PPzSOux94WyDw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:02HZLEdEySk=:SVTyzHM3tXTZ5C8VQFm0VK
 EaTlyFGe3z98+CWHFXb1r0N+zc9cc06i8Xmh3sWBFXe6s7OZsQeGGzhqOXZOp90j29xAirwiT
 HaT/8v4musZNHrpmeC5Q7t7XfDdcmujyXJuKKtZESTWnk3hh6AB99rYreoHQBi8BRKG3iBo+v
 T2IiB3XXGTPqgFXwKTnV9V39zR85J8Wb5LBaEGb7mZnxQ4/ffemAvUeLr0Mw7eHcdXgjthhrV
 4ske5Wh0Xvq9F/RXeB2nwn4whuTfn/Q+Qhvfm0hMYPH5d9WJO0Kra6X5NQeJEkW6Lp/uk+tR6
 B214vyHX+0reAAX2rS6iCCDEvMtxTFfWsY1ppbC6SG7tr6rMN6SMfsp8vstWebuZpRautQbjN
 a0ifcE9fVh7/YTG+zhPlSl5nZ3q+gzWw3P+UKfatM4KlN6Bwivz9GLRdn/QWewjJmbE3TcfSS
 WCtDvlUA36o/xE7Yp4+Y7Wvl+mbCc9HBN9df96L8ioItAK7wHMbtChzDjtyu0vlwj8w4X9PeT
 IWkOowQSWhXHAtWxwSNlWgJXhSUUkLWWS00aImBaxflu0NCTTf7ZMLylu1UyzVBfImSQulTj+
 9V09Y/Eko1Xmhn6q8oLb6ektx4ee/hgrqgowT3AxufZ1VFwA9Jqs5lEY6z3LbSEEfTGbE+oGg
 D6AMEu9SN5IoSaNdb69xpLP6QF7Whj02/g6q18d40swT8ff928sFQs04Qk+ZvI7SeUAIUACwd
 f7HPUmwHb68nduLFMUBVZGq2vzT5+Lm6pYrNhzn9LACkGAzeJtQs2JW7lNydaCAL/Bh/pnQ/M
 lwjPfxpIqBaCXcIaKCVWNmj6T8X5FkrPiFkOdlNrCGOZhfATPeE7koacR7ZMARwLxD4lpDFKW
 68tD1AR21h7Ugl6UoeAmWNrSqF8Qcb0bGUI6bzAKU=
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/barrier.h b/arch/parisc/include/asm/barrier.h
index dbaaca84f27f..43bcdccc56b8 100644
--- a/arch/parisc/include/asm/barrier.h
+++ b/arch/parisc/include/asm/barrier.h
@@ -6,7 +6,8 @@
 
 /* The synchronize caches instruction executes as a nop on systems in
    which all memory references are performed in order. */
-#define synchronize_caches() __asm__ __volatile__ ("sync" : : : "memory")
+#define synchronize_caches() asm volatile \
+	("sync" ALTERNATIVE(ALT_COND_NO_SMP, INSN_NOP) : : : "memory")
 
 #if defined(CONFIG_SMP)
 #define mb()		do { synchronize_caches(); } while (0)
