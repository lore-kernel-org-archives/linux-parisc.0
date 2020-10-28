Return-Path: <SRS0=w2GA=EE=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D1CDC388F7
	for <linux-parisc@archiver.kernel.org>; Thu, 29 Oct 2020 00:24:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C2C9D2080D
	for <linux-parisc@archiver.kernel.org>; Thu, 29 Oct 2020 00:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603931045;
	bh=RG/Dac088H5GVmB7A3wzm+xNBIFvyWXhedgYOBuwUuA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=dyj/defV3gJDs3aVLBgq0V66d5gOYM8jDHEhI6FKzsLpPp3RmO1wDnKWv1VmlL6j8
	 xY6TLoniqePcZc5zXN3R4husMY9VAB0WQvwsjAVD7+MpuFjef0MeiCrVGIKIcPaijZ
	 zWX41ZpKva5k5P+/VBFbdZhMypQLtjdLgNdrBSFk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388465AbgJ2AYF (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Wed, 28 Oct 2020 20:24:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:49588 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388430AbgJ1WhX (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 28 Oct 2020 18:37:23 -0400
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown [163.114.132.6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A423C247E7;
        Wed, 28 Oct 2020 16:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603903240;
        bh=RG/Dac088H5GVmB7A3wzm+xNBIFvyWXhedgYOBuwUuA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=mp0mi5V8yuRZfhOasGBS8qD3xtNqW+453ws5nwNnegndxP833WyBMnr5XW7bNcW3D
         Qu5goUOs2xTMMCynd2KTpZzxHBdPm3/izAVJrGVEKEndCOGCjJwD0AypGBM2QNaWqT
         7KKfpi26hxuJ7sW4Qmx+gd3mScUPM4+0zS6o+4I0=
Date:   Wed, 28 Oct 2020 09:40:38 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Moritz Fischer <mdf@kernel.org>
Cc:     netdev@vger.kernel.org, davem@davemloft.net,
        linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
        lucyyan@google.com, moritzf@google.com,
        James.Bottomley@hansenpartnership.com
Subject: Re: [PATCH/RFC net-next v3] net: dec: tulip: de2104x: Add shutdown
 handler to stop NIC
Message-ID: <20201028094038.5bd6eccb@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20201028015909.GA52884@epycbox.lan>
References: <20201023202834.660091-1-mdf@kernel.org>
        <20201027161606.477a445e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
        <20201028015909.GA52884@epycbox.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Tue, 27 Oct 2020 18:59:09 -0700 Moritz Fischer wrote:
> Hi Jakub,
> 
> On Tue, Oct 27, 2020 at 04:16:06PM -0700, Jakub Kicinski wrote:
> > On Fri, 23 Oct 2020 13:28:34 -0700 Moritz Fischer wrote:  
> > > diff --git a/drivers/net/ethernet/dec/tulip/de2104x.c b/drivers/net/ethernet/dec/tulip/de2104x.c
> > > index d9f6c19940ef..ea7442cc8e75 100644
> > > --- a/drivers/net/ethernet/dec/tulip/de2104x.c
> > > +++ b/drivers/net/ethernet/dec/tulip/de2104x.c
> > > @@ -2175,11 +2175,19 @@ static int __maybe_unused de_resume(struct device *dev_d)
> > >  
> > >  static SIMPLE_DEV_PM_OPS(de_pm_ops, de_suspend, de_resume);
> > >  
> > > +static void de_shutdown(struct pci_dev *pdev)
> > > +{
> > > +	struct net_device *dev = pci_get_drvdata(pdev);
> > > +
> > > +	de_close(dev);  
> > 
> > Apparently I get all the best ideas when I'm about to apply something..  
> 
> Better now than after =)
> 
> > I don't think you can just call de_close() like that, because 
> > (a) it may expect rtnl_lock() to be held, and (b) it may not be open.  
> 
> how about:
> 
> rtnl_lock();
> if (netif_running(dev))
> 	dev_close(dev);
> rtnl_unlock();

That's fine as well, although dev_close() checks if the device is UP
AFAICT.
