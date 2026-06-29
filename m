Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8DD43E9C5
	for <linux-parisc@vger.kernel.org>; Mon, 29 Jun 2026 16:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782748871; cv=none; b=LviJ456gk81sdbt+AbC0aB0p7ddq42pDY8PLfhnL1UuwQv/sKjtDYIi3K+Zi/waFFfCYiEbJHfgGu92stnlCuA6Vku5f9SEgoTgoAfC31PkFCIjRSVTRN/qJEKb0x7g/UUPCF5K4KtjtKHC5Av6uj72n79gAqzK2FGAFTndQ/Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782748871; c=relaxed/simple;
	bh=z4dmX8dXcX6a8GqR+YBU+JEoYI0/LpvWh746yKHnt/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OOHT4h0+ur9AFhyo9Auxs84janycYfoFBAo3HD7RduZJvZitq8KE9B911LvTs5kdONpwMKs/0ujK4lT4LeKJLYxpB9/hi1v3N59Eb9Ur89yzEO96wVFYYnKe1zWrzQmPi/2WJF4iZKHMj4xKTURU79LueVTEBJw1aVgWOR8LKaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=WSc3BCtE; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="WSc3BCtE"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-664d7863920so1141090d50.0
        for <linux-parisc@vger.kernel.org>; Mon, 29 Jun 2026 09:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1782748868; x=1783353668; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4iCXvcvVpnsYDr5kbvWXbUhbyvnE3mHOMHboZJmxShw=;
        b=WSc3BCtE8Cy+JHvUpBDEzKlYlMSsDumRTtNx0pLodh+z91ImCWQKXqvSA3g0StYP9q
         WrorzSWt4Ci3VMAqva60P0tz6Ewj/7E5C1GTM6F39ZZ/ZWHoe35ol9bRRgqmO91Pz31h
         bBjEsr1/d4aJh/ghwBfx971FN2EO+YVXdYERLnCkfp6ZBwMHOcygXzSS4LX1OECMt2TG
         yWmqN6KXAEwQQwW0fMlQSaHo4lqTG47IHQowQvaM2FAK1rjDC87LmhLr7rfqqVICSflr
         D/Fr2uGWOHOzSWVk415eHQ2p49zbKQCfYoi0dGLl/dfgkqDGA2z8qMmM7gO455uFLEKT
         78JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782748868; x=1783353668;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4iCXvcvVpnsYDr5kbvWXbUhbyvnE3mHOMHboZJmxShw=;
        b=LF5EIG/M2hRrpeB9tgKj4ZNH2bLNQWdaGwNDoQPB1eg6AZTuqKHYu3yIXwzbgl+O1w
         iviv4G7hruxDqVDhTuRGkFmzoW+Ox0/yoRaTUqbUnGNEC3yoUsaV63MQcu6EbUvbIvaZ
         dMku/xJaJndwwNbniB4xhGPi9q9BrUXwIrBXRSoSyaOAwrC8ikQY92ULEeiG8S1kV4kb
         AsxIdXTuYROvf+v2VY4EaQoI00vILbESlpM9c7lG2gV+BZXH0b0FjL7OZQtgEgg9CL68
         6kVAfSaHgnvXkJ1UX1Ah1DMCJdiVG2CkAyTjfjmWFdKS4lsKIVbhakYQR2lGu+pAakf6
         BAdg==
X-Forwarded-Encrypted: i=1; AHgh+Ro/5rFemXta4tXsuUPIGAHA64wCrfh+FmtypOuhOfTB2IlVDaE6QEdPQU9ARTW8vsECXKtIiayIC9zE/Qc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg/VZk8txVF8cDJcThCjrxpJzj6OIcFrJV+o00JBloKwkaJlhY
	xj4rd+Mik+Rdp+ZWDlrhXU7c8UtUhIqUYyZu0a2Fm8iZgvQJqW2qBq0LwbLfp80fU70=
X-Gm-Gg: AfdE7cmebbq4qq0JAW9ZS0VOCLersohTD/0p4mzm04S2oMrJhM2TZRVqvqbneZHeYKz
	9W8nsPib3udXg52TYGsyqEGJugD8MT/6ykZSf31FikYs6PdWBEUOHUrsVva27/Z5Ndu8oV/Pv19
	AwjSkw/W9hEovv3zlFguUu1NpIO/IXlqWYO6h2bbSGoLkwYWtP7cZiEBnPodi1tJkR+612oNAuv
	ZhY8x22vs/u+8KzjdUdopt2XrcSW6iPzPXwFikmuOdTKSrr0Na2irx1zxBJo+LDV+LvY3mZjWal
	SNRzVxT9+vegSXHLtRoIxSok10tSicG2pL1qTh2t5tZcd6IJsOw5MPLIuifnVXYppQpGJjbAVtr
	rcdtj7/cczcHvU+J5hhJfvZrc7hEbjbrpCPriaeTD1YCaZxoEQwq+IijgHF9cyKRJqWpnROOyee
	GeyJ9DXiP3XKON06dC3pjUTgff2AIdpWhYq+SUjXOvDM2t/ATui8ASfkCUsJbfxaNmZ+8+8iDhx
	4yw8Fk=
X-Received: by 2002:a05:690e:d8c:b0:664:e66e:f965 with SMTP id 956f58d0204a3-664f974638cmr245066d50.7.1782748868214;
        Mon, 29 Jun 2026 09:01:08 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f1a717edc7sm1112836d6.36.2026.06.29.09.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 09:01:07 -0700 (PDT)
Date: Mon, 29 Jun 2026 12:01:02 -0400
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
Subject: Re: [PATCH 05/30] mm/rmap: update mm/interval_tree.c comments
Message-ID: <akKWvnU2Ua-8ceSb@gourry-fedora-PF4VCD3F>
References: <cover.1782735110.git.ljs@kernel.org>
 <80d482a927b2e9862487b812e0ab48ebc1289a70.1782735110.git.ljs@kernel.org>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80d482a927b2e9862487b812e0ab48ebc1289a70.1782735110.git.ljs@kernel.org>

On Mon, Jun 29, 2026 at 01:23:16PM +0100, Lorenzo Stoakes wrote:
> Update the file comment to clarify that both file-backed and anonymous
> interval trees are provided, referencing the relevant data types for
> clarity.
>

Isn't this self-evident by nature of the function definitions?
(one takes a vm_area_struct, the other takes an anon_vma_chain)

> -	VM_BUG_ON_VMA(vma_start_pgoff(node) != vma_start_pgoff(prev), node);
> +	VM_WARN_ON_ONCE_VMA(vma_start_pgoff(node) != vma_start_pgoff(prev), node);
>  

For my own edification - I know not to add new BUG(), should I be
converting BUG->WARN/something when i find them in areas i happen to be
working in?

~Gregory
