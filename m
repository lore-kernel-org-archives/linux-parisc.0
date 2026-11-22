Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795316693;
	b=U8+1Pzog2vSFD4slfyubd3YmRhWyJ6ETQ2rbzirj48Tc1gihUK1up+WbYw5ZNToLK7n9
	 yg9ZL5ArIpENZffSuNZNjKP0pY3BPOZPxP7gzy1Mz2biGX8Vs4S7PRyg+xKe4ykq7DFU3
	 h1eUszUp4NtAWgOLXoWXHEXQoQ3JzcwipBghg2z2yQu1kN5KkFNA98rBadoJZ/IBiaK3n
	 0Ibj0PA7GKA5gCHniiU1uLc6bM0weGqMJmMvC8RHwJGieskxTt0ydduPGQKWyEJeiLdKs
	 nUEO7vmHW00kgrJpSrnS6bNlG33rJctNyFIiOV3W/FLrBU9bNP35Gz+gnfQH3lIHnTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795316693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type;
	bh=NieCLCvG+gDw8VjVQsEmj+Xb3Nuvde1xSdj6TYYBmIA=;
	b=4UEvw4/WCaB8MtVyR7ncYO/MzDjkhcbfKMSTBSF1IOyDOv1qCaBwzWsh4nJoLhAIkOS6
	 4spNTyFrnp2C21OG6ya6MURhmPE7Dtr0u8Nhk0E39J0VHVFi5oUAZMSc3zgiKGt2kB5LJ
	 y6t2R9gSodSBorh42RcAZtY7ve96S6lAIcu1kGiWINO5oKgz+RcvMo4hDIkHCn/uWzZPE
	 1vGKo4os46s0CEqP01UaYRn4mk4ketyUxaAJQsvnHU/9Nn9+MYasPE3EadCFiVR4b9Pgy
	 EWdXxC89ES7lgRS/qzFvDduulSMMDaR/n2R0hk8rLezoSTROdaD3tM9csL59ks1FCnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lQMapLMR;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7704D606A320
	for <linux-parisc@vger.kernel.org>; Sun, 22 Nov 2026 03:04:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7704D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lQMapLMR
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-380c28f9e35so3166919eec.1
        for <linux-parisc@vger.kernel.org>; Sat, 21 Nov 2026 19:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795316691; x=1795921491; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NieCLCvG+gDw8VjVQsEmj+Xb3Nuvde1xSdj6TYYBmIA=;
        b=lQMapLMRecxhRuMkTSymbForunIxX0OPXsGQ1CXe025r/577yULQNYi3TNrBG53/Qv
         zYU80ixAjK16x1kduXUqa1QZW9W/3ti9d/2xwfANhvwcppx94XY1wfu52uKp1wNIi+xo
         0BbROgPXyu0B62JpFc4+zEJIoiLBcGXeP+W6/munvXDcClY8J5U7eqCSCyRjBp3WeH4+
         q1p1SE27fCRmjWxB4WY3p9l7b9yn5x1FejoLmUjB8Y+BhmVh9oZGKVtoBu6VvuhXecB+
         kqHQVq97TpxJ2ylXI5iv8vW2n/kYW3PMkK+9IBmWOkrDx9AQECQxv8quTTJlItW+6/Cb
         tThQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795316691; x=1795921491;
        h=content-type:mime-version:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NieCLCvG+gDw8VjVQsEmj+Xb3Nuvde1xSdj6TYYBmIA=;
        b=FXuDk5HOAjV2saNb9yjQ77V7hcSJ5sGtn3F8swGUqQ9vJIvhBaiDbWwzcdZBfV9l5P
         y5a5LnXpb1EmGlG9hGMtNTpw2sKVOUBXkWt3vnM8VtiQmWATzDosCfn69yUmitjsJRwV
         mAmYHZLKGD2X+JrZNm8CsPKnAsM18+eeWbw3L7dimBKpa/dC+lRwnA4F8yLJURHPrklx
         ffmmYg46a3nUnUSBjESji6dx8+GVTVBSB4SdlpasoUhZT1Qe3XBn7gdfnGv7oPQgjQ66
         702z9+7uP1NjlbTC1Ba6rRyrKhZPR398GsBG55lb1bPkCxtqYNITrQx63Xt/i1nki8LB
         qR5g==
X-Forwarded-Encrypted: i=1; AL+hErEKnl1qMzWbtqLNsfX5MyOZJwxDpAHA0nV02MfTb4RXnIra4luCgKH56CQIK7V32hR+221SFQ760PLfbMQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qQzyVbtRsKVH4YjDXVTgX+0upJBHGoyjzAxdNarmFt0uUYrci
	ZUmUV9ZZwZlv2NHZqPc0kGRbJyYZLCoTW60SZ9XsVv0NfcmjzgGO7Qxl
X-Gm-Gg: AZFdTZdGcPezweHFyo57BLS3YdBQLFGOOrwzeY/dXN0PtKbWt2vEZzdqvk6C3AspQEZ
	ClBgFcpVj5CTQ5RMASD3Zkk4zOkdvc7YBT+6a47nSowxQjS1vwTRMUMGLIPnAmBLXmVOP3LwTaQ
	eAI9jP/PsOQVgxHe5rlg1g9a5zPocqdjzwNJE+6FfiR0d+sJPEvOpXjWTVvSiTTtyUwIUmBH7jU
	rUqudOxfjW4yX7wZzjpnh6BQkCZmiPfSGO3NEdoG2NTW8l0HWevyJQmRONcMMhcbnUVpYbR4HbJ
	JiHNXqwi1v90IrBYpMXLSVaYkGCn4EBS9MZCqJLdEnQ6GxbyfXqak0lxbTx5WhrsYplMeu4Cac8
	sun829AOSDUuy+66xfYTZpFRJvAqVD57nNUTtLM5Lqzg4NFRQIRRo9Q9VmvG5aAnv8BQito+EAX
	YCV95HbiXIu5VL1X9yPnCAwaTicEOxY1g9Q9s8xPiTQxx1jAmSwPE/Cn7yPMyrmNdbWW/q77g5u
	GgKAPuVVZAJOKXDYoHtBlmK5Bw/V1ofMkOfBAJQliZAuwVzXSZF/8h8M6Q1OgkiNSpCfqAVdhvq
	xWMEZpFSaHh/g+R2C/kHPdSx29QigoNHbAfb0ja/Lyyll6or
X-Received: by 2002:a05:7300:50fa:b0:383:9f52:e54d with SMTP id 5a478bee46e88-3856ff52e83mr8869235eec.8.1795316691531;
        Sat, 21 Nov 2026 19:04:51 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm24302948eec.27.2026.11.21.19.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 19:04:50 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Baoquan He <baoquan.he@linux.dev>, Borislav Petkov <bp@alien8.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, 
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Paul Walmsley <pjw@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, Rich Felker <dalias@libc.org>, 
	Russell King <linux@armlinux.org.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, x86@kernel.org
Cc: Alexandre Ghiti <alex@ghiti.fr>, Christian Borntraeger <borntraeger@linux.ibm.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Cong Wang <cwang@multikernel.io>, Mark Rutland <mark.rutland@arm.com>, Michael Ellerman <mpe@ellerman.id.au>, Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>, kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev
Subject: Re: [PATCH 2/2] arch, kexec: declare kexec and crash capabilities in Kconfig.kexec
In-Reply-To: <20261119-arch-kconfig-v1-2-37c276fe4d26@kernel.org>
Date: Sun, 22 Nov 2026 08:33:10 +0530
Message-ID: <wlq5k1ox.ritesh.list@gmail.com>
References: <20261119-arch-kconfig-v1-0-37c276fe4d26@kernel.org> <20261119-arch-kconfig-v1-2-37c276fe4d26@kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Post: <mailto:linux-parisc@vger.kernel.org>
List-Help: <mailto:linux-parisc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-parisc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

"Mike Rapoport (Microsoft)" <rppt@kernel.org> writes:

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

No function change observed in this patch (as described in the commit msg).

LGTM, feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com> #powerpc

