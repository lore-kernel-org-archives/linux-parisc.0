Received: from cygnus.com (runyon.cygnus.com [205.180.230.5])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id NAA02541
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Nov 2000 13:28:29 -0700
Received: from upchuck.cygnus.com (taarna.cygnus.com [205.180.230.102])
	by runyon.cygnus.com (8.8.7-cygnus/8.8.7) with ESMTP id MAA06765
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Nov 2000 12:30:33 -0800 (PST)
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
cc: rhirst@linuxcare.com (Richard Hirst), parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] Single-stepping 
Reply-To: law@redhat.com
In-reply-to: Your message of Wed, 15 Nov 2000 14:49:02 EST.
             <200011151949.OAA22929@hiauly1.hia.nrc.ca>
From: law@redhat.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 15 Nov 2000 13:30:59 -0700
Message-ID: <15884.974320259@upchuck>
Sender: law@cygnus.com
List-ID: <linux-parisc.vger.kernel.org>


  In message <200011151949.OAA22929@hiauly1.hia.nrc.ca>you write:
  > >   I've been helping Alan Modra out with kernel changes to support
  > > single stepping for gdb.  Paul Bame suggested I bounced our ideas
  > > off you in case you (or anyone else) had any comments.  I havn't
  > > actually committed my changes yet.
  > > 
  > > The basic approach is to use the recovery counter to generate
  > > a trap every instruction.  The scheme is complicated because a
  > > suspended process may or may not return to user space via an RFI.
  > 
  > I really don't know enough to comment on the implementation choice.  Why
  > did you decide on this approach as opposed to inserting breaks and
  > enabling the taken branch branch trap (T)?  It would appear that the recove
  > ry
  > counter was intended to provide software recovery from hardware faults
  > in fault tolerant systems.  Possibly, Grant could comment on whether
  > it is actually useful for this purpose.
Err, we tried that at the UofU in our mach port to the PA -- there's a problem
with that scheme, though I don't remember precisely what it was.  I believe
there were cases where the recovery counter doesn't trigger a trap, possibly
due to nullified instructions.

You might look at the UofU BSD code, which I believe used breakpoints and
branch taken traps instad.

jeff
