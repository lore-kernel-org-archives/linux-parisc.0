Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA25399
	for <parisc-linux@puffin.external.hp.com>; Thu, 6 Jul 2000 12:14:05 -0600
To: David Huggins-Daines <dhd@linuxcare.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] untested but building 64-bit toolchain,
 issues/questions
Reply-To: law@cygnus.com
In-reply-to: Your message of 06 Jul 2000 14:05:39 EDT.
             <874s63p218.fsf@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 06 Jul 2000 12:16:17 -0600
Message-ID: <11586.962907377@upchuck>
From: Jeffrey A Law <law@cygnus.com>
List-ID: <linux-parisc.vger.kernel.org>


  In message <874s63p218.fsf@linuxcare.com>you write:
  > Urgh.  Understood.  This means that the gcc tree on
  > puffin.external.hp.com CVS is quite out of date, which is sort of what
  > I expected.  I'm looking at the possibility of merging it now.
Certainly possible.  Especially if you get a tree from the releases Cygnus
made to HP.  Lots has changed since then.

  > I know Matthew Wilcox has been pushing for using 'parisc-*-linux-gnu'
  > and 'parisc64-*-linux-gnu' as the arch strings for 32 and 64 bit
  > targets, and standardising on a 'linux' dialect of assembly language
  > for both (basically 2.0 mnemonics).  What would the chances of this
  > being accepted by the binutils/gcc/autoconf maintainers be?  (should I
  > be asking this on another list? sorry...)
  > 
  > We need to standardise on these things ASAP, since we are starting to
  > build userspace, and we will be stuck with them very soon.
I would strongly recommend hppax.y[w] and hppa64 since the GNU tools already
know about those names.  Otherwise you're going to spend a lot of time
unnecessarily hacking up configure scripts.

I believe there's a list (config@gnu.org)?  Where this kind of stuff is
usually discussed.
jeff
