Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6973A4F51
	for <linux-parisc@vger.kernel.org>; Thu, 16 Apr 2026 11:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776339009; cv=none; b=W7zT3HtZK1POMytr0eoEZNS/S0RxDJcDgnRJ12cMCv5QmwaRRFSJsbF0k91nGF5LP7rEWTyrLySaGjWZa+0C2Yc5UvCGkzIMtGQQCpyedmj9bmDABg07As5krUey+licdw5OC4CtvUh9I6pm41o0/gaYc9b6lE4X+C66IwAh93k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776339009; c=relaxed/simple;
	bh=FSgVIzpnraycKQsxAztrNgNSM9On/XU1ftEj+pCL/gg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dPt6doq1M37e678D3NSVhBC+egenUjqWp4k4dxO31LnUYqit3vdpieuxR+y/0+iOJ3VAKcgZ5w7mPnnerqVEWwRTb6AWCVdAzzQIVt8KqA8XfU9R1c+tzEud6RVAXf7K8wyGTkNzLopQ4PPoN6QYNm7rLTFOZRMvIgEYsUV1ZF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-47952229034so2875896b6e.3
        for <linux-parisc@vger.kernel.org>; Thu, 16 Apr 2026 04:30:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776339007; x=1776943807;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AptjVPQ97g683jPGYCmYUacoTRTAG/3/TQY5t1TSdkk=;
        b=tSWmGJUm+rL2OYGGc1xANPN2ocqJZD+y0quUHvo2LeICwrh2cDGYBf3WnSdNoT7cxL
         HV7QXTy8MS4sySR8+JiRdf3bTzJeCfhAu9j7XIWagVvjWMa57Ou/lXK5QQvfIoNNUwsk
         8Ln5Vsc8MWZuZkH/ND1RYDth/kFyxm+1OHYqxuKCQuonmihdSnzF2JBArtm+CB4D2rO+
         e54IUo1moehp0mhXqP1laeMoDXg+X4aWDomtnYmIOSqJczQ5TzBZjrCP4Kihrl8RRqcW
         ew+XdAeeySiK6SNiNPP0I7PIOksF0osswLBhlRRjPOuciuDixJKWY+08sDAajU+Fb4FB
         KWUg==
X-Forwarded-Encrypted: i=1; AFNElJ9CY1nPNq2Q4oQRysUCtf6+kWD9k0PaTFR7UE6J7lsrxFfYgN7EYhSU0Ns0LTF8hitrazAyokNwo8O21g4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaacRUj1bFOvFcl7I9C+TEG089l1QJHDzyuKlbj4+KpDOwMwPY
	GCJ4/d0Pgtf4Nl6ir+xF5oopRJQljTcHf9JhISVtCOTq1dG6R+aVP3anvunY++qv
X-Gm-Gg: AeBDieu9Rl9fbWIkk8g4Gsug58TCabN10l+xHg8du6tPYXODNwbyDkvwCQeEDXCk96g
	8EoYMNmjZBC4VLq3xi3QcuCTD90KWPusV4W6bp3MloI6MScOhg2hbBgUmg4jywdTzG9mYxIeLjf
	Y/k9AsLOsrmRw5f2h1pCRIuE0b64fYPX4e30CXLo2gckbRf3ga++apX8ep6pMRKBgEgnNn1NpzD
	CmIHbiyy5MeF9/3PKp6dubmHq3ucFjRg065ZPEmTZENtzIyMyzl5P9trPflgREUosLqPfkjndGi
	PYGMw+rumQ6w7eOpy6Y+iz0F4EWtqVH+O5Pid3SUaYs04x0osI+6oW3ASo3HtvtEdVRgRTV7s5T
	Y3QQPBIuHXuV2zq4K6gqknaQL/QSJNQ4L5PMnobpOY5iN9L5r6RCvhSPejHL08BTwSGFY16T/jl
	QAu/VKWJu9zR8UV2PYsgWgyMTIqaC8q56yYP7AnyNcdlF4MPb3nJ4WnZIMnROTETK86pA/BCVID
	3I=
X-Received: by 2002:a05:6808:c1f7:b0:45c:75ec:b9b3 with SMTP id 5614622812f47-4789ca3b128mr13244476b6e.9.1776339007221;
        Thu, 16 Apr 2026 04:30:07 -0700 (PDT)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com. [209.85.167.170])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4797a4dbb6fsm2407113b6e.10.2026.04.16.04.30.06
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 04:30:06 -0700 (PDT)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-471618e20a5so4055249b6e.1
        for <linux-parisc@vger.kernel.org>; Thu, 16 Apr 2026 04:30:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8cxGxshiARWtxIPh9ry3W5sQIoYSLhRlP17qQf7uVuZ+c8Wfah8xIgdnr+Y99qsMoOt4sNQM+kcGmaOmY=@vger.kernel.org
X-Received: by 2002:a05:6122:788:b0:56f:1ed6:1d29 with SMTP id
 71dfb90a1353d-56f3bca6059mr11244615e0c.9.1776338533353; Thu, 16 Apr 2026
 04:22:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410120044.031381086@kernel.org> <20260410120317.910770161@kernel.org>
In-Reply-To: <20260410120317.910770161@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Apr 2026 13:22:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX1aShz8esbYzJ7T-0Na6++_Yi315aCiUx0Cnsgod5uUg@mail.gmail.com>
X-Gm-Features: AQROBzBwwjc8yd10cT00Tu5Dl2qrCYQStWr3Lcobhh8coMrpPeCH9vhBSNokYJk
Message-ID: <CAMuHMdX1aShz8esbYzJ7T-0Na6++_Yi315aCiUx0Cnsgod5uUg@mail.gmail.com>
Subject: Re: [patch 05/38] treewide: Remove CLOCK_TICK_RATE
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, 
	Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux.dev, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-crypto@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org, 
	David Woodhouse <dwmw2@infradead.org>, Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org, 
	Theodore Tso <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Thomas Sailer <t.sailer@alumni.ethz.ch>, 
	linux-hams@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Apr 2026 at 14:18, Thomas Gleixner <tglx@kernel.org> wrote:
> This has been scheduled for removal more than a decade ago and the comments
> related to it have been dutifully ignored. The last dependencies are gone.
>
> Remove it along with various now empty asm/timex.h files.
>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>

>  arch/m68k/include/asm/timex.h       |   15 ---------------

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
