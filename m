Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id UAA17374
	for <parisc-linux@puffin.external.hp.com>; Thu, 21 Oct 1999 20:30:10 -0600
Date: Thu, 21 Oct 1999 22:33:15 -0400 (EDT)
From: Alex deVries <adevries@thepuffingroup.com>
To: frowand@cup.hp.com
cc: Paul Bame <bame@debian.fc.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Boot messages from C3000 console
In-Reply-To: <380FB68D.A8F28E62@hp.com>
Message-ID: <Pine.LNX.4.10.9910212221480.18206-100000@vodka.thepuffingroup.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>


On Thu, 21 Oct 1999, Frank Rowand wrote:
> Ok, tirade mode off.  This is where my newbie status becomes apparent.  Please
> excuse any foot in mouth here.  I looked at the Puffin web page and didn't
> notice anything about the process of making sure that code that is submitted
> has some minimal level of quality.  Is it just a matter of the community
> applying peer pressure?

In fact, it's *ALL* about the community applying pressure.

If the code in head.S is a bit rough, remember that it was just about the
first PA-RISC assembler that Helge or Philipp had ever written, so do keep
that in mind.  Also, at the start of the project, there was a very
conscious effort to only be concerned with 1.1 code.  It doesn't surprise
me in the least that it's not 2.0 compliant.

I agree that the code is unreadable though;  I've simply passed it off on
not being able to understand parisc assembler well enough.

We'd all appreciate it if you could commit appropriate changes to make the
code clearer.

- Alex
