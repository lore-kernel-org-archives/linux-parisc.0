Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D363603F6;
	Tue,  4 Aug 2026 13:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785848700; cv=none; b=BcEwiSD+PsKkukpwNMQGxhC1bxzr6ZdxtcKTwrRc7uusJLkci+fCJOMZfvVhOw5US6lw0eYDDlOSdaf1M1wKo5PiTZ5d2TYlHY+gXPa89FlvAx18Fu9mIbizuSN9TGmTOAwRMm1AyBhX5VF5OlvUeizWdrTN5tu/PJoN+KQb6ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785848700; c=relaxed/simple;
	bh=cCyGPXk5mQ4nAcGNQswfnErfRdOALabf84rccG9eCCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pPnmadxfqXEkly/ouuphdeGBhyr1qsUQTqAbjGLsgyaM8DHQymUe/YaOUKaQETL8wZbvhEQy95jDSm4yq+83w2uocV5ozRQFn3ILKingpq/MNLCV6Kgu4TK2xqOKf2FbjteXl0rz2yD5m7an0vMHMx1d1pXuJlVfh6GKSie3r1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=rlg2u/il; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="rlg2u/il"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FiWhPQHNJR3ChnOnLAU0hFlWwVImU9/ez1+BTuZZvts=; b=rlg2u/ilzdMVqT09PW7PaCWalR
	GRRTDrjpE2/IYntu3KlO19HnVYkKkXFLi9m4FUDa3m239zVht8OBBvwTzsd6BQvOG3s+70OwKKn/i
	hzSHaQssEjoAFCJKWuGzJ8I9UDQVrzVQXewjuu1mIUtGRbn4t+yQK7ZvHxPoCOfWggibh6+70QW4Q
	ksK8EACPKiA4qiSRCwM26I+C7c1zXdYEerUPTC+Ix9m5IhhZgpGZIdPHIQ4jZEulQ5WJzprx+OEGk
	nkzMxY7+15BsTPueLJBftLWOxv9qnSPtQE0KvsleFgauZZdtxQ8bDfdGp5OEVctWqo8gZEqFLCL5F
	ACeRhG7A==;
Received: from hch by bombadil.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrEpG-00000001sjE-12C8;
	Tue, 04 Aug 2026 13:04:58 +0000
Date: Tue, 4 Aug 2026 06:04:58 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Helge Deller <deller@gmx.de>
Cc: Christoph Hellwig <hch@infradead.org>, Helge Deller <deller@kernel.org>,
	linux-abi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] UAPI: Drop PER_HPUX personality
Message-ID: <anHjekccMcDvzl7x@infradead.org>
References: <20260731125651.2924-1-deller@kernel.org>
 <anHiICAgWyO3yjxL@infradead.org>
 <1de035b6-bd2e-4b60-a389-05465e6ae3e2@gmx.de>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1de035b6-bd2e-4b60-a389-05465e6ae3e2@gmx.de>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Tue, Aug 04, 2026 at 03:02:11PM +0200, Helge Deller wrote:
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > 
> > There's not real tree for include/uapi/linux/personality.h, maybe
> > we can get Andrew to merge it through -mm?
> 
> I can take it with the parisc linux tree, if ok for you.

Works for me, thanks.

