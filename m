Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id KAA03850
	for <parisc-linux@puffin.external.hp.com>; Mon, 2 Aug 1999 10:50:00 -0600
From: Jerry Huck <huck@cup.hp.com>
Message-Id: <199908021650.JAA10088@lucy.cup.hp.com>
Subject: Re: [parisc-linux] HPUX syscall ABI?
To: Matthew.Wilcox@genedata.com
Date: Mon, 2 Aug 1999 09:50:39 -0700 (PDT)
Cc: lamont@security.hp.com, parisc-linux@thepuffingroup.com
In-Reply-To: <19990802082612.X25925@mencheca.ch.genedata.com> from Matthew Wilcox at Aug "2," 1999 "08:26:12" am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> Date: Mon, 2 Aug 1999 08:26:12 +0200
> From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
> To: LaMont Jones <lamont@security.hp.com>
> Cc: Matthew Wilcox <Matthew.Wilcox@genedata.com>,
>         parisc-linux@thepuffingroup.com
> Subject: Re: [parisc-linux] HPUX syscall ABI?

... To LaMont's reply Matthew writes:

> Yep, that's exactly what I need.  Urgh, so I have to grab the arguments
> off the user-mode stack before switching to the kernel-mode stack..

Just as an aside, you might want to use the gateway page to do some
fix-ups.  On the gateway page, you can delay the promotion, do some
argument shuffling and other glue code in the user's context, and then
finally gateway to priv 0 (and presumably to some kernel code).  You
could load up all the scratch registers with arguments and then have
the kernel-stack switch code push the arguments after the priv change.

I've always wanted HP-UX to use this type of approach to read as many
arguments (and memory data structures) as can fit in the scratch
region on both call and return.  You can avoid all the high overhead
kernel-user copy code.  Simple things, like "gettimeofday", could pop into
the kernel, get the return values, return to priv 3 near those gateway
pages, write the return values to memory, and return to the caller
without any kernel-user copies.

Jerry Huck
(PA-RISC architecture group)
