Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id IAA26125
	for <parisc-linux@puffin.external.hp.com>; Thu, 11 Nov 1999 08:52:15 -0700
To: Paul Bame <bame@debian.fc.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] _end symbol in parisc linux? 
Reply-To: law@cygnus.com
In-reply-to: Your message of Thu, 11 Nov 1999 08:36:14 MST.
             <199911111536.IAA19092@debian.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 11 Nov 1999 08:51:27 -0700
Message-ID: <8933.942335487@upchuck>
From: Jeffrey A Law <law@cygnus.com>
List-ID: <linux-parisc.vger.kernel.org>

  In message <199911111536.IAA19092@debian.fc.hp.com>you write:
  > Maybe there is a better way.  The first reason I want to use _end
  > (and _edata) is to clear the kernel BSS reliably (which is working
  > great).
Parse the som exec header.

  > Both these tasks are currently being done at run-time -- in one case
  > by parsing the SOM header and in another case by guessing about a
  > parameter passed in by the hpux bootloader -- neither is currently
  > reliable despite the considerable experimentation and
  > sweat others have poured into the effort.
Then I'd suggest looking at code from folks that have done this in the past;
Utah's BSD & Mach kernels both handle parsing of the SOM exec header just
fine.


jeff
