Return-Path: <SRS0=0R8f=SI=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06D84C10F06
	for <linux-parisc@archiver.kernel.org>; Sat,  6 Apr 2019 14:45:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C27B82146F
	for <linux-parisc@archiver.kernel.org>; Sat,  6 Apr 2019 14:45:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="AbOC0KrK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726451AbfDFOpZ (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Sat, 6 Apr 2019 10:45:25 -0400
Received: from mout.gmx.net ([212.227.15.15]:52241 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726419AbfDFOpZ (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 6 Apr 2019 10:45:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1554561917;
        bh=gAUAJiijCZZpqFQpPKqAOr50g202utCfkvGyNMRPKWI=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=AbOC0KrK8QOug+RbTTqkFa6H1PczJOroy9tjcMIERE8Os+MYIjMXlSx9i+/7nV083
         32J60EqzqUTF3xQFlK5/GasAXJ9i3wZlYQKS1tVJo/ub3p4Uy4xayPC1HZsWyhzvIo
         vDMS+aiwhTuggBr5knzTpjTTHddIpFH9NTHvxxTI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.dellerweb.de ([92.116.164.5]) by mail.gmx.com (mrgmx001
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0LzskF-1grU9G1EiR-0150dG; Sat, 06
 Apr 2019 16:45:17 +0200
Date:   Sat, 6 Apr 2019 16:45:14 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Export running_on_qemu symbol for modules
Message-ID: <20190406144514.GA661@ls3530.dellerweb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Provags-ID: V03:K1:/aD+lqlPwGM33FpW5gIQYCSpCQwz94v/tDFwLSUmFvIsAfMVPap
 3o9Ts8ZNKVlzGPnnB8Dt9WGi0qB37oNXMefw1jrRZaicn33AUB48Ht+Ua1wRlKLBBW67ArD
 qPOd80qqOF3JAD1fO5Bkas8Nz6z3Ob6vr0xFbBv9XI9LZVfpSfFMxDNfp6fQffoT9GGX7Hy
 Qyn1YUIZ7r2nelomQBhMg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EdTI0BtUzo4=:+TBKL/d3kKYFmaJ8VFws1c
 tp8LyuS0B3X2WsxqHEd8fyaYqVc5lFVroCRuxlszJIO61cWItr3exvK7VmsQ3h1Jn37Mm1AqK
 NKyHuSZaKGoUrBk21CYYXO+XyXdx25qL7czyktHr1h2AB5OPLmN8h9TkCMW8oeJPwDQh6f2MH
 8zC/PYnkNMoJxH5SE2nIGUhZaJO9CjhLfyhYXjAPQ92nqFNriEeKj0r6NiPdhnQTaDhr3vX1Z
 TBHbrPC1xSy41egg6ocFY0gFjAMK6dE6m3gchYuO1ZIff/AhFdpNUyhA5vgZEMoQlY7PXjzuy
 NvQPJZ3OdTj3yByk+zEbphomJzz5JEqI0JVBxWs288C2/E1TCiyNPm6YUASLrRo5wZN+ECFSx
 iFiTZ/qP9+6viWxyAR7p7BQ7n/ia23At/RG60IHmNvRZBfqwd3GRdSeICQU0EzERtFF5x23A4
 OuBooqjUdEkik9QV9bdjOhQ4Q1Dczh7/cjUgq/V+huUAU9LgfxsVVzcv1LYw8jddAnT8e7xgh
 9ZnZt+lH1xF4TOR0RK/efWilp/sI/4SDjeZGSjX2S34atRukr7vxiG181zDR3jiD6sSeBFcmP
 SPYriMTsHjA0irlEhL+ws/UZetIvmZKqxXOZsu3moN0EtWRZfgMPBRu9LGf9KO9e4exhOiLs4
 U6hUOCJIs5JwVG7mK/VawDfkVOiCp0SY95SFz6V5IIFM1AvGNrOgXPwXjS3uFdvD4mlHwJRgj
 WzytMp+0wLg5TqqDaNKoiVW1mlk0ex77uy7GUzubPfHSvieh9mAMDXflCYOiU0BSCrXMZL/lk
 3jcpLwFN6i5OHmVDioQ5eIFAP3QxeQMcjlXYa5tMcqzWD9tKoeZ3v+VKdK6aKU3yo0p+cJc02
 peb2F9/xl+zJCgRgV/T514BIocQedpERWMtlekN66hla3nvt2GDlBTsNCicJSP
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>
CC: stable@vger.kernel.org # v4.14+

diff --git a/arch/parisc/kernel/process.c b/arch/parisc/kernel/process.c
index 841db71958cd..97c206734e24 100644
=2D-- a/arch/parisc/kernel/process.c
+++ b/arch/parisc/kernel/process.c
@@ -193,6 +193,7 @@ int dump_task_fpu (struct task_struct *tsk, elf_fpregs=
et_t *r)
  */

 int running_on_qemu __read_mostly;
+EXPORT_SYMBOL(running_on_qemu);

 void __cpuidle arch_cpu_idle_dead(void)
 {
