Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id CAA28944
	for <parisc-linux@puffin.external.hp.com>; Tue, 11 Apr 2000 02:23:59 -0600
Message-ID: <20000411022354.A28789@puffin.external.hp.com>
Date: Tue, 11 Apr 2000 02:23:54 -0600
From: Philipp Rumpf <prumpf@puffin.external.hp.com>
To: 5116@telia.com, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] ASP patchlet
References: <200004102200.AAA14260@zaphod.halden.lillfab.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200004102200.AAA14260@zaphod.halden.lillfab.se>; from 5116@telia.com on Tue, Apr 11, 2000 at 12:00:00AM +0200
List-ID: <linux-parisc.vger.kernel.org>

> With this patch I get some noises from the core LAN in my old ASP 715.
> It dont seem to get anny interrupts yes though, any comments?

I guess all the 715/old LAN chip needs is a word swap in MPU_PORT.  At
least I don't remember any additional changes that effectively did
anything and I got mine to work.

(the MAC address stuff should be fairly obvious, I don't see any clean
solution for that though).

	Philipp Rumpf
