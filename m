Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id BAA31329
	for <parisc-linux@puffin.external.hp.com>; Fri, 11 Jun 1999 01:39:50 -0600
Date: Fri, 11 Jun 1999 09:39:46 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: Alex deVries <adevries@thepuffingroup.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] a question about HPUX's linker
Message-ID: <19990611093946.P31472@mencheca.ch.genedata.com>
References: <3760B67A.8D9F3B1F@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3760B67A.8D9F3B1F@thepuffingroup.com>; from Alex deVries on Fri, Jun 11, 1999 at 03:10:50AM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Jun 11, 1999 at 03:10:50AM -0400, Alex deVries wrote:
> 
> To help us get ahead, I'm trying to get the kernel to build properly
> with HPUX, using HPUX's linker, and gcc.
> 
> Why does the final kernel link use --start-group ... --end-group?
> 
> What's the equivalent syntax for HPUX's ld?
> 
> I'm a bit short on docs in this area...

This is something which happened towards the later days of 2.1
development.  It causes GNU ld to scan through the archives indicated
between --start-group and --end-group until no more symbols are resolved.
It is a GNU extension.  I think _in general_ it's not necessary, but
there are a few corner cases where this is needed.  Try taking it out,
tell us what errors you get.

Of course, this is all due to Linux's lame build scripts and they should
be replaced with something better.  which I don't have time to work on, of
course :-)

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson
