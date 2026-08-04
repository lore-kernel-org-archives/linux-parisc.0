Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489BD3E1208;
	Tue,  4 Aug 2026 12:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785848354; cv=none; b=pska20XC8YUbw5hJDNSN6Zt6MnqMc1VGSetxdvA+kSdYKA5IVCDS62e804s8yLtiEAW8YuSUVabM65dnvnqaeAcOsHkysUYCYVb0gZ41+Rspr71D/qJDT/bpy1HR9EFZsFbhfH6NDlF4R5pd0sk7YoJ/RZKUChX60tF08BawvL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785848354; c=relaxed/simple;
	bh=MqO3ykCmDMFFFmaMS3o2pcAuXXStb1NfZrLmb5fx/j4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fc+UhLtbetFb2RxpFIL2z791uSxYSHm3Pi9qCE40+nCN2xTh08Yys1rkgHUbBNdX2+tpa65iv/UeP4L1e5RJ6/jMDyeSl8aXlj1duN8z3clb5jmUiOne0K6FFjCXvASpuHtW82Hp8NFLQ5WvKoLIvs9PxKuvC/z3DNL997IBEcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=pP6eOKiK; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pP6eOKiK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WUhUtN56r9fhARFOR9vE7IJU5nDAKoBATYQLtqQHv74=; b=pP6eOKiKd9yHzPpXFoijOPZYcn
	g4v0q4mwyuAeBsneIHdRduKG3I+OIh4tIVkYu/T2h/aviBTH2KPoaxL/qLGIL85t4O1Tp0VU3BkTF
	gU7zJkQ90U3bvak4JQbu73yEVi8uRyGuLKs8538OT1Xk7dABexIEj79hgw5u42zyhFc9/xmguMII0
	AxvJ8CR11yplfLptoFTGqhFGhnfo5+US6hkFaU857zkpLC28EDeEvM9vVdQTE8AM0UbFVjHJ1wTpy
	6bqi/nksGDyeWksNuT/HgaxycvVr+yhJxm17U6RnDnkcnU8b8YxSPqXqbbtw3NHGt2+h/LVva611d
	xg/uTX8Q==;
Received: from hch by bombadil.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrEjg-00000001rnm-0CoA;
	Tue, 04 Aug 2026 12:59:12 +0000
Date: Tue, 4 Aug 2026 05:59:12 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Helge Deller <deller@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>,
	linux-abi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, deller@gmx.de,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] UAPI: Drop PER_HPUX personality
Message-ID: <anHiICAgWyO3yjxL@infradead.org>
References: <20260731125651.2924-1-deller@kernel.org>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731125651.2924-1-deller@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Fri, Jul 31, 2026 at 02:56:51PM +0200, Helge Deller wrote:
> From: Helge Deller <deller@gmx.de>
> 
> Two and a half decades ago, there were plans to support HP-UX syscalls
> in Linux. This was never fully implemented, never worked and was never
> actually used by anybody.
> Let's simply drop this define now and free it up for other usages.

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

There's not real tree for include/uapi/linux/personality.h, maybe
we can get Andrew to merge it through -mm?

> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>  include/uapi/linux/personality.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/include/uapi/linux/personality.h b/include/uapi/linux/personality.h
> index 49796b7756af..243f5f80a7b8 100644
> --- a/include/uapi/linux/personality.h
> +++ b/include/uapi/linux/personality.h
> @@ -62,7 +62,6 @@ enum {
>  	PER_SOLARIS =		0x000d | STICKY_TIMEOUTS,
>  	PER_UW7 =		0x000e | STICKY_TIMEOUTS | MMAP_PAGE_ZERO,
>  	PER_OSF4 =		0x000f,			 /* OSF/1 v4 */
> -	PER_HPUX =		0x0010,
>  	PER_MASK =		0x00ff,
>  };
>  
> -- 
> 2.54.0
> 
---end quoted text---
