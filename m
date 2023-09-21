Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 233F0E7D0A7
	for <linux-parisc@archiver.kernel.org>; Thu, 21 Sep 2023 20:00:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229909AbjIUUA7 (ORCPT <rfc822;linux-parisc@archiver.kernel.org>);
        Thu, 21 Sep 2023 16:00:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231483AbjIUUA0 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 21 Sep 2023 16:00:26 -0400
X-Greylist: delayed 4163 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 21 Sep 2023 11:24:41 PDT
Received: from manchmal.in-ulm.de (manchmal.in-ulm.de [217.10.9.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 384A5D434E;
        Thu, 21 Sep 2023 11:24:40 -0700 (PDT)
Date:   Thu, 21 Sep 2023 09:09:19 +0200
From:   Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Michael Labiuk <michael.labiuk@virtuozzo.com>,
        Linux PARISC <linux-parisc@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Regressions <regressions@lists.linux.dev>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: Re: Possible 6.5 regression: Huge values for "commited memory"
Message-ID: <1695279990@msgid.manchmal.in-ulm.de>
References: <1694366957@msgid.manchmal.in-ulm.de>
 <ZQWUzwiKWLk79qbp@debian.me>
 <CAHk-=wh29JJSVGyJM7ubxOs51-Nxp6YnmU9Bw1gdOk3rrQ_0mg@mail.gmail.com>
 <CAHk-=wjrEjaUw3oFVEYpF=AWAwrSM3sQTQHuPfFjFdQsvQxHeg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wjrEjaUw3oFVEYpF=AWAwrSM3sQTQHuPfFjFdQsvQxHeg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

[
    A tad late in the party, I know. The box I had encoutered this isn't
    quite on 24/7, and reproduction took some time.
]

Linus Torvalds wrote...

> I haven't pushed it out (because it would be lovely to get a
> "Tested-by" for it, and that will make the commit ID change), but I'll
> probably do so later today, with or without confirmation, because it
> does seem to be the problem.

Confirmed this solves the issue here, too. Tested on 6.6-rc2.

    Christoph
