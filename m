Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA99313FEE
	for <linux-parisc@vger.kernel.org>; Sat, 25 Apr 2026 11:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777114961; cv=none; b=lXCf9vEOihRAvsvqLul164JIkd60TIWABlP3A+q5LYiKweL8IVKdnyOlEVvr6/uNGZoJY0YuN4+X19fD5yqlHpu2tFC9lsn3WpGDMblhXrCnlMZ1tJQrgWPvOg8DUvyIibLqdJq/gbkWnXYht3QYXhAyWuqMZO5Qnded8L+vOUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777114961; c=relaxed/simple;
	bh=0Hl10w3oRmON33yMhRyufkLV9NZ+ydMT1q3LCnmE5nI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kz6quqPFoR1Iy3iYoxy/k4QtK/SKzNIm8EPc37nGO9Z+R0ifS1K9jzJL4JTcMYMO1CE6luAx/x6h6A6uJY9igIIVSJYZk4XlSgkAJJCuEwFGoByyLUzONS8Lx51UFCMmptOZtdi58ABZ+RChX4/WCgaT7ZHZIo915FB/b4Lr/NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OHSxUDCv; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OHSxUDCv"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4891f625344so74005915e9.0
        for <linux-parisc@vger.kernel.org>; Sat, 25 Apr 2026 04:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777114958; x=1777719758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=krEC5W4u3Zy98qJoM/+vZPkJBJL5qw1cHHHERcq1ubA=;
        b=OHSxUDCvZ+gQMXs1YhXZbN1B7B2fvk5rJAotUytKyfo88p/k3L/DoOA7tONqrbh3OB
         KhAcnj1Apq7wmkFgcXRKfz13uE/FwrkcMborqmq9NSr9EpyNiHXHQr9Fc0Smfstma6u4
         2h7iGB+D4EaZR3lpyv9PTlEFbvFDogEA9YcpQaz6VpJSEGZhJX7/tbZ7jf1vQDrSShBV
         CoaBYxnJymcljIbwUQRxHB0R1PCwzMUukitwEuBVTGEdhOe/Rj0WRcmFrBNl/ONxXPV5
         +S1lo0boaJenWRLz0pDnvfBIzI+KpcD9iZiYFpHWp9DVMRU5U3/g56AT0l7Cn/xkliOG
         0SeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777114958; x=1777719758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=krEC5W4u3Zy98qJoM/+vZPkJBJL5qw1cHHHERcq1ubA=;
        b=cQLR1zCQxeQMwEJuqYMjdK4jkp8kMcmVvqAVq33EQPzLTK0MmS3NpVelQeKDu3kN3z
         h5wFTLvwPKbAwjetQx9Jgd8lK5TOgSKOyxkQNoSfLuKwYi7dkaL+FQu3NU/BzsmT0WXL
         B1+xnoXWwWtuzJJo4JnSWn+Lt8WlibRvU+oH83IfnJvRtw5XLDs1E2OZTNR6S9sqfCGW
         /Bjyj/s0Pb41o+xc+wpEV0djIteYjMaEKDYA4H/eDAmC3gmBslprKIz/r0hPNuZZkW8f
         9OXx03qvLXfbp6Hs3crFb5dPhhk36MVBdt57sszXTqb4/ReBCsC9N6dPwPEPKigvJQbM
         EKSg==
X-Forwarded-Encrypted: i=1; AFNElJ+6zhJXetBKGSCxZp2On4n1D2p4te1JX8O07wqclI8+UCNyL71BSipRITW3727Z4Wya3h5UIysYTIy3bM0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz45vKtikxisMtUXA8TwsXtzNHW6RsoI/U2H5i9kcg5esd5ZJl2
	VvPQ5EnjX9gteu0a0u+e533plgwAk3aeABtrk5PyqjPJlzwMmMBJDLsr
X-Gm-Gg: AeBDieuF9RRGfQyCDMlv99sVHHab31NGPaqerz4QFY0A3oqylT1R848QuD9DPfvEdD/
	3duai2YrxGWVjVjSSwRdhRVBPcYxrg7fPU5AOQMqFZQz8aV6i8bpFTiIsyyZY5cboJ4EYQfhSYO
	K3OQgVu6Smyh/zda0yliP52PMVC09tuM01TCojhP/A9854f6dDe531oWcuM8Mu0H6tBWruzylPB
	hIHaIH5oR38zZ6NZRpZzZ7lgkGvV8rdaSQP6BO4kB+h/m+Frd70r4yW/clTt+xPUrPLVZ7B13GG
	tmHLVBrx5A2o5V7PzpFqqQULsX4Kt1u9RFvkcgzrDFveYZiNUtpx0u8QBg6mPfWwMnK3IbmsX/H
	uT0R6Lh2XqwNaNP26u4qX/78p6d9uciHQW4UZjicdfy0JmI5BcuVp0A3nA+c12D/zmendJFS/hx
	3U31nJNZMaZQtcd9XAq2zFe4o8bgebJffiwNioUgObBK7yJV2npCR2dos5eZeX5l3as6iQ3r1Zp
	Bj6DzVnFtuiig==
X-Received: by 2002:a05:600c:b96:b0:48a:5339:a46 with SMTP id 5b1f17b1804b1-48a53390f6cmr295415295e9.9.1777114957837;
        Sat, 25 Apr 2026 04:02:37 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb77b001sm312125075e9.3.2026.04.25.04.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 04:02:37 -0700 (PDT)
Date: Sat, 25 Apr 2026 12:02:35 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Helge Deller <deller@gmx.de>
Cc: Ai Chao <aichao@kylinos.cn>, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
 linux@armlinux.org.uk, dilinger@queued.net, adaplas@gmail.com,
 James.Bottomley@HansenPartnership.com, FlorianSchandinat@gmx.de,
 alchark@gmail.com, krzk@kernel.org, kees@kernel.org, rene@exactco.de,
 tzimmermann@suse.de, rongqianfeng@vivo.com, thorsten.blum@linux.dev,
 chelsyratnawat2001@gmail.com, soci@c64.rulez.org,
 gregkh@linuxfoundation.org, daniel@thingy.jp, linmq006@gmail.com,
 fourier.thomas@gmail.com, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-geode@lists.infradead.org,
 linux-parisc@vger.kernel.org
Subject: Re: [PATCH 03/35] fbdev: sisfb: Use safer strscpy() instead of
 strcpy()
Message-ID: <20260425120235.2ec10089@pumpkin>
In-Reply-To: <ccd01f97-d4b7-4bd0-92c1-adc3b1136cbc@gmx.de>
References: <20260425065926.1091168-1-aichao@kylinos.cn>
	<20260425065926.1091168-4-aichao@kylinos.cn>
	<ccd01f97-d4b7-4bd0-92c1-adc3b1136cbc@gmx.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 25 Apr 2026 10:08:08 +0200
Helge Deller <deller@gmx.de> wrote:

> Hello Ai,
...
> > -			strcpy(ivideo->myid, "SiS 730");
> > +			strscpy(ivideo->myid, "SiS 730");  
> 
> The compiler knows at build time the length of myid, and the "SIS 730" string.
> Using strscpy() has no benefit here either. Contrary, the code generated
> because of using strscpy() is probably even larger.
> Don't replace such code with strscpy().

Both should get converted to a memcpy().

If you increase the literal to be too long I'm pretty sure you'll
get a compiler warning/error from strcpy().
OTOH strscpy() is more likely to truncate the string (I'd need to
check).

So leaving it as strcpy() is fine - and possibly even better.
The header files might get changed to error strcpy() unless the compiler
knows the source string has a constant length and the destination is
big enough - but that hasn't been done yet.

	David
 

