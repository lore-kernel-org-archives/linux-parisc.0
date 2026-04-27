Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B8837CD50
	for <linux-parisc@vger.kernel.org>; Mon, 27 Apr 2026 21:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777326382; cv=none; b=oqeaRj0k8WpK8LGRFNpMYlBb3Oziwyd6rpou/WHbIwd+b9nwT9mRc18XtBmDqLDLsle9oVDPFKvg8HK5mKyXogdzGGmCVdSpyWlM03Tv9ef2TLCI/asUpiw5SEH8JojiPgSvRx6subnezyn+WPQo90If/EgcVmVDiOyG+wgROEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777326382; c=relaxed/simple;
	bh=i/k46YQbNxc6jmDhpSrBTZQploRe2hY24KQV/uGHVj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ll31SOpr9zsdMp9QYqH63ioq74rSbAgwzq2W6H7+7pxrV554z9gSHBjn28ggRiQ+ECp8gqNLubJs0mS/rY4/dFykfAuNyx/srnXThg6uWLBpTsM8EcfYw08aMwxT+FqE/YDdcNBZFMLtJFrB8/sqI1W40p2bP3bE9ogQl87EPvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Wy6tAj+G; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Wy6tAj+G"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-67389cf78b0so18828271a12.2
        for <linux-parisc@vger.kernel.org>; Mon, 27 Apr 2026 14:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1777326380; x=1777931180; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DjF1Jdn4Kp6xFyaBmAP2391GfFF2q7kuOVlruTChM90=;
        b=Wy6tAj+GVNH+wXuY4+zyxWnPfpdmDlq2ZY9ku2I1fAPeiNTP9SkZS6ZnBzJh+c2dYh
         gnRwGjUqTkSQPZ50fr+hyBy7W9hMxjWaP4bTjpF1GqQrD0A0RfBeDWIxw7EuLwxuyGzb
         Ht9WzU9X2Q7W6fKcZWJMtjWB72wklpO/otMBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777326380; x=1777931180;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DjF1Jdn4Kp6xFyaBmAP2391GfFF2q7kuOVlruTChM90=;
        b=ba2VvF+N3WRbq8vTK7udBs9XYLoDiAhKSB4iolpUNr0kNy3jmXKBNusP7friJ5wlP/
         heJ0paw9DZqCY8VYbamxqRrbA1XudBHxBTeS8FJ2ZBINKdIpbrvX5Zy5eJ5TOcp4tuce
         PZB4uQym1sRVYo2frgYGTGKqM8HEtdUwwrvttm5F50i32bWeqE5IiBsDSK/8GDLOEs4W
         fmhbpC3fhQsqH583HvJWkhVnz2VBI9rMqx7Hk6/hPo3EGY6U53jTgH08l/YwBar/I86K
         ZpUa/7YY3v4XRn4+SIM256uz5xtuLE98XGuct3G07BjaS71Jphz02+j4z+52rx0L2YZs
         jDGg==
X-Forwarded-Encrypted: i=1; AFNElJ9K7ikYKZpJWhVUtDdVe0ljpg2+Gy1dGugvNbGxPs28EQeOjTzCRIDBkQ+VLuRhYlIpyuEQhnbOV8ORcwM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYEep64mPJWpKmb1v7yKhcdShKbPdjzYmQQYG/DFTlDxVHK77W
	aRd3juHd7IVJ2zalIJcwZlIhbWf6CTPx25MQlqzKCjXhjOd8zFN/aPFQ23EmteP8s5d2TGba+T1
	bqf03YS48jg==
X-Gm-Gg: AeBDieu6PU5QbCqHQJrluB4ywlm/k+h29JviKka/lNp50zehqBtKFQpVoyq049fqY3/
	Q0BFix6Zmpw2NkBSQRJ2Ion5TFxXZR3zR7hBwUevb2TziF/Af7Ac6ZGRB4dgVcElYetf+YqDxj/
	bG38XfH+uHiBzV2wWJzXRFNi7HA59+FgclxTC24bgEoeaMdQlTbIjXt9BgK/h6ID+55JE6nFjCa
	8gYPWB2VVQT57OQbq0o9ietXQVMI6bYby4kXOXwbSr3R77jeO6u5SI7dCw5ulx6elsMm+Y0+mNG
	QnVRB/CTZSBMlETEBU09G5ynm6lIpM7mYXwQBb6z9pO1sabA3WVmMXLnhpoio777FkczX4MqdKm
	UKn2Dug/wKS8BSu3QzCHjO0+7640LsJqrGyfCzWxpxNIbdojptRpMX3nxkMg9qENbYgteem/Y6e
	QEysM/RlawzPAnChrEKXej/w5dcz7/gAX3nVQ4mBwEADv1xlpa+dgq11bJ/13lYzIv60WnaYQo+
	9DhYt2WmH4qNVxM5UfPLw==
X-Received: by 2002:a05:6402:5488:b0:66e:41a9:1198 with SMTP id 4fb4d7f45d1cf-679bb09a175mr151622a12.22.1777326379840;
        Mon, 27 Apr 2026 14:46:19 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-679b686406asm142716a12.30.2026.04.27.14.46.19
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 14:46:19 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-bb3c4d8cc29so236905966b.1
        for <linux-parisc@vger.kernel.org>; Mon, 27 Apr 2026 14:46:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9JCxlvZJEycsyM8oRokLyqOOQHTSPIzaY0dGdKQmnVxIpgrmviPAWngKlwY8IYySJwYv6zC2pYGEC7//0=@vger.kernel.org
X-Received: by 2002:a05:6402:5216:b0:679:1f4f:9d30 with SMTP id
 4fb4d7f45d1cf-679bb04c1a2mr179970a12.4.1777325976937; Mon, 27 Apr 2026
 14:39:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org> <289b424e243ba2c4139ea04009cf8b9c448a87ff.1777306795.git.chleroy@kernel.org>
 <CAHk-=whC1DZojwdMB1=sJWG2=dsCdfyU8N6tDE1qx50HRZ-WJQ@mail.gmail.com> <20260427222914.1cb2dd3b@pumpkin>
In-Reply-To: <20260427222914.1cb2dd3b@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 27 Apr 2026 14:39:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg0SGbRYhdZ1kvJUTv1HEvmRJyQauFtBGV_fMcZVF8UpQ@mail.gmail.com>
X-Gm-Features: AVHnY4I-AxqvQRk42MegvhKMp_z4sSEpEzhzpgw2GyV2bV8dezSPoI0JTlwB18Y
Message-ID: <CAHk-=wg0SGbRYhdZ1kvJUTv1HEvmRJyQauFtBGV_fMcZVF8UpQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 5/9] uaccess: Switch to copy_{to/from}_user_partial()
 when relevant
To: David Laight <david.laight.linux@gmail.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Yury Norov <ynorov@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, dmaengine@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-fsi@lists.ozlabs.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, linux-wpan@vger.kernel.org, 
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-serial@vger.kernel.org, 
	linux-usb@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-fsdevel@vger.kernel.org, ocfs2-devel@lists.linux.dev, 
	bpf@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	linux-x25@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Apr 2026 at 14:29, David Laight <david.laight.linux@gmail.com> wrote:
>
> I think there is a slight difference in that the normal copy_to_user()
> will determine the exact offset of the error by retrying with byte copies.

I have this dim memory that we decided that you can't reply on byte
exactness anyway, because not all architectures gave that guarantee
for the user copies.

But that thing came up many years ago, I might mis-remember.

            Linus
