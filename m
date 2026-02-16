Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EE5285C85
	for <linux-parisc@vger.kernel.org>; Mon, 16 Feb 2026 15:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771254010; cv=none; b=qanX9uyiX1RyKxSO03vxgo51tEblCEBWwmFODG/lYPGXLxEuP7zlJTljanrOvxhku0KSkFactvYkAxgHwqoxnjReqO7rhG5kZZ7v0eCWx+j3mf1iVEmZjmcYGXAQDU3NylmzNTIz4OOlxvu7VB+AFprjUstlSMw91II6qfqs5y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771254010; c=relaxed/simple;
	bh=lUf+rD+zK85EaecIl+MRfVINlsxw2aj22zOZLlA0ty8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RfKpROJs4J0LrZwgTkAkbBuNdIcfMRfR96Ann5uRy7DtbxsD8lMLssDpHyjp0Ili8KtxAvTqeno0cTb7Gf25zKoQP7IqEy8w3lo8lpDBku/LNWNBiR2pEbmTdsMnvXq5tgy+ZUrNLYs5O3BX4fcQsgnq4VxwQFIUVLK8Pb6lIgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8c9f6b78ca4so426430785a.0
        for <linux-parisc@vger.kernel.org>; Mon, 16 Feb 2026 07:00:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771254008; x=1771858808;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v+0W63J01pKV+NBFDfR20YFl2vlCDVBGClMHBExbTTc=;
        b=celnPaPutjXulFXmlIQByqZLyZeoWH3z1eDMqwwB87N/xHEHTWuuHN6mzZP1h9FaQR
         uAaFt610IkhBH0FMTKcYJFD1Wc/kHdBCuYP1Xk/3Y37RY3XjwdfXHX3Htu+dRLTNd8X5
         xZlZRgEGGJlLObpa2EotWczCgPd+oHOrpgwY3EgNoKmnljyigDClCl5Comgxbl5Thp1h
         n2FGmSZUIywmFwGB1eRRG6k0nLsI0yZOn0+bbOGU11u+3Mh6e31laVChGHsIW8J91VgN
         p+3WlFfvoeY+il+KjFMpRXe7N/WkQYVdDSB2vz38jaOSTSw65iL1LdoACl62efk/Tl+C
         ChmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUN5uYqCdFI/RkFT0Zt4p830yM6OCt12uWZtBpdRoV555ltuswDzf0184WeYUmHIJirG0jZS+Cz72iTAjo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFk/jYMA5tPzNLe/Llb19EID8gtuAqD6KNhwTaFSpJ5oaaE9ca
	urdWWRj4AUQrHCcgkfV+Tz4PbJV47xLkWIzINT7GhMiVP8UEbW56AcmlYvl7+zWx
X-Gm-Gg: AZuq6aKagi64TuZdDvEKz0JXqBfGDDPjW1+mn+ChIiS/3vqz1rVbaBOTf93VmGKLRro
	vE23iGZaVeUayOxWODgxWdNAFHdq+wF7kpd7DhPGET+y0jK/IIL9tFM5DXL7qaiGxWHatki66xn
	3V7U619rEq9gdq36iAaRNdVKlDdePBhJjatTh8mGKGxKu5X8HYkWO6mXWECmjJXAO9hn5dgsCpq
	UdB4+Z2nsA5CcPK8Hm6bSpguddiY8yVpd58w8mdodw+Gh/6DRtIlhjD+mQVpkRhCbNNqEleECWe
	5X2FnIJwV/yCxG/VcwYziNck+9fZDvuGpz2KrD/0Rwvzm+2yXv7y8JmRzw4miQBdMhEjN9PSRga
	rTd3zDhJPnvpRww1213Wcs3/t2tmSW0e29haJtxnUDLrhWOITQizTS9BfTh1tEYzsSgTfF+elCT
	PV79r4jfXPYFbUvDLfakONVW+uchtCpBY5ZWznGXBBVjtOZ5L1MWuIooMO7yoKTZ1s
X-Received: by 2002:a05:6102:38d3:b0:5f5:773d:88bb with SMTP id ada2fe7eead31-5fe2af25116mr2718598137.28.1771248506573;
        Mon, 16 Feb 2026 05:28:26 -0800 (PST)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5fde8a84c61sm7710002137.8.2026.02.16.05.28.25
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 05:28:25 -0800 (PST)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-56743b33c67so1271195e0c.2
        for <linux-parisc@vger.kernel.org>; Mon, 16 Feb 2026 05:28:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV+3WVhR0Y6I0DVMJRUMNgfmjhmTZaiL7K3j5lFcb1F4olZzr0ANVYzAazpC1V0AeVZJfyoKTyv/mW9puM=@vger.kernel.org
X-Received: by 2002:a05:6122:4f83:b0:567:4722:66a3 with SMTP id
 71dfb90a1353d-56889ba5013mr1919672e0c.8.1771248505602; Mon, 16 Feb 2026
 05:28:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260214005825.3665084-1-sashal@kernel.org> <CAMuHMdVeGv=f-Oo1=GQLghn_hwpe2YN5OS79fQsy2uccwyVUZg@mail.gmail.com>
 <aZMXwfvJjG0YkuF5@laps>
In-Reply-To: <aZMXwfvJjG0YkuF5@laps>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Feb 2026 14:28:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX1Mdqp7+Oz9dqe3b2VqMzpp5L7AvBJxRZuUjb0vY6gCw@mail.gmail.com>
X-Gm-Features: AaiRm51__ksjmZ0Ow9FHNfsDCOhP3Z--ENwDCnxogABgCRny5CijpedZP6Vlq9U
Message-ID: <CAMuHMdX1Mdqp7+Oz9dqe3b2VqMzpp5L7AvBJxRZuUjb0vY6gCw@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.19-5.10] parisc: Prevent interrupts during reboot
To: Sasha Levin <sashal@kernel.org>
Cc: patches@lists.linux.dev, stable@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, guoren@kernel.org, neil.armstrong@linaro.org, 
	brauner@kernel.org, yelangyan@huaqin.corp-partner.google.com, 
	schuster.simon@siemens-energy.com, linux-csky@vger.kernel.org, 
	Parisc List <linux-parisc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Sasha,

On Mon, 16 Feb 2026 at 14:12, Sasha Levin <sashal@kernel.org> wrote:
> On Mon, Feb 16, 2026 at 11:21:25AM +0100, Geert Uytterhoeven wrote:
> >Cc linux-parisc
> >
> >How did you (or the LLM?) came up with that CC list?!?
>
> Interesting...
>
> $ ~/linux/scripts/get_maintainer.pl --pattern-depth=1 --no-rolestats --nor --nos 0001-parisc-Prevent-interrupts-during-reboot.patch
> Neil Armstrong <neil.armstrong@linaro.org>
> "Guo Ren (Alibaba Damo Academy)" <guoren@kernel.org>
> Christian Brauner <brauner@kernel.org>
> Geert Uytterhoeven <geert@linux-m68k.org>
> Andreas Larsson <andreas@gaisler.com>
> Helge Deller <deller@gmx.de>
> Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> Simon Schuster <schuster.simon@siemens-energy.com>

Still doesn't explain linux-csky?

> I think that I'll fix it by replacing --pattern-depth with --nogit --nogit-fallback:
>
> $ ~/linux/scripts/get_maintainer.pl --no-git --nogit-fallback --no-rolestats --nor --nos 0001-parisc-Prevent-interrupts-during-reboot.patch
> "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
> Helge Deller <deller@gmx.de>
> linux-parisc@vger.kernel.org
> linux-kernel@vger.kernel.org

Much better!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
