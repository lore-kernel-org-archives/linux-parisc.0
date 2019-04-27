Return-Path: <SRS0=TiJ5=S5=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86D7EC43218
	for <linux-parisc@archiver.kernel.org>; Sat, 27 Apr 2019 18:40:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3EF01206BB
	for <linux-parisc@archiver.kernel.org>; Sat, 27 Apr 2019 18:40:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="W5eEVSi3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="ioA5mpvG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726372AbfD0SkE (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Sat, 27 Apr 2019 14:40:04 -0400
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:56770 "EHLO
        bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726344AbfD0SkE (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 27 Apr 2019 14:40:04 -0400
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id 456E68EE193;
        Sat, 27 Apr 2019 11:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1556390404;
        bh=0+wiO+zpi08fSlBb5qPa2BI1hdrMeRcGzuNKxP4Lgec=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=W5eEVSi3zxlQBhs0u2IVMnPnyc7LWV/2f87rIA6dIHwExtaEmErAYlBP/2Uym9wZU
         wqeWBf3B0GHZHgyypCEO76sWezw0N59rWO1f1OSkcRij/6P/wI+ooqsDVz0+PEturJ
         rlGGbENx7yI3MzCsQ2ctJNbOzVXaXWrutg7XVrgo=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 1HIzHff9NxgG; Sat, 27 Apr 2019 11:40:04 -0700 (PDT)
Received: from [153.66.254.194] (unknown [50.35.68.20])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 9AB7A8EE16B;
        Sat, 27 Apr 2019 11:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1556390403;
        bh=0+wiO+zpi08fSlBb5qPa2BI1hdrMeRcGzuNKxP4Lgec=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=ioA5mpvGnUMtsBoxeZyrqoK8UPw2LMhf5UV3R//501sOiDkt8sJPyOt7EiuychjwK
         S+yG9S6fZfxwvMQC7HUnfVFJ3gtq8MLlNDWrIYpSfjmsOhUrNbnZZf7rVlhjcDKMj9
         oDqbIsqfAJgRw1h5zor96VsfOSpbuklxqTQV52eE=
Message-ID: <1556390401.5648.2.camel@HansenPartnership.com>
Subject: Re: [PATCH] parisc: Update huge TLB page support to use
 per-pagetable spinlock
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc <linux-parisc@vger.kernel.org>
Cc:     Helge Deller <deller@gmx.de>, Mikulas Patocka <mpatocka@redhat.com>
Date:   Sat, 27 Apr 2019 11:40:01 -0700
In-Reply-To: <c14ef878-b942-af8e-5eea-3e04c80a33dd@bell.net>
References: <c14ef878-b942-af8e-5eea-3e04c80a33dd@bell.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Sat, 2019-04-27 at 14:15 -0400, John David Anglin wrote:
> This patch updates the parisc huge TLB page support to use per-
> pagetable spinlocks.
> 
> This patch requires Mikulas' per-pagetable spinlock patch and the
> revised TLB serialization patch from Helge and myself.  With Mikulas'
> patch, we need to use the per-pagetable spinlock for page table
> updates.  The TLB lock is only used to serialize TLB flushes on
> machines with the Merced bus.
> 
> Signed-off-by: John David Anglin <dave.anglin@bell.net>
> ---
> 
> diff --git a/arch/parisc/mm/hugetlbpage.c
> b/arch/parisc/mm/hugetlbpage.c
> index d77479ae3af2..d578809e55cf 100644
> --- a/arch/parisc/mm/hugetlbpage.c
> +++ b/arch/parisc/mm/hugetlbpage.c
> @@ -139,9 +139,9 @@ void set_huge_pte_at(struct mm_struct *mm,
> unsigned long addr,
>  {
>  	unsigned long flags;
> 
> -	purge_tlb_start(flags);
> +	spin_lock_irqsave(pgd_spinlock((mm)->pgd), flags);
>  	__set_huge_pte_at(mm, addr, ptep, entry);
> -	purge_tlb_end(flags);
> +	spin_unlock_irqrestore(pgd_spinlock((mm)->pgd), flags);

You can't do stuff like this on the problem systems: we can only have
one outstanding purge at once on the inter-cpu bus.  For them,
therefore, we also need a global spinlock.

Pulling the tlb purge lock down to the lowest level, so inside
purge_tlb_entries() might address a lot of the performance issues while
keeping the purges correct on merced class.

James

