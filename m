Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id KAA26876
	for <parisc-linux@puffin.external.hp.com>; Tue, 19 Oct 1999 10:45:20 -0600
Received: from xsvr4.cup.hp.com (xsvr4.cup.hp.com [15.0.68.169])
	by palrel3.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id JAA22521
	for <parisc-linux@thepuffingroup.com>; Tue, 19 Oct 1999 09:46:06 -0700 (PDT)
Sender: frowand@cup.hp.com
Message-ID: <380CA049.E16634DF@hp.com>
Date: Tue, 19 Oct 1999 09:46:01 -0700
From: Frank Rowand <frank_rowand@hp.com>
Reply-To: frowand@cup.hp.com
MIME-Version: 1.0
To: Grant Grundler <grundler@cup.hp.com>
CC: parisc-linux@thepuffingroup.com,
        Helge Deller <Helge.Deller@ruhr-uni-bochum.de>
Subject: Re: [parisc-linux] LASI and serial port initialization
References: <199910191630.JAA27454@milano.cup.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:
> 
> Helge and I exchanged some e-mail on the topic of LASI vis a vie
> serial port initialization. Since then, I've come to the conclusion
> all (or most) parisc platforms will have a similar problem.
> 
> The problem is LASI is "discovered" and initialized well after several
> other drivers want to print things to the console. I see a few options
> on how to handle it:
> 1) For each platform, force the console to be the first device "discovered"
>    and initialized. This is not a really good idea since console can be
>    different depending on configuration. Rebuilding the kernel to use
>    a different console doesn't seem reasonable to me. Having the user
>    figure out which devices need to be initialized first and build an
>    appropriate kernel so console works also seems unreasonable.  We are
>    headed down this path now though....
> 
> 2) Use IODC until the console device is "owned" by the appropriate driver
>    and can start taking input/output.
> 
> 3) buffer the output instead of calling IODC.
>    Size of the buffer will impose some sort of limit.
>    I think this is what HP-UX does but don't really know
>    and it shouldn't matter to us.

Yes, this is what HP-UX does.  And in the case of a panic, the buffered
messages are flushed to the console via IODC.

> Either 2 or 3 requires some software layer behind printk to change
> behavior at some point. I don't know where that point is or how
> exactly to define it. I just thought going down path #1 is going
> to be a real pain to support on a broad set of platforms.
> 
> Any other thoughts?

Yes, 2 or 3 sound best.

Some pros & cons... (assume that the pros are the opposite of the cons
for the other option)

  2) con: - polled I/O
          - may need to add infrastructure to do IODC I/O (but this should
            be in place for the panic and dump path anyway)
     pro: - should work on all platforms, once it works on one

  3) con: - when debugging new drivers and platforms, you won't get any
            debugging messages until the console driver works

-Frank
