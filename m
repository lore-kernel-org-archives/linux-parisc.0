Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA22284
	for <parisc-linux@puffin.external.hp.com>; Mon, 18 Dec 2000 12:41:50 -0700
From: Stan Sieler <sieler@allegro.com>
Message-Id: <200012181944.LAA07568@opus.allegro.com>
Subject: Re: [parisc-linux] ldcw in __pthread_acquire
To: parisc-linux@thepuffingroup.com
Date: Mon, 18 Dec 2000 11:44:45 -0800 (PST)
Cc: phi@hpfrcu03.france.hp.com (Philippe Benard),
        alan@lxorguk.ukuu.org.uk (Alan Cox), lamont@hp.com (LaMont Jones),
        matthew@wil.cx (Matthew Wilcox), jes@linuxcare.com (Jes Sorensen),
        alan@linuxcare.com.au (Alan Modra),
        jsm@udlkern.fc.hp.com (John Marvin), parisc-linux@thepuffingroup.com
In-Reply-To: <20001218144036.5BE0B1872C@security.hp.com> from "LaMont Jones" at Dec 18, 2000 07:40:33 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Re:

LaMont writes:
...
> That was one of the first solutions tried in HP-UX, and it resulted in
> processor 4 not getting any time (3 wasn't much better), due to the way
> that bus arbitration works (it favors one end of the bus.)
> 
> The current semaphore operations in the HP-UX kernel do not use ldcw: they
> use stb and ldw in some interesting orders (which break when we get weak
> ordering with IA64, but then we'll have a low-cost test-and-set.)

Although I said I'd stay out...

Alan...this is *important*...re-read what's clear between the lines above:

   The user is the *WRONG* person to implement locks.
   (this includes user libraries)

Why?

   - they make mistakes

   - they don't know as much as they need to know

   - their code runs on slightly different hardware (e.g., different
     models of PA-RISC with slightly different characteristics).

   - the cost of multiple copies of code (some copies by one user
     programmer, some by another) 
     ... many of which are "wrong" ... can be extreme.

Simply put:

   Locking is *important*:

      - it must be done correctly (e.g., for single-owner locks, only one
        thread must think it owns it at a time; and the owner shouldn't
        be starved of CPU time; and a requestor shouldn't run away with
        CPU resources)

      - it must be efficient.

Note that efficiency *IS ALWAYS LESS IMPORTANT THAN CORRECTNESS*.
That's 100%, totally vital!  To say "important" is to make a severe
understatement.

Well then, where can we put locking such that it's more likely to be
correct?  The kernel.  You can (and have to) rely on the kernel more than on
user code.  The kernel gets patched/fixed/updated regularly.  The kernel
is a *single point* of implementation, as opposed to hundreds of separate
points of implementation.

Why not rely on libraries?  Because code in libraries is potentially
staler than the kernel, and you have potentially many different variations.
Can you interrogate and ask what version of msem_lock() you're calling?  
Can you find out what version of msem_lock an archive-linked application
you downloaded from a web site is running?
No...but you *can* ask what version of Linux (or whatever) you're running!

Alan...this is the voice of experience again...shouting louder! :)

An operating system should provide a user-callable locking mechanism that:

   - provides a single-owner lock;

   - provides an optional multi-owner lock (e.g., multiple processes 
     can lock for shared read access, or it can be locked by a single 
     owner for "write" access);

   - provides an optional (short-term) priority boost if a high priority
     process wants to obtain a lock owned by a low priority process

   - identifies what locks are currently held by what processes (and
     for how long)

   - is 100% reliable and, if possible, highly efficient

   - allows the programmer to give a hint to the OS about the length
     of time they'll have the lock locked

   - allows a root process to unlock a lock owned by a hung/dead process
     (with stated semantics...e.g., does the first waiter get the lock,
     or receive an error (i.e., ERR_PRIOR_OWNER_DIED))

   - allows the programmer to specify what happens to a locked lock
     owned by a process that then dies. 

   - optionally detects deadlocks, and/or prevents deadlock attempts.

Although I can't find the man pages for Linux msem_lock, I know that the
HP-UX msem_lock doesn't meet all of these criteria (nor does MPE/iX, although
it comes a lot closer).

-- 
Stan Sieler                                           sieler@allegro.com
www.allegro.com/sieler/wanted/index.html                  www.sieler.com        
