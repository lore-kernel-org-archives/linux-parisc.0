Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3252325F7B9
	for <linux-parisc@vger.kernel.org>; Sat, 21 Mar 2026 05:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774071108; cv=none; b=Xbq43VhJJ2MkQ3bQRqBv9TF5tsFkjH9IGhAjYnyUll13Ws3hM1BEsU8s/UGtkari55coLr4tRiLHFW7ZlKoADTYHe3EP9FePLlVLM4pRBkJaUjauvBPBxFnqAKctriF5uL1BeD3W0JUO8FJ4fnUmTOHv2suaEM5z2hGDrz3UA44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774071108; c=relaxed/simple;
	bh=abKMir+lamm2r9MN/XOMbOWIQ8gV1sV9mmmdzJ37hII=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=ug3jIqC/KH5McLCd0fxyXI/F8o87GdsBhDw7Mfe1HMAi/H+IKAiJDM+b/gcR4T+cBUVv05AnaiQpkveifqPnQcsGqjCEQEatNxmYRiCz1XjBXUExUCYDX8GyL07+XbI2fKiSJ4RYi5Rl7wbZpD1oUlPrKZLbMTbjDff27Klrp8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XGH8zaZQ; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XGH8zaZQ"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ad9a9be502so7658885ad.0
        for <linux-parisc@vger.kernel.org>; Fri, 20 Mar 2026 22:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774071107; x=1774675907; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TSrGnm4uwHURRo/Dbgx7AVRGahiZ5mij0ljFmYODkAo=;
        b=XGH8zaZQrkG8CxSUC0S/lM89XV+r6xihax+TPodNKQ4/H8OknJNAK4sZeZ4rEELerS
         nYbTdeslhHS4hfpwzbNeSVNpfumWm1ArfIgqt2w45xgbCuqLzpZAVEdHnHp8dbZRj432
         rlc2pkSmjTMLdcZ3IO+B5ENhMzDs5KkjML5DZ5KIJxdmcdm/GzK6mnYS5EM0hKzPoSC8
         nsrNANIY+exs/Pq5NgIcNq8M1awh8YlsMVjnA2/VCm0UzHWcnXStKbkOyzZUaRKkVdKU
         Y1KLL6B7OznEnrfK7cfOQoKRSROOycEfWY20NQQiqBsMuNBNGKZD7xKNXHw3pz/HfWBf
         mAlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774071107; x=1774675907;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TSrGnm4uwHURRo/Dbgx7AVRGahiZ5mij0ljFmYODkAo=;
        b=neyA2s624oXIPFonwX1juAWRgNKQICR/guYNzP+RScCTGuH1GRB8ROrfG5vC+IN6CH
         sklVGlj73gW/Y4aMPMBKszbPA9Yy7Z3T9gHueLHnSoqD5Lj8PIJqWqoMq8ryh7WLZCoB
         U10sEwPcX90SD4Jf45CbTJTQjj498z6sGbLIry2Ckt3ygE4QBhnKkd03S+t2nAM34naS
         oJjLJMddmoKeKNFD2/7h3jyBx2kloqM4UgkQl1RTh/TnT8IK/n+7qOuh4Pc0w5CzG3qr
         PJ74IMC+clFZySTFX9tufgNN6cFo+IP6s1rKRajVWNexOwtcJ5n97C7HBCVI1ew8/+y6
         xByg==
X-Forwarded-Encrypted: i=1; AJvYcCXVZLbofYkLE7iO+v/83YqLOVMV4og+eeN723e0AncI3hbZPkBTpR7HuSEPnkbDzYlcy5R6+x/SJ5Ia4GM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4R6+g5KQBUpTAAydgFZSOl0rldn35X0VP3CSG4dyOXr+qfQwQ
	r76QwX3GnVbTdCi6rlgJTxiPPOFqX5FZ4sdBdKKEEJzsuSnLpHIrqcSQ
X-Gm-Gg: ATEYQzyZx2JC/+5MElcDzeYMYBZBHJd/UeIKp8ydOXEtjYH3IHFjFgCW0VRY+OCAVrV
	sWikScWABfK+wQ/zl2PaNQ56Bn9HZb7Du1eLvSR37ZWvCajiMsdUnhdzgH8VckBhF6gjwYghS8I
	ml1CCKLZubSaseNnyfocHtJ1rruceVSQDLa6f46En6mFLi9GWfohclKnf7qCI58k1lfS/n7Vl23
	MYKvYOxiyBC0y3ON4m3ZWq6asqHha3yfCq7opld0I4OdlwAG4wZlHR8r4Biv5IFer9OWL/J5q97
	Lr0YEL5kqI3Jm9G6hevCJgx+M+s3JKOlqr1r6TolNHvNAuWFGqdQwvEMUADEYcI6Mp/K4XSNo3c
	JIWLs9iPSexZ8oEiE+1/cCZmatktiNk08XqWyep2YI9/6yEPKLNRs+Oq0Xs2GFyvlxoRRfu4P2i
	9i+ZH4Iuuh5JPZ6j4I10nkjg==
X-Received: by 2002:a17:903:191:b0:2ae:8272:deb0 with SMTP id d9443c01a7336-2b0826feb3dmr54931105ad.15.1774071106610;
        Fri, 20 Mar 2026 22:31:46 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516aa6sm55638395ad.9.2026.03.20.22.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 22:31:45 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org, david@kernel.org
Cc: ljs@kernel.org, Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, baolin.wang@linux.alibaba.com, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, open <linux-mm@kvack.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] mm: change to return bool for pudp_test_and_clear_young()
In-Reply-To: <2711ec4bf6c30182004e34027fb31a2e8e24749e.1773890510.git.baolin.wang@linux.alibaba.com>
Date: Sat, 21 Mar 2026 11:00:45 +0530
Message-ID: <cy0xycje.ritesh.list@gmail.com>
References: <cover.1773890510.git.baolin.wang@linux.alibaba.com> <2711ec4bf6c30182004e34027fb31a2e8e24749e.1773890510.git.baolin.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>

Baolin Wang <baolin.wang@linux.alibaba.com> writes:

> The pudp_test_and_clear_young() is used to clear the young flag,
> returning whether the young flag was set for this PUD entry. Change
> the return type to bool to make the intention clearer.
>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>  arch/powerpc/include/asm/book3s/64/pgtable.h | 10 +++++-----
>  arch/powerpc/mm/book3s64/pgtable.c           |  4 ++--
>  arch/riscv/include/asm/pgtable.h             |  4 ++--
>  arch/x86/include/asm/pgtable.h               |  4 ++--
>  arch/x86/mm/pgtable.c                        |  6 +++---
>  5 files changed, 14 insertions(+), 14 deletions(-)
>

LGTM. Please feel free to add:
(assuming you will anyway kill the unwanted externs)

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

