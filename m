Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id XAA07239
	for <parisc-linux@puffin.external.hp.com>; Fri, 29 Dec 2000 23:37:09 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel3.hp.com (Postfix) with ESMTP id 705EB6E4
	for <parisc-linux@thepuffingroup.com>; Fri, 29 Dec 2000 22:40:21 -0800 (PST)
Received: from localhost (grundler@localhost [127.0.0.1])
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) with SMTP id WAA24786
	for <parisc-linux@thepuffingroup.com>; Fri, 29 Dec 2000 22:41:42 -0800 (PST)
Message-Id: <200012300641.WAA24786@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] xchg/cmpxchg defined in wrong place? 
In-reply-to: Your message of "Fri, 29 Dec 2000 21:12:19 PST."
             <200012300512.VAA24694@milano.cup.hp.com>
Date: Fri, 29 Dec 2000 22:41:41 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:
...
> Currently, parisc __xchg lives in arch/parisc/kernel/setup.c.

Sorry. I got this fact wrong: __xchg lives in arch/parisc/lib/bitops.c

__xchg_called_with_bad_pointer *is* defined in arch/parisc/kernel/setup.c.
My understanding is this fuction in fact should NOT be defined.
It's a tool to catch problems for architectures which can inline __xchg.

Neither item is material to my arguments for defining them in atomic.h.

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
