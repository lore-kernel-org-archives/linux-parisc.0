Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FC0264A9D
	for <linux-parisc@vger.kernel.org>; Sat, 21 Mar 2026 11:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774092710; cv=none; b=Iy1hLmHoCESpVBQYZyQBdcupqw/Pd8uJ0M/8YJwGjSRsYxJ0cqb4OGz8mudh5QyFfXXuM2Poq1nAztmOGVzphLlf8zQLx1Rl44sTxniLZcn0tzhzVyZYPctPiLoaalbvG4rQnYY0yOdciAXBrUIq3Ik73YPq+qtG0/lp43rBwFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774092710; c=relaxed/simple;
	bh=O9pB72vrBX8PrJJAn3TXWDHDCz+2eycvV9Yxy00dM1Y=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=S82FDtLuO1HwpEe7u4uzamdEiAJITN/17HDPnz7ld2LNe8Kof0ygRTDP3hxjlLIKjjoyenubeHrOQG1QGgTMZ0hFMZHot3HFaLJaM0KGZefA5BbRyjDjyh9VH1CBQBuWT/s5kHh13z7TdedAfY+/yh1puLXW8ZK+YYmTNXoMX5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j1uueidt; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j1uueidt"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-824c9da9928so2841384b3a.3
        for <linux-parisc@vger.kernel.org>; Sat, 21 Mar 2026 04:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774092709; x=1774697509; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YYdBjs3g/NRwIzC77+RdwYjMCfy82DXerPQVEC+RqG4=;
        b=j1uueidtzn9z2lFeOSZj9NmrsqJ0hCPPVymRzyiABvRf/QdMSmifG7TdntIqqnU1Aq
         /YzW/DU0ryT2C2qRNhAdEYIBRH0+lX4jd81nw4LSgWkMNTzk5DXkeLHrBnznU7jq0Iwb
         UufqkGuu2z00vHl2Qg73bF3psD1FpMEWLPj+lohncShyY1o4xiT7YKDEJl02WSG5Pjtw
         MhesvvMY6H974EIaXBpCLmK4JyZ6IOW4OXvAgY4RiSYoabLNXUpUjBdEAgFMARCMP3sV
         xGAarDuxBqQMAYiRtbd64t9vr482pFzXaGI6exFR0mc1du13zmM8RG8c4vPpyJtGs7Hp
         T1vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774092709; x=1774697509;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YYdBjs3g/NRwIzC77+RdwYjMCfy82DXerPQVEC+RqG4=;
        b=jgethl7qDm8D7ONpzYZuiKkaoCAcfjYGFHjo1SY82WfuAd84cWlizYCJVqqZE/ZpZB
         tBFtMViDVo8HRs3n6RvHjM+Mh725Uxt2priq1vA8p9bfUxd/mnGF3b6/jgMIk/jPLv8r
         w2mvtxw51pEM8zQT6lVvemjp1IksiEAHvlDsb4J7/PA1BHEry8qKfXq0Yxhuw2siBnzp
         cOSEtG6vXRZmztaBWvp/KfL5sJDshHtjqNzK5HrkrX/bxC81lx+W1OfGhZAvNJJEY69n
         Ii/ONhn0COh0vxQtI6QfPsqpyAEAq+cFKNJb5pDy9ZBKrSA6WjErIyfEQOONORXd7Z3f
         zp5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXXS6A90vg/1Ps6SktiPtqRMNtOsej17I3d8oGACosDW4eseq0umY6E/wKpi+1KG9e05yib0tsfCR38WsQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbaillWDQ4WRZ48smXqehMmPC/x7H8y/v6ynAdsFUC1my9Cr+5
	NSghEW78QFitjFTX9w7ktgoJb27dagKHFLX4OOtn4F7relnNjHxe9c1g
X-Gm-Gg: ATEYQzyn2Bk/PAMMfRLdTWnLGC7sfYO6HSJoSNdOScbvkS+H1kn5ZFW+KYANf8WOIem
	eyVE3ADVbJDE2CIMybWSWmEdLbyRz80vvGWuMv/Q/g2vgKNxPcPsnFdHUtMVHBE9AHbeCj8JKkP
	9xPAK3VRiGlMCk9+zKq7tV/cTFLKKxDXGn60wXqmQzpUyxxFWILjPx7i7qcmBb4vuenSU5PR/Kk
	vl6F5rZ7UOWQ0pbudzytSWx2L9Em3RszKnxHH1DrMxG2luWFIgHLOVPZxHSDEpQ+EF17dfERsGC
	92hwG2iLQpQZ49AIOtjF/sM0uTvIfpzi6T3GyU+Q+JpSZvdzAteVr4Nv/cws3567G+CqiPcTNnG
	rg7MazHhcmi9eIWCjSY8KS+jXUVFEbBrFF6sZ66o6/FKxh6G/focTMqQLc7zqZEr8rJtcIwh4pl
	iElYZCgk8meC+zKHN+S1+t7w==
X-Received: by 2002:aa7:9e8b:0:b0:82c:21af:a7bf with SMTP id d2e1a72fcca58-82c21afa908mr2465482b3a.13.1774092708761;
        Sat, 21 Mar 2026 04:31:48 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b04220d9asm4159044b3a.60.2026.03.21.04.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 04:31:48 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org, david@kernel.org
Cc: ljs@kernel.org, Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, baolin.wang@linux.alibaba.com, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, open <linux-mm@kvack.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] change young flag check functions to return bool
In-Reply-To: <cover.1773890510.git.baolin.wang@linux.alibaba.com>
Date: Sat, 21 Mar 2026 11:01:56 +0530
Message-ID: <bjghychf.ritesh.list@gmail.com>
References: <cover.1773890510.git.baolin.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>

Baolin Wang <baolin.wang@linux.alibaba.com> writes:

> This is a cleanup patchset to change all young flag check functions to
> return bool, as discussed with David in the previous thread[1]. Since
> callers only care about whether the young flag was set, returning bool
> makes the intention clearer. No functional changes intended.
>
> Ran mm selftests on Arm64 and x86 machines, and no issues were found.
>
> Note that I only CC'd the arch mailing lists to avoid disturbing too
> many people.
>
> [1] https://lore.kernel.org/all/d172d6bf-c60c-4cf5-9da9-f30de38cdfed@kernel.org/
>
> Baolin Wang (6):
>   mm: change to return bool for ptep_test_and_clear_young()
>   mm: change to return bool for
>     ptep_clear_flush_young()/clear_flush_young_ptes()
>   mm: change to return bool for pmdp_test_and_clear_young()
>   mm: change to return bool for pmdp_clear_flush_young()
>   mm: change to return bool for pudp_test_and_clear_young()
>   mm: change to return bool for the MMU notifier's young flag check
>
>  arch/arm64/include/asm/pgtable.h             | 29 ++++----
>  arch/arm64/mm/contpte.c                      |  8 +--
>  arch/microblaze/include/asm/pgtable.h        |  2 +-
>  arch/parisc/include/asm/pgtable.h            |  8 +--
>  arch/parisc/kernel/cache.c                   |  8 +--
>  arch/powerpc/include/asm/book3s/32/pgtable.h |  4 +-
>  arch/powerpc/include/asm/book3s/64/pgtable.h | 26 +++----
>  arch/powerpc/include/asm/nohash/64/pgtable.h |  2 +-
>  arch/powerpc/include/asm/nohash/pgtable.h    |  4 +-
>  arch/powerpc/mm/book3s64/pgtable.c           |  8 +--

I did compile and boot test on powerpc with various configs and overall
it looks good.

-ritesh
