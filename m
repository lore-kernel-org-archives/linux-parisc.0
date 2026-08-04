Received: from out-163.mta1.migadu.com (out-163.mta1.migadu.com [95.215.58.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740B345FFC5
	for <linux-parisc@vger.kernel.org>; Tue,  4 Aug 2026 13:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785850705; cv=none; b=amTB8dJYA4W9edwuxZbqzPhfPFApr9FsNl4n/zfXf4pE3dQe1Av6uu7HpR/7PN0l728o+To7g8oHa/B1E+MC5QUNeEoZv1sHzS7lxG5lfd1tFhcG3G5iu/5A1cIuhMksZ8SfKepmMGtfdwldhaPeX0sYBscwbf9LvTKN8MCHXA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785850705; c=relaxed/simple;
	bh=FE8+as0fyDl6/iPTKQhOGmoeygw3EIe/NYm9SNvR4vY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oel2pparrt9W5MzTkKEFWHCuLd7A23a6NqrVr9YoJoMKSk9S7roPSX1jMmblrp7korvlcd0iwWOORY5ydl7d4u4bWrzmWEES0hG9zKWfP+zJ5gohTaGlclzr3IZHfbSwfrdB8EAfC4oElDoiAy7ta6b5bo6UkYJEorEDivQT9xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=EiO1iFF+; arc=none smtp.client-ip=95.215.58.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="EiO1iFF+"
Date: Tue, 4 Aug 2026 15:37:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785850691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1VpevbcPlJ/8JIhQxBDl8f2zApgznuJ5lqOdkU3Lz6s=;
	b=EiO1iFF+YxNoaZR5mnx2z4i79GcdZ72M4fuXWrT42hDtc6abSlYQZh5tFtOtJVTLVVkPwi
	7Yov3jfh50ofzm5NMe/xul0hmAue9B01v3oRgraTQ/r04texDHDXCNBfAHsugkZJVT8bEz
	NTFDhoePj483dFVUD4hdqH929F6UV/w=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Helge Deller <deller@gmx.de>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] parisc/serial: Use generic BASE_BAUD in asm/serial.h
Message-ID: <anHrJM1roOI_34cc@linux.dev>
References: <20260804132051.104647-4-thorsten.blum@linux.dev>
 <eb470716-e6df-4468-ab23-4902f26a9bac@gmx.de>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb470716-e6df-4468-ab23-4902f26a9bac@gmx.de>
X-Migadu-Flow: FLOW_OUT

On Tue, Aug 04, 2026 at 03:29:51PM +0200, Helge Deller wrote:
> Hi Thorsten,
> 
> On 8/4/26 15:20, Thorsten Blum wrote:
> > Include asm-generic/serial.h and use the generic BASE_BAUD definition
> > instead of redefining it.
> > 
> > Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> > ---
> >   arch/parisc/include/asm/serial.h | 5 +----
> >   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> Instead of sending 3 patches, isn't removing arch/parisc/include/asm/serial.h
> and adding the patch below the better approach?

It was a single patch at some point, but since serial.h is otherwise
empty, your approach seems a lot nicer. I'll send a v2.

Thanks,
Thorsten

> diff --git a/arch/parisc/include/asm/Kbuild b/arch/parisc/include/asm/Kbuild
> index d48d158f7241..4fc315085914 100644
> --- a/arch/parisc/include/asm/Kbuild
> +++ b/arch/parisc/include/asm/Kbuild
> @@ -6,3 +6,4 @@ generic-y += kvm_para.h
>  generic-y += mcs_spinlock.h
>  generic-y += ring_buffer.h
>  generic-y += user.h
> +generic-y += serial.h
