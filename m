Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id HAA15807
	for <parisc-linux@puffin.external.hp.com>; Mon, 15 Nov 1999 07:14:15 -0700
Sender: rbrad@mailserv2.iuinc.com
Message-ID: <38301576.C614F7FA@uswest.net>
Date: Mon, 15 Nov 1999 07:15:19 -0700
From: Ryan Bradetich <rbradetich@uswest.net>
MIME-Version: 1.0
To: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
CC: Alex deVries <adevries@thepuffingroup.com>, paul_bame@hp.com,
        Parisc Linux <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] arch/parisc/kernel/realmode_setup.c Question
References: <Pine.LNX.4.10.9911141954080.7120-100000@vodka.thepuffingroup.com> <382F5B60.D215DB58@uswest.net> <19991115082044.B30917@mathe.stud.uni-erlangen.de>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Philipp Rumpf wrote:

> > > How far does it actually boot though?
>
> > Transferring control to kernel. (At entry point 0x00010000)
> > kernel(0x00148C80, 0x00504010, 0x00148C80, 0x00016640)
> > Clear BSS 0x0011B048 --> 0x0013D690
> > Boot loader: PA/Linux, maybe PALO
> > realmode_setup exiting
> >
> > ... At this point it hangs.  Before, it always used to hang at:
> > Transferring control to kernel. (At entry point 0x00010000)
> >
> > I still do not believe it ever successfully finished the rfi in head.S :(
> > I still need to do some more research to verify this, but that is my
> > gut feeling right now.
>
> This sounds right.  It is indeed possible we cannot install a BTLB entry on
> your CPU (and the firmware just reports success as it is free to according to
> the documentation) or the BTLB entry gets removed before we get the chance to
> do our first printk.

Ahh, ok.  I think I'm begining to understand what is happening now (finally).  Is
their
a way to check the BTLB entry and see if it is their right after we we insert the
entry?
or will th real-mode code take care of that?  (I would still like to know what is
happening, I've spent a lot of time tring to figure this out :))

>
> For both problems, the answer is within reach, and is called "a separate direc-
> tory for real-mode code".  Being able to debug unexpected TLB insertion handler
> calls is one of the immediate advantages of having this directory, and sure is
> going to be useful in the future (and would have been useful in the past).

Great!  Anything I can do to help?  I am just learning how this all works, but I
am very
interested in helping.

>
> Wanna bet we're going to get that machine to a sash prompt this week ?

Very, Very nice. Then hopefully I'll be able to contribute more.  I've been
wanting to get
this port to boot on this machine for a long time now :)  This is going to be a
great week!!

- Ryan


>
>         Philipp Rumpf
>
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
