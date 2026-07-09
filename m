Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719602F872
	for <linux-parisc@vger.kernel.org>; Thu,  9 Jul 2026 00:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783555574; cv=pass; b=AWCwfiQkv42RrN0mfBeLsu+A4+7puUrHXPA15FEo103+JhrnEpc3IehCcBKpnaMFqhgo+0XKChbOvOEdtLsctXbHi7Q2I7fBEkZ7FhltTpvfMUOzW+DJQzZrjm7WT1p8OTiQLXjrnO0BU37JBjdHPbFhDIjoobhYGZ0HjJ0DTTU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783555574; c=relaxed/simple;
	bh=4EuRdo8+QeN+yDW6A3X+o12IBSIMc42jYmwxuetdwEg=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fMd2yOmStY8nFDasfbUN811LLnxgF1KaoH7huAelGw+MxkHKRIOQoi6xHl2nYaInOJsonI4A4EM7k2TW1/1I6EIfro8A3QxuJB4SVQahNjBQP/GYOHMi74zPstN6R5nBQgM3CHWoAEHLR6meYaHUqwKIq+7OAluDoIvUR0WBeA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Tui2OcZi; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Tui2OcZi"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cacd69a9c0so16130635ad.1
        for <linux-parisc@vger.kernel.org>; Wed, 08 Jul 2026 17:06:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783555572; cv=none;
        d=google.com; s=arc-20260327;
        b=DXd92eqi566ulqfXU70IlC5TgavGYdrlNH3IbFA5wKjQ6SAYRCUuOGU/UV0Qa890WF
         GoD6e76XGoxNDg0gZZosAq9RXwpFoxUOBK5OWg49nELBp5boMq6EzQryYi3WloWZ0UXB
         JgN7nTqaPH5h++2kCieDRddbx43tKTA/D11lKpznkH3lalq/cdLW3uOig5y7siEIH8xU
         GEV0BHe2cdL8f3tK3H9Vr6vagjDKKZ2al9UkC4RVeDsC76CZ+yQDlaN67T02WEH/L1BU
         Ds/PvWy+m5KGrRt5erkbIB4J3vpHhlW49GTpMuih1/YFCVzv3WudrB7n39bw7QFTh/R3
         GErA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=LGyVs/ziq+v8OBPSx6ZOv0f1yGdel9dIe8uNrAG5/8g=;
        fh=CGxBcwbJq/51sT6pPrA+ngVNm5xf0w6TUhFmhPNVyZc=;
        b=MVYsvDvUgdXmh5gy+vzJ6iaEJFmTKuW2kVYhAxVpZKnwM1zEVtZRYYuv6v14gK5+ns
         c3ZldJBDN73qjuzGHwEup1sn9krgK/pEhxNnWye4P259UFZtIWt5kZYpaLeM7IWQSbMI
         4EKTk9R+EdRE1FoiIqSDtYlU6O3tjvcvxVjmJVUe3ic191sTmlwtVCLmw8IGhbXayKde
         p4jEc4MXQvOh+Zwh5jLIk8Gd/sgNGEgXP6A5ca5m6dK+RschVpmqgxSGXfgXfvE2wTNg
         3KsldKiMpzHGoRYXzlhHf8Re9PFWFb8fYdWhLdubJxoeg74BEHtRuyrA6WXoPWFMyIEK
         +69Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783555572; x=1784160372; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LGyVs/ziq+v8OBPSx6ZOv0f1yGdel9dIe8uNrAG5/8g=;
        b=Tui2OcZis/oIXOg64/k9In1vUq+guVmxXWVelpwI1011KYfw3Hl1jPM5DNAtnP6dud
         tNbegsDZz3ZfVCv3LGp5grJaOjpctg70Hd3LmUk7dQI8Vv2jYETpC0sGkT/KvKGM691w
         BT+XRpKkVjD2SrNiht7Qet9iH3M7c1BU5Bigcy4v8kA+8fmSzuSX066UPuR7CrLlRe5Q
         CeybiJeWPPdsESYlJxF9n44iu34oqvjy5d7QBDLGRppOZkrJs8UCxKIxMeLGvH74IBhr
         QssXYAiGebRkpz82B4ZjFbA4HpYTL9wbjKch97ta4LdApRDYqVK52ldJ7qx70kqeApqR
         Xu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783555572; x=1784160372;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LGyVs/ziq+v8OBPSx6ZOv0f1yGdel9dIe8uNrAG5/8g=;
        b=fEmrplF0O/172PGPoBw2wRY4NGDJjk7L7LnLQGkFdXTXptOz8sT9Js4pnmXc/ABv2Z
         RBhaD5Z3p/APS11TVcbUjTmroMcRMCauNIlC2B57fbz7HuP0STpoWGnkATlauWM4S+4Y
         io91KgDRzvK/iZ8LAQaLqinR51XtiHDTcGhFXETCOr38cMjjPJiQ4lWDT4CcZEidDJd3
         ckyUfJpBWV5+lE6OZW8iw+O+dz7U1fOKjpAZipNt8wjboga3SAodDW2kMEnX7rBRSNHv
         vaANPn4ktM5WhMDVZ9u4uBNRehcCpeHcV0LrczSW7SqpbDvtqcvvN4hs85LGtSl/kGPg
         jvTA==
X-Forwarded-Encrypted: i=1; AHgh+RpUTdJlVNInMA9MPGyxNP3S7sWbF/Puh1n9QKmTNE6/mw7JGnIpYIYG7NaSyt9/Rcnvn3hQnKsihWVxOnU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlTMnhFUSvNFrbPd/SP3PFSV0JGLllw7ahM/vtvpRhDX+yj5h2
	3q08FSxr2Z9vX6tVHWEgmTvhT7IeouAZiWrO4nMz+RI1lcre9lSoFan95ihD9GgsJa+JJtHl0Jc
	6bNN8RHgNwn0WKzDNwhQrnX+UPqxlfsj6jjzTZJBl
X-Gm-Gg: AfdE7cm97HFJGnUr4jumoRxbS6p2gv0yFPrlnjOawH0o552DFu0xDWHQj7hMFeoBhM7
	iZDSxidFxm/O2eA/lT+Nq0v1XXhBv5uzAA3v0QPQe/UxXXztn9taB/ENL7H+lFbqF1sErIkGTdH
	b1riJpi33rhhCZftTnmhMwS/J07+lhhozZUO1AUr5DOmMwJw+FmiqOqU5WLuLcgLd0FmDVCjcH9
	9DOC9R+BoZ2ZCKXo5R9wDWx120AaeN9D3RoYw8xlrvwCWXeYACB7t7so6BPu0mzYE0qRC2ZSprc
	OkUZXqi967lrr+LGs0194s5ve/isOZq1WIJwWT67ZSQWKvmRTPT/yAydZn8=
X-Received: by 2002:a05:6a21:1f88:b0:3c0:9c19:b27b with SMTP id
 adf61e73a8af0-3c0bcce9940mr4979424637.73.1783555571036; Wed, 08 Jul 2026
 17:06:11 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jul 2026 17:06:10 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jul 2026 17:06:09 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <bf56e2e98b512962a2fb88900d535a0e9e6769d8.1782735110.git.ljs@kernel.org>
References: <cover.1782735110.git.ljs@kernel.org> <bf56e2e98b512962a2fb88900d535a0e9e6769d8.1782735110.git.ljs@kernel.org>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 8 Jul 2026 17:06:09 -0700
X-Gm-Features: AVVi8CdcseowPqFId5ObGoqB8gTqCLO4QEXGH1ZjH1-pjTCLGI84NpwTLe_LrAc
Message-ID: <CAEvNRgEV9VkWHULS4g5hVHu3T6=YZ89HJmkv6rS0+hK=5UFu6Q@mail.gmail.com>
Subject: Re: [PATCH 19/30] mm: use linear_page_[index, delta]() consistently
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

> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index db57c5766ab6..f0e5da490866 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -440,7 +440,7 @@ static int kvm_gmem_set_policy(struct vm_area_struct *vma, struct mempolicy *mpo
>  static struct mempolicy *kvm_gmem_get_policy(struct vm_area_struct *vma,
>  					     unsigned long addr, pgoff_t *ilx)
>  {
> -	pgoff_t pgoff = vma->vm_pgoff + ((addr - vma->vm_start) >> PAGE_SHIFT);
> +	pgoff_t pgoff = linear_page_index(vma, addr);
>  	struct inode *inode = file_inode(vma->vm_file);
>
>  	*ilx = inode->i_ino;
> --
> 2.54.0

For the guest_memfd change:

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

Thank you!
