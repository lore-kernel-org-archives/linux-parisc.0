Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2484F3FD12A
	for <linux-parisc@vger.kernel.org>; Thu,  9 Jul 2026 08:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783586536; cv=none; b=XXaCX8lg8ER4NiEO30FC+7UNecYdLXZe5if18mAVaHhKJChHFrNGP9d7shOW6ws7zZKFWT481hrATPTqQqUqZgZBWPLqAjhL9n3ahSXPErEbyJdA8QS1ygbO+Wbnx8J7IPZZjoWFik8Hnb3dEuYvbVaSjuzTITKOwtI+/LNja2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783586536; c=relaxed/simple;
	bh=vcIYcFn8wOu64JToHCd3V3ghUBsco6aWxPDuriYHfZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n3esNJLeyH2Hv/GgabaE4vrkjoeeHv/fhBED8UrljLe7eA+bxK7B8sGEQI4MUHWLMO+OR3e10QFAw6lGkLnJfgiuGmD2gE30egSDSez/v+OcHr/MAoGz7fCQj3DsEww6H2npk1SACmBgI/fKmpRq6VmM9wbY9VSXYUxaomeVBv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5bef75a83e4so497806e0c.2
        for <linux-parisc@vger.kernel.org>; Thu, 09 Jul 2026 01:42:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783586529; x=1784191329;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=O3mkBNkViagFAJs3obyg41kBlrTMtmvpPUP/R2gZOPo=;
        b=L/kxtNd3i31vOhw8dcqDw7XdTLYBXIScRkh8HsJgmsuq6OWpnvcORN63WP8D7LCjGq
         vssFupz1xIUKqImsp//XlT2pJeSp3dUTmJ/C88enHXpdwkkqD589n5rkXblJU/5s5t1O
         gdymTKLO3uj7PWjM5KvabnrhVavW3Vwuomb+Um5wrBRxS++1c3SwmxTMeDTAUHCiVYhp
         EhDBK5fzdP62HTU0i+fg+DbcEGCs86jgtOMsxMCuBCXJGHqZPsDDaPA2XTl0/Fl0yaWe
         kLiX0Ec0WOdycFyvXEpEtLQUKotQZz11OVi/07utOexA22mPus7ZfiZT6aYegRGx9j5W
         efnw==
X-Forwarded-Encrypted: i=1; AHgh+Rpu+hZi8DEpKPFNHBcY49+o6nFRZQsdbeAAPAI4gsbGe6ejrUpmz183IMjzNN35av9+6fseNl/cptNHR5s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiXIfNII71La7VrF+BlyHuNBvuWPouHeMyUNX360Gb6hGOw3gp
	drHPPrFoNcHjQI992oWnolmf1wE9s/3xmrJmNq3jRj5EWCVC7sWTvUFpUghJyJAm+2o=
X-Gm-Gg: AfdE7cnyjAQTpxMnG0rHQMEB7RbZI8tW21NrY5aRkA9FLYa1m3oCnaWvIOw5P8dBpP8
	YWHKIxg0Tfv58Ly3kPSfViGmiWnrNcru1YJQ0NLiHgMhD8XPGDjC5jL4q9ljdhV9Twcj04NbGVN
	YX0qkumbLbh0kNVO1Xr0yavtw3lYhL2iIyJcoi7LvrSjnoA5PEevuVTsnEAw4SNz1KKXYyZ14rc
	bDnmM0Yks1jB6V27taUftpak0ND+awtqzFbdSoXktYN3LpR+x3d4LzclHsgVNZSWoVe2dfBMcdq
	oJyc0JUyCEo0cscQ1eGw+4tsg726o3/UD1zX5Yn+kOt21VrE0Lvf7UvjSV8T1QmB6ox4tYf3N6C
	dDXsDPRMR1GqpQHNf5j/OkUsrFlYgi3skaJN7mldGCwSx37J1YV5hdF+4WygmySBlmhBSSdQfkB
	aevvKMuQISR/HQgoJ5w2S0KjZhh4U4IgVbYFhdBR/NOtF9nPNO4w==
X-Received: by 2002:a05:6123:420c:10b0:5bf:8fdf:89d with SMTP id 71dfb90a1353d-5bf8fdf11f6mr512314e0c.9.1783586528824;
        Thu, 09 Jul 2026 01:42:08 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bf6f35a36esm3240498e0c.0.2026.07.09.01.42.08
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 01:42:08 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-6cf48482ddeso559227137.2
        for <linux-parisc@vger.kernel.org>; Thu, 09 Jul 2026 01:42:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpC/aKM1TOKIroIs5UOIFYq6XWXg3HBY+dLg3F9G3g1Fxud71+ds3ervVLrEyZKX3c4acM9a6ZGcSgZYNQ=@vger.kernel.org
X-Received: by 2002:a05:6102:6895:b0:738:9dd5:9b03 with SMTP id
 ada2fe7eead31-744e03a337dmr3306957137.20.1783586528282; Thu, 09 Jul 2026
 01:42:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707181957.433213175@kernel.org> <20260707190254.280015701@kernel.org>
In-Reply-To: <20260707190254.280015701@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Jul 2026 10:41:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWe1D0CZrav5h6EhDDbeJzgJcHvT89jrs6109Bdj-pdTw@mail.gmail.com>
X-Gm-Features: AUfX_mw8w2Kp5VuAYozzfDNS6gDbdKhQdYzfXsv-G72F3LS58UBytbGwOmplITc
Message-ID: <CAMuHMdWe1D0CZrav5h6EhDDbeJzgJcHvT89jrs6109Bdj-pdTw@mail.gmail.com>
Subject: Re: [patch 12/18] ptrace, treewide: Rename ptrace_report_syscall_entry()
 to ptrace_report_syscall_permit_entry()
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Vineet Gupta <vgupta@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, Brian Cain <bcain@kernel.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Helge Deller <deller@gmx.de>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Chris Zankel <chris@zankel.net>, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Andy Lutomirski <luto@kernel.org>, Richard Weinberger <richard@nod.at>, =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Jul 2026 at 21:06, Thomas Gleixner <tglx@kernel.org> wrote:
> The return value of that function is boolean and tells the caller whether
> to permit the syscall processing or not.
>
> Rename the function so the purpose is clear and make the return type bool.

>  arch/m68k/kernel/ptrace.c       |    2 +-

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
