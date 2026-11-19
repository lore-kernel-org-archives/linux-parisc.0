Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795073752;
	b=MGoUYJDRcUrlrbPYAN3NzrInILk6HDKo1WijCH3Z9oaleJ1OH2y7RcGRha+6aehojdzX
	 fGYH4/DyCQRC0jfMt9SL6BK6yLNRXCcUkfrWohyyNHn1f1Xlylmmi4/3gOCwcIc6Ji8Ni
	 gU+n/ORSAQIWK74NoV4GHYezHDItorxvn2lEKTv5wLGUllP/bxV0lS4cY6uXJz7/rk8CA
	 aa87t/uHZ46N/bCeQBfg2fVfnDUXvgDNQwEmsI2PedYb5tf6SKe40PXEu5HfZZ/LVulZg
	 J1yqdsb7jSkXb25NWmy6uYmvWgOkn73D+Bmh5XSF/TojZJDjIsIS8/ecxrSWiouXDRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795073752;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Klcqtq67J8++CxJ47wWJ4KmRtmeIU5oN8tRyALYYbAY=;
	b=U9RPHzDdGmhsgqYvUCN2kzbqGk5nTa51OZOkhHyH+1Ae3LyAN7WHGKImx8l6GNUUk63f
	 nkI3T75qLYBl7JkyvsRZOVtOd9QLbEwam8B4H5JquqXdhFwaCX/KoNeo+13+bGZnYnl/U
	 lSQ6CRJ2w1qqLYF4CE8DwV90hsLmsr3vyhJZfKclX7MUHiKtAgeqWF9KhxuJeYJyMi2Sj
	 2kKuGYB6xAPrMNgCWn64ml1Cq35qH3e1a/i7Bb1y6nxkE/lZ4WKEZBcOcPwV6uRDOgarW
	 WOd3lVIG3Q9YCCKucC6PqLaY1h30lroOEKHKRKyS37jkrBH2lfE5af++goshjnxrb0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FC7606A32C
	for <linux-parisc@vger.kernel.org>; Thu, 19 Nov 2026 07:35:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54FC7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-8629c7cc36eso1117473a34.3
        for <linux-parisc@vger.kernel.org>; Wed, 18 Nov 2026 23:35:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795073751; x=1795678551;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Klcqtq67J8++CxJ47wWJ4KmRtmeIU5oN8tRyALYYbAY=;
        b=dbFKrVHXr5UyY7QeSHIYJRm8v3SACMMDj/Tq1iuiJvXLLX1N12RJwIpukm66crQoaG
         7eno39X6cZEQZD9y5f14k05jjUQtIc8RRHJR6RYXTNa1O96wg2FnPqzVPlHpgKF3gRnd
         sDmwnHtRzQjJiFlVLxULFJxCM8foj7/7KZIO8Hm/CobIo5NyWhsTBa+MbFqX8apWSPre
         NbOWSxEZXSQGjuTtVEPz/RN5zhCBf4fK6DLApe55k5bvziT7UVnb0Bf9grJ6+FfrA6/H
         iGWPOCGVrtMQ0U4RPY7th8PjDba+C2ZtsiSjNh/zBnkZOnfMxC7Ccj18CTIFj1rU89nA
         37Ug==
X-Forwarded-Encrypted: i=1; AL+hErGdn89GljVsJpOimpoDfkJqGI/reDkRhSUS16RZUTRYRjPm8gW/+tHi3GEbjuu3DPAqEqE2YY/PNyd35Jg=@vger.kernel.org
X-Gm-Message-State: APuU4Z81VaRVHLYq6e71Ya2TXqR2sLW3A15qbvI29cwIaHLOn7fO3nUW
	nVY+hfmMlyELXB2S7GQsZlYLMUYpJSc0uP980xLDUHqQlOsJNNUngRaPoHBUv87Y
X-Gm-Gg: AYBFou1qX+fXL7XJRA/tqZpmD5OMP7swW5puLj5ZdYIuhCsf6KimAEMOGAjTCxj1kL9
	teWih39B9yfb9iyM0g+ASwrEsMxXlfwvNBP6D9zC1LNGXytlYT+3nAf4QVCbEk+diJld2/V/ucH
	UwsoY+eSQUr2FBR+N3aD8+bwrlSTCmveWacvsVDDZTQAnZNur2IdTyRJXRgOU/uIiqy60x+b7E4
	ccFHj1wFaZdKop48ens8q0MEAn+s8EhIOoFBNaOO/oZjsVxw6MMabRlG27EWuQtgLsWaaaRBV1N
	qC3VHhOo+nc6ttasfjQu2qMw4docjcWhnHk0nMwMimimU0YdQq67K/L70rMmOciQ6uK4smNmzd7
	dot1exv1EWjsN+O0bCcYlu9xogkhV3i8ykCRlNgOOkiWgYhzJfCIEvXmBRzYJWtwRh03aeAWh6A
	fTBFvFGjjCnekMgrSKHREvKN0GPjkWysydHsF8am54Cqx6Ebn/El9QrX8ZXux2+xDGklVDKeGAh
	Y2ZvBhPQV/OuR6mPHASpcFl1VZV0jk/JDxw0bbBjVCAnjhxw0MAYetCw6PTN8Uder6Ue+fRA/1U
	8PVQyonX8jvk7xGnG6LOJrUa4qQzSBNhf3Sp5lZWieiShmEmtX0Rqbz2BPGFWDXJEVjS
X-Received: by 2002:a05:6820:718e:b0:709:1cc3:ddee with SMTP id 006d021491bc7-71b18565791mr3213609eaf.30.1795073751294;
        Wed, 18 Nov 2026 23:35:51 -0800 (PST)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com. [209.85.161.48])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b192272ffsm3898094eaf.2.2026.11.18.23.35.50
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 23:35:50 -0800 (PST)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-70bf1671c21so1226147eaf.1
        for <linux-parisc@vger.kernel.org>; Wed, 18 Nov 2026 23:35:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHd3/mQlwgHwFAO4ESjjdVHxJLaAtgjpfo351OrfcjaK2662ptucZPy+9WXJb9P2KWqVsKyufrkJmVfKPM=@vger.kernel.org
X-Received: by 2002:a05:6102:e0c:b0:7b3:8f0a:f76c with SMTP id
 ada2fe7eead31-7d6ba35b7d8mr1806982137.13.1795073401089; Wed, 18 Nov 2026
 23:30:01 -0800 (PST)
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Post: <mailto:linux-parisc@vger.kernel.org>
List-Help: <mailto:linux-parisc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-parisc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-arch-kconfig-v1-0-37c276fe4d26@kernel.org> <20261119-arch-kconfig-v1-2-37c276fe4d26@kernel.org>
In-Reply-To: <20261119-arch-kconfig-v1-2-37c276fe4d26@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Nov 2026 08:29:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU2u9wDiqp+H-aDWSRcT8_VtDg1NS0gVmqYYm9rt2ZSrA@mail.gmail.com>
X-Gm-Features: Aa3M54rf5ygj8ORK3fy8Y6Bg5UcrfzvYekQ-eoJmIgxSYs0ZeBrecHV4-2jERSw
Message-ID: <CAMuHMdU2u9wDiqp+H-aDWSRcT8_VtDg1NS0gVmqYYm9rt2ZSrA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arch, kexec: declare kexec and crash capabilities in Kconfig.kexec
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <baoquan.he@linux.dev>, 
	Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Paul Walmsley <pjw@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, Rich Felker <dalias@libc.org>, 
	Russell King <linux@armlinux.org.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, x86@kernel.org, 
	Alexandre Ghiti <alex@ghiti.fr>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Cong Wang <cwang@multikernel.io>, 
	Mark Rutland <mark.rutland@arm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>, kexec@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Nov 2026 at 07:17, Mike Rapoport (Microsoft) <rppt@kernel.org> wrote:
> The options that let an architecture opt in to kexec and crash dump
> features, like ARCH_SUPPORTS_KEXEC or ARCH_SUPPORTS_CRASH_DUMP, are
> defined in each architecture's Kconfig as def_bool, and most of them are
> copied over several architectures.
>
> Declare these options once in kernel/Kconfig.kexec next to the options
> that depend on them, similarly to how mm/Kconfig does it, and make the
> architectures select them instead.
>
> Selection conditions are preserved, so there is no functional change.
>
> Acked-by: Baoquan He <baoquan.he@linux.dev>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # sh

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
