Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA24184
	for <parisc-linux@puffin.external.hp.com>; Mon, 18 Dec 2000 13:41:20 -0700
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: sieler@allegro.com (Stan Sieler), parisc-linux@thepuffingroup.com,
        phi@hpfrcu03.france.hp.com (Philippe Benard),
        lamont@hp.com (LaMont Jones), matthew@wil.cx (Matthew Wilcox),
        jes@linuxcare.com (Jes Sorensen), alan@linuxcare.com.au (Alan Modra),
        jsm@udlkern.fc.hp.com (John Marvin), lamont@hp.com
Subject: Re: [parisc-linux] ldcw in __pthread_acquire 
In-reply-to: Your message of "Mon, 18 Dec 2000 19:54:52 GMT."
             <E1486N5-000662-00@the-village.bc.nu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Date: Mon, 18 Dec 2000 13:44:12 -0700
From: LaMont Jones <lamont@hp.com>
Message-Id: <20001218204414.F2EAF1872C@security.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> > Note that efficiency *IS ALWAYS LESS IMPORTANT THAN CORRECTNESS*.
> > That's 100%, totally vital!  To say "important" is to make a severe
> > understatement.
> Tell that to the folks I work with at times for whom user space lock testing
> shaves 4 weeks off a run. Try the difference in Mozilla.
> In both cases Im forced to disagree - at least for x86.

Correct appears to be a relative term.  An implementation of semaphores is
correct if it provides mutual exclusion.  Performance becomes a secondary
consideration to that, of course.

I have to side with Alan on this point.  x86 costs too much to go into the
kernel for something that you'll normally not have contention on.  The only
challenge there is that the owner of the resource may hold it for a _long_
time if he gets swapped out, since the kernel has no knowledge.  Note,
however, that it is still correct: eventually, all of the waiters will go
to sleep, and the owner will finally get time to do his thing and free the
sema.

With PA, there's a chance to get into kernel mode cheaply, and it probably
makes sense to do an arch-specific msem_lock() that avoids the heavy
contention issues.

> > Can you interrogate and ask what version of msem_lock() you're calling?  
> Yes. ELF has versioned symbols if they have changed. You can use those for
> many things. X86 however has a stable instruction set abi for locking.

parisc's set is usable as well, but there's a difference in how you code
test-and-set vs test-and-clear.  This makes it a royal pain to port code
that expects test-and-set to parisc...  (And test and inc/dec makes it
even easier...)

> > Although I can't find the man pages for Linux msem_lock, I know that the
> > HP-UX msem_lock doesn't meet all of these criteria (nor does MPE/iX, althou
> > it comes a lot closer).
> We use user space locks for stuff like pthreads on most platforms with
> the kernel doing the contention cases. I'm not arguing that it wouldnt be nic
> to let the kernel do it all if we had cheap syscalls. 

Sounds perfectly reasonable.  How hard is it to put arch-specific things
into that path?

lamont
