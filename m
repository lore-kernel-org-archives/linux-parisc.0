Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5039D2C9D;
	Sun,  5 Jul 2026 21:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783285892; cv=none; b=VhAaCxFLov10Zll0fwbRjNzyg66wFo+3x5X6H6CHhGk3Yv/Ll+Vm9z3lUM/Y7hRbavRcv1m+LK828uyFVWTvEpMWl0O7R2FruDShVRV5hLNR+9YZ6w/4G7rc/ocq1/IsNl+CJTg2jEreu0lq1ybzVg1EPgZpLc2aJ3ol3U0VgqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783285892; c=relaxed/simple;
	bh=zGc4OJVnY2KhcBf7+0FJPTFmMaWpgjhZsk2ZqEnHR6g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CUSGnR0RZQcG+ATdNr77xEe3VlwwVGX4sUboHRs3S1Cr2/PtFUK0/QtMEuz1Ga8TBzj2sX1zp/b5i4Rw6y99EDUvL++kGcIUft7wNjYP9V6BAyQNxfxTWFprrbmCPlu5jAB9jMQ30jV0ULR7nkHOztv2R7hXxd+bgtFeG67NqWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=mUhQP5vz; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="mUhQP5vz"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id D3606C328E;
	Mon,  6 Jul 2026 00:11:27 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro D3606C328E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1783285888;
	bh=Cs57aQ+5MvLGJBf1qjBY3RX1sH1PhcW43vwtBnfdhUc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mUhQP5vzwWfsTOPCgcZ5bsZ7e+shwA1+Mq91lVEEIw1EuOtMtPs2rBjRPmQaWAyDD
	 AtYqDEnEnutnnqwLibjypa/6ZTyPXP8osnXD+xMf3nfoZ+S+kJGdmL7ye9pOT+mK7r
	 7NUJY3N06iVywO7OFjYOgJBl0xshx+d5uYLGig4qaFDBYMlrW553hstt20I2dUgg0p
	 2bjSfg3u3/ywd43dor14LrFDUUE8iVVNP/ZzB3vgeVZin9A9kSpFKY4f8B9yeM6It+
	 K+Cin2//LxWlIV9ii4nzyBn0xw2xo/2zZggFzmmATsRFQt8npuAcHasp50qf6r4K0N
	 83uK9a2dTnFfQ==
From: Radu Rendec <radu@rendec.net>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Thomas Gleixner <tglx@kernel.org>
Cc: linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] genirq: Remove unnecessary NULL check of the kstat_irqs field
Date: Sun,  5 Jul 2026 17:09:50 -0400
Message-ID: <20260705210951.2717741-2-radu@rendec.net>
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
descriptor (with a caveat - see below).

When CONFIG_SPARSE_IRQ is enabled, all interrupt descriptors are always
allocated dynamically via alloc_desc(), which calls init_desc(), so in
that case kstat_irqs is guaranteed to be non-NULL before a valid struct
irq_desc pointer is even returned.

By contrast, when CONFIG_SPARSE_IRQ is disabled, interrupt descriptors
are allocated statically in the irq_desc[] array, and kstat_irqs is
initialized implicitly to NULL. The per-cpu pointer is initialized only
later, for all descriptors, via start_kernel() -> early_irq_init() ->
init_desc().

The kstat_irqs field is used mostly for printing interrupt statistics
(i.e. reading /proc/interrupts), and that cannot happen until much
later, when user-space is fully initialized. So, there is no concern
with that use case.

The list below includes all functions where the NULL check is removed,
along with a list of all possible call chains and/or a brief explanation
of why it's safe to remove the NULL check in that case.

* irq_desc_kstat_cpu() [include/linux/irqdesc.h]
  - All direct call sites use it for printing IRQ statistics.
  - Indirect call site: per_cpu_count_show() - also used for printing
    IRQ statistics.
* kstat_irqs_cpu() [kernel/irq/irqdesc.c]
  - Called by sun3_int7() and sun3_int5() [arch/m68k/sun3/sun3ints.c]
    These are interrupt handlers and cannot be called until their
    corresponding interrupts are initialized in sun3_init_IRQ(). The
    call chain leading to that is:
      start_kernel() -> init_IRQ() [arch/m68k/kernel/ints.c] ->
      mach_init_IRQ = sun3_init_IRQ()
    The init_IRQ() call happens right *after* the early_irq_init() call,
    which means the descriptors are already fully initialized by the
    time the interrupt handlers are even registered.
  - Called by show_interrupts() [arch/s390/kernel/irq.c] - used for
    printing IRQ statistics.
* kstat_irqs() [kernel/irq/irqdesc.c]
  The only possible call chain is via fs/proc/stat.c:
    stat_open() -> show_stat() -> show_all_irqs() -> kstat_irqs_usr() ->
    kstat_irqs()
  It is used for printing IRQ statistics.
* kstat_snapshot_irqs()
  The only possible call chain is via kernel/watchdog.c:
    watchdog_timer_fn() -> is_softlockup() -> start_counting_irqs() ->
    kstat_snapshot_irqs()
  The watchdog timer cannot fire early, before early_irq_init().
* kstat_get_irq_since_snapshot()
  The only possible call chain is via kernel/watchdog.c:
    watchdog_timer_fn() -> report_cpu_status() -> print_irq_counts() ->
    kstat_get_irq_since_snapshot()
  The watchdog timer cannot fire early, before early_irq_init().

Signed-off-by: Radu Rendec <radu@rendec.net>
---
 include/linux/irqdesc.h |  2 +-
 kernel/irq/irqdesc.c    | 11 ++++-------
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/include/linux/irqdesc.h b/include/linux/irqdesc.h
index 8080db17c1b1..779d6023c5c2 100644
--- a/include/linux/irqdesc.h
+++ b/include/linux/irqdesc.h
@@ -146,7 +146,7 @@ extern struct irq_desc irq_desc[NR_IRQS];
 static inline unsigned int irq_desc_kstat_cpu(struct irq_desc *desc,
 					      unsigned int cpu)
 {
-	return desc->kstat_irqs ? per_cpu(desc->kstat_irqs->cnt, cpu) : 0;
+	return per_cpu(desc->kstat_irqs->cnt, cpu);
 }
 
 static inline struct irq_desc *irq_data_to_desc(struct irq_data *data)
diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
index 80ef4e27dcf4..3a818f07a101 100644
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -1004,7 +1004,7 @@ unsigned int kstat_irqs_cpu(unsigned int irq, int cpu)
 {
 	struct irq_desc *desc = irq_to_desc(irq);
 
-	return desc && desc->kstat_irqs ? per_cpu(desc->kstat_irqs->cnt, cpu) : 0;
+	return desc ? irq_desc_kstat_cpu(desc, cpu) : 0;
 }
 
 static unsigned int kstat_irqs_desc(struct irq_desc *desc, const struct cpumask *cpumask)
@@ -1026,7 +1026,7 @@ static unsigned int kstat_irqs(unsigned int irq)
 {
 	struct irq_desc *desc = irq_to_desc(irq);
 
-	if (!desc || !desc->kstat_irqs)
+	if (!desc)
 		return 0;
 	return kstat_irqs_desc(desc, cpu_possible_mask);
 }
@@ -1038,18 +1038,15 @@ void kstat_snapshot_irqs(void)
 	struct irq_desc *desc;
 	unsigned int irq;
 
-	for_each_irq_desc(irq, desc) {
-		if (!desc->kstat_irqs)
-			continue;
+	for_each_irq_desc(irq, desc)
 		this_cpu_write(desc->kstat_irqs->ref, this_cpu_read(desc->kstat_irqs->cnt));
-	}
 }
 
 unsigned int kstat_get_irq_since_snapshot(unsigned int irq)
 {
 	struct irq_desc *desc = irq_to_desc(irq);
 
-	if (!desc || !desc->kstat_irqs)
+	if (!desc)
 		return 0;
 	return this_cpu_read(desc->kstat_irqs->cnt) - this_cpu_read(desc->kstat_irqs->ref);
 }
-- 
2.54.0

