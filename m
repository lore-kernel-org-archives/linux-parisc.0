Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA06119
	for <parisc-linux@puffin.external.hp.com>; Tue, 29 Feb 2000 11:23:52 -0700
From: willy@thepuffingroup.com
Date: Tue, 29 Feb 2000 12:24:39 -0500
To: Andrew Shugg <andrew@neep.com.au>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Value of an old K-class server?
Message-ID: <20000229122439.F9944@thepuffingroup.com>
References: <20000301010645.Y30912@neep.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000301010645.Y30912@neep.com.au>; from Andrew Shugg on Wed, Mar 01, 2000 at 01:06:47AM +0800
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Mar 01, 2000 at 01:06:47AM +0800, Andrew Shugg wrote:
> The lowest-numbered K class machine I can find on HP's website is a K220.
> I'm fairly sure the machine I've looked at is a K200, but if this model
> never existed then it's probably a 220.  =)

I've just been going through The List of hardware, bashing the hw database
into something more sane.  The K200 did exist, codenamed `Kittyhawk' with
a 100MHz PA7200 CPU in it.  It has an NIO bus in it which is something
we don't have documentation on yet (also known as HP-PB, I think).
The K-class machines probably wont work very soon, but I suspect someone
will eventually get them working.  Mention the cost of getting a support
contract on it if you need to scare management into dropping the price :-)

> When or if I get it, it will be joining my HP 375/125 in helping with testing
> for the parisc-linux project, hence the vague relation to this list.  =)

300 series... aarrrgghh :-)  300/400 series machines are m68k based.
We are sharing their HIL keyboard driver (share in the sense of `copied
and made changes but will merge back later' sense), and Steve Shack
mentioned something about the 300-series STI interface recently.
