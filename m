Received: from cosrel1.hp.com (cosrel1.hp.com [156.153.255.170])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id LAA28237
	for <parisc-linux@puffin.external.hp.com>; Thu, 16 Nov 2000 11:09:40 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by cosrel1.hp.com (Postfix) with ESMTP id 16285484
	for <parisc-linux@puffin.external.hp.com>; Thu, 16 Nov 2000 11:12:03 -0700 (MST)
Message-Id: <200011161810.KAA14979@milano.cup.hp.com>
To: "Thomas Marteau" <marteaut@esiee.fr>
Cc: parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] The config for 712 hp boxes 
In-reply-to: Your message of "Thu, 16 Nov 2000 18:18:58 PST."
             <00a801c04ff1$4e9b7f20$a832d793@esiee.fr>
Date: Thu, 16 Nov 2000 10:10:23 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

"Thomas Marteau" wrote:
> Hi all,
> 
>     Here is the config file we use to compile a new kernel from the test10
> sources. We have the console with the STI and an extra term on the serial
> port.

Thomas - excellent - thanks!

> Also, in this mail, you have the diff between our hp_keyb.c and the official
> one but it gives you the ~ and the ' and others scancodes.

I noticed this mail was directed to me - but I can't take ownership
of this code. I have too many other things going on.

Helge - can you commit this fix too?

thanks,
grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
