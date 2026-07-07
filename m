Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FB9434E4A
	for <linux-parisc@vger.kernel.org>; Tue,  7 Jul 2026 16:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783441615; cv=none; b=I4YF5T9P0PzRMvyZ1298K0X6WqPLkyxfudUhxZGPJh6y45BgvEW6NHHZ5skNk40RhMwiuq79JfKELulQ2czAS6YGN1lPEp7Y3PrIkYbUxjrIQ+U9aGmISMq4+f0QhzhuymwylVVBZWmT/knQRidW9O4dp/JX5Brdptvzo+CpITs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783441615; c=relaxed/simple;
	bh=YNUiKnsVmS0YnEoi5UBidfFcsIdy4Lv/4umM1P9hbyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mtY/FXeGiQhRLjD2snjl+OtTRCoWns/QmeSmRiCBftdxAopOQ+dqlbpPvrUgg6cJFG6ZtwYFOEB2sCsxdvDIsWvUqN8JuXWFFzf6uARbHObyHxyGpfRSpdzYGU349W/V4JlimN2cr5f3duwbaxVKiXxF0NLEvPz3B+D01oH32og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=u9XK5Da4; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="u9XK5Da4"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-9204711e831so370309085a.2
        for <linux-parisc@vger.kernel.org>; Tue, 07 Jul 2026 09:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783441611; x=1784046411; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3pPJvCom7n6xLJkZnxYC/ipfbqNHo6N+N3CeZviAw0k=;
        b=u9XK5Da4IKO5YCa7r9wRdeAZRbdN+BblJr6cMTVoKzAXJiBI2XpI+81GYJqI3wwNEf
         ltCrKtUyPdrgJVwskmyo7KsshDiCu2+FHddX7vy/fhe2g1z+PvsiOcCNBcCnsMWcu8lp
         +CiD2I7O8xxySLq/J64ifb9NGk1cJqsvti9BUmDXr/ReF8IhV0x3gmjIus6+hcPzgAZz
         MyDClWncjmMN6+RT262effEyciC7qzg74LLcJJ47ODH+lqgBpNwOTFZx8749gZk+5bxg
         8+zmp+HJAccni27zzrj/r1tFAj3Bf/qyhoMbmkJb9EazJVlrQxigXnRAkGfYol/geJ7e
         2xBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783441611; x=1784046411;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3pPJvCom7n6xLJkZnxYC/ipfbqNHo6N+N3CeZviAw0k=;
        b=GzdzLePxz0mqgy7I8WMl7myt8GLvcsgCRJVMBCV1rSErtLs8CoI4bOlX+2pg+Noz3v
         Y2lWAhQkmZ6uZDbtHHfY1cA3xbY6NHXwMLTS7f/CEgrMre86le612owfKF1ewg0vYQeB
         5kU0bqg3urY/Nv3UTUlPK3cy3wG2V3Pl7dpEfxqy/pWOvmeW+QguJIvLOOPt6irEDJ10
         iHKXM5RqXSHLGUlPK08kYq11bGPWaSmk5pZgHL/MjVM4Yeckj+5ysRBy4Jo/QxCrCJk+
         2EgxD5Y8jbEL0hXz/YYxzx+l+JpsVhkvRPgkM+/aE1rec7b/imJ91KMlHtJJx19ncJx/
         g/tQ==
X-Forwarded-Encrypted: i=1; AHgh+Roq8qp7epkh57wQHWXvNylIYTwUB2xjk+6s+TrhTIWcrbKeAqbySIC7K7XdqjHWAHzvPRwzCMZcPNzUCTg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTVaUC7rvESUNtoemwBE45Isn7Pgv57mOuUEXUuxdeVeos6jck
	XG/r9TtvZ9FEIrNJ+fzbumsNUK1isNK5nQi+jjKeCFhYY6CKbwix2vWXaN/s1D11GXY=
X-Gm-Gg: AfdE7clT5VlqJH3XZrpMWHeNmY36//U0QiMdptDg1QTjGSIyJWOHSAtoWx54FqRgHoZ
	CbUnxNi3TV92FClyQCiQcCrFZt86Vyhb3JZwNlgCc5gXPLyFEQqRTANjf1J1iqWcjlbXpBPyITQ
	pSi/IIv+aF/gaWnybsdOkDKybt9n8+renW/k95QV/Bah+j7r60ANtWqNEaCnr7/WYTD6cqudPEO
	VgA8lykvfvbwVb/+F86wlXrKMBPtTZ4DQbc7wxDhqn9hvm9Bz3wKHaXSKYEuu1YK8zYH8sN5sAY
	VxNBZL+wyoSXIZqgBhXhe6nriupd1MwKgPO/6M/5+rFrUa4WeIz3/U1/7gWiCewlhmfflpkwR0n
	jxYTfVxcx5xtnRbet8k+bHN6ZYN6kx0qRvvOPuga9GYM1lm6Kkc5gZeRiu8V/SXOpPUfWZLFuRc
	nbdiQ3QVuQ81IKYZj1C2mQVmjbK/dbo9Z4lcl/w7uFWAkCkH6CKKO1WAg5y9NVPio4CU00RZIip
	oXVbYw=
X-Received: by 2002:a05:620a:a807:b0:92e:c118:18b9 with SMTP id af79cd13be357-92ec1181fa1mr324497185a.88.1783441610850;
        Tue, 07 Jul 2026 09:26:50 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90ba41fesm1231337385a.17.2026.07.07.09.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 09:26:49 -0700 (PDT)
Date: Tue, 7 Jul 2026 12:26:43 -0400
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
Subject: Re: [PATCH 12/30] mm/vma: clean up anon_vma_compatible()
Message-ID: <ak0owyNkHX6mw4pe@gourry-fedora-PF4VCD3F>
References: <cover.1782735110.git.ljs@kernel.org>
 <5a7a07bd2a774989849b0fea84f758059ed914df.1782735110.git.ljs@kernel.org>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a7a07bd2a774989849b0fea84f758059ed914df.1782735110.git.ljs@kernel.org>

On Mon, Jun 29, 2026 at 01:23:23PM +0100, Lorenzo Stoakes wrote:
> Break up the existing very large conditional, add comments and use
> vma_[start/end]_pgoff() to make clearer what we're doing here.
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>

Reviewed-by: Gregory Price <gourry@gourry.net>
