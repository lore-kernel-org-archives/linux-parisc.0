Return-Path: <SRS0=CLjU=RW=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E709C43381
	for <linux-parisc@archiver.kernel.org>; Tue, 19 Mar 2019 06:05:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 942F020989
	for <linux-parisc@archiver.kernel.org>; Tue, 19 Mar 2019 06:05:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=duncanthrax.net header.i=@duncanthrax.net header.b="ODiA0Dds"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbfCSGFu (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Tue, 19 Mar 2019 02:05:50 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:59849 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726437AbfCSGFu (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 19 Mar 2019 02:05:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date;
        bh=ENifPgUCwlGg9YsRClR9Z7jw9FrD7sJYvul/PIeP7a4=; b=ODiA0DdsSheKSlzqkILRXhFQjU
        M6MFUjqLg2EBzTJ+jGD+CPt6B9c9zhtowXrT+OA0P4Gwb2mtiYKrdYw+zXUhJ2HicpsulR8W2b6b0
        79hL4GZ7h8U8XA2qNSyy+RldZ+ZyAs4WCDyMrrX/9ofXePJxK+iZfj1gmehn3H45VMMk=;
Received: from [134.3.47.207] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1h67si-0001iw-Q7; Tue, 19 Mar 2019 07:05:48 +0100
Date:   Tue, 19 Mar 2019 07:05:47 +0100
From:   Sven Schnelle <svens@stackframe.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org
Subject: Re: [PATCH] parisc: fix iosapic address compare
Message-ID: <20190319060547.GA23466@t470p.stackframe.org>
References: <20190318141301.14750-1-svens@stackframe.org>
 <20190318220306.GA10060@ls3530.dellerweb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190318220306.GA10060@ls3530.dellerweb.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Helge,

On Mon, Mar 18, 2019 at 11:03:06PM +0100, Helge Deller wrote:
> Hi Sven,
> 
> * Sven Schnelle <svens@stackframe.org>:
> > i just updated my C3750 to latest git, and got the kernel oops below. It looks
> > like the change to using F_EXTEND breaks using 32 bit kernels on at least my
> > C3750. Not sure whether we should revert the F_EXTEND change, or just cast
> > the other side of the compare to long. The patch below does this.
> 
> Thanks for testing!
> I think, as suggested by you, revertig parts of my patch makes most sense.
> I've committed the patch below to my for-next tree.
> Can you check if it works for you?

Yes, works for me. The good thing about this Bug is that i was forced
to read the NS87560 driver source and have an idea now why it's called
SuckyIO :)

Tested-by: Sven Schnelle <svens@stackframe.org>

Regards
Sven
