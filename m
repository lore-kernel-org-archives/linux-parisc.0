Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA05648
	for <parisc-linux@puffin.external.hp.com>; Tue, 23 Nov 1999 12:00:00 -0700
Message-Id: <199911231901.OAA03902@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Progress
To: Philipp.H.Rumpf@mathe.stud.uni-erlangen.de (Philipp Rumpf)
Date: Tue, 23 Nov 1999 14:01:32 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: Philipp.H.Rumpf@mathe.stud.uni-erlangen.de,
        parisc-linux@thepuffingroup.com
In-Reply-To: <19991123190339.H1009@mathe.stud.uni-erlangen.de> from "Philipp Rumpf" at Nov 23, 99 07:03:39 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> I'd agree this loop is the nicest of the "real" delay loops so far, but I'm
> still unconvinced there's any advantage to using a "real" delay loop over a
> CR16-based one.

I think it depends on what the intended use of __delay() is.  If you just
want to wait a few cycles for a device register to update, then the "real"
delay loop should be fine.  The CR16-based loop will return faster if
there is some kind of hardware event during the loop.  But does it matter?
Usually, you don't care if the delay is longer than specified.

The CR16 loop is probably better for long delays.  However, in this case,
we probably should be sleeping instead.

For small delays, the CR16 loop has the same problems as the "real"
loop (cache and page faults, interrupts, etc).  The CR16 timer also
has a model dependent rate.  My documentation indicates the rate
varies from 0.5 to 2 times the peak instruction rate.  The algorithm
is not as tight as the "real" loop.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
