Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id IAA18147
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Sep 1999 08:27:28 -0600
Date: Wed, 22 Sep 1999 16:29:49 +0200
From: Philipp Rumpf <prumpf@suse.de>
To: Hannu Martikka <martikka@stybba.ntc.nokia.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 715/80 problems
Message-ID: <19990922162949.F5481@suse.de>
References: <19990922153509.B5481@suse.de> <Pine.HPX.4.05.9909221725280.1697-100000@gamgee.ntc.nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.HPX.4.05.9909221725280.1697-100000@gamgee.ntc.nokia.com>; from Hannu Martikka on Wed, Sep 22, 1999 at 05:27:44PM +0300
List-ID: <linux-parisc.vger.kernel.org>

> What's the difference? I mean why should it be different?
> I guess tftp/bootp uses the Image (make Image) and IPL can use vmlinux
> (make vmlinux) kernel.

It can't (or at least I don't know it can).  The kernel image has to be
loaded by a boot loader, and there is reason to believe it has to be our
boot loader.

 	Philipp Rumpf
