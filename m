Received: from mailserv2.iuinc.com (mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id WAA15497
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Jan 2001 22:03:45 -0700
Message-Id: <200101170509.VAA12498@milano.cup.hp.com>
To: Josiah Carlson <jcarlson@macalester.edu>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] I'm having a couple problems 
In-reply-to: Your message of "Tue, 16 Jan 2001 16:57:00 PST."
             <3A64D1BC3C8.29B5JCARLSON@smtp.macalester.edu>
Date: Tue, 16 Jan 2001 21:09:17 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Josiah Carlson wrote:
...
> How do I get _actual_ r/w access to the volume that the system boots
> from?

Clean filesystem and fstab enty corresponds to the root filesystem.
You need to post more info on this I think.
Start with a console log up to login prompt.

> 2. How do I set up the ethernet interface within parisc-linux?  I've
> never done this manually (always let redhat and netbsd do it's thing).

ifconfig and route commands.
Or edit /etc/net/interfaces and use ifup and ifdown commands.

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
