Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3DF434E3D
	for <linux-parisc@vger.kernel.org>; Tue,  7 Jul 2026 16:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783441569; cv=none; b=j/cD1fZIPQ3WZi+xPWAy8ADkrSofrJybMCu7kSfa+dlUZ0PtSK/LBwl9fC9jh1qkuFjPmvybHNBx8qDmN7R65BemTRNG02VSY0OUJ6NSg62JWpwAWJG5FjNCoyRrb9Y1Quzt7ffgfSRQ2uCe78UBukcypIjoy0QhUwgZ/kQSFeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783441569; c=relaxed/simple;
	bh=lrYSArpP0iVuUgDVG3d1222jafWM2daRLlBprnwN79M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sJB4AYrEN7rHqirGX61rv54nCq6pAtZFEOcX5dzX5oylMsk5jLTvKcyc0CCIF61n24VZrYmB8/l9YK7cTcqABTX4vLWy9z0MDe1GvB5xau+Nu2UibTwl6Vytwq+Jg+dhdQoj60dZFUFrCX9sYnBthkgxBA9zEGR81a+zXGl+qDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=eDqMHtOO; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="eDqMHtOO"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8e9c9d63815so18124776d6.2
        for <linux-parisc@vger.kernel.org>; Tue, 07 Jul 2026 09:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783441566; x=1784046366; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Abd7yWEQE6Vuyzvr8uj66ic6dsI9yDvEtRp+r0f0v0Y=;
        b=eDqMHtOOKnZ2WodO1jnQZJ790kEpTIDI8WuU+/mtNr5ibVX299F7ZakW6olp8PyAFO
         roxmiG7G+NToxYzzQQPwxJRwcqw5Hp4FroxVqvucMZTpqhJreYpmSbr4DME9G0+JNOwk
         0FqJcGS95j5Lwv+uX7ayJk6W+z04XAe4mAKrxPqnXBU3h3RUJU2V1S6dD6B0mSI9eauU
         w9hhZfwt46Lf6MzZQRePSEZFnjg+zaMKIww/rAcT6yzuCEGTy9SpoYoM1E0c7DjdlwHZ
         fk97uJYdOH2dY4c9NVrjW0ueon860oDHARuEQE2SFZoGRDyE4SbsSzEUqKYQ7UvC65uL
         /XvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783441566; x=1784046366;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Abd7yWEQE6Vuyzvr8uj66ic6dsI9yDvEtRp+r0f0v0Y=;
        b=l+s/COxV1tUrv/3G+/qRyAeqyBS85uG4xH8sR72PDXCEAjEX5/YOGhUSzAkBMhvI/S
         dAo2PquYCFjNHoO9rd/FFS9dakZwnqnjiE0tjVuiYQUhGF6pGqX9Ca5m8PgvZmlVddd8
         AqNS9kixqbnL4zz6wmj7bFdZIkhjR3keMCIxMZtj+d6jgjUy00L6XMFgrLh6Oqt8M6nU
         qWMAu2FPbH47axGtflK3lSMlm7D2KgYoEWme8rWMR8AUxb2tuPJLj8Vp4U1ne74+U4aj
         rTztGYZgq6mKSFoGhZi81HHwM1wX8Os0BjlVEQB4GiheCrL6a8qXZqaSRnE4jE7J35uP
         pksw==
X-Forwarded-Encrypted: i=1; AHgh+Rp2UlvxDtuL32m3V0mkVfZhLnSUPjeNN0qw2l29XAr31ydaPZ5+PA3R2pXfo92Q+r9f41+DjTV9+XYkWFI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGIi1JBuB5tixFiRcO5YK9+qPyIfyvBRIzoowLTuBBg2tmpLbH
	r8sDy3JPWHM34T1aHXCAP8W0pdBaT8pAZUKKiR4Fa0d1RiEr2/RZg2o39ZiJPoTZFQQ=
X-Gm-Gg: AfdE7clKZ39mzf3/kkJPF5lhewJuKtaQngA5ps9ys3QENjArDOV4hYyxrMr9T07IsUO
	oGRfjqp4HkuV4FPan6rF3DSYzt3xz5aL93oCv4SRof0FHFkKkfsuFiTLBUdJPXGMO1foCgAjY33
	F3nFfbEJ6WuJZ7D+RvXbh7zAvsaJ6zqoGG57WtbMsXJkHd68T+XR9ZbAeOmkSJliyZdYlSvmsi6
	cJPAdKB5+v5bYHFnPnyG3090JHY9giwQHDA3MpUTrHl10ZRDCGaf3QCaDXrknuqkRhP5Saffjvg
	ymh7T0OTYB1L5EbdKZLPk/rls6KnPzPiU7Vir7gIl0sNTULTACRhGILMN4xNe5Y12hsIRsSX5qf
	pv3NBWUxkTgmMt6qUPUtvfW3HQHIIaH3pVE2x808FJbmYb2NQO1QrgZSoq/iiaGHmVyne8AW4HD
	Dm90doiWYAhF4Se8cA0wwx/JI2x5y2ROTSsKOMBbWR1V6T6oLIF/UjL07piq6haFZBhkvav/Yp/
	XSPTnQ=
X-Received: by 2002:a05:6214:6011:b0:8fd:6de3:bbaa with SMTP id 6a1803df08f44-8fd6de3be6emr28372996d6.64.1783441563961;
        Tue, 07 Jul 2026 09:26:03 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f46f306123sm181382626d6.20.2026.07.07.09.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 09:26:03 -0700 (PDT)
Date: Tue, 7 Jul 2026 12:25:58 -0400
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
Subject: Re: [PATCH 11/30] mm/vma: introduce and use vmg_pages(), vmg_[start,
 end]_pgoff()
Message-ID: <ak0olp9zA6ERCXtO@gourry-fedora-PF4VCD3F>
References: <cover.1782735110.git.ljs@kernel.org>
 <f7b4f8a611ab4d36eb3cf2e394610a3744a93895.1782735110.git.ljs@kernel.org>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7b4f8a611ab4d36eb3cf2e394610a3744a93895.1782735110.git.ljs@kernel.org>

On Mon, Jun 29, 2026 at 01:23:22PM +0100, Lorenzo Stoakes wrote:
> In the VMA logic we often need to determine the number of pages in the
> specified merge range, as well as the start and end page offsets of that
> range.
> 
> Introduce and use helpers for these purposes.
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>

Reviewed-by: Gregory Price <gourry@gourry.net>
