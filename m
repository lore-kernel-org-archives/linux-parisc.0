Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id OAA06830
	for <parisc-linux@puffin.external.hp.com>; Tue, 23 Nov 1999 14:10:03 -0700
From: Stan Sieler <sieler@allegro.com>
Message-Id: <199911232111.NAA25923@opus.allegro.com>
Subject: Re: [parisc-linux] Progress
To: Philipp.H.Rumpf@mathe.stud.uni-erlangen.de (Philipp Rumpf)
Date: Tue, 23 Nov 1999 13:11:44 -0800 (PST)
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <19991123190339.H1009@mathe.stud.uni-erlangen.de> from "Philipp Rumpf" at Nov 23, 1999 07:03:39 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Re:

> I'd agree this loop is the nicest of the "real" delay loops so far, but I'm
> still unconvinced there's any advantage to using a "real" delay loop over a
> CR16-based one.

If interrupts can happen (and get serviced), a CR16 loop is inherently
unreliable.  If you're looping until CR16 becomes >= some value, X, then
you might find that CR16 goes:   n, n+2, n+3, n-10000, n-9998, ...

I.e., the interrupt servicing could take enough time that the value in
CR16 becomes misleading.  If the new CR16 is < the last seen one, is it
simply because it "rolled over", or because an interrupt came in and 
you've spent an unknown amount of time doing other things?

OTOH, I like the idea of using a drastic change to CR16 as a signal
that "something happened", and consider using that as a clue 
to prematurely exit a counter-based loop.  In that scenario, I'd
expect a routine like:   delay (int loops,  int premature_exit_ok),
which would let the caller decide if a premature (CR16 change based)
exit was allowable.

-- 
Stan Sieler                                           sieler@allegro.com
www.allegro.com/sieler/wanted/index.html          www.allegro.com/sieler
