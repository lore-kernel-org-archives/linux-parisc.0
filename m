Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id GAA08583
	for <parisc-linux@puffin.external.hp.com>; Tue, 1 Jun 1999 06:22:23 -0600
Date: Tue, 1 Jun 1999 14:21:47 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: Alex deVries <adevries@redhat.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] The plan for SOM, ELF32 and ELF64.
Message-ID: <19990601142147.Y1410@mencheca.ch.genedata.com>
References: <Pine.LNX.3.96.990531230648.8814C-100000@devserv.devel.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.3.96.990531230648.8814C-100000@devserv.devel.redhat.com>; from Alex deVries on Mon, May 31, 1999 at 11:16:34PM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Mon, May 31, 1999 at 11:16:34PM -0400, Alex deVries wrote:
> The bad news is that we have a challenge no matter what we do.  The
> problems are that:
> 
> - we don't have a version of ld for SOM in binutils, which means we can't
>   really cross compile properly

.. and Jeff Law declined to put SOM support into BFD :-)

> The route we've planned to take is:
> 
> - focus on SOM only for kernel and userland, but not the linker.  When we
> need to link SOM userland, we'll have to do it on HPUX.

Or get sufficient HPUX binary compatibility that the HPUX linker works
under Linux/PARISC.  Of course the SOM loader is the first tiny part of that.

> - at some point Cygnus will deliver on their HP sponsored gcc support for
> PARISC 2.0, which should have some ELF64 code we can borrow. It's
> understood that the ELF32 and 64 specs have a lot in common.

You said you were unsure whether the release date for any of that stuff
was public knowledge.  Is there any public indication of dates yet?

> No reasonable distribution will be SOM based, so we're going to have to
> get ELF done before we get to that point.

> Let me know if I'm mistaken on any of this.

that all fits with my memory.

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson
