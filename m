From: Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>
Subject: Re: Testing the lws_compare_and_swap_2 syscall
Date: Tue, 7 Nov 2017 22:46:25 +0100
Message-ID: <1510090803@msgid.manchmal.in-ulm.de>
References: <1508874207@msgid.manchmal.in-ulm.de>
 <F232B09A-5367-4A4C-B731-00C63AAB489A@bell.net>
 <1508973952@msgid.manchmal.in-ulm.de>
 <20171106212734.GA29237@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: Helge Deller <deller@gmx.de>, Richard Henderson <rth@twiddle.net>,
        John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20171106212734.GA29237@ls3530.fritz.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Helge Deller wrote...

> * Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>:

> > Status: My system boots and all my tests pass. However, I find smartd
> > stalling in 100% CPU, might be coincidence. Now I'm putting some more
> > load onto the box to see whether it's less crashy then it used to be the
> > previous weeks.
>
> Did you continued your tests?
> How were the results.

Basically I gave up on this. My change made things worse, and while I
still didn't get the point (read: For my understanding there's a
discrepancy between the syscall's description and what actually
happens), it's certainly better to keep things the way they are.

> > Aside, there is another ",ma" modifier in lws_compare_and_swap that I
> > fail to understand. Haven't checked yet in detail yet, though.
>
> I'd suggest to keep the other ",ma" modifiers for now.

Since, as I presume, this has no impact on performance, this boils down
to aid a human reviewing the code in understanding what's happening
here.

    Christoph
