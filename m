Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id EAA01714
	for <parisc-linux@puffin.external.hp.com>; Thu, 2 Nov 2000 04:56:18 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (root@195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 2 Nov 2000 11:58:01 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 13rJ0D-0000zx-00; Thu, 02 Nov 2000 11:57:53 +0000
Date: Thu, 2 Nov 2000 11:57:53 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Friedrich Lobenstock <fl@fl.priv.at>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HP 3000 - 922LX ??
Message-ID: <20001102115753.A3632@parcelfarce.linux.theplanet.co.uk>
References: <3A014CC5.CFBC7AD4@fl.priv.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3A014CC5.CFBC7AD4@fl.priv.at>; from fl@fl.priv.at on Thu, Nov 02, 2000 at 12:15:17PM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Nov 02, 2000 at 12:15:17PM +0100, Friedrich Lobenstock wrote:
> Hi!
> 
> How about support for a HP3000-922LX? I think this should be a PA-RISC
> machine.

According to the docs:
http://www.thepuffingroup.com/parisc/hp9000_models.html

the 922 is the same physical machine as the 822.  As such, it's too old
for it to be worth supporting.  the official statement is...

The earliest PA-RISC servers have proprietary HP devices attached to
proprietary HP bus architectures. It is unlikely that documentation
on these busses and devices will ever become available, since so few
people are interested in spending any effort finding and releasing the
docs. Machines in this category are the E, F, G, H, I class (aka Nova)
and T500 series (Emerald) machines as well as some earlier, unlettered
servers.

I should perhaps update this to reflect the particular model numbers.

-- 
Revolutions do not require corporate support.
