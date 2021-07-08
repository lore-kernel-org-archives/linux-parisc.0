Return-Path: <linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B0DEC07E96
	for <linux-parisc@archiver.kernel.org>; Thu,  8 Jul 2021 18:04:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7039A61878
	for <linux-parisc@archiver.kernel.org>; Thu,  8 Jul 2021 18:04:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbhGHSGv (ORCPT <rfc822;linux-parisc@archiver.kernel.org>);
        Thu, 8 Jul 2021 14:06:51 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:46632 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229469AbhGHSGu (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 8 Jul 2021 14:06:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=T0yLFHU1jTZGVahxpQhxtwSJH8ngWeNTdV5zq/0o304=; b=Br89DxWErYr7NMP7/kKuaWmxah
        DO8ZvuLAxqhn+IUs/B94TZN7aJDE55GJDrenlhnBBmPdrOtO2xgdiPDCQFE233hyMoL3sWSxrj5w9
        dlRu0uZaRiHhplT2a/CLRGNc10kRyE087emMWIMiX4jEw2Aeoqp8oy3T2CVvPjSlUbTQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1m1YNV-00CfYS-Hv; Thu, 08 Jul 2021 20:04:01 +0200
Date:   Thu, 8 Jul 2021 20:04:01 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Carlos Bilbao <bilbao@vt.edu>
Cc:     James.Bottomley@hansenpartnership.com,
        Joe Perches <joe@perches.com>, deller@gmx.de,
        linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2] drivers: parisc: Remove unnecessary #if
 blocks
Message-ID: <YOc+EWQQUMJDZRCE@lunn.ch>
References: <1793924.CQOukoFCf9@iron-maiden>
 <39a7b7c455c6c23f0bfe7403b4957d2c92196d46.camel@perches.com>
 <2661892.BEx9A2HvPv@iron-maiden>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2661892.BEx9A2HvPv@iron-maiden>
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Thu, Jul 08, 2021 at 01:40:54PM -0400, Carlos Bilbao wrote:
> Remove undefined #ifdefs and #if 0 from these two files.

Hi Carlos

This is not a network driver, so putting net-next in the subject is
not useful.

Also, at the moment, we are in the merge window. It is unlikely that
any maintainer will accept your patches until the merge window closes,
which should be this weekend. You can whoever still send patches, but
please mark them RFC, and send them just to the appropriate list, not
the maintainer.

       Andrew
