Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA27106
	for <parisc-linux@puffin.external.hp.com>; Mon, 18 Dec 2000 15:23:56 -0700
To: Stan Sieler <sieler@allegro.com>
Cc: parisc-linux@thepuffingroup.com,
        phi@hpfrcu03.france.hp.com (Philippe Benard),
        alan@lxorguk.ukuu.org.uk (Alan Cox), lamont@hp.com (LaMont Jones),
        matthew@wil.cx (Matthew Wilcox), jes@linuxcare.com (Jes Sorensen),
        alan@linuxcare.com.au (Alan Modra),
        jsm@udlkern.fc.hp.com (John Marvin), lamont@hp.com
Subject: Re: [parisc-linux] ldcw in __pthread_acquire 
In-reply-to: Your message of "Mon, 18 Dec 2000 11:44:45 PST."
             <200012181944.LAA07568@opus.allegro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Date: Mon, 18 Dec 2000 15:26:49 -0700
From: LaMont Jones <lamont@hp.com>
Message-Id: <20001218222649.B02801872C@security.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> Why?
>    - they make mistakes
So do kernel engineers.

>    - they don't know as much as they need to know
>    - their code runs on slightly different hardware (e.g., different
>      models of PA-RISC with slightly different characteristics).
These are the same point, and it ain't necessarily so.

>    - the cost of multiple copies of code (some copies by one user
>      programmer, some by another) 
>      ... many of which are "wrong" ... can be extreme.
This isn't a right vs wrong, just a code bloat issue...

>       - it must be done correctly (e.g., for single-owner locks, only one
>         thread must think it owns it at a time;
It doesn't matter if a thread thinks it owns the lock if it can't access
the resource.  (Yes, you can do locking that way, I can think of at least
two places in HP-UX where that is the case:  one in kernel mode, and one
in user mode with a kernel assist...)  Both of those are based on the fact
that it's more efficient to run like hell and then pick yourself up when
you trip than it is to lock before using.  Both cases were driven by the
simple fact that efficiency was the difference between having a product
and having a piece of junk.

>	  and the owner shouldn't be starved of CPU time;
Doesn't matter until someone else wants the resource...  Given a finite
amount of CPU resource, and a given number of locks, someone is going to
get starved sometime.

>	  and a requestor shouldn't run away with CPU resources)
Shouldn't hold the resource _longer_than_necessary_.  But now you're
talking performance.

>       - it must be efficient.
It _should_ be efficient.

> Note that efficiency *IS ALWAYS LESS IMPORTANT THAN CORRECTNESS*.
> That's 100%, totally vital!  To say "important" is to make a severe
> understatement.

See above.  The correct technical solution is not always the correct
business decision.  (And man, does it hurt parts of me to say that.)
If the efficient solution allows a bit of starvation in a corner case,
then it may be best to just document the corner case and live with it,
based on how much better the normal case is.

> Well then, where can we put locking such that it's more likely to be
> correct?  The kernel.  You can (and have to) rely on the kernel more than on
> user code.  The kernel gets patched/fixed/updated regularly.  The kernel
> is a *single point* of implementation, as opposed to hundreds of separate
> points of implementation.

A single shared-only library pretty much constitutes a single point of
implementation as well.

> Why not rely on libraries?  Because code in libraries is potentially
> staler than the kernel, and you have potentially many different variations.
> Can you interrogate and ask what version of msem_lock() you're calling?  
> Can you find out what version of msem_lock an archive-linked application
> you downloaded from a web site is running?
> No...but you *can* ask what version of Linux (or whatever) you're running!

You can also provide the locking code in a shared-only library.  Depending
on what is being locked, you may not have to worry about all of the above:
if the entire set of binaries that will be locking the shared resource
arrive as a set, then you just make sure that you deliver the set.  If you
have, say, a database that is accessed by everyone and their mother, then
you may have a different situation on your hands.

Spinning in user space before going to the kernel to do it is a waste
of every user-space cycle, but only when you go to the kernel.  Faced
with a 50-state kernel-mode cost, I would be strongly inclined (for a
performance sensitive app) to go with a user space spin, with kernel
assisted blocking.  If I were concerned about the starvation potential,
I would consider some minor adjustments to the blocking code in the
kernel to promote the owner of the lock, in order to reduce the starvation
issues.

There are situations where performance is _EVERYTHING_.  In those cases,
you pay a higher support price, and just do what has to be done.

> Alan...this is the voice of experience again...shouting louder! :)
> An operating system should provide a user-callable locking mechanism that:

>    - allows the programmer to give a hint to the OS about the length
>      of time they'll have the lock locked

Not really needed, but certainly on the wishlist.

>    - allows a root process to unlock a lock owned by a hung/dead process
>      (with stated semantics...e.g., does the first waiter get the lock,
>      or receive an error (i.e., ERR_PRIOR_OWNER_DIED))

If the lock is not in kernel memory, then I don't have to have someone
unlock the sema, that becomes an app issue.

>    - optionally detects deadlocks, and/or prevents deadlock attempts.

If sleeping is done at interruptable priorities, then this is an app
problem, although it sure is nice when the locking API takes care of
deadlock detection - it lets you be sloppy in defining your locking
strategy and get away with it.

lamont
