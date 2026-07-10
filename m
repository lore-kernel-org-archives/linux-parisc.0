Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1219A3BB675
	for <linux-parisc@vger.kernel.org>; Fri, 10 Jul 2026 21:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783718467; cv=none; b=ukiveaQhQDCoBzuXne/OtgSE1HCxMvJ9pkOBhpM/NJrzKf/P2DLPXmNc2oXu2ZcADNlNjGcHh/kkneLZpuFGAlRY0ftsHeS05u9aMN9ysMWZ82WdL1pslb+7n+Mhqa8pLipPES0iCoCaQ5GYXci8pCxdn1RDKfbywSbNHdbZ47M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783718467; c=relaxed/simple;
	bh=OrArmp546t2joLiGKmZojGNI2jG19j2P4RpxQaXcMQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W3wJSMCppR2Emg4ipdPjH1XIKgKZK0O0REVT7M7TfxGfPJUE5xwm2/76zparDSHI8Op2yp6ILgW7Q59qQ9+nDTBYAmcbFYbPKBW6CyqTUGXEfMcLUU65YA6D4Hh1KjPf0/MPoQCn+MC21YPQNd9ufdC5T8KJxh0aS9JW0QnC43U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=WrsZLakZ; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="WrsZLakZ"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-51bf2479349so8904891cf.2
        for <linux-parisc@vger.kernel.org>; Fri, 10 Jul 2026 14:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783718463; x=1784323263; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kBOMvPUpfjw5N1/s9nVKhxGNiyKZIoN9dPtD8sVM7ho=;
        b=WrsZLakZJT/5oETG2Se79/v9kdjkpEQDr7Yp+OGw79X3NAKPcDAh1QSIBTgD1APIk9
         PcNtWnmXjzVyA/ekAuc9J1Ldf1520O+Ezw0w/Ib2rmg9zLzxvlAdRLVhZhEA8PmWUNiK
         TQNQjHvefwSfVxq1+ZCz986aNPT/4H/tI61eQYAsQJpO4szsu8Cjyex71k+0GpxpujLy
         wBnlnlMi5HipUbm2ZzOkDOrRTbcr6VJAyIpY72aJ/E32HuOp1s4SJDdzj0BVE5V3xg8/
         VUpFjW6w8Fy4sl1gdFaDfoPbhesiNrFc9fyD8+l3IKOSNiiupFoFQbmh3CqhrxND/l+7
         UddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783718463; x=1784323263;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kBOMvPUpfjw5N1/s9nVKhxGNiyKZIoN9dPtD8sVM7ho=;
        b=P7c/ffB+pdVP0Q9aou+GvCKHTD0liGyOkQLVeThRbfK9cL2LlBW0YYdRu7PQWsrKEm
         NeUrPZ+5sTUH6jngyD4RKXF1+6K7mXtw15vIEbxZwsPhVnaD1vNRyiXfSTuQf8Uw8Q2d
         fYAv9qh3G56KsW5MjLRH7KlphTag2DYbUBhY4fbQefKa+hgC1McuKldfSdaynFaunBfO
         /Ga3yFbZ2GRii82YUEyRde2gp5aW87uMF4ypt2Z0cPl3R3XaBE5rXdZFqpn1AqiZ0e4t
         fIGX8SWhH/tCYzMWOFojJcg29ipKRyhukpJRcbL5Cs58Qeerxq2D0wZOEd7TDivLc7gM
         PaGA==
X-Forwarded-Encrypted: i=1; AHgh+RpWDNVn5W5DI1r/Fppc972Byyyr/yG2334HSh2vUMnmoVwP8udK5ddAUAfZtl64y5ppCG13+GDSY+lwk/g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx51gy3jrBTDGag3g57bvN8ywFB8XEjNhg8b6Hln6SRvv1ytoc+
	4v3z/xXeroJJmbcVYqTzkWwUk9vU/No7EOiqlDu/pj0PjBNatfSv1p8w1onjdjysDhQ=
X-Gm-Gg: AfdE7clznTrKLYff0MhsSPFRU47pZwagK9iOrIeLKJiigNtCw8Cdc+iPoRO+oOMViu5
	JSpVAgTAvZiyJizkbj2qbe4jCvq4wEJ5a3kb1hyDRC8WveEONZQYkvCD0ER7ptHphPbtD6wh4Fl
	+B6ENQaUU2jKZh3eKIetFyhAHAIKhD0T1i2Eqj1sgg5WBdBqFyxE2jhDgiDop/xmNY6f5LPw/Hm
	IOWT+oMv8YeSBfgbY4dK97T3haHXWJHalVZrYx2pqgFW+U5zZRXhqAwHUhGlJWnm0RFcVgFAuGY
	msrkzkooMjh6wLqrTK9Uq4CctU+8Tnl87DzmbDMLjxCwH/B1ig4Oh0kdvUZfYztJ/6N8eURO4sN
	T3Cv8EgQr+Drd2rau4IMdsApcs/S8gmZoYLnBffRKxjBwV73z1my0+XlObbgE3/wu7qYYUG7khB
	vsMQOCYiSRi5yiEEw/YmZKGatQTiba3aiBX6fULdwqayaRSb5ZgQ/VBvjCk5krLa9W7kC7
X-Received: by 2002:ac8:5ace:0:b0:51c:7b11:41ae with SMTP id d75a77b69052e-51cbf2dffb2mr6287721cf.74.1783718463047;
        Fri, 10 Jul 2026 14:21:03 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caaf621e6sm23894971cf.24.2026.07.10.14.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 14:21:01 -0700 (PDT)
Date: Fri, 10 Jul 2026 17:20:56 -0400
From: Gregory Price <gourry@gourry.net>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Rik van Riel <riel@surriel.com>,
	Harry Yoo <harry@kernel.org>, Jann Horn <jannh@google.com>,
	Lance Yang <lance.yang@linux.dev>, Pedro Falcato <pfalcato@suse.de>,
	Russell King <linux@armlinux.org.uk>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Simon Schuster <schuster.simon@siemens-energy.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Dan Williams <djbw@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Usama Arif <usama.arif@linux.dev>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-perf-users@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, damon@lists.linux.dev,
	iommu@lists.linux.dev, kasan-dev@googlegroups.com,
	linux-sgx@vger.kernel.org, etnaviv@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org,
	kvm@vger.kernel.org, Russell King <linux+etnaviv@armlinux.org.uk>
Subject: Re: [PATCH v2 26/33] mm/vma: update vma_shrink() to not pass start,
 pgoff parameters
Message-ID: <alFiODVaGwd_wYl4@gourry-fedora-PF4VCD3F>
References: <20260710-b4-pre-scalable-cow-v2-0-2a5aa403d977@kernel.org>
 <20260710-b4-pre-scalable-cow-v2-26-2a5aa403d977@kernel.org>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710-b4-pre-scalable-cow-v2-26-2a5aa403d977@kernel.org>

On Fri, Jul 10, 2026 at 09:17:07PM +0100, Lorenzo Stoakes wrote:
> vma_shrink() is only used by relocate_vma_down() to shrink the tail of a
> VMA. Therefore neither the start nor the pgoff parameters make any sense.
> 
> It seemed we were passing the pgoff parameter solely to satisfy
> vma_set_range()'s requirement for pgoff being specified.
> 
> Since vma_set_range() is now isolated to vma.c, we can simply introduce
> __vma_set_range() which sets only vma->vm_[start, end], and invoke this
> instead, removing start and pgoff from vma_shrink() altogether.
> 
> No functional change intended.
> 
> Reviewed-by: Pedro Falcato <pfalcato@suse.de>
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>

Carry over from v1

Reviewed-by: Gregory Price <gourry@gourry.net>

