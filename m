Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id KAA21349
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Dec 1999 10:42:37 -0700
To: Matthew Wilcox <willy@thepuffingroup.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Trouble building CVS binutils 
Reply-To: law@cygnus.com
In-reply-to: Your message of Thu, 30 Dec 1999 12:22:28 EST.
             <19991230122228.U12629@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 30 Dec 1999 10:42:25 -0700
Message-ID: <14381.946575745@upchuck>
From: Jeffrey A Law <law@cygnus.com>
List-ID: <linux-parisc.vger.kernel.org>


  In message <19991230122228.U12629@thepuffingroup.com>you write:
  > > No released version of gcc supports hpux11 yet.
  > 
  > oops, didn't realise that.  i should build binaries on hpux-10 to run
  > them on hpux 11?
It's not the binaries that are the problem, but the changes HP made to their
header files for hpux11.  So using hpux10 binaries doesn't solve the problem.

[ There's some other hpux11 changes that effect C++ and shared libraries, but I
  don't think those changes would effect what you're doing. ]
  

I put hpux11 support into the GCC development tree over the summer; it should
be possible to take that code and retrofit it into gcc-2.95.x.

jeff
