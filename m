Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id QAA03722
	for <parisc-linux@sod.res.cmu.edu>; Mon, 29 Mar 1999 16:27:43 -0500
From: Stan Sieler <sieler@allegro.com>
Message-Id: <199903292127.NAA30341@bart.allegro.com>
Subject: Re: [hppa-linux] syscall work
To: mickey@openbsd.org
Date: Mon, 29 Mar 1999 13:27:01 -0800 (PST)
Cc: shaver@netscape.com, hppa-linux@thepuffingroup.com
In-Reply-To: <199903261703.MAA19278@lucifier.dial-up.user.akula.net> from "Michael Shalayeff" at Mar 26, 99 12:03:26 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Re:

> let's think what is less efficient: extra mapped page, or
> extra indirrect ptr reference?
> my point is, why map extra page (and waiste extra page) ?
> one page is 128 page dir entries, hehe (; returning to the pd discussion)

If you're talking about the gateway page, if you don't actually *allocate*
a page, but simply rely on the trap that occurs when you try to jump to it,
then there's 0 storage cost for the extra mapped page approach...no TLB
entry, no entries in other data structures.  The only cost is the
additional CPU time in the TLB miss handler to say:

   if isr.ior = 0xc0000400 (or whatever)
      then handle system call attempt
   else
      handle TLB miss

BTW, the extra cost of doing a system call mechanism via a non-mapped gateway page
vs. using a GATE instruction is about 5 microseconds on a 32MHz machine.
 
-- 
Stan Sieler                                          sieler@allegro.com
                                     http://www.allegro.com/sieler.html
