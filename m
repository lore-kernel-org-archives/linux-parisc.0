Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA14055
	for <parisc-linux@puffin.external.hp.com>; Wed, 27 Dec 2000 13:14:34 -0700
Received: from upchuck.cygnus.com (taarna.cygnus.com [205.180.230.102])
	by runyon.cygnus.com (8.8.7-cygnus/8.8.7) with ESMTP id MAA22539
	for <parisc-linux@thepuffingroup.com>; Wed, 27 Dec 2000 12:17:42 -0800 (PST)
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
cc: rth@redhat.com, alan@linuxcare.com.au, rhirst@linuxcare.com,
        parisc-linux@thepuffingroup.com, gcc-bugs@gcc.gnu.org
Subject: Re: pa reload problem 
Reply-To: law@redhat.com
In-reply-to: Your message of Thu, 14 Dec 2000 11:40:04 EST.
             <200012141640.LAA03285@hiauly1.hia.nrc.ca>
From: Jeffrey A Law <law@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 27 Dec 2000 13:08:52 -0700
Message-ID: <9917.977947732@upchuck>
Sender: law@cygnus.com
List-ID: <linux-parisc.vger.kernel.org>

  In message <200012141640.LAA03285@hiauly1.hia.nrc.ca>you write:
  > That's what I thought.  It would appear to occur when the above two insns
  > get moved out of a loop.  The count gets decremented when the old insns
  > are deleted but not incremented when the new insns are created.  The puzzle
  > is why the count is zero rather than 1.  Maybe what happens is the two
  > insns in the loop are deleted first, then the label is deleted?  Notice
  > that insn 788 is moved to insn 1530.  However, the insn becomes 1531 and
  > the reg changes to 337 from 208.
In this case we typically will bump the number of uses before we delete
the insns that way the label doesn't go away unexpectedly.

jeff
