Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA01903
	for <parisc-linux@puffin.external.hp.com>; Fri, 11 Jun 1999 11:12:32 -0600
Sender: adevries@feather.thepuffingroup.com
Message-ID: <37614530.35570847@thepuffingroup.com>
Date: Fri, 11 Jun 1999 13:19:44 -0400
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
CC: law@cygnus.com, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] booting problems
References: <199906111406.KAA01206@hiauly1.hia.nrc.ca>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

John David Anglin wrote:
> 
> >   In message <3760CF80.887DA4C3@thepuffingroup.com>you write:
> >   > Okay, I'm a bit better off now.  I've at least located the problem.  I
> >   > copied the IPL straight out of Jason's binary, rebuilt, and it boots.
> >   > The next task is to figure out why the cross compiled version of ipl is
> >   > broken, and how to fix it.
> > It could well be an endianness problem in the ELF tools if that's what you
> > are using to build stuff.
> 
> While there could be an endianness problem, I think it more likely that
> it is how IPL is being linked and extracted into the LIF image.  

I think you're right.  I'm sure now that the byte order isn't a problem,
because my header and Jason's IPL work fine.

> Jason's
> link options, "-R 0 -N", specified a text origin of 0 and data following
> the text.  I think the default for ELF is to place the text at 0x1000 and
> data at 0x40000000.  The gnu ld equivalent for "-R 0" would appear to
> be "-Ttext 0".  I am not sure there is a direct equivalent for "-N".
> Maybe, you could use "-Tdata" to set the data location.  Maps might be
> useful to sort out what is going on.  

Definitely.  This should be the next step in sorting this out.

> Also, the SOM and ELF headers at the
> beginning of each binary may differ in size.  When I tried "-Ttext 0",
> the size of the ELF header seemed to change in size.  I think there
> is info in the header about its size, etc.

I was thinking that object formats wouldn't really matter in the end; in
the end we're doing straight binary with no loading information.

- Alex
