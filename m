Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA22729
	for <parisc-linux@puffin.external.hp.com>; Fri, 22 Oct 1999 11:31:18 -0600
Received: from xsvr4.cup.hp.com (xsvr4.cup.hp.com [15.0.68.169])
	by cosrel1.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id LAA12224
	for <parisc-linux@thepuffingroup.com>; Fri, 22 Oct 1999 11:32:11 -0600 (MDT)
Sender: frowand@cup.hp.com
Message-ID: <38109F94.7DA3551A@hp.com>
Date: Fri, 22 Oct 1999 10:32:04 -0700
From: Frank Rowand <frank_rowand@hp.com>
Reply-To: frowand@cup.hp.com
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
CC: Paul Bame <bame@debian.fc.hp.com>
Subject: Re: [parisc-linux] Boot messages from C3000 console
References: <Pine.LNX.4.10.9910212221480.18206-100000@vodka.thepuffingroup.com> <99102217512801.00256@P100>
Content-Type: text/plain; charset=iso-8859-1
List-ID: <linux-parisc.vger.kernel.org>

Helge Deller wrote:
> 
> Am Fri, 22 Oct 1999 schrieb Alex deVries:
> > On Thu, 21 Oct 1999, Frank Rowand wrote:
> > > Ok, tirade mode off.  This is where my newbie status becomes apparent.  Please
> > > excuse any foot in mouth here.  I looked at the Puffin web page and didn't
> > > notice anything about the process of making sure that code that is submitted
> > > has some minimal level of quality.  Is it just a matter of the community
> > > applying peer pressure?
> >
> > In fact, it's *ALL* about the community applying pressure.
> >
> > If the code in head.S is a bit rough, remember that it was just about the
> > first PA-RISC assembler that Helge or Philipp had ever written, so do keep
> > that in mind.  Also, at the start of the project, there was a very
> > conscious effort to only be concerned with 1.1 code.  It doesn't surprise
> > me in the least that it's not 2.0 compliant.
> >
> > I agree that the code is unreadable though;  I've simply passed it off on
> > not being able to understand parisc assembler well enough.
> >
> > We'd all appreciate it if you could commit appropriate changes to make the
> > code clearer.
> >
> > - Alex
> 
> Thanks Alex,
> 
> Yes, we all know that the boot-loader really needs a complete clean-up, and as
> it looks like I´m the maintainer of the bootloader.
> 
> It´s really funny to see people from HP talking to the list and saying somthing
> about code-quality, but only as a little reminder:
> When I wrote the bootloader I had no documentation on bootloading from HP at
> all, no knowledge of parisc and got it only working with trial & error methods
> in day and night-sessions. More, it´s first goal was to get at least a kernel
> booted so that the real kernel-development could start. (See my messages in the

<stuff deleted>

First, thanks to all for the gentle replies.  I like this community!!

Alex, I guess I wasn't clear enough about what my issue was.  I wasn't complaining
about the actual code (I try to avoid that, as long as code is mostly correct
(works)).  My concern was that I, with twelve years experience with PA-RISC
(including four different OSs - MPE, NextStep, HP-RT, and HP-UX), had to go to
external documentation to read what is trivial code (a PDC call) when a
one line comment would have made it obvious that the code was calling
PDC_BLOCK_TLB().  For me, just annoying - for someone who might be missing one
or two of the bits of knowledge, potentially a multi-hour sidetrack to
understand some trivial code.  I want to encourage people to make the code
easily readable so I don't have to waste a lot of time when my help is requested
to debug or contribute code.

Helge, I wasn't complaining about the boot-loader, I think you are mixing two
different threads together.  And I'm not complaining about the algorithms,
the instructions coded, correctness of code, or anything like that.  I'm just
saying that the sequence that I had to read in head.S to figure out the
cause of the HPMC on the C3000 needed at least a comment to make it readable
without having to know about and consult external documents.  (And Grant made
a good point that using defines instead of numbers can also increase
readability significantly).

And yes, I suspect that adding the comment to the code will be my first
submission to parisc linux (how embaressing to submit a comment before
submitting any code!).

Thanks all,

Frank Rowand
