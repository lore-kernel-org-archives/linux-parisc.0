Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC463644D1
	for <linux-parisc@vger.kernel.org>; Thu,  9 Jul 2026 15:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783610332; cv=none; b=p9ebdzXSxWWwmkWqJIi8g5+Uabjvtn1txHMLRrKHLNwssw0+Pt7Z9s34L0CV4fMuxGEMLjg6PzcjFoR/VJXm5UqhqIOHrOTk1gxxK0lMr3pNG5IX4Rdwbd/aDNGO9ZpP+kwmrAg/zAsMa85sl3p/iixi/eEZgAF4ORWAXgNnrlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783610332; c=relaxed/simple;
	bh=EmhDmZEzfDqtz+/wM5OYtSnBNKhNR5z6WmgKAnKqYZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fhv19IJZEx0CXyBL35NFQsgbyzDRSMc/nQ0KF2a1gmLsEKjxSJD9brAZ6IW/qd0KkOhRd5YVTNIXIEoUu0iHC8f4YdXj2I7++JBpjsQvWdik8+r06w82Vq8Yan0nWQl5N71+acMsN9UPLaDZG6jbgSojM9PDi81ocqwjMCBruuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=XYuSc5IC; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="XYuSc5IC"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-51c01089e8aso12004241cf.2
        for <linux-parisc@vger.kernel.org>; Thu, 09 Jul 2026 08:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783610327; x=1784215127; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D66HPeIJnm5ZDnK+VorUOpyiniaZPeUCt2fPIKMnyb4=;
        b=XYuSc5IC+EVJbDWikpVPC9cDKrnWwVwEAM4vxRerghx9T5cLKor0lZn/3xvEy8MYvH
         P4G8QPzYbfEZ/SuD19iQ/Y1IHWEN8FQYvrl4gGGNvM85yYx5CoTWRnrwozvd8buW/yZu
         rTLr0Kl5kFm/eeBRVjl2lZuNMDx5WC8PeGDIx78E6vBCLlaGrNT+PUtAJ/u8INBmJnMf
         RbCmKrzJydlT8MQRk1duN94/X88hvDTJtAhpiVN/Uddledvv9UkLMBn9POBFDX+NJflU
         wUwaXNQ4tD3o84h7GQtBbwvEsPtUxnWPlr1FHKAANE+13sbK/9le7ZhU64POCONVaFwl
         Syjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783610327; x=1784215127;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D66HPeIJnm5ZDnK+VorUOpyiniaZPeUCt2fPIKMnyb4=;
        b=ejALdWdSLkLZDyO76W/TapXe3Y8h/PVvjNgNw57AUK8kESgxmSqfZjeQQNqEHMeynk
         Z5CXeNbju/g4TK4qYBL3bBESdTZ6hvdJfW9k1Mldn9EV8dbpV/MrI4pQrgCq7vmgh38t
         pKhx1bGjfzcHRBWtVumTToWVel2L346Zbl82oIrqyLs/pyr+I+N1ApI1Si2Bw0YDE77Q
         U9gq0BD6uuKFgVLafZQ96KvgXq/aeYczPqImPYwM0pVArsRBLnMt4FLAkXrVYN3RJcSs
         6LKhULWRGUsbLyijCZVcxWkZCxpDEb4LCC0Xc0TiKxLDugoh1gnFiewLQQyTK3IrGK8w
         9VxQ==
X-Forwarded-Encrypted: i=1; AHgh+RpGL+H6ROOLFcgubVpJULulSKY6S2k7d9MC7g0T8Ou1B9Hyu2BAvU/B3/fbM6lIe9EFohbtLoqWsoEvfOY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo3oSRRHvtqfMilyI0fsm/b7jTsqc6weC1bLQql6z8ZlgdDGNY
	mPyLDpya27dyGmaD7DDbbc698FT21qcRA4lIcNqh25f+2oAFBZ6ABJ9la4kwHBd5TRM=
X-Gm-Gg: AfdE7clkuRi4P5KAz2FXOju+zk+GyTl9PmgRNWAfevFaCJtMJvW2Od8gaO/s5wfgyNb
	xb1VzMgKF445bwqkuUbLOzvqiPLZdJQ8QK0OtWCwqD5v6j77f7Fm3vPvw3tC8vueuqOjR2z/PkH
	7MIPXOX1fJliVJtir6YccQUcGI3Nx0v0kjHuh7kQLFzh06HViMDkiQc2T5D4Rpnz6SSdThTGGdw
	1+yI6PtwUqThADIGN23poPnxXz1suhEftzhT5Ej+2w9DNg8oUlw43WPpT5h+MKh3BzNKxIp1FL1
	+OjzczWOaTj9QuidESSPZ9cRnu1WWZajWfZGwbaNMB2AwXW2yp6gcUxjzwmAbL99XzqEmOdBERw
	DlRyMIGOO5/hKaxgaDdx7siv5HBPZTOz09d/gUm2VRN3ZsIar3oj847SNzA12Lm15wsK3X9u0bK
	lTwCFqXK0YxJEF8V9uPWn+RxFeWEBCmjJ80ZzTi5swD+dOdHt+SqVAby7A1gnEMb7/c12Yi2XFi
	GFj3BU=
X-Received: by 2002:ac8:5cd4:0:b0:51c:1c2c:a8c9 with SMTP id d75a77b69052e-51c8b3e2e32mr79753441cf.43.1783610327278;
        Thu, 09 Jul 2026 08:18:47 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51c41db4fb5sm158006781cf.25.2026.07.09.08.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 08:18:45 -0700 (PDT)
Date: Thu, 9 Jul 2026 11:18:40 -0400
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
Subject: Re: [PATCH 13/30] mm/vma: refactor vmg_adjust_set_range() for clarity
Message-ID: <ak-70CHGujkI5jJI@gourry-fedora-PF4VCD3F>
References: <cover.1782735110.git.ljs@kernel.org>
 <ada7972f49ea7f1ff1df6d11e4651f270444f8fd.1782735110.git.ljs@kernel.org>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ada7972f49ea7f1ff1df6d11e4651f270444f8fd.1782735110.git.ljs@kernel.org>

On Mon, Jun 29, 2026 at 01:23:24PM +0100, Lorenzo Stoakes wrote:
> Add comments with ASCII diagrams to describe what we're doing, avoid
> dubious use of PHYS_PFN(), and use vma_start_pgoff().
> 
> The most complicated scenario represented here is vmg->__adjust_next_start
> - when this is set, vmg->[start, end] actually indicate the range to be
> retained, so take special care to describe this accurately.
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>

Reviewed-by: Gregory Price <gourry@gourry.net>

> +		/*
> +		 * vmg->start    vmg->end
> +		 * |             |
> +		 * v    merge    v
> +		 * <------------->
> +		 *         delta
> +		 *        <------>
> +		 * |------|----------------|
> +		 * | prev |    middle      |
> +		 * |------|----------------|
> +		 *        ^
> +		 *        |
> +		 *        middle->vm_start
> +		 */

Even with these diagrams, it's a bit difficult to understand what the
actual intent/result of this chunk is (but that may be a limitation of
me not spending enough time reading the surrounding code, not a comment
of your work here).

~Gregory

> +		/*
> +		 *                Originally:
> +		 *
> +		 *            vmg->start   vmg->end
> +		 *            |            |
> +		 *            v    merge   v
> +		 *            <------------>
> +		 *            .            .
> +		 * merge_existing_range() updates to:
> +		 *            .            .
> +		 * vmg->start vmg->end     .
> +		 * |          |            .
> +		 * v  retain  v            .
> +		 * <---------->            .
> +		 *             delta       .
> +		 *            <----->      .
> +		 * |----------------|------|
> +		 * |    middle      | next |
> +		 * |----------------|------|
> +		 *                  ^
> +		 *                  |
> +		 *                  next->vm_start
> +		 */
