Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA02466
	for <parisc-linux@puffin.external.hp.com>; Sat, 6 Nov 1999 13:15:31 -0700
To: Philipp Rumpf <prumpf@mathe.stud.uni-erlangen.de>
cc: Paul Bame <bame@debian.fc.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] _end symbol in parisc linux? 
Reply-To: law@cygnus.com
In-reply-to: Your message of Sat, 06 Nov 1999 19:26:14 +0100.
             <19991106192614.H11609@mathe.stud.uni-erlangen.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 06 Nov 1999 13:08:22 -0700
Message-ID: <30261.941918902@upchuck>
From: Jeffrey A Law <law@cygnus.com>
List-ID: <linux-parisc.vger.kernel.org>


  In message <19991106192614.H11609@mathe.stud.uni-erlangen.de>you write:
  > > Anybody know how to get PA-Linux to have an _end symbol like
  > > most other programs, including Intel Linux?
  > 
  > AFAIK we would need to have linker scripts to do so, which seems to be impo
  > ssible
  > with the HP/UX ld.  So this is on the "things that will get nicer when we h
  > ave
  > GNU binutils again" list.
Actually, you can with SOM with clever use of the sort_key attribute within
a subspace.  Create a new subspace with a larger than normal sort key.  Within
that space create a single symbol "_end".

Though I'd worry about precisely *why* someone wants the _end symbol; whatever
they're trying to do there's probably a better way.

jeff
