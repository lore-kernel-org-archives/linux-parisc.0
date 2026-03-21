Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C46121771B
	for <linux-parisc@vger.kernel.org>; Sat, 21 Mar 2026 05:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774070774; cv=none; b=Krc3qE8lFlxfWjnImVDdWnXaMMU9V2mmaVj94QcR567wyGFmICJuYPusmi+jN+I9FK38fZuGLV5zOaJJOpPxSqLMF4lVN68qMz+f8owpdNoNdv3+LNj/yWzqntoz4/ZCErsMKRJNUyScPQ1NPC6hqLULfOaDDcL3fZVQ/kP11DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774070774; c=relaxed/simple;
	bh=f2FGYzER/1NSdCgQbZhD8ESSlUAXZ2pKt8ApCgQs+WM=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=MMaNkEj+REuJTz4tEFBgoKqGvRzPf3q1Zv+AzYAKuFaKOuX18U5M9dUj9S3DWge0gaYGpWa6GFsMB2bXn8YzGUTc2RdBY4bMpP5bKAA4XPgco4BLlMZFl4kJf+2KKVpdK8JpX+hGEh3F8wAdvGwoCe/+NUWmD2X84JwzNt2kGHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JH7tK+h/; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JH7tK+h/"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-359fea895b5so1781171a91.0
        for <linux-parisc@vger.kernel.org>; Fri, 20 Mar 2026 22:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774070773; x=1774675573; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PPum4GWetd7qCwPivtEJVV9TkLkZOn6LkWq6BWUPBjA=;
        b=JH7tK+h/GCvkqOclAJkfhMrLNnUCbGlurtpgwVAkbGKK1NNBHm/oQF8C9109HRu/Ia
         3BTmoFxQJbFkT+enKgHAOzANjHQiFAZviYmTO0k2QqiYuqFM67QIlEM08gSLWXHpVwiy
         GP9l1KjNgOIxnxJnDjDskejG3KU4jeMD5e9nfnpjUkITnG19hhmo2W3tMba61Ri4aPu+
         Da3f3TrARpDb1fYTV8OQdBnpCOgZOgWi7gcUqVd8XQZy/DpbZJV4jaucgDsajmYM48cE
         euMZjG2x+AmEgpquGjThFs6H9mo0BeJ7a9o0fkchP635trdPdJvjzEt+7o8vWw+5iAVl
         Qcyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774070773; x=1774675573;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PPum4GWetd7qCwPivtEJVV9TkLkZOn6LkWq6BWUPBjA=;
        b=SpewNjKQvcQ97kgQMqFS7gbIBaY0pj3O7fbyryK0NbGc3o27hEy4cHgT+TdnA15IO2
         WlBJLqE1sbPLt0beJ4Q/BX4lHNyrnnPcYQVvAyDjMhOxxnnn1cVbcltOCEifL7Q37nbl
         uuKm+r6T9jC3IdB9PMF9EzDtWUryt1P1787VERssax7eX0GH/7WUUw0N2JABTB6/+9/v
         JblQQmGZEeYwlClLBwS+opGdz7RchFr5+i3xvdE7qS824sPkVps27Ztu+3cshpqL7Fl9
         VTW5vqK0Lr5lDJCbixM5F+TOS1L9jlvsaVd4gWZRQ2xlX/1wprYRrIgfnuvAJASFVFG6
         ZsRw==
X-Forwarded-Encrypted: i=1; AJvYcCXFbKN0VMIo2tAgof/g4nfk3mjC3C6+CzsHjrNrUoauBD/lR9udha2ax7LywtTCgtJhrT7s5F+7bbii3A0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/sn5Upn+YAiAOg73zjLox1pH51e3iav3NN3C276BMdhedFh7b
	9Zm4F9IF7qm8ogWtErngL9UxM4QVwj58D32Bo7d04Pt00L8k+O/RrGg6
X-Gm-Gg: ATEYQzz8f1WuiWdgVIj0e79VZicmJxFRE3KVWS08gS78+64xaQWTx7pSuSike7aRbeD
	2diPqi4w370W1QaL5vLRxmf3nUI71SL6Y2CTA108i0VWcUCDawXRk532obaKlMYSaHYlwftNj+e
	HjOD1muiCNRpH52BHHQjnWaRhQMU144EVGDbP6YN4dki0+R06VniRVS6FyG8EAyGYAm0NSU9hQf
	JKJR40xFGCSZwxbYYQNMOZ4PnYUc1o2M7vEk4iDk04lagY1FbkuqQdcmuWRWq1sNr5Ch5iLaRQF
	7Utws2pYhG0QDRLbxiIbkgu9Ya2dJwqvO33Lh1TeGaITSwT98ZtRR7MTJUy+tpRvL3Q8EechpmY
	zR3uxI/9UFIsIl4F8rWtRV8P2a/5IqSUzjGXdBLDAT+WYPzrQAEIq51xWHQH9s3jJgknNg7YhKe
	JJQ6REc9FWuyHpi0KGLCZ1fw==
X-Received: by 2002:a17:90b:510a:b0:359:f3b1:6811 with SMTP id 98e67ed59e1d1-35bd2bd5ceamr4620697a91.1.1774070772650;
        Fri, 20 Mar 2026 22:26:12 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bd41347f0sm3299371a91.17.2026.03.20.22.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 22:26:12 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org, david@kernel.org
Cc: ljs@kernel.org, Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, baolin.wang@linux.alibaba.com, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, open <linux-mm@kvack.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] mm: change to return bool for pmdp_test_and_clear_young()
In-Reply-To: <8025b898d0841a4bcbd766998959b4e2ae4d4abc.1773890510.git.baolin.wang@linux.alibaba.com>
Date: Sat, 21 Mar 2026 10:54:05 +0530
Message-ID: <ecldycui.ritesh.list@gmail.com>
References: <cover.1773890510.git.baolin.wang@linux.alibaba.com> <8025b898d0841a4bcbd766998959b4e2ae4d4abc.1773890510.git.baolin.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>

Baolin Wang <baolin.wang@linux.alibaba.com> writes:

> Callers use pmdp_test_and_clear_young() to clear the young flag and check
> whether it was set for this PMD entry. Change the return type to bool to
> make the intention clearer.
>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>  arch/arm64/include/asm/pgtable.h             |  6 +++---
>  arch/powerpc/include/asm/book3s/64/pgtable.h | 10 +++++-----
>  arch/powerpc/mm/book3s64/pgtable.c           |  4 ++--
>  arch/riscv/include/asm/pgtable.h             |  2 +-
>  arch/s390/include/asm/pgtable.h              |  4 ++--
>  arch/x86/include/asm/pgtable.h               |  4 ++--
>  arch/x86/mm/pgtable.c                        |  6 +++---
>  include/linux/pgtable.h                      | 19 +++++++++----------
>  8 files changed, 27 insertions(+), 28 deletions(-)
>

LGTM. Please feel free to add:
(assuming you will anyway kill the unwanted externs)

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
