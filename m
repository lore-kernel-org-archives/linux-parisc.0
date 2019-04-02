Return-Path: <SRS0=b8iV=SE=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CF9CC4360F
	for <linux-parisc@archiver.kernel.org>; Tue,  2 Apr 2019 10:13:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CCB462082C
	for <linux-parisc@archiver.kernel.org>; Tue,  2 Apr 2019 10:13:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="aVvHXAS7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728999AbfDBKNl (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Tue, 2 Apr 2019 06:13:41 -0400
Received: from mout.gmx.net ([212.227.17.20]:52907 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726436AbfDBKNl (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 2 Apr 2019 06:13:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1554200012;
        bh=uc656CdfJvqMgmxzD6T5j1pkGnennj18ufOycPcYf1g=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=aVvHXAS7AmNyNop75H3IHL+XSbOpXuACHHwaf0Pvl6+EyYoRCM8oHCiXFpPyJlXqE
         B00YckvPjM7E59mqb2KksQcUgHguYTx8B7v16BEwFJtFWoaStwTfxqa0qwhbPcEA2p
         8ieJx8/Cdf7nINmVSW6xWfWIvoCztc/liETbr6z0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.dellerweb.de ([92.116.133.0]) by mail.gmx.com (mrgmx103
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0M8e5P-1gxQfQ3rCl-00wCHH; Tue, 02
 Apr 2019 12:13:31 +0200
Date:   Tue, 2 Apr 2019 12:13:27 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Detect qemu as early as possible in boot process
Message-ID: <20190402101327.GA15928@ls3530.dellerweb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Provags-ID: V03:K1:ZVpJ1qqumYGYEm/NFgpzLhqmSPuDBAoipoV+jSf7iNM+uXio3AF
 wQ6gK8gSjosbUc8pQ4Tns33FilbZN79RFxsd8suRojxUKvZHFnv89Ez9of0Ptct4423L1k0
 z+ROqWLLnPoYLARIOgFKaSy/Ar5kr65KS5YuWUe+eVgdanx5+lBIEHaWMxV471g3/ByyVgz
 3mz5Npx9WrcLBAEq/UgXQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jU1hkCKkd54=:sG3JFc7O72osCMLVu+jFE+
 opmBEYiL01xB95A0FHVr1frbv5mNADQ6MIg1vs/HzhirUxtR+6XN7J8ulJeNhFZdsDHLw9dM3
 2EDFBGpw9e6TS8RtRSB+3I94SU/35LF2lW6jcQPBZmuktVO0i6UAZWt+E+woJm10B7/ozPtYx
 miUQp4oMgNSnYRis2QXnDcZ+gTk8xST75X+cXOUwJHwCIMLFqMpyPLrQA7QQeFLYBmeG1gYE0
 1HwqTUdrqiofmT62O7fygoHHJlPbjuOwCFxkJtactSEcnVfmRAvN94eDBWHO895PldHOY0hq0
 XCD0wUi2UyN9tdOdSjAhh/Bkf1LdHoqZyqzRdRPX6xOqXiUcTnE1jsuu2Xck+kgDFlsD320iX
 YlFwgAioDDxIZiajTWLV9Zs23azOCdbphEtHwwidW09TkncaSZSvgD9jwkix7h+M2G3wun/5Z
 umfCRblqq7pn4QTIgRix8qyDzEvxiAzzalDUkjzOq6P5WLpSM/lRj/IDvIhz3ZTI1zViyQsmm
 Fcq4f9VWEPxIkrDBIvAqOnt6d/Vqf+iB00NnyF6t3Umc5Ep+ihU2f94lO3S6QZaHbRT7Lt9d5
 Zvzpto5++M8qxGvS0OdVLPU93lJMacOsI0YyYOsVW7nGx3kdBo7n92o8zSXjE0FS5CC21VSoa
 zJgugR42t38upLlbiAOS4kKaGLyI5aZDRwSnN/+5BlBAHeM1RDY9jw38mB9ZfcDZiZwR7aKFN
 3zvDPILJfSsNCV26iktYGN21tyjzhPMb9VA9gS9fEVgMtRWT4e7VbATIFaaJVRrlypPx/Da4T
 N/ITUpDm+YM3sgldCtB0BTLRc0uptt4+7Skb5gsxx/J8GgHkgK4NU6gUSZiJzLWcbdm6pNg05
 8ym+GiNivAvL5Ho5xk0++wk7U7hdVQ12s+qGmSDImZzBrl+M6weFEtBC0yGdp3
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

While adding LASI support to qemu, I noticed that the qemu detection in
the kernel happens much too late. For example, when a LASI chip is found
by the kernel, it registers the LASI LED driver as well.  But when we
run on qemu it makes sense to avoid spending unneccesary CPU cycles, so
we need to access the running_on_qemu flag earlier as before.

This patch now makes the qemu detection the fist task of the Linux
kernel by moving it to where the kernel enters the C-coding.

Fixes: 310d82784fb4 ("parisc: qemu idle sleep support")
Signed-off-by: Helge Deller <deller@gmx.de>
CC: stable@vger.kernel.org # v4.9+

diff --git a/arch/parisc/kernel/process.c b/arch/parisc/kernel/process.c
index eb39e7e380d7..841db71958cd 100644
=2D-- a/arch/parisc/kernel/process.c
+++ b/arch/parisc/kernel/process.c
@@ -210,12 +210,6 @@ void __cpuidle arch_cpu_idle(void)

 static int __init parisc_idle_init(void)
 {
-	const char *marker;
-
-	/* check QEMU/SeaBIOS marker in PAGE0 */
-	marker =3D (char *) &PAGE0->pad0;
-	running_on_qemu =3D (memcmp(marker, "SeaBIOS", 8) =3D=3D 0);
-
 	if (!running_on_qemu)
 		cpu_idle_poll_ctrl(1);

diff --git a/arch/parisc/kernel/setup.c b/arch/parisc/kernel/setup.c
index 15dd9e21be7e..d908058d05c1 100644
=2D-- a/arch/parisc/kernel/setup.c
+++ b/arch/parisc/kernel/setup.c
@@ -397,6 +397,9 @@ void __init start_parisc(void)
 	int ret, cpunum;
 	struct pdc_coproc_cfg coproc_cfg;

+	/* check QEMU/SeaBIOS marker in PAGE0 */
+	running_on_qemu =3D (memcmp(&PAGE0->pad0, "SeaBIOS", 8) =3D=3D 0);
+
 	cpunum =3D smp_processor_id();

 	init_cpu_topology();
