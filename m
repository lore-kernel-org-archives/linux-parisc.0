Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA29608
	for <parisc-linux@puffin.external.hp.com>; Fri, 2 Jun 2000 09:18:19 -0600
Message-ID: <20000602091716.B28818@puffin.external.hp.com>
Date: Fri, 2 Jun 2000 09:17:16 -0600
From: Philipp Rumpf <prumpf@puffin.external.hp.com>
To: Bas Valkema <bvalkema@knowhowww.nl>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] LED's on the machine
References: <000001bfcc73$9ede5720$0303a0c0@nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <000001bfcc73$9ede5720$0303a0c0@nl>; from Bas Valkema on Thu, Jun 01, 2000 at 08:39:35PM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Jun 01, 2000 at 08:39:35PM +0200, Bas Valkema wrote:
> Wouldn't it be nice to use the leds in front of the machine for debugging?

The code is there, if you want to use it (if it isn't in the TPG tree
it's in the SF one).  I prefer having a stable console so you don't
actually need to decode leds all the time.

> 2: The PA-RISC version of Mach contains nice code......

which you cannot copy-and-paste (license problems) but you can use as a
reference implementation - and really you don't want to do more than that.

	Philipp Rumpf
