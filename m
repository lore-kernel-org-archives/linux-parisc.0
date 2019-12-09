Return-Path: <SRS0=AuCZ=Z7=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C8E3C43603
	for <linux-parisc@archiver.kernel.org>; Mon,  9 Dec 2019 19:26:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D419C2080D
	for <linux-parisc@archiver.kernel.org>; Mon,  9 Dec 2019 19:26:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbfLIT0s (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Mon, 9 Dec 2019 14:26:48 -0500
Received: from smtp.gentoo.org ([140.211.166.183]:34452 "EHLO smtp.gentoo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726562AbfLIT0s (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 9 Dec 2019 14:26:48 -0500
Received: from wim.jer (jer.xs4all.nl [212.238.182.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jer)
        by smtp.gentoo.org (Postfix) with ESMTPSA id 0C07434D8C9;
        Mon,  9 Dec 2019 19:26:46 +0000 (UTC)
Date:   Mon, 9 Dec 2019 20:26:26 +0100
From:   Jeroen Roovers <jer@gentoo.org>
To:     linux-parisc@vger.kernel.org
Cc:     Meelis Roos <mroos@linux.ee>
Subject: Re: new panic in 5.5-rc1 (parisc, kmem_cache_open)
Message-ID: <20191209202626.0f2c2112@wim.jer>
In-Reply-To: <de6b77cc-9c32-23fa-5caf-b6d370792e85@linux.ee>
References: <de6b77cc-9c32-23fa-5caf-b6d370792e85@linux.ee>
Reply-To: linux-parisc@vger.kernel.org
Organization: Gentoo Foundation
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Mon, 9 Dec 2019 20:22:17 +0200
Meelis Roos <mroos@linux.ee> wrote:

> I tried 5.5-rc1 on RP3440 and got a surprise panic on boot (5.4
> worked):

Ah, I was going to reported this, too.

> mem auto-init: stack:off, heap alloc:off, heap free:off
> Memory: 12348004K/12580864K available (6438K kernel code, 2148K
> rwdata, 954K rodata, 1193K init, 500K bss, 232860K reserved, 0K
> cma-reserved)

I see an additional message after this:

random: get_random_u64 called from __kmem_cache_create+0x70/0x660 with
crng_init=0

And then the same or similar enough backtrace.


Regards,
     jer
