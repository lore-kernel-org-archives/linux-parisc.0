Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA23555
	for <parisc-linux@puffin.external.hp.com>; Thu, 6 Jul 2000 10:29:32 -0600
To: David Huggins-Daines <dhd@linuxcare.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] untested but building 64-bit toolchain,
 issues/questions
Reply-To: law@cygnus.com
In-reply-to: Your message of 06 Jul 2000 10:49:14 EDT.
             <873dlnl3f9.fsf@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 06 Jul 2000 10:30:43 -0600
Message-ID: <10808.962901043@upchuck>
From: Jeffrey A Law <law@cygnus.com>
List-ID: <linux-parisc.vger.kernel.org>

In message <873dlnl3f9.fsf@linuxcare.com>you write:
  > > Yes, but I thought that 'hppa2.0w' means 64 bit by definition, so it
  > > strikes me that the problem is with config.guess returning this.
  > 
  > Oh, and one more thing.  GCC thinks that hppa2.0w is a 64-bit target.
Err, no.  Go look at the official GCC, GDB, binutils repositories.

hppa2.0w is not considered a 64bit target by any of the tools.

jeff
