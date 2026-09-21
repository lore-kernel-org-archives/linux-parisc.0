Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0E42EA480
	for <linux-parisc@vger.kernel.org>; Mon, 21 Sep 2026 02:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789958330; cv=none; b=vBOGqFeSLJ9lNZmOPi3tszlp+2E2XEWUl6cjtpvJ0sgMhcpooMVe1+Y0k9fbUIkLuNSZFf//EsFOdcPXKT5bXjc1A6nvnSPy6qKtaEWt1IBX75V/pOfAdm3xNZdwAJiWf5QFiTl9tESNNdJUqDiZSC/NKWXglDCxob2Xr4tom2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789958330; c=relaxed/simple;
	bh=roqCL/hZ7Ph4PBse9KxMlNOZ2C57CeVfUJf+MSM/X5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SIjfo471kEP1tag6WWY+JkIlrB0UN8bFKRrVRtmenMYw0bTtbFTRrw9+Zp9LgJOJa4HKPmzGTHTgdYYMSrs8aV9CUHVxgq53xUGbNAgKA5M4Ay4Xa5N2pf1obGJcL+5BHtrQnLA+boJ6/9ANkVIOTmaHD1B9EhL5v5qjPYZiGbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CM8VYNeu; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CM8VYNeu"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cea4c79fso999337a12.0
        for <linux-parisc@vger.kernel.org>; Sun, 20 Sep 2026 19:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789958328; x=1790563128; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ORBs3m+ws4OHfu45BhvkuHCmS+gMggmNeMZoCuvyzTw=;
        b=CM8VYNeuW0VOL6B8yt/DRO+ysw3pyTQ3yl/tUnQvN+Im8R7kSAuDn43fTL6sDUqlKY
         rhdEDGSKL2FiGxZCwLRP8R0DBGaPVVll43KpNDgruBNu+2RtBEhq5oLXDHIY53ZdxppW
         PnEKkW2uh6WeyifZWbD1OAqUAVGxShKGrORQQmt9GkKUnK7x2PbluE4w9BDk+Cr3JfGE
         NApn0WCFGXTzgeE5Rl5r1tPUjgiNcgbl0ztnZWIxhvKzdprZr+Xhj9W+kaWZx/uKxziD
         9W117Ij7n7vOqgpHQ4fa+9SSLwdXdKwULSuGqh9DXYlCtwa7ZplLTF2a2Zvx2Pig4UQ0
         S/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789958328; x=1790563128;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ORBs3m+ws4OHfu45BhvkuHCmS+gMggmNeMZoCuvyzTw=;
        b=ssQiXYLoH1Y2aM+DIs2YY0Z8WQIJSASQDwQWNk8iyA0fCOPR5hzMJz+y6H+CEMQvUc
         7QBe6MEoII93e1J/hB9Ov01bWMa59/mQG47QljHSQzXnDE0PEKBzriXXa3YFReFVKsoQ
         Mi0jE0U8cKf8FOcUCsJ7TImEXFZVKrPQtchF7fkT7bXZY1ghclYNob1DmUcKyP7XBhBP
         wPetFHZWIaClRPOd3fdypcTuRWAJNUeT+tvSRjLPyV4qeB5Dk+MPJDmumbEv/f58W0QU
         Btoudpy0HIEthlG2lfwR2VaKaXAMxDLWM0zz8RsEGDq1J4pkwK83NJG0olijNm5zxsfh
         ZaiQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqwPv8yfNht7eyr3JmVwtfxWocI7k9J9y89PpXCJgB6PzRw9kSLN54BdzPV07josBherKDS9E2t7ly4uM=@vger.kernel.org
X-Gm-Message-State: AFuF++kLyp+jthzs68yTeMzdVMNdu2QrSydcUvYk6iXIuWdbTUV1mH3L
	3RelO/N0nq5atCuTsZcrI7Nke2cygsyJq07l7bbllVrWq1nqbwssUStrM2ylHIhV
X-Gm-Gg: AYBFou387l9G67m+NjV8jUFizgpw346OGEuigCZGCF8bLFuv2dat5gviqqcoi1LsERx
	ulOs6iT/NnkSIx9lx6ODqciaBBzJwnIA4PXjftvkIghOUz4s7WEkrbV6PQcFW8fky8WnnN6Ud05
	aBULA/xdV/xmPEXUAfHsVyh/tY5ChIGC8WRXwAW6ow4ghV5zbt1XZ/W2LXTnlk/XccZ/0pHJ0Bx
	dqMIRs7flQZOk+8QLDgFPit/LrN0P0NhiYe3K05t0aV4ION8SjW7uK5F/1q2h1xAo1XZzJsAC5x
	sp0a09jZ4BcezyOy+1ZvaMwTkks16mWrDO/JJEyQfFdniE0GHoluaBnxacX4/KSL1YoCtNpENYZ
	rdxmBwkslsXbxJ9LmC1H9D+O8WMozt6FqYdezWcg07wJpazkrNY+ixTQTBBrTrBeJLyUEqcoWcY
	wgVjAX6U7xIccQ1hrLOd4DRaRTzo+nEqUEeF6MKWRA3Ss5zPMt0DsP38cNOml+eSzD60wj75fe1
	QsUPzXrItCD6T91D3qj86lh2E0si0q2OqyXPDW+
X-Received: by 2002:a17:90b:5281:b0:3a0:3673:dbbf with SMTP id 98e67ed59e1d1-3a03673dd7bmr3956785a91.59.1789958327913;
        Sun, 20 Sep 2026 19:38:47 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:3844:3355:5928:66ce])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3318744dsm14208387eec.20.2026.09.20.19.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 19:38:47 -0700 (PDT)
Date: Sun, 20 Sep 2026 19:38:44 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Helge Deller <deller@gmx.de>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-parisc@vger.kernel.org
Subject: Re: [PATCH 1/7] Input: gscps2 - clean up driver code style and
 structure
Message-ID: <arCYnPusyDZxrdCp@google.com>
References: <20260830-gscps2-v1-0-c733d4cae7f9@gmail.com>
 <20260830-gscps2-v1-1-c733d4cae7f9@gmail.com>
 <4cc9fe4b-c3c3-46ff-a32f-d2a86c0ce077@gmx.de>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4cc9fe4b-c3c3-46ff-a32f-d2a86c0ce077@gmx.de>

On Tue, Sep 15, 2026 at 11:51:28AM +0200, Helge Deller wrote:
> Hi Dmitry,
> 
> On 8/30/26 22:52, Dmitry Torokhov wrote:
> > Clean up code style issues and function ordering in the gscps2 driver:
> > - Reorder functions to place gscps2_interrupt() before its callers,
> >    allowing removal of its forward declaration.
> > - Change gscps2_enable() to accept a boolean parameter and remove the
> >    ENABLE and DISABLE macro definitions.
> > - Convert printk() calls to dev_dbg() and dev_warn().
> > - Fix operator spacing and multi-variable assignment.
> > - Add spinlock comment and use cpu_relax() in spin-wait loop.
> > 
> > Assisted-by: LLM
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >   drivers/input/serio/gscps2.c | 208 +++++++++++++++++++------------------------
> >   1 file changed, 91 insertions(+), 117 deletions(-)
> you may add for the whole series:
> 
> Acked-by: Helge Deller <deller@gmx.de>
> Tested-by: Helge Deller <deller@gmx.de>

Thank you Helge!

-- 
Dmitry
