Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA25110
	for <parisc-linux@puffin.external.hp.com>; Thu, 25 May 2000 08:21:51 -0600
Message-ID: <20000525082147.A25025@puffin.external.hp.com>
Date: Thu, 25 May 2000 08:21:47 -0600
From: Philipp Rumpf <prumpf@puffin.external.hp.com>
To: Sam Creasey <sammy@oh.verio.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Ethernet driver issues....
References: <Pine.GSO.3.96.1000525095354.23825D-100000@users.qual.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.GSO.3.96.1000525095354.23825D-100000@users.qual.net>; from Sam Creasey on Thu, May 25, 2000 at 09:55:01AM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Thu, May 25, 2000 at 09:55:01AM -0400, Sam Creasey wrote:
> This message appeared on the m68k list today, I've had some of these
> issues with the lasi ethernet driver on my 712....  any change with a
> newer driver as listed below?

I've seen this issue and blamed it on console driver issues (I couldn't
reproduce it on a 712/60 running sticon, it did happen on a 715/33 using
iodccon).

I'll try to see whether merging the new changes helps.

	Philipp Rumpf
