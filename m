Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id QAA04042
	for <parisc-linux@sod.res.cmu.edu>; Mon, 29 Mar 1999 16:41:55 -0500
Received: (from mickey@localhost)
	by lucifier.dial-up.user.akula.net (8.9.2/8.9.2) id PAA00932
	for hppa-linux@thepuffingroup.com; Mon, 29 Mar 1999 15:42:53 -0500 (EST)
From: Michael Shalayeff <mickey@lucifier.dial-up.user.akula.net>
Message-Id: <199903292042.PAA00932@lucifier.dial-up.user.akula.net>
Subject: Re: [hppa-linux] syscall work
In-Reply-To: <199903292127.NAA30341@bart.allegro.com> from Stan Sieler at "Mar 29, 99 01:27:01 pm"
To: sieler@allegro.com (Stan Sieler)
Date: Mon, 29 Mar 1999 15:41:40 -0500 (EST)
Reply-To: mickey@openbsd.org
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: mickey@lucifier.dial-up.user.akula.net

re
okie, but why emulating gate instruction, when there is already such
instruction exist? (;
page w/ gate instructions needed for existing (3 already) operating systems
compatibility, so it's needed anyway, and btw having the gateway
page mapped (and only one) could result in that it's tlb mapping would
persist in the tlb improving perfomance, while doing if() would
always penilize. this needs actual measurement, but i beleive certain
cases w/ many syscalls being called should be very possible.
cu

Making, drinking tea and reading an opus magnum from Stan Sieler:
> Re:
> 
> > let's think what is less efficient: extra mapped page, or
> > extra indirrect ptr reference?
> > my point is, why map extra page (and waiste extra page) ?
> > one page is 128 page dir entries, hehe (; returning to the pd discussion)
> 
> If you're talking about the gateway page, if you don't actually *allocate*
> a page, but simply rely on the trap that occurs when you try to jump to it,
> then there's 0 storage cost for the extra mapped page approach...no TLB
> entry, no entries in other data structures.  The only cost is the
> additional CPU time in the TLB miss handler to say:
> 
>    if isr.ior = 0xc0000400 (or whatever)
>       then handle system call attempt
>    else
>       handle TLB miss
> 
> BTW, the extra cost of doing a system call mechanism via a non-mapped gateway page
> vs. using a GATE instruction is about 5 microseconds on a 32MHz machine.
>  
> -- 
> Stan Sieler                                          sieler@allegro.com
>                                      http://www.allegro.com/sieler.html
> 
> 


-- 
    paranoic mickey       (my employers have changed but, the name has remained)
