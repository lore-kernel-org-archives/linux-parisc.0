Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id KAA19913
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Dec 1999 10:16:45 -0700
To: Matthew Wilcox <willy@thepuffingroup.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Trouble building CVS binutils 
Reply-To: law@cygnus.com
In-reply-to: Your message of Thu, 30 Dec 1999 12:16:55 EST.
             <19991230121655.T12629@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 30 Dec 1999 10:16:33 -0700
Message-ID: <14225.946574193@upchuck>
From: Jeffrey A Law <law@cygnus.com>
List-ID: <linux-parisc.vger.kernel.org>


  In message <19991230121655.T12629@thepuffingroup.com>you write:
  > 
  > I just attempted to build the binutils in CVS and ran across this problem.
  > When building bfd/hpux-core.c, it stops with a parse error before uint64_t
  > which is used in one of the hpux header files.  <sys/_inttypes.h>
  > does not define this type unless the __STDC_EXT__ symbol is defined.
  > I added this symbol to the egcs spec file and binutils now builds, but
  > I'm not sure this is the most appropriate fix.  It probably is, since
  > HPUX's headers seem to use this as a sign that the compiler supports
  > `long long', but I'm not sure if that's the only thing it means.
Let me guess.  You're using gcc on hpux11?  

No released version of gcc supports hpux11 yet.
jeff
