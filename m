Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA10557
	for <parisc-linux@puffin.external.hp.com>; Tue, 19 Dec 2000 16:21:38 -0700
Message-Id: <200012192325.PAA16134@milano.cup.hp.com>
To: Alex deVries <adevries@linuxcare.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] hwclock 
In-reply-to: Your message of "Tue, 19 Dec 2000 10:49:10 PST."
             <3A3F8376.BF84A667@linuxcare.com>
Date: Tue, 19 Dec 2000 15:25:34 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Alex deVries wrote:
> There's been some discussion on IRC about not always having to set the
> clock when in userspace.  I had a quick look at it, and it shouldn't be
> too hard.  We just need a parisc version of hwclock which calls the
> PDC_TOD functions.

CONFIG_GENRTC in fact does use PDC_TOD.
Randolph Chung had hwclock working for PXC-L/L2 machines and I tested it
on my c3k (32-bit) a few weeks back.
If it's broken, then it's a "recent" change.

grant
