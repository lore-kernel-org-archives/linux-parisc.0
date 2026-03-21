Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44F2346FA6
	for <linux-parisc@vger.kernel.org>; Sat, 21 Mar 2026 05:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774070397; cv=none; b=ipnxSjXMQy+MSZsQaYJZC3jEfUHTHx3EtsS6nXDwjBOTprRzJbv7aMChwrVvhg/izK66+Tc2U52Yjtzh8t65g4KRAruiPAKeE990Wmb0Tx3u64xEYFSL5kWnw0qOVxiD7OUZZq9DKx2diy5L//DWaMjXD7gQS6l2W+l7OhIO1VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774070397; c=relaxed/simple;
	bh=GBqnSW9uq89sCfuA0J6JSy8lRk9vTD0tsuanrzAodm0=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=nWj1J4/vUTxqSXxwU3qWJsA9o1P7rG8Mq5N0yzlfZXmx3B7LeZCYAazBmQ3SBfLDLPIhln3BoI00C+CUKAlC5ZJhmgktFVTgiHLOh9g0+wh5n6GXsmt7jSs/1kNe+hX3WK4NUMnHnzXd78/fqOibpe942hc6TSarXK9JOrmXXFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NiWmc/3g; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NiWmc/3g"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2aaf43014d0so16300075ad.2
        for <linux-parisc@vger.kernel.org>; Fri, 20 Mar 2026 22:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774070395; x=1774675195; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N5slH90cGMNQaJ/nUAO66vR2HM7xhu3omBUy3YIB1Mo=;
        b=NiWmc/3g78YJ3IIOQKmn6Kw0P2JnH5XPXN8IGFgqB38AEiQjp39KqmoZwYkmt+95ll
         vikpnSOFcMpbj3rsbfQq6BC2xgnlo5c8d8nr7iuPfHxqMKffbt97tJZz7SbyxXmFtbyU
         /Tz9PQeAJ1W/CjxmbMGKqGiCJAEH7xTXWoJyWVyWZgsFixVDXhZaKpghttKAc8NO6ZA6
         U8/fG3+LS2SbdS29Z9Akr0LnK00hsGBnRNExnuWFLFhLlxY9G/dDi7qkkuMa6PAW8vB/
         FmJ70tr2Va5oZZUuX/qO6ZUZWbjAkzMEYy8FwaPKC6msAmsr5c8FO9isD5voU//faGif
         pPIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774070395; x=1774675195;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N5slH90cGMNQaJ/nUAO66vR2HM7xhu3omBUy3YIB1Mo=;
        b=WyTkRMbkFbLfDIJy/dFbCeGtgWnRZJ8LyqkAIAEc6vLoRienYxKhKZ4QdBX2NTFOpm
         O21EDzCiAcniIquIpeNA+otKxMrpss0GFR4w1HxZNEFRdeAnNBkE2sfWspr3awxBJm6t
         6NeomIFPEBkC7yuXMrTgRVfAUhwBwEtxTKA5mNSO6j9mj3OzlizZCbMnTgyuDQLinNd/
         ai1e+wzda4rZZjGzTJ4lWT12Gm/8hkdCMzkY7SWPO57T03IDhLwy4UHJtgSBT40Pv09A
         ej4p4ANu7PtjcVdufQpiDtct7CTxAzC9Uxrzvt6pLMfyMUSMt5Mdlj9zC6lNiw1HKdU2
         6Pew==
X-Forwarded-Encrypted: i=1; AJvYcCULvDV+bQ20jRxtGdCsem5+dur/ilm+6GMoiYGFjGkip/u90ZE0rS6dlA6aF1utUYelPs/OOa7gcPmaqnQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1G5PlpukLIbiMSBD+J5wNrJfrX5pLfwWc+HRi2oR3lOI85uJ1
	CDCqPWUQyNphjx7jIIPPKV387BcLfLo+vv0Knvufd1SlChi7awb5AdRG
X-Gm-Gg: ATEYQzzBwf7ziCI8nPuNrxYkpCe+g0gCkcpASzOmox3+X+ylhTkH/FyOXLkQhx9S4dO
	sHwgFbPPMOQEIAJxEKzAxO8QZhw0XAUJsLwTBJD4/joG0gXM5VkUjCUvTK3/H4x8FGsLoEOVckF
	WfsVHTXr4BBrxS+apZMNhq5qZOGM8aBLqbuKUKOV4bYmUQ4kxiyw7um5HqN3PoYDAyFxZL3kjUH
	M9beZsBLQXBzNMs8wGvZYiDTxBjmAUkVfcv/xC0IGNf/VgQixSx20o2sa6qrNqUne/vBifT4UMc
	CHULJW0/lp15EM83o0jznNDRv8DGPDLuNb9KA0kthFxK2s5vYXJA/v6bIFazGM9/P3MlxRRkGrV
	OszbcN/65SJ1vrLJofLa6b95NvK/16RamF6FUIk/REh8f5GoqLGUT0ARfoKEDP7obNsUnGHVmYy
	dF5QEX5+hvAAooXuGUxRCYig==
X-Received: by 2002:a17:903:191:b0:2ae:c984:6d72 with SMTP id d9443c01a7336-2b08271e23fmr57382855ad.22.1774070395090;
        Fri, 20 Mar 2026 22:19:55 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836955dbsm52944385ad.72.2026.03.20.22.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 22:19:54 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org, david@kernel.org
Cc: ljs@kernel.org, Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, baolin.wang@linux.alibaba.com, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, open <linux-mm@kvack.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] mm: change to return bool for ptep_clear_flush_young()/clear_flush_young_ptes()
In-Reply-To: <5d24b34d8b7860dc2188408b3fa530193bcc5caa.1773890510.git.baolin.wang@linux.alibaba.com>
Date: Sat, 21 Mar 2026 10:48:41 +0530
Message-ID: <fr5tyd3i.ritesh.list@gmail.com>
References: <cover.1773890510.git.baolin.wang@linux.alibaba.com> <5d24b34d8b7860dc2188408b3fa530193bcc5caa.1773890510.git.baolin.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>

Baolin Wang <baolin.wang@linux.alibaba.com> writes:

> The ptep_clear_flush_young() and clear_flush_young_ptes() are used to clear
> the young flag and flush the TLB, returning whether the young flag was set.
> Change the return type to bool to make the intention clearer.
>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>  arch/arm64/include/asm/pgtable.h             | 15 +++++++--------
>  arch/arm64/mm/contpte.c                      |  4 ++--
>  arch/parisc/include/asm/pgtable.h            |  2 +-
>  arch/parisc/kernel/cache.c                   |  8 ++++----
>  arch/powerpc/include/asm/nohash/64/pgtable.h |  2 +-
>  arch/riscv/include/asm/pgtable.h             |  4 ++--
>  arch/s390/include/asm/pgtable.h              |  4 ++--
>  arch/x86/include/asm/pgtable.h               |  4 ++--
>  arch/x86/mm/pgtable.c                        |  4 ++--
>  include/linux/pgtable.h                      |  8 ++++----
>  mm/pgtable-generic.c                         |  7 ++++---
>  11 files changed, 31 insertions(+), 31 deletions(-)

LGTM. Please feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

