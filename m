Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA06403
	for <parisc-linux@puffin.external.hp.com>; Mon, 21 Jun 1999 12:07:33 -0600
Received: (from sieler@localhost)
	by bart.allegro.com (8.9.1/8.9.1) id LAA29277
	for parisc-linux@thepuffingroup.com; Mon, 21 Jun 1999 11:07:19 -0700
From: Stan Sieler <sieler@allegro.com>
Message-Id: <199906211807.LAA29277@bart.allegro.com>
Subject: Re: [parisc-linux] HPUX binary compatibility
To: parisc-linux@thepuffingroup.com
Date: Mon, 21 Jun 1999 11:07:19 -0700 (PDT)
In-Reply-To: <14480.929987303@upchuck.cygnus.com> from "Jeffrey A Law" at Jun 21, 99 11:48:23 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Jeff writes:

>   > The problem with translators is that they don't work in all cases.
>   > 
>   > The most important case is where you want to link some .o files
>   > together: some are compiled for Linux, some for HP-UX. 
>   > 
>   > *That's* why having different system call numbers is important.

> You really don't want to do that.  I strongly recommend against it.  In

(Presuming "that" is "have different system call numbers")

> 5 years of working on a system which had hpux compatibility we had zero
> need to do this kind of stuff and it just makes things a lot more complicated
> than they need to be.

You're "compatible" if you can run an HP-UX app "out of the box" (e.g.,
restore it and run).  If you have to run it through a translator of some kind,
you aren't compatible.   (If the translator is part of the OS, and invoked 
automatically & invisibly, that's ok...been there, used that for 15 years 
on MPE)

So...how do you achieve this level of compatibility?  Simple...the HP-UX
system call numbers *must* be honored.  What does that mean, then, if
Linux has an identically named (not numbered) system call whose
semantics differ?  Precisely one thing: the kernel must be able to
differentiate between them.  There are two basic methods of doing this:

  1) different system call numbers

or 

  2) different gateway page for the system calls (e.g., 0xc0000000 for
     HP-UX, and 0xc0000040 for Linux).  (Note: I don't recall the exact
     digits HP-UX uses...the values above are for illustrative purposes)
     (The kernel could check to see which address had been used for the
     call)

Without such a mechanism, you can't tell the system calls apart.

So, the only unanswered question is: is HP-UX compatibility desired?  
If the answer is "yes", the subsequent question (how) was answered above.

-- 
Stan Sieler                                          sieler@allegro.com
                                         http://www.allegro.com/sieler/
