Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544E1313543;
	Sun, 12 Apr 2026 09:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775984844; cv=none; b=jeS7dKZhcHvjgIG29xJuiqqOzqD1VfFhGPbBbifRfj8ayMT1ZZF31WDTxR0UTX+0lOfcympsyo48+fxCca1XFFZiDibWpt0ODcRGSVoHsOuJDvlTJ9dw8ydMR0FVqD4Taklj61Nli5ygbw6VrOaldBtpeJIvxZ4CBM5u9/hBC6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775984844; c=relaxed/simple;
	bh=6EafNJeQjkt9lbGKB1TtXzceN3ncohol3VH70I6+ZWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DVfBGUltVJKLP+EG4CGyZelJkFsu7FFy1gvWiM+R5ZO1pTGqX17g+CGS3YpKNIMTORBufd3LU+b4x8sIFAskiWdtn4hEYCmDiyj9+suFGeijgam+OXXCreqsEGb8BprVrSsj0yK1+ege1Sty7ZT68FXqHi8o5HMHLY8x+bUVJTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=qDVMkhvK; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="qDVMkhvK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1775984841; bh=jHKjjYLNXoE85s+6SLi4LMO1LBUxCkJcWzt53yawMo8=;
	h=From:Message-ID:From;
	b=qDVMkhvK1pO7Q36nZMFc4Gxf/VDFlwPY+yXyk/q1wOLwCkjEB7TW0y/l+KS1bFe1K
	 6B6s/rnKR7I4gSESArhkFtL22/8F/D9L0z3QTnPkto4qIld2/DWB2l+1XwJTHswj9W
	 Xjbs+jWKa2ar6ThF59cLOeMaRQG57sCf5t/NL1Gg=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id A29EFC098A;
	Sun, 12 Apr 2026 11:07:21 +0200 (CEST)
Date: Sun, 12 Apr 2026 11:07:21 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
        linux-parisc@vger.kernel.org
Subject: Re: [PATCH v4 0/2] tools/nolibc: add support for 32-bit parisc
Message-ID: <adtgyfTihqLEX_6y@1wt.eu>
References: <20260409-nolibc-hppa-v4-0-24e5f31a0233@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260409-nolibc-hppa-v4-0-24e5f31a0233@weissschuh.net>

On Thu, Apr 09, 2026 at 01:54:29PM +0200, Thomas Weiﬂschuh wrote:
> Extend nolibc to target the 32-bit parisc architecture.
> 64-bit is not yet supported.
> 
> Based on nolibc/for-next.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

I'm fine on the principle, but I defer it to Helge to validate the
implementation (I've seen the 3 other versions and discussions). So
if needed, that's an ack by me from the nolibc perspective, but of
limited value here :-)

Acked-by: Willy Tarreau <w@1wt.eu>

Willy
