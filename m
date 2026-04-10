Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD193DA7EE
	for <linux-parisc@vger.kernel.org>; Fri, 10 Apr 2026 15:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775835133; cv=pass; b=fbPPsDT419te3tjxMW2xcPuJFppaC8suQrsWi/YTXi6wDnK0WkW0kssP8OCwT5RCTdt9e4L26iPATWGtC/0TTDrifh27Qcn7PY0JRupqKAEXjH7MwWJUUQ+MSvXNxfavL05eBAAMs1iM98f1LEGnaBJMsRBqpsmYUeBgN2jqDVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775835133; c=relaxed/simple;
	bh=OBQJPBhzAm5teFuL1it4zrQEsej5woZw67yMwyO4d8U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mQEcVluRzq/5194PqeO3Fq4KS1hdM8QQklAzH6EXvmELEJOkk/1IUrKU/qYvXcFoet0d7se4RccrkB3GE7w5l5NDLSDXahzDWE1z8wKbl6vuv4Rsp5wqhp1cDf/GG8hjmUgB7vhWZJOYcUSC97IsNhhQLdRZektrrlB+M938yqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=cs+zJ0r8; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="cs+zJ0r8"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12c1a170a50so2014877c88.0
        for <linux-parisc@vger.kernel.org>; Fri, 10 Apr 2026 08:32:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775835131; cv=none;
        d=google.com; s=arc-20240605;
        b=P7XraCTy1jxbCBFSJwDiKCDNaaWaX/4ZzmPiigg7M5HNrh8tV60WTrHN0RCDSFPV6a
         dw8yWNEUin8JvmdRknov6zutBMNM/fyB0ciuzmp4227vbeQIKZuNlaxmS0Az54erFy9m
         ovLtf2Pt0r6HPK4G+EspXA0mYN4Ysoys9liByCpgLU++hLezil01js6jmTtIX+Am17wL
         RZi6kG/4KHD+BMb20WoZt2BK5sFKiv4xKoMxdNLbl2bT6Z8pYGUj6kybKTRlZlz0Qs/O
         ls09Q2bRn67o8Mij26iSnI7vqupeTj+Dvaw40Snm8uSUVgqUWz663UaSZXXSGp/JudX+
         Qa8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OBQJPBhzAm5teFuL1it4zrQEsej5woZw67yMwyO4d8U=;
        fh=wMAq/SubZA0TjUe7Jn+ims8ojaTJ5vheZQBJDaBiuYE=;
        b=TCsK80o6PBFKnWFoaulHp6DfuM9Ez5HhYOlFDMnjDAFDcEo4vhqhMad3dsSiE65mKE
         iiQdo0Jcux4HePQ1IQM4OXnZP3v/n5jDgNOwQmMHPsOjghvPCXs5cSPrBvRZuhsdGZxM
         fGLizBVRjlB8Gd4moZmQS4Nl1JQdUdao3WChnBh+/Jh35ynV2fCWljpkG2IZxevxiEQx
         B9oC2eRhVy1DA0D4tX1p2B/m1OAXVwXjGP3tWszYYSIwcLjTTU9QD6qpMEYcIn9dRzjE
         /K1Q+tZojSJk9HTYkR068MMsegpu6jEFgsmYz77OICmBk+H8MMj4ONxGFd7rmtu7BDeV
         OWoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1775835131; x=1776439931; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OBQJPBhzAm5teFuL1it4zrQEsej5woZw67yMwyO4d8U=;
        b=cs+zJ0r8E1VxbeERL/6orYDfRzBNN0xV+FBDuuOmam2/EuHZ7scxaUctzZ3REo2LBr
         KdQSu4tLtUeUQ/Am7PGmtjXBLQ/7knpdVClf5erC+tpkhYxe59BfVvuW88STHDIDr49T
         TpKPrBeobAalm+DfnxseCj+mCeyPg4AFXq4Ow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775835131; x=1776439931;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OBQJPBhzAm5teFuL1it4zrQEsej5woZw67yMwyO4d8U=;
        b=eKhKJyOmqpS0DvGqUWBURSIf2TAvQelLkWbTeRxBbvMXhkmsHF3f8NQJnMHGKdDjEp
         Y4g39n01vIdVHkuOFNuN1iyzJbe6qqO8XvHgCMgpQD7ZbjDGlsARnn/s06m6t7/5+ym0
         T1Pg020Oj1GPvuIHO0MrL4Nea9y65GWeESDkx19BkE7mevv6yLDQGrWWzZVbBfR+FdiI
         r0OhPKpB0GEUgis+kBJq4SSuH+dQcYDh8Z696E1d0EW63Vnglsn+40AdtcCU4FjIHWD5
         bfFbuCzZDRjk2GNoB0VgqRY47T6wP4E7j0r5rQL/SCZn+9RYmoUJDPCw0YJd/hq4iy/r
         g2DA==
X-Forwarded-Encrypted: i=1; AJvYcCXd0868TK2rjUQ9Gn0UO54+fNtoHt6/fV6N0eJUqJ6m5KTQ4+Hw2ohc6vFHUxvHN76inkPrBsPKrMkGmD0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEITUD+eCBsPMRFF32efQyUzj4BpjzG3QdYUVuVCNtx6sIpICJ
	GLLR2gRLCejaxO5CLIa1bp7CN/49pzcXYWxPUYJ5W996PAcEwEqgULET5Jme9qLIFIjVYS+Bc/m
	QW1ArIjRMpTwwHGV54ei4x/6wo8oYgkFGIGzWGUhl5Q==
X-Gm-Gg: AeBDiesTVqhqSuq/hP33zTCQv6cTFjbMVmv0WWqfT2CIA4qBlfMGbgRrnuI8aHqXsUZ
	0QpVrvbG2emF9D8ppn+baupXHs/r5XSfXJk9cUEIhlOWO6zlsMhUMTPwzSXMtoJQA6vsdKbSMrI
	IlVajbfjUyTRZOHa1sPbkRmzk9nELAh0A+UrPEoH9bAJln1T/vxpHPKlPVvU3qDOGrLVFgFK/gU
	3aZnZbWJ8+k3fow7wJ/6ozHT+RSjZgdYDh4pJh4yNkBIbXrb9QEJCM9hv2TFT95bO+O78QRk/fM
	64Yg
X-Received: by 2002:a05:7022:6097:b0:128:ccb7:7fa3 with SMTP id
 a92af1059eb24-12c34f069f8mr2159203c88.34.1775835130696; Fri, 10 Apr 2026
 08:32:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410120044.031381086@kernel.org> <20260410120319.397219631@kernel.org>
In-Reply-To: <20260410120319.397219631@kernel.org>
From: Daniel Palmer <daniel@0x0f.com>
Date: Sat, 11 Apr 2026 00:31:59 +0900
X-Gm-Features: AQROBzAnX-XEClLFV-qWYFUzCuq4P43sNZviESiWFI1yCPXm2VtVZ2QkaUGJoPY
Message-ID: <CAFr9PXk7qK8-2JWrrfgXHoS9JWTRL+WobLjmAesyCE9VLL8ZyQ@mail.gmail.com>
Subject: Re: [patch 27/38] m68k: Select ARCH_HAS_RANDOM_ENTROPY
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	linux-m68k@lists.linux-m68k.org, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, 
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
	loongarch@lists.linux.dev, Dinh Nguyen <dinguyen@kernel.org>, 
	Jonas Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi

On Fri, 10 Apr 2026 at 21:39, Thomas Gleixner <tglx@kernel.org> wrote:
>
> The only remaining usage of get_cycles() is to provide
> random_get_entropy().
>
> Switch m68k over to the new scheme of selecting ARCH_HAS_RANDOM_ENTROPY and
> providing random_get_entropy() in asm/random.h.

I have built and booted this on my Amiga 4000 and it apparently still
works so FWIW:

Tested-by: Daniel Palmer <daniel@thingy.jp>
