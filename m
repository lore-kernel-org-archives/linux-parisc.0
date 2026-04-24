Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06352BD01B
	for <linux-parisc@vger.kernel.org>; Fri, 24 Apr 2026 08:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777019138; cv=pass; b=XuDJwoZiVvoI3CNwGynWfIg30t1zaXTFOzYwOhCceHWZ3BtgCRt/Kwg84KK+NadyholT587r5ex7/VAllTy4ivswJW1nv1+NbJKWd4aC40hi5BBrE1q0PWbiH/LHQ0RcSkX26ItxmssXRtMCzdGZgR6OXq+viEkUPAGXbHZfQhM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777019138; c=relaxed/simple;
	bh=XIPsBVx25llsRnIJHz5P8QrYbZMK5XCRMdTfe5QXlHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uo9gi3mLPfxIxcFWqYswsyn4m31mcP1RcTG76uB3VwjYr9+gAolrmbMMNOXQDycLEpf+/Rv82hEcQJm3iIWpItdiQOabCVacZJVHVOzulIDQx2noTfjqC2yHlc7RSytrPW+xqnGLGFxRAgc947hxEpYj71HnJZgdM9O+y7hFeC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gkcAozmT; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gkcAozmT"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7b41fdf9de2so56089367b3.0
        for <linux-parisc@vger.kernel.org>; Fri, 24 Apr 2026 01:25:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777019136; cv=none;
        d=google.com; s=arc-20240605;
        b=iVZ0q4/6QpekeSgIp9JkJz5hv2wuDTZI4lLkcXY3gY60OSJ0Xpseg9wuHuyHyYYfdv
         6FMc9kSENjY5Cx7BFQpmV7JY79HVWfrkhWYfFbhYvhxFQWGUtfKIqvOdqJfN4TGozrKX
         oBGOqpf9nq39jjn1nuavOOnW1u+rRf2HJqFAXHyxUWI21qzMINMqDNsEoNPc6Xdxoa/b
         htCBN9t6hqChFOYcR6ey5QkG20rwU2R2OZv6WiRBY1JY9HY99DxWrKrW6bC9O5pmHFB+
         4y82R8t1n+w+OXCouAIbnxWqMfwo2qKq4/TXl40j/Ypof/Ly6QvBd3O8S+tNoi5o2r8c
         CAKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=M9We0OjygE7ZUXmeeuo/n0XXy33aRc57qkBO7gP5cCQ=;
        fh=XCq/h7mWsxeomn6xsq/b4EKPx8NyXy7nCL8VWNMEUpw=;
        b=VGR5Yf+FDxdP+XCXSGYFwI3bu0VqilZqpCS+Jd6A7biQhwjg+vaaZBoOo/72QlwTDN
         H8VwgnqLqNBw6fYrykIjATZZVzImuIw0m6IxsBTNvxW83PccdKmuIbY3WiQ0bf3ylzzT
         0abJ/j3ci+juRvTgdjuPK+qRmV1gMp0SQ404huhjk4c31hH1jD+NV9t7kCxeOR5BWQaX
         MDNZRels2VgbeA/qydGt38SQmSX73xOzQ3u609/OEAYnvxgjYqMX4BwEzmJ8scuE0/6W
         PfA/+4KP2IRNIy4vw0TopfDH3lyKZsS5Nptfoj1Rog9q3oWxjwzbM0U47eoIXoDdLJKX
         BpHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777019136; x=1777623936; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=M9We0OjygE7ZUXmeeuo/n0XXy33aRc57qkBO7gP5cCQ=;
        b=gkcAozmTJcyCtXIxqkcnQ7FQbsvTbWHW6V8jsvLWS+0KIlYt3bmdEcAfl9mYRZHf3V
         ca50WkL2+sBdahM9WwSLBN951HzYDNVOIWikMoUCxdwfHvp93sAJLK3j+SuqnwbOeY73
         2L2O+dv22Z1FSRCCmpcdiauDgbS4hKkR/kZi77ObP3dmb3uLkEOIo6g0kDQCWbKXOmVS
         6CwPhEc2N7UOmQndek3BezKyt8c8ka4eTiR2aXqj7g7eli7qDK4ydh0i5WMXPo29skuj
         FF4C53omkHq3L6HV4zeiNTCsmZFJLe2YVc1+Z+RWW2Frcju0po+sXjRBh1umyzXogEUL
         l1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777019136; x=1777623936;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M9We0OjygE7ZUXmeeuo/n0XXy33aRc57qkBO7gP5cCQ=;
        b=o1dQws9UgVUN93IrYKcBj4ySXJMMiOubCD02H4llQ/DObPXq99M0TBdvzzSr7Nip9z
         bF7GR7B2N4KZQrDHSy3d7WbATUTwV7P/c5fa1DudY+DWZHCmXWs4+M6bB0z7764fIjR7
         ueQsbzeFKboaSNAcD2fCztz6auCrVbixulqm0wZCzSKekvx/oHeWL9Zp51CkQsddEKyy
         +EM7Vr03Zc0iITSCIb3F2vd2UCF4Qd01iUL3TK318vDxFPB4Ht1tfnn4XMFH0XUdfbmv
         Hv1X1bMcXvH1d5Yn8/DQq2DNe49WCXjxz0UTLv2bDvZUpA2DNAKxBtSF/0/teiINcG0D
         wCxw==
X-Forwarded-Encrypted: i=1; AFNElJ+k6t1ceNnwCSleVtpw8Kpm6JF/+QIZc2alQs1sPouZBmWDnsX4hWpmSopxIK+f8FZOY9876R7NStvLfbc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyDFNgYhncCnhmzpN9+nfPaXsMIdGzmkB23AlzlCxvZKXw1IJf
	YynxpnUusio7u4Tb9yW/gxX36d/NcqG2vShpMn9vzIkBORN3FjomO1LGTXrbCdByWIahS3z0kSa
	GVnexF0LoJQ8bUEbe+3MiMfeJHbVQ9fM=
X-Gm-Gg: AeBDietm2gN0uoXf8usITgrEIfwQhlaAGsFwWsZi4BJp8r1Qirzqqu5mbLKaQDlsCwV
	hv6666TEzpvlYRVLRNZHS9M9FCcEYmSksQZAu8IqqHW1JTfBk/t9IzW6tbB5CBPlRuXoOp/PTBA
	y53EtAPM1AxgFjp1VcSgAUQj5oeN0ujhV87+prr1mJIXqVgu0czPWGyGBE21Oqr6P0WebG7MblF
	LOfO8DBbQxLuyhKgkoc3Zpai+NKpWy4lN+aFTXF3seC50+2DZdIF0quzyI7tZbosPa7uGQ8FwRr
	oCVWqfu4DrJPQefg3d9Gvb/1G2cftWM=
X-Received: by 2002:a05:690c:6e83:b0:79e:4657:7349 with SMTP id
 00721157ae682-7b9ecf79c52mr297625547b3.32.1777019135747; Fri, 24 Apr 2026
 01:25:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260415170515.3605095-1-lgs201920130244@gmail.com>
 <929ebeca-d070-4537-b3f5-3a4c93f1301d@gmx.de> <f3cd203e-0acc-4b5c-b590-145c0e82c768@kernel.org>
 <3d9613cf-6caa-4609-b4a6-6fe06f5a7f7a@gmx.de>
In-Reply-To: <3d9613cf-6caa-4609-b4a6-6fe06f5a7f7a@gmx.de>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Fri, 24 Apr 2026 16:25:21 +0800
X-Gm-Features: AQROBzDj1PErv0imI03UTYn2GqIB0SCYDV3akKvC_0HjOLeESc2hKp0Ew8dQTYk
Message-ID: <CANUHTR-xUS+LRcnfYmKYqZYx4LdH-Uni-=n0oPxNh0=sd4=_bQ@mail.gmail.com>
Subject: Re: [PATCH] parisc: led: fix reference leak on failed device registration
To: Helge Deller <deller@gmx.de>
Cc: Jiri Slaby <jirislaby@kernel.org>, linux-parisc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jiri, Helge,

Thanks for pointing this out, and thanks Helge for taking care of the
revert.

On Thu, 23 Apr 2026 at 15:09, Helge Deller <deller@gmx.de> wrote:
>
> Hi Jiri,
>
> On 4/23/26 07:24, Jiri Slaby wrote:
> > On 17. 04. 26, 11:39, Helge Deller wrote:
> >> On 4/15/26 19:05, Guangshuo Li wrote:
> >>> When platform_device_register() fails in startup_leds(), the embedded
> >>> struct device in platform_leds has already been initialized by
> >>> device_initialize(), but the failure path only reports the error and
> >>> does not drop the device reference for the current platform device:
> >>>
> >>>    startup_leds()
> >>>      -> platform_device_register(&platform_leds)
> >>>         -> device_initialize(&platform_leds.dev)
> >>>         -> setup_pdev_dma_masks(&platform_leds)
> >>>         -> platform_device_add(&platform_leds)
> >>>
> >>> This leads to a reference leak when platform_device_register() fails.
> >>> Fix this by calling platform_device_put() after reporting the error.
> >>>
> >>> The issue was identified by a static analysis tool I developed and
> >>> confirmed by manual review.
> >>>
> >>> Fixes: 789e527adfc33 ("parisc: led: Rewrite LED/LCD driver to utilizize Linux LED subsystem")
> >>> Cc: stable@vger.kernel.org
> >>> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> >>> ---
> >>>   drivers/parisc/led.c | 6 ++++--
> >>>   1 file changed, 4 insertions(+), 2 deletions(-)
> >>
> >> applied.
> >> Thanks!
> >> Helge
> >
> > Unless the static pcmtst_pdev has ->type->release or ->release set, the patch triggers a warning upon put().
> >
> > platform_device_register() should be fixed instead.
>
> Thanks for the notice! I'm going to revert that patch.
>
> Just yesterday I refused to apply the other patches for fbdev and suggested
> to fix platform_device_register() instead. See:
> https://marc.info/?l=linux-fbdev&m=177687117206684&w=2
>
> > See also:
> > https://patchew.org/linux/20260415174159.3625777-1-lgs201920130244@gmail.com/
> Thanks!
> Helge

I agree that this patch is not appropriate. platform_leds is a static
platform_device and it does not provide a dev.release callback, so calling
platform_device_put() on the platform_device_register() failure path can
trigger the missing release callback warning.

Please disregard this patch. I will drop it, and I am also going through
the other patches I sent for the same pattern and following up where they
should be ignored or reverted.

Sorry for the noise.

Best regards,
Guangshuo Li
