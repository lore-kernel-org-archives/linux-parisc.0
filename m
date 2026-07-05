Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B822C9D;
	Sun,  5 Jul 2026 21:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783285905; cv=none; b=miyVxwr4iwhMCYX/mvQ+ZVfPPqaOqzMsiztwp7ZfoYx3mQ2bGpZW5pAHp8+BmjDS8Vi41kShIepbQBUnTFLb+iWG9lq1OXJoY4g60pc+ZzLbhLGPx/HtcFqQlFVYzrRQnAvJFpkl8oen26gMuiMM8/fI94h1jdIZv859j7f6TAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783285905; c=relaxed/simple;
	bh=m9O+QO6CRocr8xpVAL65Mv0Tf4QGTqelClcvZolADd8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vyt1DDk9QHB6NUOVdXa1pdv9TzsX4xT6/glIoFqZMLbdlMp/JsvmtDHxcE9Zfo1LEsGvTQf8Tya1pxseXPVKEkzKqMEt6AiMFarQItUTZAKtRUp28HiZwojnwHzzVnnDPUsiNmjdqxU3QdJ5HQU3AZ5Co0U4IFyzb0yzJ75TXAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=qWV3TMJr; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="qWV3TMJr"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 989ADC32A8;
	Mon,  6 Jul 2026 00:11:41 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 989ADC32A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1783285902;
	bh=6WWcYF+VxTkXBx3v5umEtGyhPZsKEVka8A524q2kBkI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qWV3TMJrdb2mVo0bkpy+1IMwnzAOA5xEcuMtwsiiEvq+PM9xQkhfTHj44Dn7fLcDP
	 QotdJfu2G4LRb6qb6q+v+e+ld6h2/1K30nzO6Ci21Jnc8R2IWJZusKOIet1hew21Ip
	 gcvwq6LZQ7Tx2aDHOApw+deGCqsE5KDWEXoDaTT7hXo+RxTn1jWJcwXPuzlj1UZRZJ
	 9qv+eyiFK7XmwsuQFnFtGmYC0w4y/5v+fWaVuIlr2Uxb4ajqdkMZQFbwkVdMQVlb6H
	 oGfC0zZoPnU8JzpscMBi+VDy7bWXwEHreH1ZlFyZHuJtHFFyPmkuGxSrYcSxsGi/2G
	 xGNVFdrfEuE8Q==
From: Radu Rendec <radu@rendec.net>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Thomas Gleixner <tglx@kernel.org>
Cc: linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] parisc: Remove unnecessary NULL check of the kstat_irqs field
Date: Sun,  5 Jul 2026 17:09:51 -0400
Message-ID: <20260705210951.2717741-3-radu@rendec.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260705210951.2717741-1-radu@rendec.net>
References: <20260705210951.2717741-1-radu@rendec.net>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kstat_irqs field of struct irq_desc is used to store a per-cpu count
of interrupt events. It is initialized in init_desc(), along with all
the other fields in struct irq_desc that need explicit initialization,
and therefore it's always available (non-NULL) for any valid interrupt
descriptor.

On parisc, CONFIG_SPARSE_IRQ is disabled, interrupt descriptors are
allocated statically in the irq_desc[] array, and kstat_irqs is
initialized implicitly to NULL. The kstat_irqs field is initialized
later, for all descriptors, via start_kernel() -> early_irq_init() ->
init_desc().

smp_boot_one_cpu() is used only for CPU hotplugging. On a SMP system,
the boot CPU initializes the interrupt descriptors as described above,
and smp_boot_one_cpu() is called later, for the secondary CPU(s).

The previous patch in this series makes a similar change across the
generic IRQ code in kernel/irq/irqdesc.c, and provides a more detailed
explanation of why kstat_irqs is guaranteed to be non-NULL.

Signed-off-by: Radu Rendec <radu@rendec.net>
---
 arch/parisc/kernel/smp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
index b2d12ab728b1..36be17e32948 100644
--- a/arch/parisc/kernel/smp.c
+++ b/arch/parisc/kernel/smp.c
@@ -343,7 +343,7 @@ static int smp_boot_one_cpu(int cpuid, struct task_struct *idle)
 	for (i = 0; i < NR_IRQS; i++) {
 		struct irq_desc *desc = irq_to_desc(i);
 
-		if (desc && desc->kstat_irqs)
+		if (desc)
 			*per_cpu_ptr(desc->kstat_irqs, cpuid) = (struct irqstat) { };
 	}
 #endif
-- 
2.54.0

