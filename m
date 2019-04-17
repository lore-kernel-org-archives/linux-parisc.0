Return-Path: <SRS0=jXT6=ST=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D3E1C282DA
	for <linux-parisc@archiver.kernel.org>; Wed, 17 Apr 2019 20:56:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9F28D217FA
	for <linux-parisc@archiver.kernel.org>; Wed, 17 Apr 2019 20:56:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=duncanthrax.net header.i=@duncanthrax.net header.b="F+oTl27Y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387517AbfDQUzU (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Wed, 17 Apr 2019 16:55:20 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:58427 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730361AbfDQUzT (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 17 Apr 2019 16:55:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date;
        bh=XRGf/bRutjgvxlWhJptECNCtT71mb8qIJqHWgGVpoXo=; b=F+oTl27YzelA7fRYm8SeTlvpTl
        8LpVDkSfEAIjqr8MNA4CWRDTE2aFODc8JMHLQWDTi5dunMmO+esEVIXLK8ORm6K2WACxKJEkRcFad
        GBInrN7yGcTMLnIXdk/X8RU9Pv6gknEWi1Dl2iBWcucxGJeCWitRUopflaJ3OXC6nzS4=;
Received: from [134.3.47.207] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hGraP-0001q9-2z; Wed, 17 Apr 2019 22:55:17 +0200
Date:   Wed, 17 Apr 2019 22:55:15 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     John David Anglin <dave.anglin@bell.net>
Cc:     linux-parisc <linux-parisc@vger.kernel.org>,
        Helge Deller <deller@gmx.de>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] parisc: Remove lock code to serialize TLB operations in
 pacache.S
Message-ID: <20190417205515.GA2001@t470p.stackframe.org>
References: <bd9ad9ce-8e83-6653-00d9-68b8504efc11@bell.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd9ad9ce-8e83-6653-00d9-68b8504efc11@bell.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Fri, Apr 12, 2019 at 07:12:04PM -0400, John David Anglin wrote:
> TLB operations only need to be serialized on machines with the Merced (Stretch) bus.
> The only machines in this category are L and N class, and they require a 64-bit PA 2.0
> kernel.  On these machines, we use local TLB purges in the tmpalias routines.  We don't
> need to serialize TLB purges on all other machines.  Thus, the lock/unlock code can be
> removed when CONFIG_PA20 is not defined.  Further, when CONFIG_PA20 is not defined,
> alternative patching converts the TLB purges to local purges when PA 2.0 hardware has
> been detected.
> 
> Signed-off-by: John David Anglin <dave.anglin@bell.net>

I had this patch running on my C8000 and J5000 for a few days, and haven't
encountered any issues.

Tested-By: Sven Schnelle <svens@stackframe.org>

Regards
Sven
