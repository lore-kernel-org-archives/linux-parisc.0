Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA14614
	for <parisc-linux@puffin.external.hp.com>; Wed, 24 Nov 1999 12:30:42 -0700
Date: Wed, 24 Nov 1999 20:33:50 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: Stan Sieler <sieler@allegro.com>
Cc: Philipp Heinrich Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Progress
Message-Id: <19991124203349.J1009@mathe.stud.uni-erlangen.de>
References: <19991124110032.I1009@mathe.stud.uni-erlangen.de> <199911241900.LAA30325@opus.allegro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199911241900.LAA30325@opus.allegro.com>
List-ID: <linux-parisc.vger.kernel.org>

> > Look at the loop.  What we do is basically
> > 
> > 	cr16 = mfctl(16);
> > 	while(((cr16+loops)-mfctl(16))>0);
> 
> You definitely don't want to do the above!
> 
> Even ignoring the possibility of an interrupt that takes us away
> for awhile, there's the simple possibility that cr16 might
> roll over during your loop.

(cr16+loops) < mfctl(16)     does not handle roll-over correctly
((cr16+loops)-mfctl(16)) < 0 does.

> (On a 100 MHz machine, with it ticking once per clock,
> it rolls over about once every 40 seconds or so.)
> This means you have an non-0 (although low) probability that your
> loop may screw you up royally!

No, I haven't.  Think about it.

> For example, if CR16 was 10 ticks away from rolling over, and
> you wanted to delay for 9 ticks there's a non-0 probability
> that it will rollover in between checks... poof, a 40 second delay
> occurs in your loop! (Perhaps more, if you don't happen to grab
> the cr16 within an acceptable window of time at the end of the 40 seconds.)
> 
> Detailing the above:
> 
>    cr16 = mfctl (16);    (and get's max-10)
>    cr16 + 9 = max - 1

cr16+loops	mfctl(16)	((c+l)-m(16))	((c+l)-m(16))>0
0xffffffff	0xfffffff5	0x0000000a	true
0xffffffff	0xfffffff6	0x00000009	true
0xffffffff	0xfffffff7	0x00000008	true
...
0xffffffff	0xffffffff	0x00000000	false
0xffffffff	0x00000000	0xffffffff	false
0xffffffff	0x00000001	0xfffffffe	false
...
0xffffffff	0x00010000	0xfffeffff	false

Handles the roll-over just nicely, doesn't it ?

>    after 4 to 20 loops, depending upon cr16 implementation on the machine,
>    you *could* get to:
>        while (  ((max - 1) - (max - 2)) > 0)
>    and then loop back and get
>        while (  ((max - 1) - (0)      ) > 0)

oh, I think I see your problem.  Of course, we rely on the (a-b) part of
(a-b)>0 to be signed.  (using ">0" for unsigned integers doesn't make much
sense).

	Philipp Rumpf
