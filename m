Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA29022
	for <parisc-linux@puffin.external.hp.com>; Fri, 31 Mar 2000 08:55:38 -0700
Date: Fri, 31 Mar 2000 10:55:35 -0500
From: Nick Cabatoff <ncc@cs.mcgill.ca>
To: PARISC-LINUX@thepuffingroup.com
Subject: Re: [parisc-linux] Building bin-utils and gcc on HP735...
Message-ID: <20000331105534.F27366@cs.mcgill.ca>
References: <01JNOHLGY86Q000XJ1@ICIL64.CILEA.IT> <20000331115211.B30107@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: willy@thepuffingroup.com's message [Re: [parisc-linux] Building bin-utils and gcc on HP735...] as of Fri, Mar 31, 2000 at 11:52:11AM -0500

On Mar 31, willy@thepuffingroup.com wrote:
> On Fri, Mar 31, 2000 at 10:51:34AM +0000, BOSCHINI@ICIL64.CILEA.IT
> wrote:
> > Then, realisng a needed the parisc includes from the puffin, I
> > re-started from scratch. As sson as I start building, both with HP
> > Ansi C compiler as well with gcc 2.95, the binutils, I get an
> > error about not finding bison
> 
> That's correct, you need bison.  Would someone like to volunteer to
> make a bison .depot available from pehc?  It should build properly
> on HPUX; we certainly have a binary which works here, but I think it
> needs to be packaged properly...

There's one (1.28) at http://hpux.ee.ualberta.ca if that's good
enough...
