Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id XAA07694
	for <parisc-linux@puffin.external.hp.com>; Sun, 28 Jan 2001 23:36:57 -0700
From: 5116@telia.com
Message-Id: <200101290640.HAA24683@zaphod.halden.lillfab.se>
Date: Mon, 29 Jan 2001 07:40:55 +0100 (CET)
Reply-To: 5116@telia.com
Subject: Re: [parisc-linux] Kernel module loader gave break
To: Matthew Wilcox <matthew@wil.cx>
cc: parisc-linux@thepuffingroup.com
In-Reply-To: <20010127182320.A20379@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/plain; CHARSET=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On 27 Jan, Matthew Wilcox wrote:
> On Sat, Jan 27, 2001 at 05:10:51PM +0100, 5116@telia.com wrote:
>> Hi, all
>> 
>> I get messages like 
>> 
>> break 0,0: pid=116 command='cat'
>> cat[116]: Breakpoint 0
>> 
>> Followed by a register dump when I do some thing that would trigger the
>> kernel to call modprobe. Modprobe is not in stalled in my system (is it
>> ported yet?).
> 
> the modutils source is available by cvs from pehc.  richard was working
> on it (he's on holiday right now).  don't remember how far he got.
> i know he did a merge with the upstream modutils source at one point.
> 
I have not built modutuils yet, but if I install echo as /sbin/modprobe
the problem goes away.

So something in the request module path does not handle missing files
as it should.

/Daniel
-- 
