Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id VAA28650
	for <parisc-linux@puffin.external.hp.com>; Thu, 24 Feb 2000 21:50:54 -0700
From: willy@thepuffingroup.com
Date: Thu, 24 Feb 2000 22:49:34 -0500
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] code 28 trap
Message-ID: <20000224224934.N9944@thepuffingroup.com>
References: <200002250259.SAA04374@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200002250259.SAA04374@milano.cup.hp.com>; from Grant Grundler on Thu, Feb 24, 2000 at 06:59:49PM -0800
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Feb 24, 2000 at 06:59:49PM -0800, Grant Grundler wrote:
> 
> Hi folks,
> I'm getting a "Code 28" interrupt on my c3000.
> I've appended the full console output. 
> 
> IOAQ points to ip_rcv+156.
> GR02 points to net_bh+620
> 
> 0xc01ca024 <ip_rcv+156>:        ldw 0(sr0,r4),r25
> 
> and GR4 == c7e8702e.
> GR4 is aligned on 2byte, not 4 byte which the ldw wants.
> 
> I've reproduced the problem in another chunk of code:
> 0xc01fa82c <ic_bootp_recv+76>:  ldw 0(sr0,r4),r25
> 
> In this case: gr4 == c7f7e82e and gr2 == c01ce708 (net_bh+576)

Uh oh.  We really need a kernel unaligned trap handler.  Some of
the network protocols rely on that being handled right (yes, i know.
it sucks.)  I was about to say `I really don't think this applies to
IP or BOOTP/IP', when I remembered...

http://boudicca.tux.org/hypermail/linux-kernel/2000week06/0092.html

There was a bug in 2.3.41, looks like it didn't get fixed in .42, that
caused things to get unaligned once in a while.  Doh!  Anyone want to
volunteer to write an unaligned trap handler...?
