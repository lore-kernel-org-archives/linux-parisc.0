Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id DAA31765
	for <parisc-linux@puffin.external.hp.com>; Fri, 11 Jun 1999 03:14:19 -0600
To: Alex deVries <adevries@thepuffingroup.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] booting problems 
Reply-To: law@cygnus.com
In-reply-to: Your message of Fri, 11 Jun 1999 04:57:36 EDT.
             <3760CF80.887DA4C3@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 11 Jun 1999 03:08:39 -0600
Message-ID: <18273.929092119@upchuck.cygnus.com>
From: Jeffrey A Law <law@cygnus.com>
List-ID: <linux-parisc.vger.kernel.org>


  In message <3760CF80.887DA4C3@thepuffingroup.com>you write:
  > Okay, I'm a bit better off now.  I've at least located the problem.  I
  > copied the IPL straight out of Jason's binary, rebuilt, and it boots. 
  > The next task is to figure out why the cross compiled version of ipl is
  > broken, and how to fix it.
It could well be an endianness problem in the ELF tools if that's what you
are using to build stuff.

While we did at one point try to squash them, we may have missed some --
over the long haul dos-x-hppa-elf did not turn out to be all that popular
of a host-x-target combination (what a surprise).

BTW, did I mention that probably the first thing your kernel should do is
start mucking around with the leds?  They're an awful primitive, but highly
valuable debugging tool.

jeff
