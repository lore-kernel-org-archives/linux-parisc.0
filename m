Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA23470
	for <parisc-linux@puffin.external.hp.com>; Mon, 18 Dec 2000 13:12:47 -0700
Received: (from sieler@localhost)
	by opus.allegro.com (8.9.3/8.9.3) id MAA08048
	for parisc-linux@thepuffingroup.com; Mon, 18 Dec 2000 12:15:43 -0800
From: Stan Sieler <sieler@allegro.com>
Message-Id: <200012182015.MAA08048@opus.allegro.com>
Subject: Re: [parisc-linux] ldcw in __pthread_acquire
To: parisc-linux@thepuffingroup.com
Date: Mon, 18 Dec 2000 12:15:43 -0800 (PST)
In-Reply-To: <E1486N5-000662-00@the-village.bc.nu> from "Alan Cox" at Dec 18, 2000 07:54:52 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Re:

> 
> > Note that efficiency *IS ALWAYS LESS IMPORTANT THAN CORRECTNESS*.
> > That's 100%, totally vital!  To say "important" is to make a severe
> > understatement.
> 
> Tell that to the folks I work with at times for whom user space lock testing
> shaves 4 weeks off a run. Try the difference in Mozilla.

To say I'm shocked is an understatment.

Alan, if you think efficiency is more important than correctness, then
please let us know what programs you've worked on,
so we can all avoid them! :)

However, I don't really believe you meant that!

Note that I never said efficiency isn't important.  But, it's like
a car with no brakes...that car can go faster in a straight line, but
it isn't correct ... and I sure as hell am not going to deploy such a car
for my commute!

> In both cases Im forced to disagree - at least for x86.

So...a fast x86 lock is more important than one that's correct?
I'm glad I'm not doing mission critical work on an x86! 
 
> > Can you interrogate and ask what version of msem_lock() you're calling?  
> 
> Yes. ELF has versioned symbols if they have changed. You can use those for
> many things. X86 however has a stable instruction set abi for locking.

So, the man page for msem_lock for ELF documents various versions?  Great!

Wait...no, it doesn't.

Scanning through a few ELF x-86 libraries fails to show any per-procedure
version information (although you can generally guess an overall version
of the library package).

With HP-UX, or MPE/iX, I can make a system call to inquire about the
OS version ... that, coupled with information available to the programmer
at writing time, allows a program to make decisions like "I won't try
to do X on this release, because I know that X didn't work correctly
until the next release".

Alan...I write products, some of them run on every release of MPE/iX
that's every come out.  That requires attention to detail, but the 
payoff is that you don't have to tell me what version you're running when
you get one of my programs.  I'd *like* to be able to do that on HP-UX
and Linux, but it's a awful lot harder. 

> We use user space locks for stuff like pthreads on most platforms with
> the kernel doing the contention cases. I'm not arguing that it wouldnt be nice
> to let the kernel do it all if we had cheap syscalls. 

Ok...the "I'm not arguing" sure wasn't clear before!

And...you still don't get it...it's not merely "nice", it's clearly better.
...just like the idea of adding brakes to that car.

(BTW, I'm trying to strip the cc list, so the interested parties don't get
tons of copies :)

-- 
Stan Sieler                                           sieler@allegro.com
www.allegro.com/sieler/wanted/index.html                  www.sieler.com        
