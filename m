Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA13848
	for <parisc-linux@puffin.external.hp.com>; Wed, 24 Nov 1999 11:59:04 -0700
From: Stan Sieler <sieler@allegro.com>
Message-Id: <199911241900.LAA30325@opus.allegro.com>
Subject: Re: [parisc-linux] Progress
To: Philipp.H.Rumpf@mathe.stud.uni-erlangen.de (Philipp Rumpf)
Date: Wed, 24 Nov 1999 11:00:39 -0800 (PST)
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <19991124110032.I1009@mathe.stud.uni-erlangen.de> from "Philipp Rumpf" at Nov 24, 1999 11:00:32 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Re:

> Look at the loop.  What we do is basically
> 
> 	cr16 = mfctl(16);
> 	while(((cr16+loops)-mfctl(16))>0);

You definitely don't want to do the above!

Even ignoring the possibility of an interrupt that takes us away
for awhile, there's the simple possibility that cr16 might
roll over during your loop.
(On a 100 MHz machine, with it ticking once per clock,
it rolls over about once every 40 seconds or so.)
This means you have an non-0 (although low) probability that your
loop may screw you up royally!

For example, if CR16 was 10 ticks away from rolling over, and
you wanted to delay for 9 ticks there's a non-0 probability
that it will rollover in between checks... poof, a 40 second delay
occurs in your loop! (Perhaps more, if you don't happen to grab
the cr16 within an acceptable window of time at the end of the 40 seconds.)

Detailing the above:

   cr16 = mfctl (16);    (and get's max-10)
   cr16 + 9 = max - 1
   after 4 to 20 loops, depending upon cr16 implementation on the machine,
   you *could* get to:
       while (  ((max - 1) - (max - 2)) > 0)
   and then loop back and get
       while (  ((max - 1) - (0)      ) > 0)

The likelihood of this (an observed rollover fouling you up) would be
greatly minimized if you added code to note the delta in each two
successive reads of cr16 and terminating if the delta became negative
or quite large.

> And what exactly would be the advantage ?

Not having sporadic hangs of 40 seconds?  (or more) 

-- 
Stan Sieler                                           sieler@allegro.com
www.allegro.com/sieler/wanted/index.html          www.allegro.com/sieler
