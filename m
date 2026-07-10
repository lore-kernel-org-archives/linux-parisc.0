Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED22382F01
	for <linux-parisc@vger.kernel.org>; Fri, 10 Jul 2026 19:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783710126; cv=none; b=KyQMw8Lm1Lt4/ns4SjZ7AUlevnKeuLvsu1ZlM50bZSr57aIMn0pDihevD1/y33P59lvKg7Z5WoOJubsziiOXggE/HtXJSdaQ4yq3jrEukrVkZhdxOmuQcF9qJUxh70XrXn93zpsN1qJDoKjnsMVy89WTS7ExERazdYvh0bDb1Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783710126; c=relaxed/simple;
	bh=47yOZh0uL9PiUmgaP7WAHRIYSRvyXRhMxAEwOuVsgWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PEz0i/sOtyyr3+khdj+CibkIagJ6aYraiZOhTwvUof7AjXx0gOofwiClH1WZNbqeqFvVLEe0w9vAK25aygdT4rZJo/C50yncbfUphKATDbsmGK+KZXihPMU90b0OPZLsnUW4VEqSUfRqe8RxhqyLvNZD56CDBP4bpC/JviUrghg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=oH172YNn; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="oH172YNn"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7387ac7d28cso336339137.1
        for <linux-parisc@vger.kernel.org>; Fri, 10 Jul 2026 12:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783710123; x=1784314923; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pC/3U7Ftz6dY/QSNTLtw6DNyhuKVUlnEMcNANT8zsUU=;
        b=oH172YNnx6GWnDOYdxZM6y8FHnAKIdPqf7oJXkxetr57Xa4tKv4mOxQACqBVrRf+p4
         TrNtvoG3knoyv2r6f4V4hm3rw7LiIwWPLx9kqxbSAYBndGtVMq1i9y4MJQEFAITHj3JE
         ncEATNfNHpUUdS+DlXvD+YGnkV/kakQkgSm1Eq33kSSPffPYi+W/Gq82z0IFCZf2dfWq
         4pOCTBQSwnd6GztzMElphzi8I3+RvsEB5BFjdEgYk3G+4W58VnPZUG6/Pe8sWa0rlNQd
         hn5J9NpCpAYrCKikBJdloXAr28j2Hx5wUMxo1GsSSlo4LlI7rhr3pBvD34HYHPoBtGVk
         Twtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783710123; x=1784314923;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pC/3U7Ftz6dY/QSNTLtw6DNyhuKVUlnEMcNANT8zsUU=;
        b=W5z3DeEM8fqG1q1DHYnsjMbD7mYgdZM7DLHFFd2kC6AjEsZmK0ID3XDr6v+q6VOy9V
         ADZ4W80ETXPYFlOX8MCUD8PTVIwTQpSgoeLVHOpsse9pEKQZeAlWaslzrg2Y4FBD8d8m
         JHNvNm+ogIuWffTUVFZ9nZW5hEn3sC/RXMMwSMGk+34kx6+4okoQIlfnyZOtGxLJfJoW
         gTkiE5XDV8b8bCuG6rRRi1UyAI331hD0muVl6HsnFhrXAHZpjPd5qsqyxUPHl+tedEY+
         f9NF6QV/4w3EZ3g18aD6oDTdxImCsKHMyJAB3Hh1M3VlPNHFFY9V5jv48PoePyHNSOsv
         h5Vw==
X-Forwarded-Encrypted: i=1; AHgh+Rr33wvZbwUro05Q1VcEymNssWfyH6nQdit7n1mVsK7tCjdYVqDBjjftutVgAAEQALWd5uSvkxmehOdEEY8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8Q+nHHAclmEkhRmaW0Xyf3dlVOoC4WW8bs82p+pVSUShwjaAB
	yDcabN4f1zTEN02Y7+YoCbcX8/tpLzyab9DG0qqS7dSubvyKTLtTU1p34tSMSh9ply0=
X-Gm-Gg: AfdE7clzjM2nEzCM8NOWLdPt7pIVLOFuCzhMHDggFyC1HssTuYLGeYfNyeYooLeRSJR
	weK16WSHD/4L9YnZyVkX9+Ft5g2GTPGJE9FpqiTRFVNgj69miEkdIzlCQuATAb3wk3wwBViwhwF
	VmsAdlQubj1yokqcpDknaoLpf11YbUiUB0ToMbCYZiixPiTRW621ge6R215qze7FM4n3BwugXYB
	J8TCtmveeLfXsfoid1ljrt/ofIUbi9pcy0iU7/uejahLwNFo6ZLVzWr8a1fhyNd1Ap25ZEQW2o2
	Ech38yGVjF76JXpnakqOP4xHKDEId88QYq7B4/wywVdijR8crOklqzDfJlfRm6mvJZxtSNicR31
	xBMZyjNMZRKtqYbr9eyZoNPkFqSbsGkZMkLfZuRhyTx0pRW6InUrazFgpHqrARYkGimq9pdEsnB
	EHYIV3mtlt2cQTNF7f1QD1IIYD+N0NxOuSAgosxL7YlXw6YE9xJntmBd738zPih3T6+MCU
X-Received: by 2002:a05:6102:689c:b0:739:5f55:3c3c with SMTP id ada2fe7eead31-74533d66217mr325833137.13.1783710114831;
        Fri, 10 Jul 2026 12:01:54 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd56c4b91sm48074036d6.19.2026.07.10.12.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 12:01:54 -0700 (PDT)
Date: Fri, 10 Jul 2026 15:01:49 -0400
From: Gregory Price <gourry@gourry.net>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Russell King <linux@armlinux.org.uk>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Simon Schuster <schuster.simon@siemens-energy.com>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Christian Koenig <christian.koenig@amd.com>,
	Huang Rui <ray.huang@amd.com>, Ankit Agrawal <ankita@nvidia.com>,
	Alex Williamson <alex@shazbot.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Dan Williams <djbw@kernel.org>, Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Matthew Wilcox <willy@infradead.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>, SeongJae Park <sj@kernel.org>,
	Miaohe Lin <linmiaohe@huawei.com>, Hugh Dickins <hughd@google.com>,
	Mike Rapoport <rppt@kernel.org>, Kees Cook <kees@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
	linux-sgx@vger.kernel.org, etnaviv@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org,
	kvm@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	nvdimm@lists.linux.dev, linux-mm@kvack.org, iommu@lists.linux.dev,
	linux-perf-users@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
	damon@lists.linux.dev, Pedro Falcato <pfalcato@suse.de>,
	Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>,
	Jann Horn <jannh@google.com>
Subject: Re: [PATCH 21/30] mm/vma: add and use vma_[add/sub]_pgoff()
Message-ID: <alFBnZ8RcRN1hlk5@gourry-fedora-PF4VCD3F>
References: <cover.1782735110.git.ljs@kernel.org>
 <794044881e454fd8ac13e59d5ff5fc86fca08b03.1782735110.git.ljs@kernel.org>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <794044881e454fd8ac13e59d5ff5fc86fca08b03.1782735110.git.ljs@kernel.org>

On Mon, Jun 29, 2026 at 01:23:32PM +0100, Lorenzo Stoakes wrote:
> Add helpers for adding or subtracting to a VMA's page offset, exposed
> internally for VMA users within mm in mm/vma.h.
> 
> This is to lay the foundations for tracking anonymous page offset for
> MAP_PRIVATE file-backed mappings, where adding and subtracting from this
> value must be reflected in both the file and anonymous offsets.
> 
> These are used on VMA split and downward stack expansion.
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>

Reviewed-by: Gregory Price <gourry@gourry.net>

