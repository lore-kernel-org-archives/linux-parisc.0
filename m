Return-Path: <linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16ADEC433EF
	for <linux-parisc@archiver.kernel.org>; Tue, 19 Apr 2022 21:52:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356492AbiDSVy7 (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Tue, 19 Apr 2022 17:54:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350809AbiDSVy6 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 19 Apr 2022 17:54:58 -0400
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [IPv6:2607:fcd0:100:8a00::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EFC13B01B
        for <linux-parisc@vger.kernel.org>; Tue, 19 Apr 2022 14:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=hansenpartnership.com; s=20151216; t=1650405133;
        bh=DGQOkSXoSA2ZhBn+vc7S9ZuuYN9Ma1uDIzjAodtilDY=;
        h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
        b=ap56u+R+qo6odqrDuwbSho31u/Ztl/n0HevhZzrNHmkZ5Gw/LQ9UxvoYz3RBNf3YH
         5Owtlq7yWIYIs5XYW/nFxrS+mH2R/TMtmOuKDAhJhamcI8NBtfBRu8ceK1SHnHjCqc
         ksl28VQZ1pAEeC8RAzZko5gUmvdiGkYv+7NDXejo=
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id 972C11288CA0;
        Tue, 19 Apr 2022 17:52:13 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id C0j5kN3uIuVx; Tue, 19 Apr 2022 17:52:13 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=hansenpartnership.com; s=20151216; t=1650405133;
        bh=DGQOkSXoSA2ZhBn+vc7S9ZuuYN9Ma1uDIzjAodtilDY=;
        h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
        b=ap56u+R+qo6odqrDuwbSho31u/Ztl/n0HevhZzrNHmkZ5Gw/LQ9UxvoYz3RBNf3YH
         5Owtlq7yWIYIs5XYW/nFxrS+mH2R/TMtmOuKDAhJhamcI8NBtfBRu8ceK1SHnHjCqc
         ksl28VQZ1pAEeC8RAzZko5gUmvdiGkYv+7NDXejo=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4300:c551::c14])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 0E38A1288C9F;
        Tue, 19 Apr 2022 17:52:12 -0400 (EDT)
Message-ID: <137e0b6f4dcaceafeac4b1ecfa30e4249939028d.camel@HansenPartnership.com>
Subject: Re: Recurring INEQUIVALENT ALIASES issues and userland
 corruption/crashes
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     John David Anglin <dave.anglin@bell.net>,
        Sam James <sam@gentoo.org>
Cc:     linux-parisc@vger.kernel.org, hppa@gentoo.org
Date:   Tue, 19 Apr 2022 17:52:11 -0400
In-Reply-To: <7a25a890-461b-0ba4-0b77-57d639de0007@bell.net>
References: <63DA313A-FCE1-4535-9BF3-11E36B2DE422@gentoo.org>
         <f2ad1439-f304-e6ae-6e4e-b9fda73ec4cd@bell.net>
         <94439119-D2B6-4961-B61D-95784E09798D@gentoo.org>
         <cb19a0a0-69b2-ab14-7767-a0cd7bd671b0@bell.net>
         <383d6dfa-bef1-e56f-8f82-dfc0682cdacc@bell.net>
         <93BE3A28-6EBE-4DC4-92BE-867E7ACB255B@gentoo.org>
         <FD03A5C5-9B87-4117-9FFF-545E31668AD0@gentoo.org>
         <7a25a890-461b-0ba4-0b77-57d639de0007@bell.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Tue, 2022-04-19 at 17:29 -0400, John David Anglin wrote:
>  We know that the PDC call to determine cache
> characteristics indicates that the alias boundary on PA8800/PA8900 is
> larger than 16 MB. 

Sorry, late to the party.  What the PDC tells you is unreliable. 
However, the Architecture guide Appendix F says "These rules provide
offset aliasing on 16 Mbyte boundaries, with optional support for
offset aliasing on smaller power of two sized boundaries, and either
restricted or unlimited space aliasing."

So unless someone has an update to the architecture guide, 16MB as a
cache stride is architecturally required to work.  The tmpalias code in
pacache.S is predicated on an assurance by the old HP chip designers
that no chip was released with a cache stride greater than 4MB, meaning
we could safely relax the 16MB architectural rules down to 4MB.

James


