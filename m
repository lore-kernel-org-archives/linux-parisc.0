Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id OAA28344
	for <parisc-linux@puffin.external.hp.com>; Sun, 20 Jun 1999 14:26:36 -0600
To: Matthew Wilcox <Matthew.Wilcox@genedata.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HPUX binary compatibility 
Reply-To: law@cygnus.com
In-reply-to: Your message of Sun, 20 Jun 1999 19:40:15 +0200.
             <19990620194015.J30362@mencheca.ch.genedata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sun, 20 Jun 1999 14:21:36 -0600
Message-ID: <20550.929910096@upchuck.cygnus.com>
From: Jeffrey A Law <law@cygnus.com>
List-ID: <linux-parisc.vger.kernel.org>


  In message <19990620194015.J30362@mencheca.ch.genedata.com>you write:
  > 
  > How far do we want to or are we able to go with making constants identical
  > between HPUX and Linux?
We never bothered at the UofU.  It didn't seem worth the headache to try and
get either HP or Berkeley to change syscall, errno or other constants.

  > I've just been through errno.h making the Linux error numbers the same as
  > the HPUX ones.  This seems pretty sane; I can't imagine that it will have
  > any negative effect on anything.  Where it gets a little more thorny is
  > in signal.h -- HPUX uses more than 32 signals.  Is it going to negatively
  > impact Linux at all to use more than 32?  I see there is space reserved
  > for them, but I'd like someone to reassure me.
Just write translators on the hpux emulation side.

ie, consider the linux values the canonical internal form.

You then have two external representations.

  First is linux.  Do nothing here since the internal & external representation
  is the same.

  Second is hpux.  Translate values as you enter/exit the kernel.  So for
  example, you may need a second syscall table to do handoff of syscalls
  after translating the syscall #.  On the exit path you probably need to
  translate errno values.  Similarly for signals.

jeff
