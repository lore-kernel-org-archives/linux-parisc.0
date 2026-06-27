Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C90351C0C
	for <linux-parisc@vger.kernel.org>; Sat, 27 Jun 2026 05:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782538989; cv=none; b=Dz45psFgcmfigNNOdKnV2mhcbwS5vLEWmrgqOVafZ7h54ihCjazTQdmrG2vl2GJV6TfvvG/yhCWv+s8KPUjTpagliriAeqOpPCuXkX9NAh7kjCpXTM3LdAa2IX2akxiVQ7nsPX8cbgvVASqy7ld0FTVxRO2eEMseSQdd0JUgbtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782538989; c=relaxed/simple;
	bh=1AlcacmmfGnLSGC42haB1KmCNL6YGKCWUowghp+cB7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oP0icqP+Jjd7iX1csL6PcEW8DSxsyQ06K4run9dgF3y5ql9foxVUAQ5ut2XlHHWbuUyZ2/G3khhry4XLf8jlerIOiSlb7M66jMjB0n9tGolq2YZdLBfu4vcsb13PoMHNFnsUdfVsIa02s52FSjpwAVGXihMZYz/NRyHcQcazZzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MA8ZqyQ6; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MA8ZqyQ6"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-30e18c3e0b8so52970eec.0
        for <linux-parisc@vger.kernel.org>; Fri, 26 Jun 2026 22:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782538987; x=1783143787; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iqXoMKna19xGBHDnSKCZr4IKhjs+v6dxb7RGvIkniRE=;
        b=MA8ZqyQ6PSrWjZtMEprM1wH20EjXeNvxAFgNqRNBcapuRta7nxP1lFLjGyWF9qZqAv
         NR0qtZ7HQliE7M6kDc/aGIqbl7cc34kVdWralB6ny11f4nJ1ybp12BwerMX6Sd1Ws7vL
         2gKmoD47O95Jun/dLQdID7u6+QkyzLYriJADS2gpTfF7k8xUUciCXOp/iephx8dls+Np
         io1opYnfT71DmO3idkAYJ8rVUIO5HM5cPWD4wI8FILntjaenznB+XmljNEjVdjdWnkMG
         zrrvNAar38KQqLaO37l5R8pJEsxlEKDdwwuHxIGca5sNm6VCx0tVIBVQ1WxaDuOxIyRk
         eW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782538987; x=1783143787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iqXoMKna19xGBHDnSKCZr4IKhjs+v6dxb7RGvIkniRE=;
        b=li+gWfu4j17UKADD0mLnT6UUjp3QWNi/RgnFEzZZTEgYSjf7wUBbIGrHufG8osVD3R
         Paq3/HFtexEiNHEOjPvQ8Bq2DOXnmyRCLywBuhX6rUlydL6omS2+lGsYTe138V4OTsUI
         uAwedSUl9E/7ulY7CV6D44BWWth/4kjre+1CjOPFkJG+Bqd0MxgbV7cKmPQ3+6InQeZt
         tPUt5tz/VHzGOBF/GmUM7IDMEGi7/Gxv7cRt1Al6/WmE965kd5GpXnH0DcmU6+OecZOZ
         C7ZtcZ+tpA9IKTjOM7v7qrm8PCeLAN7QY1gpZT27s9ACKbR02hdOmpwTSso1L0VwrJG7
         0dNw==
X-Forwarded-Encrypted: i=1; AHgh+Rp+JPIO2mj19h80jooqhxVzaxdBtovLcx1e2IGOsKxjL1qN0L4+EjIhDRkXWpEsX8fse61EhD+P2ZA4WPc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhugXW0vYI6zjOwjgXA1RauECwZ2WY0577e9AaltigcLG4CqrH
	b6Ae5X+02LrsmjEr2dPEYJJ51g2e6BuuyPrIjXCv3/V32fMoe3ISgGA0
X-Gm-Gg: AfdE7cleT4lflrLOKeHJNRlJXVw90jOVU+8auJLAHSGiGDS4fzDB2RNTdgHAp0H14pu
	+RtcO5+uDAdHPE+nAsi9LfJIZWkTZnv256PDNthpHErHILnpBSPJ3h4YmrdGnB9p1FBDaCwBWV4
	h9IK3B4JvqPHbJ4EoSOUrnNvZPoHPfTk45Myl7DOAI/cCb7DFvx3NnjK6RBgzhVHGaXXlCEhjQA
	aABmgAgSUIZVe7j6rlmqA+mrzZNYc+YGin5bHDyguwZo3iPHz0kiv5rKkzSA2LAZcVtXJwzbF9Z
	a6t5FDILF3fLg6/o1H/Jy2zVGKqQvsJUDDqoeifEFx43Uey1KrB0MfM/OUvT469I/N0wn3qXVJt
	FRTzPph858w6Zx+y/91uxHXXM+gTgsehYhra6N1i5Je8qNwIcyJwCFxs6XyJbMORcCwon/D0xjk
	K+Wn1G+mEcfvSVJqyZEFLQb4xip0bl+z5kpRITq4gl1QY9a+a3A4Gg
X-Received: by 2002:a05:7301:9e44:b0:2f5:5907:3a48 with SMTP id 5a478bee46e88-30c84d14053mr8966083eec.1.1782538986692;
        Fri, 26 Jun 2026 22:43:06 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:e062:ec60:2d87:502])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ca5f15024sm11181432eec.17.2026.06.26.22.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 22:43:05 -0700 (PDT)
Date: Fri, 26 Jun 2026 22:43:03 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: raoxu <raoxu@uniontech.com>
Cc: James.Bottomley@hansenpartnership.com, deller@gmx.de, 
	linux-parisc@vger.kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH] Input: gscps2 - advance receive buffer write index
Message-ID: <aj9i44uye8mHGjR2@google.com>
References: <460B5655BA580C60+20260624094739.850306-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <460B5655BA580C60+20260624094739.850306-1-raoxu@uniontech.com>

On Wed, Jun 24, 2026 at 05:47:39PM +0800, raoxu wrote:
> From: Xu Rao <raoxu@uniontech.com>
> 
> Commit 44f920069911 ("Input: gscps2 - use guard notation when
> acquiring spinlock") moved the receive loop into gscps2_read_data()
> and gscps2_report_data().
> 
> While moving the code, it preserved the writes to
> buffer[ps2port->append], but omitted the following producer index
> update from the original loop:
> 
> 	ps2port->append = (ps2port->append + 1) & BUFFER_SIZE;
> 
> As a result, append never advances. Since gscps2_report_data() only
> reports bytes while act != append, the receive buffer always appears
> empty and no keyboard or mouse data reaches the serio core.
> 
> Restore the omitted index update.
> 
> Fixes: 44f920069911 ("Input: gscps2 - use guard notation when acquiring spinlock")
> Cc: stable@vger.kernel.org # 6.13+
> Signed-off-by: Xu Rao <raoxu@uniontech.com>

Applied, thank you.

-- 
Dmitry
