Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA24546
	for <parisc-linux@puffin.external.hp.com>; Thu, 6 Jul 2000 10:59:05 -0600
To: David Huggins-Daines <dhd@linuxcare.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] untested but building 64-bit toolchain,
 issues/questions
Reply-To: law@cygnus.com
In-reply-to: Your message of 06 Jul 2000 10:14:28 EDT.
             <87puorl517.fsf@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 06 Jul 2000 11:01:15 -0600
Message-ID: <11103.962902875@upchuck>
From: Jeffrey A Law <law@cygnus.com>
List-ID: <linux-parisc.vger.kernel.org>


  In message <87puorl517.fsf@linuxcare.com>you write:
  > Yes, but I thought that 'hppa2.0w' means 64 bit by definition, so it
  > strikes me that the problem is with config.guess returning this.
Yes/No.  It would have been more convenient in some ways if it didn't do
that -- however it has also been argued that not returning the "w" loses
information.  ie, when the "w" is included we have a system that is 
capable of running 64bit binaries -- not all hppa2.0 systems can run
64bit binaries.

  > > This was discussed on the gcc, gdb, binutils, and autoconf development 
  > > lists.
  > 
  > Can you provide a subject: line to search on or a URL? 
I don't remember offhand.

  > I can't find
  > any definitive statements on the semantics of config.guess nor the
  > proper configuration for 64-bit PA-RISC in the archives.
They're there :-)  

  > > I'm not aware of a technical reason why this will not work in the assembl
  > er;
  > > there are *major* problems trying to make this work with the compiler.  F
  > eel
  > 
  > Yes, I'm aware of that :) I was hoping to follow the Sparc model where
  > the compiler is configured to pass the appropriate flags to the
  > assembler.
The biggest problems you're going to run into are radically different ABIs
in the 32bit and 64bit worlds -- things like arguments growing in different
directions.

jeff
