Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA12260
	for <parisc-linux@puffin.external.hp.com>; Thu, 13 Jan 2000 11:38:00 -0700
Received: from endor.fc.hp.com (endor.fc.hp.com [15.1.49.59])
	by palrel3.hp.com (Postfix) with ESMTP id 7394E1948
	for <parisc-linux@thepuffingroup.com>; Thu, 13 Jan 2000 09:38:29 -0800 (PST)
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 2.3 whining 
In-reply-to: Your message of "Thu, 13 Jan 2000 11:43:13 EST."
             <20000113114313.J11300@thepuffingroup.com>
Date: Thu, 13 Jan 2000 10:37:13 -0700
From: Paul Bame <bame@endor.fc.hp.com>
Message-Id: <E128oBN-0000kX-00@endor.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


My point isn't that we *can* recover, since surely we will.  Nor is
it about mechanistic CVS procedures, with which I'm familiar enough
to do date-based diffs and merges.

In *effect* we reverted a lot of code -- trashing our own efforts
without a good reason that I've heard.  "Falling through the cracks" is not
something I allow from our caliber of folk.  Whenever we revert someone's
code, especially without consultation with them, we make a pretty
clear statement about how much we don't value their effort.  AND if
there was value in the lost code, we have a bunch of re-work to do
thus the project loses ground.  It hurts the people AND the project.

When I was doing the embedded realmode stuff, which took me quite a
while, I thought it was my duty to continually bring in the changes
others were making to those same files, so that when I committed we
would have the product of all the authors' efforts, not just mine.
The lesson I could take from our 2.3 code reversion is that I
needn't bother eh?

As for $Log$, I abhor using that in source code.  But I think the
check-in comments, aka from 'cvs log', are a valuable part of the
authors contribution, and reverting them is just as damaging and
insulting as reverting the code itself.

I can start putting my 2.2 changes back into 2.3, but since I don't
know the reason for their reversion, I really don't have a good
basis upon which to select which features to bring forward and which
to leave.  Without the realmode hack some of the features we had in
2.2 can't be coded in C.  Should I re-hack the realmode thing or
something which solves the same problem?  Will *that* just get reverted
too?

The mechanistic details of diffs and merges are not the issue here.

		-P

P.S. I wish we had started the 2.3 port like this:

on puffin.external.hp.com:

cp -r /home/cvs/parisc/linux/arch/parisc /home/cvs/parisc/linux-2.3/arch
cp -r /home/cvs/parisc/linux/include/asm/parisc /home/cvs/parisc/linux-2.3/asm
