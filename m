Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA15682
	for <parisc-linux@puffin.external.hp.com>; Fri, 15 Sep 2000 11:44:44 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 15 Sep 2000 17:45:13 -0000
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 32 bit compiler bug causing kernel crashes
References: <200009151206.GAA17924@udlkern.fc.hp.com>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 15 Sep 2000 13:43:10 -0400
In-Reply-To: John Marvin's message of "Fri, 15 Sep 2000 06:06:45 -0600 (MDT)"
Message-ID: <877l8dlff5.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

John Marvin <jsm@udlkern.fc.hp.com> writes:

> I've been investigating a problem that was leading to the kernel executing
> a break 0,0 (executing 0) at random times. I've tracked the problem down
> to a compiler bug.

Cool.  Strangely enough I don't see this in 2.3.99pre8, only in 2.4.
The problem with userspace executing zero at random times is obviously
something else.

> So here is the code at the beginning of schedule():
> 
> 	c0114404 <schedule>:
> 	c0114404:       08 03 02 41     copy r3,r1
> 	c0114408:       08 1e 02 43     copy sp,r3

Hm.  This bit above puzzles me, because I thought the kernel was
either compiled with -fomit-frame-pointer, or with sufficient
optimization that the frame pointer would be omitted anyway.

> 4--->   c011440c:       0c 68 12 90     stw  r8,8(sr0,r3)
> 	c0114410:       08 1e 02 48     copy sp,r8
> 	c0114414:       6b c2 3f d9     stw rp,-14(sr0,sp)
> 	c0114418:       08 08 02 53     copy r8,r19
> 5--->   c011441c:       6f c1 01 00     stw,ma r1,80(sr0,sp)

Wow.  That is some unbelievably screwed up register spilling.  In fact
I suspect that this may be a reload bug.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
