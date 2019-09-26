Return-Path: <SRS0=s0sj=XV=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD653C432C2
	for <linux-parisc@archiver.kernel.org>; Thu, 26 Sep 2019 07:58:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 406D52146E
	for <linux-parisc@archiver.kernel.org>; Thu, 26 Sep 2019 07:58:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=duncanthrax.net header.i=@duncanthrax.net header.b="kZ08d99M"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbfIZH6m (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Thu, 26 Sep 2019 03:58:42 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:41116 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726418AbfIZH6m (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 26 Sep 2019 03:58:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date;
        bh=8Lg4yatCKD7X4fsvvkrBx2B6erVSI9xd/Gf3vtOMCRg=; b=kZ08d99MtIyox77pa2hbYEgswa
        qsZsocQJHhdjf/xELBRkBwZILVUc7LpcQ674UqyV7p3M1fJSv/+6naGn3ZSbCH8lsBOGQnbUWDKGf
        Wk2kXZFeMJk7vArKpP97Z4WRq4w/3I1liTu8QeFLzBCR5bzdABb2b/15lXINdeVXFrYc=;
Received: from [2001:470:70c5:1111:5054:ff:febf:83e1] (helo=stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1iDOfh-0002Ar-2w; Thu, 26 Sep 2019 09:58:41 +0200
Date:   Thu, 26 Sep 2019 09:58:39 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org
Subject: Re: [PATCH] parisc: remove 32-bit DMA enforcement from sba_iommu
Message-ID: <20190926075839.GA9516@stackframe.org>
References: <20190924150131.24404-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190924150131.24404-1-svens@stackframe.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Helge,

On Tue, Sep 24, 2019 at 05:01:31PM +0200, Sven Schnelle wrote:
> This breaks booting from sata_sil24 with the recent DMA
> change. According to James Bottomley this was in to improve
> performance. Remove it for now to make DMA working again.
> 
> Signed-off-by: Sven Schnelle <svens@stackframe.org>
> ---
>  drivers/parisc/sba_iommu.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/parisc/sba_iommu.c b/drivers/parisc/sba_iommu.c
> index 296668caf7e5..6ac9500f2752 100644
> --- a/drivers/parisc/sba_iommu.c
> +++ b/drivers/parisc/sba_iommu.c
> @@ -678,14 +678,6 @@ static int sba_dma_supported( struct device *dev, u64 mask)
>  		return(0);
>  	}
>  
> -	/* Documentation/DMA-API-HOWTO.txt tells drivers to try 64-bit
> -	 * first, then fall back to 32-bit if that fails.
> -	 * We are just "encouraging" 32-bit DMA masks here since we can
> -	 * never allow IOMMU bypass unless we add special support for ZX1.
> -	 */
> -	if (mask > ~0U)
> -		return 0;
> -
>  	ioc = GET_IOC(dev);
>  	if (!ioc)
>  		return 0;
> -- 
> 2.23.0.rc1
> 

please drop that patch for now. With 64-bit DMA my C8000 crashes with HPMCs
likely caused by invalid DMA transfers. So i have to read up a bit on the DMA
capabilites, and what "since we can never allow IOMMU bypass unless we add
special support for ZX1" means.

The other option is to prepare a patch that limits the DMA mask with the
API Christoph mentioned, but i would first like to understand the
capabilities of the chipset.

Regards
Sven
