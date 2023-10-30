Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3ABEC4332F
	for <linux-parisc@archiver.kernel.org>; Mon, 30 Oct 2023 15:25:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232176AbjJ3PZs (ORCPT <rfc822;linux-parisc@archiver.kernel.org>);
        Mon, 30 Oct 2023 11:25:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233646AbjJ3PZr (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 30 Oct 2023 11:25:47 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C66ACDA;
        Mon, 30 Oct 2023 08:25:44 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF14FC433C8;
        Mon, 30 Oct 2023 15:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1698679544;
        bh=btyjpiEdwQ+MufjXyopFOcMveHsu8z12SIfdV1MwW1E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NB0Wy7AqZMyCyTj7jPHOyVOmMcV2xXkZ9p/0mLLlOk8ctevt0m08Wy5FWx0uvRNzp
         zQ4ePKjZSEYIDgB0vLHw05dy6x8M/Nkt/yAYI8CzutUxSYoIaGSXMNxzxhCs7/dS8C
         wKbp2P2FYs76TuQo1aSSsk62hEfdI2Hl6DsZ/1VE=
Date:   Mon, 30 Oct 2023 16:25:40 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Benjamin Poirier <benjamin.poirier@gmail.com>
Cc:     Kira <nyakov13@gmail.com>, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Manish Chopra <manishc@marvell.com>,
        GR-Linux-NIC-Dev@marvell.com, Coiby Xu <coiby.xu@gmail.com>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>, Sven Joachim <svenjoac@gmx.de>,
        Ian Kent <raven@themaw.net>, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-parisc@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: Revert "staging: qlge: Retire the driver"
Message-ID: <2023103001-drew-parmesan-c61a@gregkh>
References: <20231030150400.74178-1-benjamin.poirier@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231030150400.74178-1-benjamin.poirier@gmail.com>
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Tue, Oct 31, 2023 at 02:04:00AM +1100, Benjamin Poirier wrote:
> This reverts commit 875be090928d19ff4ae7cbaadb54707abb3befdf.
> 
> On All Hallows' Eve, fear and cower for it is the return of the undead
> driver.
> 
> There was a report [1] from a user of a QLE8142 device. They would like for
> the driver to remain in the kernel. Therefore, revert the removal of the
> qlge driver.
> 
> [1] https://lore.kernel.org/netdev/566c0155-4f80-43ec-be2c-2d1ad631bf25@gmail.com/

Who's going to maintain this?

> Reported by: Kira <nyakov13@gmail.com>
> Signed-off-by: Benjamin Poirier <benjamin.poirier@gmail.com>
> ---
> 
> Notes:
>     Once the removal and revert show up in the net-next tree, I plan to send a
>     followup patch to move the driver to drivers/net/ as discussed earlier:
>     https://lore.kernel.org/netdev/20231019074237.7ef255d7@kernel.org/

are you going to be willing to maintain this and keep it alive?

I'm all this, if you want to, but I would like it out of staging.  So
how about applying this, and a follow-on one that moves it there once
-rc1 is out?  And it probably should be in the 'net' tree, as you don't
want 6.7 to come out without the driver at all, right?

> +QLOGIC QLGE 10Gb ETHERNET DRIVER
> +M:	Manish Chopra <manishc@marvell.com>
> +M:	GR-Linux-NIC-Dev@marvell.com
> +M:	Coiby Xu <coiby.xu@gmail.com>
> +L:	netdev@vger.kernel.org
> +S:	Supported
> +F:	Documentation/networking/device_drivers/qlogic/qlge.rst
> +F:	drivers/staging/qlge/

It's obvious taht these people are not maintaining this code, so they
should be dropped from the MAINTAINERS file as well.

thanks,

greg k-h
