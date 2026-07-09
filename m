Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B00B22097
	for <linux-parisc@vger.kernel.org>; Thu,  9 Jul 2026 00:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783555568; cv=pass; b=MWWImX0mrDQhFENowiKkVY6RGe8MiWFyX8gSw8t9On9kwQqqG4a+YgL/M6Sstgt14Zp4/mTl1ypWO+SXYSI8ZyDLsWinHR24H1r3PD295pdPvuF/WstCtyjGCG8PsP6dY48/dj3XwVeamOzxZEhyHlfgIAyyK5MyF50Zbdr6G8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783555568; c=relaxed/simple;
	bh=yJaHiIAKdt59/nUs88AHXAG1seHCynr9U+jmRjUBOEg=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xr8I7gO+FBZwTiL8OSr00MP+2+VWZooOFx912C0lL86rIGo2mBSyp540K2GSgFj8qb3BhxqLjFM0s/A8e5kA9Mu+WIO4IgR5FbHTESxTpmY0WZu3Evb69KzgQiwJ7rjJN+fIHul5UObb8eal5IhQe27HjmpuYpdAmm6PauxsI6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=km73nMuQ; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="km73nMuQ"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cad8076b01so15237255ad.2
        for <linux-parisc@vger.kernel.org>; Wed, 08 Jul 2026 17:06:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783555565; cv=none;
        d=google.com; s=arc-20260327;
        b=SBWsOBdMB0pXpMKQ38X5cpzTNdxCmVRVmEtE8WUeQIqmyQgx4tFo9grJ1dljv+/utJ
         4MGHrxkKcgCUb0SsWkmXbGuBbga7grC4oeaye8djw6Wbuc28QnvaglI7Kg9b3jUbPBKY
         jYtiCCpyfGVwwGh61NJP41pp3i08LkM7BD1N6qrGqnBQldL38DwDKeQl3ierekrLiA2p
         +lIgw0+EF910RA5wwNAYV7gLb3f3Ntm3z+HRtIpG2A8SzBH0KTzJ+DOnNpCNOhtMu4IF
         zbNNdQe7GlJQ5SKoLs7HCS5Zxjf9eswiNyHMFpD98VmgCfO/KVe8Jjs/4vfqklw9+7tQ
         9BWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=yJaHiIAKdt59/nUs88AHXAG1seHCynr9U+jmRjUBOEg=;
        fh=YYLEh4AjuzMYDf3gwgyHplXiCT0Jo2vJQ57gqDS8QC0=;
        b=ebAZ23Ou8VAZYxCGzLcd7hht+J9aqaKXcwbLP2Py3NZBMsrYYhaEQNuzYX3baKkkIU
         cr1dI9oJVxnjMTeGd1wgbE6rxk58Zp5WsbhDUd/ctMwxUOaAfcHDTTRFvjkY04UdSieL
         w4JotMY91ZSlY/mh3SzQ7KE8ZJvbGJmrh9zj7jY8KwyPh/IJ6VOxNoXnOWjQQqX3P/c6
         eo3JvejuO1PaTNxMIQXbmk/wl2+1UU6IFOIFBstjAEwFX68rrE+fykd+UeY4OR8zGJG3
         bfDY11zc0Fo641ofDhFmwiELnMjDeEFjH1bsGS+YalcUcY6UPBFjPqlL0FyH7r8n80KR
         +b4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783555565; x=1784160365; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yJaHiIAKdt59/nUs88AHXAG1seHCynr9U+jmRjUBOEg=;
        b=km73nMuQirX6WkgaiDewtefUUpLqHsLA9lhojmRVu/O5GWXI+qspHLrIcP28hPedd1
         IdrQ4w2WUGkGZnfsvZbX4i/0vv+f8zy6UYrbx+r+6VAltUS4BsKAcMEEAqGPcoKiR6RJ
         oJPaYYcMOCkbcbYn6DUg2jPj6RwRgKn8b5KjbPN0LTaLwabP3wAFOO6JrbWd8+/V2xJm
         8qmB+NxqEb/SagF5FxCEtMVuCK+ov8IPbs0gvdfNk2TGZa0FvtOnzr4ElVQGCDXTFRjv
         zpPIU07tYAE6O/XcExlihB295hDnRUteCnX4/vklcg+GnLTnFl9WQaUB6cAitmsgQsSS
         bmvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783555565; x=1784160365;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yJaHiIAKdt59/nUs88AHXAG1seHCynr9U+jmRjUBOEg=;
        b=JrViKT8xrliUF8EmopzdCYI09IOXK64ZAp26cfOHvMgRKM6EBn+KNMPP1skRZGh7RZ
         oDPol+WxsiMMHSFkh1o2aktQQYjrBBWp1HGLWi9mZQxyjx81wfE5rRoQRFvZ2+aqA9xX
         TyRBIHWD2b0pzK8nohrUr01HQHyWhXR1QNPYjDXik+2Os/mnilpAJOmUQ7mUpziOK7ij
         gIpMMrCpzNpKcUeq6elLPa3IgepmfFfXzgKxTyQb8g9U9upntYM4L1gEcPS0scvVUDKy
         264mLDOKdyHm00/PAJiHaNgZEBLY5y+DYs12FeLMefXbFENxHCF4B6Kob7YpqakKdx+s
         k8WA==
X-Forwarded-Encrypted: i=1; AHgh+RpUjoQZGoFcf416xkr84V9d5H8/tkUB3EsYdOYE08Rv22LX8R9ekUNtx2y9WEJrWw/RCFY/z8giSRZ5HoE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ2ckjaTLdZULcegEoDUyoAWDZ5WobSLchUTtEisliiCB1o/BJ
	QXu++Gn+7ybmlSwAvkTCr1Sh9asQCdRUA85xBJEP03zWSWSdvwUUh6iM+HSm9578fUwzX1LQa+r
	0HrwWLCWBe/+p352LD8SX6CS6aODMpYPwD7Y9CKgV
X-Gm-Gg: AfdE7cmr2rWThQ+YhHG++yBDrpf/oBHNWtsgcLDmCDj2vHAmv1KMwLczU3dvQZgjNg4
	8hugUHRT78kdKyNkCQGxkV10ni5ASL71HN0GzPOqTyl8N9+kigh1/1cct/mcJEPOZE2X0XFvr2u
	A+ZCEfW+FDtPdA2XHy+9bo8rSGpznTT4A5luYHB8XIuzVl0U6PMAAdFxTyg6EeOaCAcg+Grlbfz
	qG7dbRi9tR/6bJKZ23FSBvz45VM/T9VZ990R+2sI7WiBF1Ok3glfTEEaEfqnMwlLIzLG3ZydCXA
	LygfnijIgPNVdU7cgy8OZMMdxXn7gdHKaphC05YN2CpFdx2fXsVNr2FXihUJF9y/AuhIjQ==
X-Received: by 2002:a05:6a21:7482:b0:3b4:669c:ee32 with SMTP id
 adf61e73a8af0-3c0bcbc1353mr5760887637.37.1783555564841; Wed, 08 Jul 2026
 17:06:04 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jul 2026 17:06:04 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jul 2026 17:06:03 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <eedf589778aaab33e6df2ad6556dcde536e13460.1782735110.git.ljs@kernel.org>
References: <cover.1782735110.git.ljs@kernel.org> <eedf589778aaab33e6df2ad6556dcde536e13460.1782735110.git.ljs@kernel.org>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 8 Jul 2026 17:06:03 -0700
X-Gm-Features: AVVi8Ceg-PSWltTScKU18ZF0mdbBsNHDv0s-VKhIaqzjwQ-q80D6zfZMKk_VWII
Message-ID: <CAEvNRgE-JJAzC0jp+bY8+e1+gYSH+MjT6JqX_DfCcpaxOM-Dtw@mail.gmail.com>
Subject: Re: [PATCH 15/30] mm: introduce and use linear_page_delta()
To: Lorenzo Stoakes <ljs@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Russell King <linux@armlinux.org.uk>, Dinh Nguyen <dinguyen@kernel.org>, 
	Simon Schuster <schuster.simon@siemens-energy.com>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Ian Abbott <abbotti@mev.co.uk>, H Hartley Sweeten <hsweeten@visionengravers.com>, 
	Lucas Stach <l.stach@pengutronix.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Christian Koenig <christian.koenig@amd.com>, 
	Huang Rui <ray.huang@amd.com>, Ankit Agrawal <ankita@nvidia.com>, 
	Alex Williamson <alex@shazbot.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Dan Williams <djbw@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	David Hildenbrand <david@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	"Liam R . Howlett" <liam@infradead.org>, Matthew Wilcox <willy@infradead.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Peter Zijlstra <peterz@infradead.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Steven Rostedt <rostedt@goodmis.org>, SeongJae Park <sj@kernel.org>, Miaohe Lin <linmiaohe@huawei.com>, 
	Hugh Dickins <hughd@google.com>, Mike Rapoport <rppt@kernel.org>, Kees Cook <kees@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, 
	linux-sgx@vger.kernel.org, etnaviv@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	kvm@vger.kernel.org, linux-fsdevel@vger.kernel.org, nvdimm@lists.linux.dev, 
	linux-mm@kvack.org, iommu@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	damon@lists.linux.dev, Pedro Falcato <pfalcato@suse.de>, Rik van Riel <riel@surriel.com>, 
	Harry Yoo <harry@kernel.org>, Jann Horn <jannh@google.com>
Content-Type: text/plain; charset="UTF-8"

Lorenzo Stoakes <ljs@kernel.org> writes:

> It's often useful to obtain the number of pages a given address lies at
> within a VMA.
>
> Add linear_page_delta() to determine this and update linear_page_index() to
> make use of it.
>
> Add comments to describe both linear_page_delta() and linear_page_index().
>
> No functional change intended.
>
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

>
> [...snip...]
>
