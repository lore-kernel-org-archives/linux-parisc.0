Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA06851
	for <parisc-linux@puffin.external.hp.com>; Mon, 21 Jun 1999 12:28:36 -0600
To: Stan Sieler <sieler@allegro.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HPUX binary compatibility 
Reply-To: law@cygnus.com
In-reply-to: Your message of Mon, 21 Jun 1999 11:07:19 PDT.
             <199906211807.LAA29277@bart.allegro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 21 Jun 1999 12:23:12 -0600
Message-ID: <14666.929989392@upchuck.cygnus.com>
From: Jeffrey A Law <law@cygnus.com>
List-ID: <linux-parisc.vger.kernel.org>

  In message <199906211807.LAA29277@bart.allegro.com>you write:
  > > You really don't want to do that.  I strongly recommend against it.  In
  > 
  > (Presuming "that" is "have different system call numbers")
Correct.

  > You're "compatible" if you can run an HP-UX app "out of the box" (e.g.,
  > restore it and run).  If you have to run it through a translator of some ki
  > nd,
  > you aren't compatible.   (If the translator is part of the OS, and invoked 
  > automatically & invisibly, that's ok...been there, used that for 15 years 
  > on MPE)
The translator is entirely in the kernel.  It does not require hacking the
binary in any way shape or form.

  > Without such a mechanism, you can't tell the system calls apart.
Yes you can.  The exec headers have different magic #s  which you can use
to identify hpux vs bsd vs osf vs lites vs linux binaries.

If the process is not a linux process, then you look up the syscall number
in the appropriate translation table.  Similarly for signal #s, errno values,
etc.

I strongly recommend you actually look at the code Utah wrote.  It handles
hpux compatibility well enough to run X servers, compilers, shells, etc etc
right off an hpux distribution tape/cd.

jeff
