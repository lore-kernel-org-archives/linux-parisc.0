Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA25170
	for <parisc-linux@puffin.external.hp.com>; Thu, 6 Jul 2000 12:05:10 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 6 Jul 2000 18:06:32 -0000
To: law@cygnus.com
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] untested but building 64-bit toolchain,  issues/questions
References: <10808.962901043@upchuck>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 06 Jul 2000 14:05:39 -0400
In-Reply-To: Jeffrey A Law's message of "Thu, 06 Jul 2000 10:30:43 -0600"
Message-ID: <874s63p218.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Jeffrey A Law <law@cygnus.com> writes:

> In message <873dlnl3f9.fsf@linuxcare.com>you write:
>   > > Yes, but I thought that 'hppa2.0w' means 64 bit by definition, so it
>   > > strikes me that the problem is with config.guess returning this.
>   > 
>   > Oh, and one more thing.  GCC thinks that hppa2.0w is a 64-bit target.
> Err, no.  Go look at the official GCC, GDB, binutils repositories.
> 
> hppa2.0w is not considered a 64bit target by any of the tools.

Urgh.  Understood.  This means that the gcc tree on
puffin.external.hp.com CVS is quite out of date, which is sort of what
I expected.  I'm looking at the possibility of merging it now.

On the subject of architecture strings:

I know Matthew Wilcox has been pushing for using 'parisc-*-linux-gnu'
and 'parisc64-*-linux-gnu' as the arch strings for 32 and 64 bit
targets, and standardising on a 'linux' dialect of assembly language
for both (basically 2.0 mnemonics).  What would the chances of this
being accepted by the binutils/gcc/autoconf maintainers be?  (should I
be asking this on another list? sorry...)

We need to standardise on these things ASAP, since we are starting to
build userspace, and we will be stuck with them very soon.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
