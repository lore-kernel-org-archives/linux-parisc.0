Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id UAA02369
	for <parisc-linux@puffin.external.hp.com>; Sun, 19 Nov 2000 20:03:18 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 20 Nov 2000 03:05:23 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id OAA22272;
	Mon, 20 Nov 2000 14:03:16 +1100
Date: Mon, 20 Nov 2000 14:03:16 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: John Marvin <jsm@udlkern.fc.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: Single-stepping
In-Reply-To: <200011160901.CAA00367@udlkern.fc.hp.com>
Message-ID: <Pine.LNX.4.21.0011201317160.15391-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 16 Nov 2000, John Marvin wrote:

> Anyway, for reference, HP-UX does single stepping by using a combination
> of the taken branch trap, and loading the instruction queues such that the
> front of the queue points to the next instruction to be single stepped and
> the back of the queue points to the first of two break instructions on a
> "break" page.  It does NOT insert break instructions into the code, so it
> does not adversely affect execution on a SMP machine.  Note that we
> already put a bunch of break instructions before the syscall entry point
> on the gateway page, so it would be easy to use our gateway page for the
> "break page".  This way, if the single stepped instruction branches, a
> taken branch trap will be taken (which is important in the case where the
> branch nullifies its delay slot).  Otherwise, the instruction will be
> executed and then the break instruction at the known location on the
> "break" page will be executed.  If the single stepped instruction
> nullifies the next instruction, the second break instruction on the
> "break" page will be executed.

This is the path I started out on for hppa-linux, then hit the problem of
a branch that nullifies it's delay slot.  At that point, I decided playing
with IAOQ_back wouldn't work as I missed the solution of enabling taken
branch traps. :-(  If I'd seen this trick, then I would not have tried
using the recovery counter, and even now, it may be better to go back to
IAOQ fiddling.  The recovery counter scheme has the disadvantage that
there's only one of them so you need to save/restore over task swaps or
introduce extra instructions in the syscall path - and be very careful.

> Note that this is the short explanation. It is not as simple as it sounds.
> One major complication is that branches with links don't work properly
> with the instruction queue magic, so the link register has to be updated
> in the taken branch trap handler. Also branch externals won't update
> the space of the space queue tail properly (again, that has to be fixed
> in the taken branch handler). I can provide more details if the recovery
> counter method doesn't work out.

I'm a little intrigued about these "complications".  How can the link
register or space _not_ be updated properly?  As far as I can see, the
only really tricky instruction to single-step is RFI - which shouldn't 
ever occur in userspace, and which we'd just emulate if it was important.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
