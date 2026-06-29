Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01B9436356
	for <linux-parisc@vger.kernel.org>; Mon, 29 Jun 2026 15:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782746857; cv=none; b=oShYsLzST9QR8UIzg3VkpZMl0vrvZg79coxgN6nYpnUJZQ0Wq69Z/XAl7F99Q+WAdfkjR0cj0KRxQNsnIOwY5S8BSfHFKoBKV5MQK6CqcbJ0qW5ZD7o7vzjcoqPGBgHjL7jPWMWAokiHWd8wd7q3prtrXeAriNrDbzE3Tqe5uMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782746857; c=relaxed/simple;
	bh=S0czybLrYjf/ynP1kVMlwjsL14pOds5Rs5BBJNaJCXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lgz4jS8Nl+A/TOw+rQtYwqT+XNtSuDO134NrO+n7PaOsEz7FNhS04GWlHXc08PaTPv+sy4B8l/fVm2wWlnNLFjpSX77gamcJ8/bCy7fDtRzIGedUQWbWFs4/YtkY3DsfFGqYTtt9RBADD+BnTboOfJLtWhg04Qt1f2l3FcWg/4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=YD4ldY6J; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="YD4ldY6J"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-92e5c92c389so47859885a.3
        for <linux-parisc@vger.kernel.org>; Mon, 29 Jun 2026 08:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1782746853; x=1783351653; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YVSnUoP7z1l2IjNO7QqWpl688BIslf+DGUxd2Ln6LGs=;
        b=YD4ldY6J9yYSngwoVnhz/rOLEfNM+a/QDH3N+mFU+kbbZbNNGaMSxOOMmCnLOAhX9k
         UPvcm/NDvNBkiffkqjJXPTNcQjgH8ZjtDe5QarFc2KSRhjvRuex5SwpDS4/S4NDHaUI4
         TrfYPXVIQKHe00dCaRIy+NqU6orKJiLqGgHxpQlUVqRHHnTmyKo067DpGBzaUU3lVQ9O
         6XqDD59n4np8Vd/UbftErbKU6Dvq3czt5Wx/pXSB3yKfVfENQ9Y+vXLgyeEcT5qaBphr
         O52YE4fYwfcWs/zQPj+id41/fNx48SJO9srg4qDeOXfbVNpd81DK03X4NrenRmLZo45O
         ziPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782746853; x=1783351653;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YVSnUoP7z1l2IjNO7QqWpl688BIslf+DGUxd2Ln6LGs=;
        b=OVmv0dQfIv66i/34yOg9+V3wO4jGzjPvbG+w9e4/pgZ8m7ZS1Gns73fERTnCPU79vN
         PLKPAYbLBatPbb6tjWmvRNRDJMeojO60pMWtwuBGctHUZEF9vYDDl8nYm1dUuNdMvl6b
         3rvxQlO4SxjK8jg5At10oU56uk7ag5n4bfPjO8eKfW7azmCp0Ez0WCt0+pPP1EeWhkRX
         n93MIl/4F5jX1cA4oBhIQFJIeRJCkxinJ+Bf9yot4fj/N+UThBHHfYDmVu8eqlaKietR
         tH5GtQj1jHxdjZFzEr1barQ8+uFm8m6Jj2BlCMwdridviMShC7tihli8MWS3ilaVGMk0
         hKPQ==
X-Forwarded-Encrypted: i=1; AFNElJ86Fs8mypPzWhCBWvMGepCglULyQNPwHuEwQc12DjhWJEwwoaDTz/6PrMSIvYOTP2tqInZCnRrEq8f0VFE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrCNzlGlFMLMokrtn0FaoCKCj3WsjKvfctJ0bBdq9LuJUdpJEJ
	2O00CHnL1dGUUwGm/GjauDhuRLtc2ERvmkeIWYeqSFpgdfhkngTrhepbMklG4SHk4BA=
X-Gm-Gg: AfdE7ckgxLM46qwvuJTYNf/ar5hUc8bsZaO52Dq0Tbuz2bWSmSaJKI9sHTFk7qD1R5X
	VPwKODIq7t6r6VqO0blDp536knfJsLNXuVAVBJBlIYjSnBWQqxGbqZ+TaphoYYE5B1qG3wINA5f
	Y1wWu2PyLVrdWzhSbC+F/oBkNwlbj206sdq7lqI3YcwOCaK9bKUquLqjOv1V1eEWNoUA36G5wJ5
	5ilY3+qhrKMaZ+3wPVZwh00S/CqIxQh4K8RWnzMxu2oRT1ST7BnjFjqn535wbF0vCFAWjWzthc6
	oYI0PLYO+nfbEtKIuM0KGEug8ev3ocHyzKTaTIu7wYfGVTOcOrm5mcXTXAfTBmV6uQ14c/uzNVf
	cHIzaVjaHKU6F7c6B5DjDzE0Jtma2cIR+r2GGmTfZRyVc85mRUjRN5EnymSpmQXVrh0NWQxiWiq
	V6AzyKYRkEhv7HxfcOiZiASCrXRt0NP4SsWAURwY3iqwRc0SudZAYDTg/ylHMryOyhixAoT4hHg
	oOTadY=
X-Received: by 2002:a05:620a:7002:b0:921:9df8:d38f with SMTP id af79cd13be357-92e62785c63mr1415985a.43.1782746852526;
        Mon, 29 Jun 2026 08:27:32 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e621943b3sm7429785a.19.2026.06.29.08.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 08:27:32 -0700 (PDT)
Date: Mon, 29 Jun 2026 11:27:26 -0400
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
Subject: Re: [PATCH 01/30] mm: move vma_start_pgoff() into mm.h and clean up
Message-ID: <akKO3vnNmWIJAZ7z@gourry-fedora-PF4VCD3F>
References: <cover.1782735110.git.ljs@kernel.org>
 <b28b698df4c009e85c4728446ca5863d8e633164.1782735110.git.ljs@kernel.org>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b28b698df4c009e85c4728446ca5863d8e633164.1782735110.git.ljs@kernel.org>

On Mon, Jun 29, 2026 at 01:23:12PM +0100, Lorenzo Stoakes wrote:
> vma_last_pgoff() already lives there, so it's a bit odd to keep
> vma_start_pgoff() in mm/interval_tree.c. Move them together.
> 
> These each return unsigned long, which pgoff_t is typedef'd to. Make this
> consistent and have these functions return pgoff_t instead.
> 
> Additionally, express vma_last_pgoff() in terms of vma_start_pgoff(), since
> we wrap the vma->vm_pgoff access, we may as well use it here.
> 
> Also while we're here, const-ify the VMA and cleanup a bit.
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>

Reviewed-by: Gregory Price <gourry@gourry.net>

