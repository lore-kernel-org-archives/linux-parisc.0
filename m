Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id AAA24291
	for <parisc-linux@puffin.external.hp.com>; Fri, 2 Jun 2000 00:02:43 -0600
Message-Id: <200006020604.XAA05048@milano.cup.hp.com>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] ttyS00 reported twice 
In-reply-to: Your message of "Wed, 31 May 2000 16:41:02 PDT."
             <20000531164102.L2253@linuxcare.com>
Date: Thu, 01 Jun 2000 23:04:08 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Richard Hirst wrote:
...
> The solution might be to make register_serial() aware of whether rs_init()
> has yet been called.  If it hasn't, register_serial() just queues the
> struct_serial that was passed in and returns success.  At the end of
> rs_init() we call register_serial() again for each item in the queue.
> This is similar to what happens with the net devices.

Richard,
For lack of visible discussion, I'd say just do it.

This sounds like a reasonable approach. Error recovery is the only
potential pitfall.

thanks,
grant
