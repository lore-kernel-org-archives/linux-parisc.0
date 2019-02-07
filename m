Return-Path: <SRS0=bQ1H=QO=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC618C282C2
	for <linux-parisc@archiver.kernel.org>; Thu,  7 Feb 2019 17:11:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 35A1C21872
	for <linux-parisc@archiver.kernel.org>; Thu,  7 Feb 2019 17:11:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=duncanthrax.net header.i=@duncanthrax.net header.b="LO49NkZB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726793AbfBGRL4 (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Thu, 7 Feb 2019 12:11:56 -0500
Received: from smtp.duncanthrax.net ([89.31.1.170]:46149 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726055AbfBGRLz (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 7 Feb 2019 12:11:55 -0500
X-Greylist: delayed 2868 seconds by postgrey-1.27 at vger.kernel.org; Thu, 07 Feb 2019 12:11:54 EST
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date;
        bh=pNHg71+hAxfagpmLEVsItFo+MXtE8ieUwdo9HS0SGa4=; b=LO49NkZB+R1jEvIXtFSjOfMtsV
        KQATjBYqp4hMb8BfOezCW0TJ2dz0k6+H/mx9PoPj1Y4RMpHO01B1AgSS9c6YrYkSwhJvIgh0WP5TJ
        V4/rheGhR7Ou3YBGXGWIcvCE6z9nHwI3rom5IqeRDLcVIamY+sm9T2b1jrhHQw4xXzUU=;
Received: from hsi-kbw-109-193-150-175.hsi7.kabel-badenwuerttemberg.de ([109.193.150.175] helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1grmT6-0003iB-9B; Thu, 07 Feb 2019 17:24:04 +0100
Date:   Thu, 7 Feb 2019 17:24:02 +0100
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: Add assembly implementations for strlen, strcpy,
 strncpy and strcat
Message-ID: <20190207162402.GB20985@t470p.stackframe.org>
References: <20190206222110.GA19527@ls3530.dellerweb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190206222110.GA19527@ls3530.dellerweb.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi,

On Wed, Feb 06, 2019 at 11:21:10PM +0100, Helge Deller wrote:
> Add performance-optimized versions of the strlen, strcpy, strncpy and
> strcat string functions.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 

I did a quick test on my C3750 with latest git plus this patch and found no
obvious Problems.

Tested-by: Sven Schnelle <svens@stackframe.org>
