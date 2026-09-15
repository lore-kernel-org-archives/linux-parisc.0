Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E782F4A843D
	for <linux-parisc@vger.kernel.org>; Tue, 15 Sep 2026 22:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789512918; cv=none; b=CVRdbvKh8cfIN+xOFpFpQ/o++1D3G8GC+PsGwgOrOXBtPRJOlQWmYVc2zWdmFFcdewnskGspYIcZCJEPrzqIatEEoI9kB9Mj8iK8LgTFu6OZb1idw4IzoCmwnN78tUdBGdBGobrAgCXFDSbnei2xaX86RAjwURhoL3nnBVWKJnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789512918; c=relaxed/simple;
	bh=ITz7hBythv5OWTbmQ9c4e1mzRPysX2+YTMbCrseTj6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f+olP/kGuX0yech4112j4MWeniuyA3Gl5pljWy+Xgoi04lcYtpYi5GzkAxo2IPJ4mAV9SrnQLkgNr+xS8BWS7zJ1ep4KPqCXkYBTy4W+QkCPzI8BONAXbxBsVKcvBk+NZwQMF64049J3aBTwtjpbGmAzQYt94DEQs2KBjpF4YLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=BaFfwi/F; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="BaFfwi/F"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f6c7a4aso50886066b.0
        for <linux-parisc@vger.kernel.org>; Tue, 15 Sep 2026 15:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789512915; x=1790117715; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7NEEN5klK6sYQ7k8fj+V0z2WeSFVNwjy5fJJIdfiMPQ=;
        b=BaFfwi/FmC47z34glvbnmfqjmeukTinCdWGIUUARv96HwNtEBsxjAmQILj2WtvkDcs
         RAnt6DOSSDkexGYooog6kRuo74XQFKWR0xPJ8Q3MdpCRUVv//jEECt9T5w0lJzIRTl89
         jINToeDPi+bnBhr33VW6dFtdyczuHmFXwfNu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789512915; x=1790117715;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7NEEN5klK6sYQ7k8fj+V0z2WeSFVNwjy5fJJIdfiMPQ=;
        b=nWgEN77Q5CdBTXDLyqlfUs5vCf/X32Emv8N+Cl0m1IPNL2efWgmAyHvpWroabpJedR
         GKm+t1X0N1To3LQ63Ut7466vaUE055LcH6lOcUfZirtsgz7BICWirDijS3OWM/kZY0DC
         88m+feJ2Zf/sL393xi8fIbydFDjw/Ex3qXqaOa+OKxLqHto2Lm0NRE2vI/ASi9zy+xhA
         QT9rpWKJR3uLqkbw2O/u5p5fPlYjvlCTf6QArwJ3lAovNRw5oNSPs2+cJfO7Xmp1zcYN
         sBNWsOa3Jvpmz7JgvyZL9xOcAN0C4uwNsjG8Om7F7j6GwL+G1EahI14zYxLvxsaEC5Cs
         6FGA==
X-Forwarded-Encrypted: i=1; AKwUvBxUkhSJjroR36+WHfpNZBxnRXcv+UKjY8VJirG+Hf6+fI02J2nsh5oVDVBmIhM0581b+DosVbXbUwBKVqw=@vger.kernel.org
X-Gm-Message-State: AFuF++k/zgcC+0P6/zqh9FzzR1C6mA7azDHr9NXl/W5ELbAx4hts0lws
	59i4knjeAIqHHyM+q6BVDe9BxH5u3XTznQmxxQqVLTaQ2+soJshNT7EIWw6N92IzrsItbr4ZiXs
	l4eD9/UKoPQ==
X-Gm-Gg: AYBFou0uwQl4P17Svw1ZzvFa3OFEbm8z2pGUDEEe7OtkGfGU1xnLT4jBDcu4ri3Ciqt
	dwGqNy9boIFsjKvi2lk1a2iFERFcfGEyKqsKAS/SUYWwCCf2y3ziUVCN7L7r+/Zd+2khnqJaxGu
	+f+box1YkzMR7WQjuSNoOrPni8BwfBTtYk6D2if9gpuHkLsxHipgMDSLvdSkguRTaEz8XpfzXm0
	BRcgkW64iZA41mQ8/eDz7ztmwiOe3JyWVo2g3M88EWSTofhrIqtE8q/Fsao5/2Tm06l3jrqfEQA
	MSBWxMDSwdwNeu+9W1Lmw1FHwXcx9JWEXkaZLHHKY8r5Jk8zTFME/cRMxdVvFqiLAgIAQYhwFHs
	UtdBEAE8fv99Pf+CSkSf1qLrgxnXyGS2z6HhZkPc5Qb9VXz1yUDbXhqQWN8eGoBCpSpSw8A4yiB
	tvKwlWfZkMnvFxlBmQw3/5ps2OfzzBpxVRRA/x8gZtjFbEUU/UwCdKHsjvorZi0KewK5U//OwEu
	TeP6ARjnyiTr9vakpVCykhWyPRlpkwaTnyCmPtWICXB1h55
X-Received: by 2002:a17:907:948a:b0:c29:d3ad:4f72 with SMTP id a640c23a62f3a-c29e5207917mr11013166b.16.1789512915383;
        Tue, 15 Sep 2026 15:55:15 -0700 (PDT)
Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com. [74.125.228.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de48af2asm33877366b.26.2026.09.15.15.55.14
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 15:55:14 -0700 (PDT)
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a605844571so457268a12.3
        for <linux-parisc@vger.kernel.org>; Tue, 15 Sep 2026 15:55:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzS7GX/0FfgI3/k8wuPMI+OCaTmK7UYI2vUZEHWwIIPQH1ur7kFisy6KhVwaA0H7GsGsoTriiTYPbTBR8I=@vger.kernel.org
X-Received: by 2002:a05:6402:5d1:b0:6a9:a6c0:e5ef with SMTP id
 4fb4d7f45d1cf-6aa2244ef06mr218172a12.37.1789512913950; Tue, 15 Sep 2026
 15:55:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <CAHk-=wjeamU=_RYT9cR3dZJ2N-Teo-N1+aYh7jwhrB=iWXD0cg@mail.gmail.com> <CACSVV028AdnTYa6OKDeoJYCau58uTkKMgEdqTn7crNSV8QZxOA@mail.gmail.com>
In-Reply-To: <CACSVV028AdnTYa6OKDeoJYCau58uTkKMgEdqTn7crNSV8QZxOA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 15 Sep 2026 15:54:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjhJF91TCO0Zqeuf+caG2tQZ4AzbLr2qFmRmnMM4dbh4g@mail.gmail.com>
X-Gm-Features: AcwNN1Wx2MaYDtFtmeOlL6MnzYY7doY_FEPpziKatTBWbLOeKsjmritQ5JuAL3M
Message-ID: <CAHk-=wjhJF91TCO0Zqeuf+caG2tQZ4AzbLr2qFmRmnMM4dbh4g@mail.gmail.com>
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
To: rob.clark@oss.qualcomm.com
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jann Horn <jannh@google.com>, Jan Kara <jack@suse.cz>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Oleg Nesterov <oleg@redhat.com>, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org, 
	netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, bpf@vger.kernel.org, 
	David Airlie <airlied@redhat.com>, virtualization@lists.linux.dev, kvm@vger.kernel.org, 
	kexec@lists.infradead.org, linux-hyperv@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Sept 2026 at 15:21, Rob Clark <rob.clark@oss.qualcomm.com> wrote:
>
> With fd's it is more than just about error rollback.. exposing an fd
> to userspace mid-way thru an ioctl is an easy security bug to write..

That isn't very common code. It's something that is done by a few
strange cases, and yes, those cases should just do it right.

But "those few cases should do it right" does not mean "make a whole
new subsystem for this thing that makes a simple "open" actually be
slower and stranger".

             Linus
