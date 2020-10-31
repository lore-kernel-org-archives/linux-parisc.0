Return-Path: <SRS0=dkQg=EG=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5B26C388F9
	for <linux-parisc@archiver.kernel.org>; Sat, 31 Oct 2020 00:16:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 88E8D221EB
	for <linux-parisc@archiver.kernel.org>; Sat, 31 Oct 2020 00:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604103380;
	bh=3sS9gyngy2xW//YWouE37Ii+cbgHByqQpy4nT5ZEYT0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=hrZWD7JVtiP4TA/nwHbhsxSMIIuj/5CY7U/ZgFcH2nilGmSH13x4ok/3agtFX73HJ
	 6+MaNrjWXopuZ8JW24mffPo5WdULPvVnRJShAlJj4FqFcHk+x2pJSakdf1r95FdmnS
	 M4WX9qN13RUdYWgjypsNAxhQ64kAkRcChf6HKJlU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725854AbgJaAQQ (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Fri, 30 Oct 2020 20:16:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:39064 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725536AbgJaAQQ (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 30 Oct 2020 20:16:16 -0400
Received: from kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net (unknown [163.114.132.7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 696FC208B6;
        Sat, 31 Oct 2020 00:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604103375;
        bh=3sS9gyngy2xW//YWouE37Ii+cbgHByqQpy4nT5ZEYT0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=wFtmK2+CWHZMkeiC+tpOCOWRViASmbrmAsMhi6hBEgeQ9VAc/mXHOSIhs/cuYHyM2
         23z8raO1WCfuuNLPtjGx0hv/GEkNPfLoTl9Tz/lmXGzGVq+W+GDPLjNYL7Ao4FqBr/
         HJO/dfjJ7PXU55cBZvMfMx853FtoMckQKloIUg2A=
Date:   Fri, 30 Oct 2020 17:16:14 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Moritz Fischer <mdf@kernel.org>
Cc:     netdev@vger.kernel.org, davem@davemloft.net,
        linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
        lucyyan@google.com, moritzf@google.com,
        James.Bottomley@hansenpartnership.com
Subject: Re: [PATCH net-next v4] net: dec: tulip: de2104x: Add shutdown
 handler to stop NIC
Message-ID: <20201030171614.290266a8@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
In-Reply-To: <20201028172125.496942-1-mdf@kernel.org>
References: <20201028172125.496942-1-mdf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Wed, 28 Oct 2020 10:21:25 -0700 Moritz Fischer wrote:
> The driver does not implement a shutdown handler which leads to issues
> when using kexec in certain scenarios. The NIC keeps on fetching
> descriptors which gets flagged by the IOMMU with errors like this:
> 
> DMAR: DMAR:[DMA read] Request device [5e:00.0]fault addr fffff000
> DMAR: DMAR:[DMA read] Request device [5e:00.0]fault addr fffff000
> DMAR: DMAR:[DMA read] Request device [5e:00.0]fault addr fffff000
> DMAR: DMAR:[DMA read] Request device [5e:00.0]fault addr fffff000
> DMAR: DMAR:[DMA read] Request device [5e:00.0]fault addr fffff000
> 
> Signed-off-by: Moritz Fischer <mdf@kernel.org>

Applied, thanks!
