Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA17652
	for <parisc-linux@puffin.external.hp.com>; Sat, 27 Jan 2001 11:19:23 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 27 Jan 2001 18:23:22 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14Ma0O-0006JO-00; Sat, 27 Jan 2001 18:23:20 +0000
Date: Sat, 27 Jan 2001 18:23:20 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: 5116@telia.com
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Kernel module loader gived break
Message-ID: <20010127182320.A20379@parcelfarce.linux.theplanet.co.uk>
References: <200101271610.RAA30546@zaphod.halden.lillfab.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200101271610.RAA30546@zaphod.halden.lillfab.se>; from 5116@telia.com on Sat, Jan 27, 2001 at 05:10:51PM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Jan 27, 2001 at 05:10:51PM +0100, 5116@telia.com wrote:
> Hi, all
> 
> I get messages like 
> 
> break 0,0: pid=116 command='cat'
> cat[116]: Breakpoint 0
> 
> Followed by a register dump when I do some thing that would trigger the
> kernel to call modprobe. Modprobe is not in stalled in my system (is it
> ported yet?).

the modutils source is available by cvs from pehc.  richard was working
on it (he's on holiday right now).  don't remember how far he got.
i know he did a merge with the upstream modutils source at one point.

-- 
Revolutions do not require corporate support.
