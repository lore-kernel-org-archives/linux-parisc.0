Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DA739DBEB
	for <linux-parisc@vger.kernel.org>; Tue, 24 Mar 2026 17:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774372003; cv=none; b=O/jt0vs3rnTDC4V1AiWYll+eULScfWaw2hjGdOZE77kARFh7eP5Wkz0BIXGqOkqE7IeHnJUSR6y9FHcCO7L72gqOrYi6ukxiOsNeJRHYB7QL+7S5ibrZ+2o7pg4/bzZQOJ6drvjfTAPgDLAyElMTTVCh1ZsJtFSNvumuk1+SiVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774372003; c=relaxed/simple;
	bh=3GEJwPfpmz1HAcFqPqDcCHr7DP7fs2OA9k1TBgcroIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R+HJRkdt3bI/AUpJWJG/ekEXKDBFGc84zJvyNUJj2wk9oFOHpURsS3zltYiEkZRvV+em6czUHaZaghRX2AilrDW5oo/Zj9nWy/BEqtMYQws1NCOP2aEvOL8uEGZxvFhm3vRy6oGbQVFRDzJNFC+BaJzj3w4EB9odrdVes7SCBFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56b6c7c8d00so3452611e0c.3
        for <linux-parisc@vger.kernel.org>; Tue, 24 Mar 2026 10:06:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774372001; x=1774976801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=imA4hBFgRxEV6K6PxesH3aFI8Gk9es7sFYCGiASF9lc=;
        b=L5W7uPh9z1XRzCiuUweWXzRaF7KCN0ZF4HhfSuoVNbPGSGJ4t/pj7FGbZBqym+DnyX
         AeFhv7VRA94rYgubxoq87DS9mTVMZt8Cb/Huwvnf5GtnEOiq7PZzobxn8bGIakIg01TX
         wrkcP5PechEZ+vRDfwVFdm6foSazfbw7skpduJgYn3SuKky5ymtehEu3rN7S3JyJwv/g
         mOX6HVPOLmlpSj8eabmJETlftS4mrrZLXfZPygkRYnDqSZYwRrRtM0ow2GPycieizAmy
         r52zyHCxG/a89ZMhrbB5sF+MpLL4RHkeLfT6mGHH5Q1PGd3ZS4KA/rGnk1C3DGjFl19W
         dq8g==
X-Forwarded-Encrypted: i=1; AJvYcCVxIlUmrRgsXsklPuqQn+qqCtMszpSZCI421UD4EwDVtr7ZETpQptMn8MH59VWN28hnuj9tXgGNU7lFx0I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSUdCBuG3QVUduM4XElXKmOD4oxTBeefiI1SnGaeO2su4QfAdr
	s4gj3IoHGlKDRq0q8MRd0NLKdUdBa4kdZdbUIAN5Q7Nu7P5Dh9qbEzbkuKKUxpTdS7I=
X-Gm-Gg: ATEYQzxoD8kl7gPt6ibXDobW8v5L5evp95LnOMC9A5sSJHVn89S5vA9zCMykcw3qpnr
	Uo1j2+eJP9U12drpjuG6C6yp9roWK/a55sAfure6X+QxSN3w42S3qVcSrlqQyX67InhZ6ev5qcJ
	/KnfeBfBUJPi5We4bwV/OIcgndX++cen5+dINuWwe5cCPsgPRwNL1bRqBB24tj4Otx1jpFPjO9N
	6BNeuqbpPsOgJBtmlYur9JlnilNWqsLITjtBnxBtP25sHT8ad3yr5d40GTUzmCiqzhDm6AwJbmz
	2uNFQkZ/s10uIX+EXwGF3Jh9JgMnl+dxe0JEsM5GTwZUdAfz0yIlO8iRi0L6OAaZFMqBBKbn8w+
	YWu6Y9UG8MRej/JKq+9Oe/KBm4gNjVxzMue/+YZDb4ffAoDuQSO38K8YSpXTZcIAx0aI4UG/VPW
	tZ8TWGIRajWDKMvIc5RyZYdLsCdcaNQLhxW7HgjszwzXblsbdUrSJHc6yCwZvU0rhU
X-Received: by 2002:a05:6122:c9c:b0:56b:c6e1:65b2 with SMTP id 71dfb90a1353d-56d21f3d2d2mr401419e0c.4.1774372000904;
        Tue, 24 Mar 2026 10:06:40 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95136de3e33sm13166596241.9.2026.03.24.10.06.35
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 10:06:38 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56b6c7c8d00so3452527e0c.3
        for <linux-parisc@vger.kernel.org>; Tue, 24 Mar 2026 10:06:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVIrNHzAZm8+nWMj9wWCbVbW0/+/Y8n3fXASZwG8VlcvIWadQ0v1xYFIOtqINIcttedK898SZ01HFIt9cc=@vger.kernel.org
X-Received: by 2002:a05:6122:1da4:b0:56b:5978:22f5 with SMTP id
 71dfb90a1353d-56d220a8b85mr416671e0c.12.1774371994638; Tue, 24 Mar 2026
 10:06:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324165633.4583-1-ilpo.jarvinen@linux.intel.com> <20260324165633.4583-6-ilpo.jarvinen@linux.intel.com>
In-Reply-To: <20260324165633.4583-6-ilpo.jarvinen@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Mar 2026 18:06:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXX16=pih34yehj=3bJkg2H3ivGUj_34JDg31ABheLE5Q@mail.gmail.com>
X-Gm-Features: AQROBzA3vydAXwvxX7mNaSzU55R-3eBg9lznDuFtNbFYtRdYd66gsLQKONTytjo
Message-ID: <CAMuHMdXX16=pih34yehj=3bJkg2H3ivGUj_34JDg31ABheLE5Q@mail.gmail.com>
Subject: Re: [PATCH 05/10] am68k/PCI: Remove unnecessary second application of align
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, 
	Guenter Roeck <linux@roeck-us.net>, linux-alpha@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, Russell King <linux@armlinux.org.uk>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	linux-kernel@vger.kernel.org, Greg Ungerer <gerg@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

CC gerg

On Tue, 24 Mar 2026 at 17:59, Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> Aligning res->start by align inside pcibios_align_resource() is
> unnecessary because caller of pcibios_align_resource() is
> __find_resource_space() that aligns res->start with align before
> calling pcibios_align_resource().
>
> Aligning by align in case of IORESOURCE_IO && start & 0x300 cannot ever
> result in changing start either because 0x300 bits would have not
> survived the earlier alignment if align was large enough to have an
> impact.
>
> Thus, remove the duplicated aligning from pcibios_align_resource().
>
> Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> ---
>  arch/m68k/kernel/pcibios.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/m68k/kernel/pcibios.c b/arch/m68k/kernel/pcibios.c
> index 1415f6e4e5ce..7e286ee1976b 100644
> --- a/arch/m68k/kernel/pcibios.c
> +++ b/arch/m68k/kernel/pcibios.c
> @@ -36,8 +36,6 @@ resource_size_t pcibios_align_resource(void *data, cons=
t struct resource *res,
>         if ((res->flags & IORESOURCE_IO) && (start & 0x300))
>                 start =3D (start + 0x3ff) & ~0x3ff;
>
> -       start =3D (start + align - 1) & ~(align - 1);
> -
>         return start;
>  }
>
> --
> 2.39.5
