Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id VAA00801
	for <parisc-linux@puffin.external.hp.com>; Fri, 8 Dec 2000 21:02:43 -0700
Received: from upchuck.cygnus.com (taarna.cygnus.com [205.180.230.102])
	by runyon.cygnus.com (8.8.7-cygnus/8.8.7) with ESMTP id UAA13802
	for <parisc-linux@thepuffingroup.com>; Fri, 8 Dec 2000 20:04:23 -0800 (PST)
To: Richard Henderson <rth@redhat.com>
cc: John David Anglin <dave@hiauly1.hia.nrc.ca>, alan@linuxcare.com.au,
        rhirst@linuxcare.com, parisc-linux@thepuffingroup.com,
        gcc-bugs@gcc.gnu.org
Subject: Re: pa reload problem 
Reply-To: law@redhat.com
In-reply-to: Your message of Fri, 08 Dec 2000 17:39:48 PST.
             <20001208173948.B4198@redhat.com>
From: Jeffrey A Law <law@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 08 Dec 2000 21:05:27 -0700
Message-ID: <23471.976334727@upchuck>
Sender: law@cygnus.com
List-ID: <linux-parisc.vger.kernel.org>

  In message <20001208173948.B4198@redhat.com>you write:
  > On Fri, Dec 08, 2000 at 08:07:23PM -0500, John David Anglin wrote:
  > > It is my impression that the MEM would pass as a general_operand unless
  > > the volatile flag is set.  It will pass GO_IF_LEGITIMATE_ADDRESS.  Thus,
  > > the general_operand test doesn't look like it will work.
  > 
  > Your GO_IF_LEGITIMATE_ADDRESS will accept the UNSPEC?
  > The mind boggles.  Why, then, is this strange beast its own insn?
  > 
  > Perhaps that is part of the bug...
Ironic that this is the hack that I ripped out (for basically the same reasons)
when I started working on V3.

Unfortunately, I can't actually test it yet to see what problems removing
that old hack will expose (FWIW, it's not my hack, and it pre-dates movement
of everything to public lists, so there's no discussion of why the change
was made).


jeff
