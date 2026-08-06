Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691D66FC5
	for <linux-parisc@vger.kernel.org>; Thu,  6 Aug 2026 06:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785997328; cv=none; b=Ho6E6YRE2tMQnGI3B/ljQdkLrL83IAceVKaxqoIhQ6ggJrNUaQkurqajyjExgVHtpN1xFKA/+PengqfRx8GRArv4HQD2GU4K5sTc2vQGakiTvCIt6LcYPeo0ifaVuAuRnE3Uewdt10yngIQGLDzer+F8yD8xdAGuUVqaXUvjNHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785997328; c=relaxed/simple;
	bh=cDMNpazCMTtIGQLm+kw5+VDoqXHW1j0fBEb9LvXCNVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fEseL65rCbrlUmItUDfNMEXNnjDYwQ34wmpZa0/xCGUbWBIJH5mcos5S+C2drDF72u9tVk2kCczsejXfSW9syNCPDlEUkLKV2SgWN16RuXVcD7DfQJ3aTUuP/gOR/Hc76jsR75k5G3HN2E6O6EY0j5Iq00PBkMWqAZ0B/cgyGGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o/eYHOfX; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o/eYHOfX"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cbb85186d43so997746a12.3
        for <linux-parisc@vger.kernel.org>; Wed, 05 Aug 2026 23:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785997326; x=1786602126; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dSiApwR1mx/EhqhzyQvUIyZv/3wBIS1aGlL5D5CHEI8=;
        b=o/eYHOfX6CdUnm2DuPpxDV0TR8fxjl75QiktpFf7JmH3Oj0UUvv+cU/oax40RF6zJB
         yc+PBNMT+/KuqA4lg4GWxbL/VhD4HKRKdv7E87cnNMVLdzXzYlXlBNvlq6jQtJ64RuJB
         5USakE0lFBq7usdTM7Rxp3CNCikshroIJp5hstPTlDjm5M3A1eDcdFIOgePT9Jc0gXTv
         A2DkO9cBO0vFMdTOyfR2eIXuMssLN2KU/X7fLc55v/tAB+0TSw2NpO/ffqWeTdGKxMyf
         z+9l0yopHhO+d7+EFLsnE6UnyDDX9HI+EUiCDQ0JDns0CcJD3p1vPqaA85w6mUA+fq2+
         Lviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785997326; x=1786602126;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dSiApwR1mx/EhqhzyQvUIyZv/3wBIS1aGlL5D5CHEI8=;
        b=DWP8xjmnVZsVSLlduqtR/CnxMGvqQOLWWN53wix9Q5vFlpj0xr1BqhGCd5qi4oqdXo
         xOc4hRi9qgNT6e8xOv8EKPzoFkP9Q51n7Asl+jYppnqmKOgsjqBFLBh6C34fhN80Zp9+
         8L4uKmUcn5QXuizYW7jTicn3dbkZkdwEAhmDlcVFrob4s+AqQnfcMLXh2HTYaklGQJST
         dtP+NzfXbUwhObjo1vM2RMYSoz5bnKmjB6kIIPRhCLvWPmDriVlJ16oxWvUlqWGpf968
         lS6aH46JKE713nL2EZXOKWYGDrOeu5p1KK6dnSpyTjr0L9yGzoJtQZO7MXCtcDamoin9
         xavA==
X-Forwarded-Encrypted: i=1; AHgh+RpALRNybAqnUAGLOyGw4fEr94ifeV4760Al9u/rSNcozP6XhvDH0JY4Ov20hSqP0XBzpw4FkHLlw+y988k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYGWQXaiGfGKcT42L/atH167gvvdRSjdaHMkHzAQCSHGvWekRt
	e59/Vc+xd/BiRthfL6YiBdxZrs3kpaqCZdrz/s8zBRMpmtwio54LuPxGTDVs/Q==
X-Gm-Gg: AR+sD13dFKXHpdbelMY1CqKSXJ16Zb2ULxQcQ0+3da7/cDNCcr6zGlm6ilVRGzC6B0/
	KHqnp9uIq4koc/J0GGJ4PSbIXJoKQQJoYXbBDYSC9LN8911WJMA42M5QxaMwgz5gZzl8hj7mRfT
	blgEbpQiDmWIoJh1hS0LNQUCtLzAc2qTgcDP0ZKnIRCoMy0WMpW2CU4aE9StV3HzsJfAvYKT2lO
	6TaF8Tx564iii2U+WMz2+zxa8k1J1D0wq92O24tlDaW/g2nq/pyiuuRZ3Em/cllF/QU3NUPO3/T
	Yu/BOyKwrW3r70UG5Fi35jx4kHzwQe78DRGpfkmZw37/UmEkiHBLo1gu57slto3RZl2NkT5nXK9
	RKRONv7CzhcSyOqDaN2htjqLx6UqTHBMz1zV35/F6mU82eYaY7rWdRgNGz+mmS1EXOYf2W2vqcT
	4TvOaXARwNdN297sISQs51MUjO1Y8SZBgTn+vJIdmnkXRMIAhFujxWUbc5D83jpeq/OMXhWwewt
	Nc+Yc/ZaiNZKyE//yhvCnK2CW9e
X-Received: by 2002:a05:6a20:4309:b0:3be:b0b3:3962 with SMTP id adf61e73a8af0-3cb85dee5ecmr14191561637.9.1785997325601;
        Wed, 05 Aug 2026 23:22:05 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:d081:36b2:965:e66f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca660e66sm20857368c88.8.2026.08.05.23.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 23:22:04 -0700 (PDT)
Date: Wed, 5 Aug 2026 23:22:01 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Helge Deller <deller@gmx.de>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, linux-parisc@vger.kernel.org
Subject: Re: [PATCH] Input: gscps2 - supply PA-RISC keyboard keymap via
 device property
Message-ID: <anQnwJYBmY7wxF-B@google.com>
References: <am_9BvmZu9g4RlUM@google.com>
 <4346aa03-1d8c-4a9a-bad3-0c4186dbc65d@gmx.de>
 <f0d96059-31c1-434c-b3d0-b2119f915d61@gmx.de>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f0d96059-31c1-434c-b3d0-b2119f915d61@gmx.de>

Hi Helge,

On Tue, Aug 04, 2026 at 08:36:17PM +0200, Helge Deller wrote:
> On 8/4/26 15:59, Helge Deller wrote:
> > Hi Dmitry,
> > 
> > On 8/3/26 06:39, Dmitry Torokhov wrote:
> > > Instead of hardcoding PA-RISC specific keycode tables into atkbd via
> > > compile-time inclusion, have the gscps2 PS/2 port driver attach a
> > > linux,keymap software node device property to the serio device when
> > > a keyboard port is registered. This allows atkbd to dynamically fetch
> > > and apply the custom keymap when probing the port using generic
> > > firmware property helpers, removing architecture-specific hacks from
> > > generic keyboard driver code.
> > > 
> > > Co-locate the keymap definitions with the serio port driver by moving
> > > hpps2atkbd.h from drivers/input/keyboard/ to drivers/input/serio/.
> > > To handle the five conflicting keys on RDI PrecisionBook laptops without
> > > runtime model string checks or duplicate keymap tables in memory, add
> > > CONFIG_SERIO_GSCPS2_RDI_KEYCODES to drivers/input/serio/Kconfig and
> > > resolve the conflicting keycodes at compile time via preprocessor
> > > macros.
> > > 
> > > Assisted-by: Antigravity:gemini-3.5-flash
> > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > ---
> > > 
> > > v2:
> > > - instead of using device_create_managed_software_node() that has issue
> > >    if serio port is unregistered before it is fully registered, switch to
> > >    creating software node when initializing the driver and attach it to
> > >    the serio port
> > > - added keycodes lost in movement (0x92 - silently ignored, 0xca -
> > >    KEY_KPSLASH, 0xda - KEY_KPENTER).
> > > 
> > >   drivers/input/keyboard/Kconfig      |  38 ---------
> > >   drivers/input/keyboard/atkbd.c      |   8 --
> > >   drivers/input/keyboard/hpps2atkbd.h | 110 -------------------------
> > >   drivers/input/serio/Kconfig         |  27 +++++++
> > >   drivers/input/serio/gscps2.c        |  47 ++++++++---
> > >   drivers/input/serio/hpps2atkbd.h    | 120 ++++++++++++++++++++++++++++
> > >   6 files changed, 184 insertions(+), 166 deletions(-)
> > 
> > Thanks for cleaning it up.
> > Your solution is much cleaner and gets the hacks away.
> > I'll test and report back very soon.
> > 
> > > diff --git a/drivers/input/serio/gscps2.c b/drivers/input/serio/gscps2.c
> > > index bf9b993f5733..cd1bca57fda3 100644
> > > --- a/drivers/input/serio/gscps2.c
> > > +++ b/drivers/input/serio/gscps2.c
> > > @@ -22,20 +22,19 @@
> > >    *                 was usable/enabled ?)
> > >    */
> > > -#include <linux/init.h>
> > > -#include <linux/module.h>
> > > -#include <linux/slab.h>
> > > -#include <linux/serio.h>
> > > +#include <linux/delay.h>
> > >   #include <linux/input.h>
> > >   #include <linux/interrupt.h>
> > > -#include <linux/spinlock.h>
> > > -#include <linux/delay.h>
> > > +#include <linux/io.h>
> > >   #include <linux/ioport.h>
> > > +#include <linux/property.h>
> > > +#include <linux/serio.h>
> > >   #include <asm/irq.h>
> > > -#include <asm/io.h>
> > >   #include <asm/parisc-device.h>
> > > +#include "hpps2atkbd.h"
> > 
> > Doesn't it makes sense to move the contents of the new file
> > "hpps2atkbd.h" directly in here instead of keeping in own header?
> Other than that, you may add:
> 
> Acked-by: Helge Deller <deller@gmx.de>
> Tested-by: Helge Deller <deller@gmx.de>

Thank you very much for testing it. I went ahead and merged the header
into the driver code and applied.

I have a few more cleanups since I've been looking at the driver, I'll
send them out in a couple of days.

Thanks.

-- 
Dmitry
