Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id XAA29002
	for <parisc-linux@puffin.external.hp.com>; Sat, 23 Oct 1999 23:20:58 -0600
Message-Id: <199910240522.WAA01597@milano.cup.hp.com>
To: JHamilton@earthling.net
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Trying to boot on an N-Class 
In-reply-to: Your message of "Sat, 23 Oct 1999 23:44:00 PDT."
             <NDBBKIEANAMHBNPAILKPKEBECEAA.JHamilton@Earthling.Net>
Date: Sat, 23 Oct 1999 22:22:11 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

"Justin Hamilton" wrote:
> Here's what I get when trying to boot the kernel on an N-Class:
...
> And this is where it sits.
> 
> Is this kind of info useful to anyone? 

Not to me. (yet). But I have access to N-class machines.

> Am I expecting too much at this stage in development?

Definitely. Firmware on N-class is *quite* different from the
of two flavors of PDC we have the current code talking to.
And none of the CEC (Core Electronics Complex - CPU, Mem, I/O bus
adapters) in an N-class are supported by the code in CVS today.
We are quite a ways off from implementing everything N-class needs.
The docs for that box are not (and probably won't be) published
for quite a while.

The next step in that direction is probably to write PA2.0 processor
support and support for the "ccio" bus adapter. Then try to get this
working on a C200 through C360. I know some folks are working on the
processor support but docs for "ccio" haven't been released.
(Or have they?)

thanks though,
grant

Grant Grundler
Unix Developement Lab
+1.408.447.7253
