Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA03085
	for <parisc-linux@puffin.external.hp.com>; Fri, 11 Jun 1999 13:30:09 -0600
Sender: adevries@feather.thepuffingroup.com
Message-ID: <37616570.19DC3853@thepuffingroup.com>
Date: Fri, 11 Jun 1999 15:37:20 -0400
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: Jason Eckhardt <jason@equator.com>
CC: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] booting problems
References: <199906111849.LAA29341@gatekeeper.equator.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Jason Eckhardt wrote:
> 
> > I think you're right.  I'm sure now that the byte order isn't a problem,
> > because my header and Jason's IPL work fine.
> >
> > > Jason's
> > > link options, "-R 0 -N", specified a text origin of 0 and data following
> > > the text.  I think the default for ELF is to place the text at 0x1000 and
> > > data at 0x40000000.  The gnu ld equivalent for "-R 0" would appear to
> > > be "-Ttext 0".  I am not sure there is a direct equivalent for "-N".
> > > Maybe, you could use "-Tdata" to set the data location.  Maps might be
> > > useful to sort out what is going on.
> >
> > Definitely.  This should be the next step in sorting this out.
> >
> 
>   The bootstrap definately will not work with default data at 0x40000000.
>   The HPMC that is occurring is undoubtedly because the data section is there.

Okay, this is the same conclusion I came to.  Where should I put both
the data and text sengments?

- Alex
