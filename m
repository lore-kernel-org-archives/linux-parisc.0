Return-Path: <SRS0=0R8f=SI=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31E18C10F06
	for <linux-parisc@archiver.kernel.org>; Sat,  6 Apr 2019 19:49:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EAAB5213A2
	for <linux-parisc@archiver.kernel.org>; Sat,  6 Apr 2019 19:49:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="XTZq8J0g";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="oBY+TsXT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726562AbfDFTtH (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Sat, 6 Apr 2019 15:49:07 -0400
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:52046 "EHLO
        bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726452AbfDFTtH (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 6 Apr 2019 15:49:07 -0400
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id 5788F8EE0ED;
        Sat,  6 Apr 2019 12:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1554580146;
        bh=9caGuq/HGPNVfwfj5gwbSFJWJefcBW9JePbSoco7os4=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=XTZq8J0gDLwj+QlXK4+za0TIijbeJ9fY7FFUreRU1O/Az+iKCW9Xu0DWoYQrM/sZi
         Q26Wcf+RWAbUzsLlWXyf6XjO+IWxhDCwjzlwStebOmuBYbfykZGB8bbSQhTqEUKN4f
         atBxt/3XAbE47NOm8a5yObLZkr8Ia2KVOYbFRH3o=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 3wTLzKO6ChSk; Sat,  6 Apr 2019 12:49:06 -0700 (PDT)
Received: from [153.66.254.194] (unknown [50.35.68.20])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 252F58EE0E0;
        Sat,  6 Apr 2019 12:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1554580145;
        bh=9caGuq/HGPNVfwfj5gwbSFJWJefcBW9JePbSoco7os4=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=oBY+TsXTmrYq4OOe43FKwIav47PRIRqMwpGXQ5QT5SscZH7/M93k7W+Lc7hnw6nzd
         tGbNPYpc22rN2huYIcrG/JqUVQBG4se2VQ/PjzX3TZg7CTwQBID5xh/aZxgsLK9PTk
         u/BD9JneyL1ZvwO6+VQLLq00U2ApmneIroL4323c=
Message-ID: <1554580144.5053.4.camel@HansenPartnership.com>
Subject: Re: [PATCH] parisc: use per-pagetable spinlock
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     Mikulas Patocka <mpatocka@redhat.com>,
        Helge Deller <deller@gmx.de>,
        John David Anglin <dave.anglin@bell.net>
Cc:     linux-parisc@vger.kernel.org
Date:   Sat, 06 Apr 2019 12:49:04 -0700
In-Reply-To: <alpine.LRH.2.02.1904061533530.21941@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.1904061533530.21941@file01.intranet.prod.int.rdu2.redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Sat, 2019-04-06 at 15:36 -0400, Mikulas Patocka wrote:
> Parisc uses a global spinlock to protect pagetable updates in the TLB
> fault handlers. When multiple cores are taking TLB faults
> simultaneously, the cache line containing the spinlock becomes a
> bottleneck.

You can't do this.  As the comment in cache.c says: the lock is to
protect the merced bus, which runs between the CPUs on some systems. 
That means it must be a single, global lock.  Of course, on systems
without a merced bus, we don't need the lock at all, so runtime
patching might be usable to fix that case.

James

