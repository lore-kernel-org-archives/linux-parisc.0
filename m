Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA29130
	for <parisc-linux@puffin.external.hp.com>; Thu, 6 May 1999 15:07:53 -0600
Message-ID: <19990506221731.18894@insula.local>
Date: Thu, 6 May 1999 22:17:31 +0000
From: Philipp Rumpf <prumpf@jcsbs.lanobis.de>
To: Jason Eckhardt <jason@equator.com>, adevries@redhat.com
Cc: jason@gatekeeper.equator.com, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] ld problem workaround
Reply-To: Philipp Rumpf <prumpf@jcsbs.lanobis.de>
References: <199905061842.LAA11719@gatekeeper.equator.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199905061842.LAA11719@gatekeeper.equator.com>; from Jason Eckhardt on Thu, May 06, 1999 at 11:42:19AM -0700
List-ID: <linux-parisc.vger.kernel.org>

>   The source is fairly complete in the sense that the bootstrap can load
>   a kernel image and transfer control to it. If we had a linux kernel, it could
>   be booted today.

Is there any reason not to let this stay in the kernel tree ? I think being able
to make the necessary changes in the CVS tree instead of sending them to you would
be convenient. (Or is the "official version" the CVS one ?)
