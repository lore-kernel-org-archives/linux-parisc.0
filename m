Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BB02C9D;
	Sun,  5 Jul 2026 21:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783285855; cv=none; b=rWExxD5be5rtU8CDSefx2jyK+yrH5F1NjCHKSRAdxk9VEP0n29vZ2mXYwY4XvC0dgysbFNUMhSLDKCvMYWRs88LSblibeBfSdO2S0rRClyRPr7XdscUOtesKhnKYSJWg3ETIIG/Py/ki8QIEN5bhYbpQwybiUFZ3+4kBeXMtp+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783285855; c=relaxed/simple;
	bh=G7Cbr0jGNqJqCD4YpEpXCq4ZiHm/GzYfU4tP9mTrrcE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SqGx9q0e2jsIPKGW2hpdJSm7jWFz/LdY455pzcB24RK0GkMt/06HAzeI84x8F3zN+0iedP5C8+BRqkHG4luj7zGfE/PEVV6MjphU41G5lAb1xmp3YbngBgHJCFzohM1GrE2SeGIEeIix8oj3qXkcYMtRW1KWN4iqDEhIkOAHNbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=hHv6ilBN; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="hHv6ilBN"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 77B95C2A88;
	Mon,  6 Jul 2026 00:10:43 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 77B95C2A88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1783285844;
	bh=+krgGADGayuqpJkFzoU47G/YcyZfwCQuxzbIud/vEiE=;
	h=From:To:Cc:Subject:Date:From;
	b=hHv6ilBNBJ5q0dWEsd3iVh9w0ohB4Ug1PU5qw42tb0sdUoXO0O9lb7NoYT2karZm+
	 r1iHA2sRhSWlpMhQOZ7nyPN+j0pbsuWtl3ZW+KS4sGBaHgW/b+VcxHwddLDg5gV85e
	 ZSjlwq/ZrdPzq+5e4EHoX5C/tx8fTk/ETxlI4Kt8dkG0wdQPvVawEmyOeRdfbtUJxa
	 aCCtvXAxSxMzSdPRz0Ese2K0+fzcH8rZrZfVt0RrnF43j1mXcSCvXI9bbHPN0fJ1Nm
	 LncNyUClMyHO9G/HMnkphfwhBE4oCMi6tnPK9MsURG+hBQ4jjKZoUVf2vR8JdTAD2B
	 UC2xzRuQhncWQ==
From: Radu Rendec <radu@rendec.net>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Thomas Gleixner <tglx@kernel.org>
Cc: linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Remove unnecessary NULL check of the kstat_irqs field
Date: Sun,  5 Jul 2026 17:09:49 -0400
Message-ID: <20260705210951.2717741-1-radu@rendec.net>
X-Mailer: git-send-email 2.54.0
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

This series removes the unnecessary NULL check of the kstat_irqs field.
The first patch addresses the generic IRQ code, and the second patch
addresses one isolated occurrence in the parisc code. The first patch
also includes a more detailed description of why removing the NULL check
is safe.

Radu Rendec (2):
  genirq: Remove unnecessary NULL check of the kstat_irqs field
  parisc: Remove unnecessary NULL check of the kstat_irqs field

 arch/parisc/kernel/smp.c |  2 +-
 include/linux/irqdesc.h  |  2 +-
 kernel/irq/irqdesc.c     | 11 ++++-------
 3 files changed, 6 insertions(+), 9 deletions(-)

-- 
2.54.0

