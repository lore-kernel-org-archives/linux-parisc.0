Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from riker.mountain.net (smtp.mountain.net [198.77.1.35])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1C0FC482A
	for <parisc-linux@parisc-linux.org>; Fri, 20 Apr 2001 21:09:08 -0600 (MDT)
Sender: tleete@dsl2.external.hp.com
Message-ID: <3AE0F999.BA288768@mountain.net>
Date: Fri, 20 Apr 2001 23:08:09 -0400
From: Tom Leete <tleete@mountain.net>
MIME-Version: 1.0
To: Russell King <rmk@arm.linux.org.uk>
Cc: lkml <linux-kernel@vger.kernel.org>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Re: OK, let's try cleaning up another nit. Is anyone
 paying attention?
References: <20010420085148.V13403@opus.bloom.county> <Pine.LNX.4.33.0104201206250.12186-100000@xanadu.home> <20010420125005.B8086@thyrsus.com> <20010420200859.B5510@flint.arm.linux.org.uk>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

[Cc: trimmed]

Russell King wrote:
> 
[...]
> 
> Generally it seems like diff needs to produce one more line of context, and
> most of these problems will go away.  Yes, there will still be the odd
> problem, so then it becomes the "how much do you crank the setting" problem.
>
 
$ diff -6 ...
will give 6 lines of context. patch will understand the output without any
extra help.

Cheers,
Tom

-- 
The Daemons lurk and are dumb. -- Emerson
