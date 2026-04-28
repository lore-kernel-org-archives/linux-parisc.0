Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BC13A5E9F
	for <linux-parisc@vger.kernel.org>; Tue, 28 Apr 2026 09:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368681; cv=none; b=ZAatu0Uq2Df0cgQr63qobdC8mqkAFQ5w0YzKw5xsFCDTGMuui5Blh03bNlv4OvFQax4lDmX0l7G0RdBniG+sPB6sDXdFhbMFIamukcEHpxroZKbSV71gxGwMSoIRtR2oB9EkmnB9Xw0yWT9Yf9hpB8dFCmpE3z1PfbEBSbrHUkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368681; c=relaxed/simple;
	bh=WZ0dv++aH+AeLwkvbNXxLqu7wJ3mA6GpS63WG1N27Uc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JAtGrR+3KKXCA5BFA1uoLORRanSWqO97TYLl7aFL6kMgpZGDw5tQbEGnQbtjQIh6dg9aF+OLHNxV1EMWXRRB5l5Lwm0ZoM052rICzwfhvYRdLlDKMOeMqngdlp1R3GILiuRZ0BUMkRNXJsgDvDm5+Y+q82+SS+ggaA0t6QMRbmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-678a526f374so7377377a12.0
        for <linux-parisc@vger.kernel.org>; Tue, 28 Apr 2026 02:31:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777368678; x=1777973478;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Al22kA6RCf7FSEzj29cZLSkjdM9EgXxihmBX7/SeSVI=;
        b=aoaDEccW6+tnCiHn31MymprAts3gPweQQvX7CkWRyWpdMtF94EMo8YfGqv7N0QWSqB
         fmMbEh4tAoG4xxi6ZJuRozSo2w4778nSPLsqmqgHqIP+9pO6k4HljQ3TqRwjXoyH6Zvv
         8C7cvEoCvcLKM305lN/2rCG7eIEFCeC/5B9IVYbcHLNSuVLCQDWB+znW5/Ou9BjJGVIa
         tPL9b8dcXmiHl2J7Ab7cRhn/zli2a12L6DZmulnRtAdkz658sB4EbOSZhHJhgwZx4i7+
         /WmXAGaro962n10tYVIcAgM9oYWvPvBGBzbsquX5MHzw+SMHfIc4Zzeq/2hgFzc1ba1D
         hshw==
X-Forwarded-Encrypted: i=1; AFNElJ9KAFdAdBKRH6rWWnlc+EI2ww7XoHfKIkwTZXEpCNdrR/b6o+olLwaQpTEIjDhh1nsx+wSHjCN3UUcvMP4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx/ziD2xF/fRDGtxWbR3aN81P9KCj8XA4ctvVP7mikj5Xr1Yaw
	0UJiXxraLLUnqFgreh0dfWbq70yH1PSGtKQS9jiqjTXYjfNGN7cex2s2O0UzpSGzRNE=
X-Gm-Gg: AeBDietXvgqRmdqCKJW8ZA9hRqdHXxo6w5eAxnuV8ADjfXx4QqVz/++P8KhDNjDzQaa
	7W5c7gRVq+v36PQXvv/shiU8U8dUkFKiSttwW5xxU0vlscdr6N0B5vqcc4PyFwbXX0p00ls8TL3
	QWacFtsXRchnFtGPKscCkJv6mB1V/k+6cjv9hw6uN4uyk4adqJ/MTogR7QxjmBdy4g9CRteJRYa
	d4cQDBSQoREsM7s/V+IxA1bph+tN1i9LJRJnZ5V+eBEBT8hNd4ZxgV6Bx4oMx/ozjIURQwaZk22
	mSG+foq/7jG7N6nm3WnGc7fohoSewCijtFhnioj057VVZ5n++vdFZTN6+Zv36vuOnaW9pgoFMdC
	YvvuTzEvLlQc/A2vWLw/MxmF0aODCaNLkCaGo+jMVg3gPOBFy/rMmFqSIxhpiUq5ENChamwNDfF
	j5UGn0G9tcE2LDx5BLRw3g8VH2jeAqWfUtzvFQFNS4ls0Yjx/b8F0+vLuw3VO1bcKCgDL/LSs=
X-Received: by 2002:a17:907:9453:b0:b9c:7dc2:e464 with SMTP id a640c23a62f3a-bb802da8530mr132928566b.21.1777368677515;
        Tue, 28 Apr 2026 02:31:17 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80bd91f49sm73377266b.51.2026.04.28.02.31.17
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 02:31:17 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-65c4152313fso15350684a12.1
        for <linux-parisc@vger.kernel.org>; Tue, 28 Apr 2026 02:31:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/e5m0CUAHzLqLs4HMQab79Ry9snuJ455qMbcu9hpFZ0WBQ/NgVOnG+zU0m+Z5CQ02uWoo7IzgPPsTCkPQ=@vger.kernel.org
X-Received: by 2002:a05:6402:5056:b0:676:d8a1:7a04 with SMTP id
 4fb4d7f45d1cf-679bb09a4admr915149a12.23.1777368324094; Tue, 28 Apr 2026
 02:25:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org> <c73b90236f2810edd47c84edd2a8d8e8e0c816da.1777306795.git.chleroy@kernel.org>
In-Reply-To: <c73b90236f2810edd47c84edd2a8d8e8e0c816da.1777306795.git.chleroy@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Apr 2026 11:25:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUvTBWoDN_wUo2n8-gkoheJ+-rbwew53OvoAwo8G5n1qg@mail.gmail.com>
X-Gm-Features: AVHnY4JEWBVPw4tSjHgbQTia8gZd2WGJ1sv6qLdKJbtvs4hms1blpvc35yb0VWw
Message-ID: <CAMuHMdUvTBWoDN_wUo2n8-gkoheJ+-rbwew53OvoAwo8G5n1qg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 4/9] uaccess: Introduce copy_{to/from}_user_partial()
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Yury Norov <ynorov@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, David Laight <david.laight.linux@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	dmaengine@vger.kernel.org, linux-efi@vger.kernel.org, 
	linux-fsi@lists.ozlabs.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	linux-wpan@vger.kernel.org, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, 
	ocfs2-devel@lists.linux.dev, bpf@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, linux-x25@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Christophe,

Thanks for your patch!

On Mon, 27 Apr 2026 at 19:18, Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
> Today there are approximately 3000 calls for copy_to_user() and
> 3000 calls to copy_from_user().
>
> The majority of callers of copy_{to/from}_user() don't care about the
> return value, they only check whether it is 0 or not, and when it is
> not 0 they handle it as a -EACCES.

I think the "a" can be dropped.

> In order to allow better optimisation of copy_{to/from}_user() when
> the size of the copy is known at build time, create new fonctions

functions

> named copy_{to/from}_user_partial() to be used by the few callers
> that are interested in partial copies and need to now how many

know

> bytes remain at the end of the copy.
>
> For the time being it is just the same as copy_{to/from}_user().
>
> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
