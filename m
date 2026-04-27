Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2BA3043BE
	for <linux-parisc@vger.kernel.org>; Mon, 27 Apr 2026 21:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777327182; cv=none; b=OSY7xPr3FKRJ7e0MGDGsPB37D/2Jjq4JS2G31N5QHOLYjYthzfy97a0wK/BTwAd5tSvPHG52VjUbCtJnOHZoJWG2xBv1m72ErgoS5hzbqn0rnINTma36dXM/veVXep8YB0UGIjmnpIkeqxfjFs2lA6lsXkEkGCxhutqeO6mRhH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777327182; c=relaxed/simple;
	bh=7P7VU36hQu4iMsGekLZKiPL3rBFQOW0TOaXA+fXfycA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hC9Q061W3turRArIZeYXkp7dAuuF1wKaIyXmYXw8epu1uzhZI26aJuNBHQ4E15XCNA02ijKRot/TY6sXwad3QdIU0CrZ91+SQybYLV/nMkUd8kPz9rDZj8e4EQu6mG6Bwgs8VDXWX39fqfzE9W8rgO9DeoGxifQbs+lSCqoLnYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=XoyDJfop; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="XoyDJfop"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b9c3a9fe80fso1582054066b.3
        for <linux-parisc@vger.kernel.org>; Mon, 27 Apr 2026 14:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1777327179; x=1777931979; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eodThUBj1SnOvacXe/3ftYxEWQMFbYqc4B0FCa9Alx4=;
        b=XoyDJfop5LOOhrPZeq9qiwPTh9UCk4z77kj3eile98CfcjwQodTzZ7AbZmZOqgCJi/
         QNBZutSL+fRAdS8mh1JuvjHQQ/zJX5ujrhjR5dtcczKcaM57rUycDbqNx9M1f9s9puyb
         3ZpCsI0lujinb+4UyHn7UbnUpSujs2jntX5CI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777327179; x=1777931979;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eodThUBj1SnOvacXe/3ftYxEWQMFbYqc4B0FCa9Alx4=;
        b=CehXDZ0vt80WkNObF5QISiF0Yj7QEbLMDjY1KSNnq/RBGNT1spfzLZi+mtBC7LEN4Y
         u1QjSauJGIZj9VylWnQbxKLWJKBdm01Jj8JAs0ys2B9pufRZZ3Ovu7j+2Qkx6TRgOSFC
         0a6l1vyDNLWYPP5kVFvRKpozjPwLd6PnNPUp04KopBXfQn1fetqVk89EBWeWsja8RvyD
         LBs9xneH3QVvbEgk4POT/QPbNh9hQ9KYmWUiiQxdg50zCrwVeL9boVI1JRrEIKnEZ7DS
         ZHO5gf9JVRWqJH1Cy2UhBTcuDEuu1u7mmxg7GLGu3I8gwd37r/Fa1WUYoaMryDWnQ1F7
         VfKA==
X-Forwarded-Encrypted: i=1; AFNElJ9pSxpCl2qnsnjQ3+O1WoLxNdwiLyOD4m9Kn3oD2/6Ron/1aXBVR6aatHiTkEBwwkfz9KqgjSXJgDdERWU=@vger.kernel.org
X-Gm-Message-State: AOJu0YweH3hUAVp+rtIbu+AVCy7aXn54zK3oK6JNC28WS9URIQFDnXDW
	q7W3UAX8jPLr29zcp8WgTNoFDRyIB8DwWKlm+akuj3xdhHvkr19CP0mH16srkcPnkxQkXwN12YL
	FeudvFI4dIQ==
X-Gm-Gg: AeBDies6nT4kYto1xk4Azv5XnoLDzdamiJ1PU/fSoS4u9qlNNTADTkNRn84I+Y4NSaV
	Yb3jqW37nAQTaQ833ANBA3z4Cg05Z5RROllI2G8yV63RJnrI9oTNZDs3CCLjdUG6lORSDzNB6hT
	KhGM18KVFmWsdLZjvT7kC8KfM+birjo0tzZd6fC1atwvicJS3eo/zsVrEBERvxmJWmfn2y88K5I
	xm3dZZT82l/SX3UAqGsg1DMR+Jt4t3M520X/0lareKaPJU5HQ5AFRmhf2q2isjkrkUso59tWXvm
	3LH2+HM9dGS6tS6PESUuZbcltWFqx5sHLdU/kHb24zshmgoMWvjvkeib52vE0HnPXYo0zxGne54
	35hp7Wt+6+o3esO6bFYQ0lt6oIavfC0csmhUJR8uLbuT++VwSpNT6XpeoVIYMg9ZRjFzjIaku1l
	eEYDjopqauYfR5IE3M09NZv5/uDY80z59MIsgjEX9vtElgHYbNwJvjBdDwN3wPW0E4iylDv+zgx
	iF/e3WpWqg=
X-Received: by 2002:a17:907:1b10:b0:b9c:bc70:e928 with SMTP id a640c23a62f3a-bb80377aa23mr30739266b.25.1777327179020;
        Mon, 27 Apr 2026 14:59:39 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb808632f35sm11155766b.11.2026.04.27.14.59.38
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 14:59:38 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-66e8cf72a93so13206712a12.0
        for <linux-parisc@vger.kernel.org>; Mon, 27 Apr 2026 14:59:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ80us7LGk6RvQ19Osoku31m/Z/NfrU3sCG3P/cRsNUXl8JqiIgT3VTAD2iDgXYekqlCjptAahE/9WeeqDQ=@vger.kernel.org
X-Received: by 2002:a05:6402:35c2:b0:677:270f:6f4b with SMTP id
 4fb4d7f45d1cf-679bb04a8a7mr185115a12.1.1777326742385; Mon, 27 Apr 2026
 14:52:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org> <0ee46bb228d97163fbdc14f2a7c52b93d8bc34ce.1777306795.git.chleroy@kernel.org>
 <ae-j2_QirCySZD02@yury> <63a4d0f6-0eb3-48cd-9f98-bf7b223b2606@kernel.org> <ae-2yLWSGnfeTvh1@yury>
In-Reply-To: <ae-2yLWSGnfeTvh1@yury>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 27 Apr 2026 14:52:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgPrLy0FR3sEWBYQuNAac1axDASYMnTuPuxEU0WytzL7w@mail.gmail.com>
X-Gm-Features: AVHnY4LQUFWo9ODz4M3q2vZC9Gn8nsdYr95Nd4ky5ERVHHxIyN_9ZXY5zjebfdc
Message-ID: <CAHk-=wgPrLy0FR3sEWBYQuNAac1axDASYMnTuPuxEU0WytzL7w@mail.gmail.com>
Subject: Re: [RFC PATCH v1 7/9] x86: Add unsafe_copy_from_user()
To: Yury Norov <ynorov@nvidia.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Laight <david.laight.linux@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-alpha@vger.kernel.org, Yury Norov <yury.norov@gmail.com>, 
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

On Mon, 27 Apr 2026 at 12:19, Yury Norov <ynorov@nvidia.com> wrote:
>
> This is what Linus said when added x86 implementation for copy_from_user()
> in c512c69187197:

Note that some things have happily changed in the six+ years since...

>   That's partly because we have no current users of it, but also partly
>   because the copy_from_user() case is slightly different and cannot
>   efficiently be implemented in terms of a unsafe_get_user() loop (because
>   gcc can't do asm goto with outputs).

now everybody can do asm goto with outputs.

Yes, it's disabled on older versions, so it's not *always* available,
but all modern versions do it. And if you care about performance, you
won't be using an old compiler.

             Linus
