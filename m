Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id AAA06142
	for <hppa-linux@sod.res.cmu.edu>; Fri, 26 Mar 1999 00:00:11 -0500
Received: (from smap@localhost)
          by dfw-ix7.ix.netcom.com (8.8.4/8.8.4)
	  id WAA04900 for <hppa-linux@thepuffingroup.com>; Thu, 25 Mar 1999 22:59:27 -0600 (CST)
Date: Thu, 25 Mar 1999 21:01:05 -0800 (PST)
From: Kumar <kumar@ix.netcom.com>
To: hppa-linux@thepuffingroup.com
Subject: Re: [hppa-linux] syscall work
In-Reply-To: <36FACD03.6446ACF4@netscape.com>
Message-ID: <Pine.LNX.3.96.990325205652.197B-100000@quark.ix.netcom.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>


On Thu, 25 Mar 1999, Mike Shaver wrote:

> While we're on the topic, though: why 0xC0000004 and not 0xC0000000 as
> the target address?  (Although there are other bugs, like ``ldo 5,%r22''
> instead of ``ldi 5,%r22'' in the Assembler Ref as well, so maybe this is
> another?)

It does not matter as long as the gateway instruction is on the "special"
page. Probably one wants to put a nop before the gateway instruction.

-pkd
