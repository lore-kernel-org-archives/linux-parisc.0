Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA31786
	for <parisc-linux@puffin.external.hp.com>; Fri, 26 Jan 2001 11:12:39 -0700
Date: Fri, 26 Jan 2001 12:16:29 -0600 (CST)
From: Greg Ingram <ingram@symsys.com>
To: Richard Hirst <rhirst@linuxcare.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] C100 improvements, problems
In-Reply-To: <20010125173637.R3571@linuxcare.com>
Message-ID: <Pine.LNX.4.21.0101261205420.31352-100000@maestro.symsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 25 Jan 2001, Richard Hirst wrote:

> On Thu, Jan 25, 2001 at 11:33:07AM -0600, Greg Ingram wrote:
> > o  I still have trouble with unligned data references.  I've discovered
> > that in addition to tar and make, sleep and nscd also produce this error.
> 
> Sounds like the libpthreads problem, for which a new glibc is being
> built.

Standing by.  Eagerly.  I'd like to see this crate try to roll its own
kernel.
 
> > more works fine.  I can mount the ext2 partition and run more from there.  
> > But when the SCSI disk is root, more page faults. Here's some kernel
> > messages:
> 
> There is a bug in more (really!), now fixed, but needs a rebuild.  If you
> invoke it as /bin/more you'll be ok.

I believe it, I just don't believe it.  Is this related to stack
direction?  (What is it: grows down on parisc but up on Intel and most
other Linux-supported processors?)  If so, what is more fiddling with on
its stack?  Does it alter its behavior based on argv[0]?  Oh well, not
really too important now, I guess.

- Greg
