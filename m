Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA28873
	for <parisc-linux@puffin.external.hp.com>; Fri, 31 Mar 2000 08:52:46 -0700
From: willy@thepuffingroup.com
Date: Fri, 31 Mar 2000 11:52:11 -0500
To: BOSCHINI@ICIL64.CILEA.IT
Cc: PARISC-LINUX@thepuffingroup.com, BOSCHINI@cilea.it, QUATTRONE@cilea.it
Subject: Re: [parisc-linux] Building bin-utils and gcc on HP735...
Message-ID: <20000331115211.B30107@thepuffingroup.com>
References: <01JNOHLGY86Q000XJ1@ICIL64.CILEA.IT>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <01JNOHLGY86Q000XJ1@ICIL64.CILEA.IT>; from BOSCHINI@ICIL64.CILEA.IT on Fri, Mar 31, 2000 at 10:51:34AM +0000

On Fri, Mar 31, 2000 at 10:51:34AM +0000, BOSCHINI@ICIL64.CILEA.IT wrote:
> Then, realisng a needed the parisc includes from the puffin, I re-started from
> scratch. As sson as I start building, both with HP Ansi C compiler as well with
> gcc 2.95, the binutils, I get an error about not finding bison

That's correct, you need bison.  Would someone like to volunteer to make
a bison .depot available from pehc?  It should build properly on HPUX;
we certainly have a binary which works here, but I think it needs to be
packaged properly...
