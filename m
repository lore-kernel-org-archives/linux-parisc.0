Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA16799
	for <parisc-linux@puffin.external.hp.com>; Tue, 30 Jan 2001 14:58:20 -0700
From: 5116@telia.com
Message-Id: <200101302202.XAA16424@zaphod.halden.lillfab.se>
Date: Tue, 30 Jan 2001 23:02:16 +0100 (CET)
Reply-To: 5116@telia.com
Subject: Re: [parisc-linux] register_fallback_cpu()
To: Grant Grundler <grundler@cup.hp.com>
cc: parisc-linux@thepuffingroup.com
In-Reply-To: <200101292201.OAA26531@milano.cup.hp.com>
MIME-Version: 1.0
Content-Type: TEXT/plain; CHARSET=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On 29 Jan, Grant Grundler wrote:

> 
> register_fallback_cpu() was one of the functions used by older HW
> that I was not able to test. If anyone has time to pull a new kernel
> and play with it, that would be good. Please let me know ASAP, if I
> broke it. I'm happy to help fix it again.

I just tried a freshly built kernel cvs updated two hours ago and is
crashed with a stack dump right after the serial driver sign on message.

I have a 715/old

/Daniel
-- 
