Return-Path: <SRS0=cK3J=PM=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C333C43387
	for <linux-parisc@archiver.kernel.org>; Fri,  4 Jan 2019 23:05:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 03AF9218D3
	for <linux-parisc@archiver.kernel.org>; Fri,  4 Jan 2019 23:05:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbfADXF6 (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Fri, 4 Jan 2019 18:05:58 -0500
Received: from mout.gmx.net ([212.227.15.15]:39333 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726009AbfADXF6 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 4 Jan 2019 18:05:58 -0500
Received: from p100.box ([92.116.186.155]) by mail.gmx.com (mrgmx003
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0Lymoh-1hPnZq2ad5-0168jv; Sat, 05
 Jan 2019 00:05:49 +0100
Date:   Sat, 5 Jan 2019 00:05:46 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Improve initial IRQ to CPU assignment
Message-ID: <20190104230546.GA18977@p100.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Provags-ID: V03:K1:imjKfPqUU4lk0EnsME9I0mV0T+M8ZqHRYEYy40iO03bs4nRRZDU
 QHyig3UZIjtJwxBX8XoKj9WU5Eg6cZKtDvvsAB0zxfKssn/sGIym9RcteRTMqp0qi6baOYB
 KeQblCHwT02qJ0XSjSTOIuNWW++mpinilA6Btl1WLVSyeUOFOrnMgr8vLcqZgquk8kshINZ
 iRADI80BrlwK3e3cveHIQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1LVdfAfViLI=:1lO3jBKHvjUwpsil4AXfk5
 m3olhFRf1dQhZNwD3P54R2hv52mmUE9vxq9cJZSk6yzGZG3MCXWFAh6Py6SfNoQulmaYqcOS8
 xgZI6r9FpldJKqoRXjk7hYfwt2IcJe3dAcZetGdvhhrCR7quYQUkLKC9nmLBCgahDFaGcwzZy
 +s4aYL3FlgY7qShuECTbyNcez+QAW3IIwZv/4OfKbbKcAhCi/87Ymu3WoYP9+hLaI0NsX5LMz
 AiJJ9LdEVVsi9emJGVy4sA4bfUo/umqxFwgs4X6KNjMZmhIl3qv+pVLh5KiyF4tLAztAXomUL
 QKwd1JpzynhmAhdR1V6P0Z9/GsvdzZBP92GvgS0Veu9sJ5efUK0w8jqy8Y5rorR69o24TyFaK
 CKEXOUTH8S+EE7NnZ2w+KVIwPImOwckgyGOGkOr49uxeJij60k8Vfcb6cM27iZwahh/2mX+jS
 OmP2vC37Bo/kEdXXEJTNko0Vsw0FTOBErWaZoR+5oeyX78u4eggGk7DxBuFdLWzREMxoxpMw0
 Fy/XrHW1UaJzaL9Ia0qJzTEnziJD6/azbdPRT8k3ZXj+kk+ZYFZHuiZtJbcVHdz5A466swrnE
 8YUmh9OQPT7+zzHCNxj/p0r+l65cGlpSNI5LGaLrlnWvr8LI6EGxXYCa6NOapIHA9a5UFayti
 pJTQbxIbM6bywKUCigpQrgH63LuIatxNI0rzaPWnut5CLKoOA91/Jd0x8+VX77hAFsFpqLBtm
 Mf9AN1s4WXccCNCDGu8H6pFBq1iy/8wBh29e8zcuawOx/twSgY6kVLHR6BkcRiYbtZQhkmMwl
 j77WSHDG8Z41VuJqfussk2zLgX99rpy7y8V8DD9YbKseceCR2BwFwI0m3SAkt13+iIKRaqa8i
 cNl1KW3nz8Qq3ZNIPQVL2rx5fZ1YozreZzojbbPgc=
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On parisc, each IRQ can only be handled by one CPU, and currently CPU0
is choosen as default for handling all IRQs by default.
With this patch we now assign each requested IRQ to one of the online
CPUs (and thus distribute the IRQs across all CPUs), even without an
instance of irqbalance running.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/irq.c b/arch/parisc/kernel/irq.c
index fd6d873..04e8755 100644
--- a/arch/parisc/kernel/irq.c
+++ b/arch/parisc/kernel/irq.c
@@ -117,7 +117,10 @@ int cpu_check_affinity(struct irq_data *d, const struct cpumask *dest)
 		return -EINVAL;
 
 	/* whatever mask they set, we just allow one CPU */
-	cpu_dest = cpumask_first_and(dest, cpu_online_mask);
+	cpu_dest = cpumask_next_and(d->irq & (num_online_cpus()-1),
+					dest, cpu_online_mask);
+	if (cpu_dest >= nr_cpu_ids)
+		cpu_dest = cpumask_first_and(dest, cpu_online_mask);
 
 	return cpu_dest;
 }
