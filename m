Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp1.powertech.no (smtp1.powertech.no [195.159.0.145])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0EE72482A
	for <parisc-linux@parisc-linux.org>; Tue, 18 Dec 2001 00:09:24 -0700 (MST)
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [parisc-linux] Status report - B132L and 725/100
Message-ID: <1008658780.3c1ee95cb7432@nyepost.start.no>
Date: Tue, 18 Dec 2001 07:59:40 +0100 (CET)
From: Andy Walker <squawker@start.no>
Cc: Helge Deller <deller@gmx.de>, Matthew Wilcox <willy@debian.org>,
	Andy Walker <squawker@start.no>, parisc-linux@parisc-linux.org
References: <1008589643.3c1ddb4b75583@nyepost.start.no> <20011217143513.W10085@parcelfarce.linux.theplanet.co.uk> <20011217222143.4F578482A@dsl2.external.hp.com> <20011218004926.A5571@solo.franken.de>
In-Reply-To: <20011218004926.A5571@solo.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Quoting Thomas Bogendoerfer <tsbogend@alpha.franken.de>:

> On Mon, Dec 17, 2001 at 11:21:01PM +0100, Helge Deller wrote:
> > I think a better solution would be to sort the found graphic devices
> by the hpa.
> [...]
> > In case the user wants to override with the sti= parameter the kernel
> should now
> > select this entry (e.g. sti=1 should select the card at 0xf4000000).
> 
> the big problem is, that stifb completly ignores sti= from the
> commandline
> and video=map doesn't seem to work (I need to reconfigure a machine to
> test
> that myself, which I hadn't time yet). The best thing would be to use
> the console path from pdc, no idea how hard that is.

I agree with Thomas here. The PDC console path should always be mapped to
fb0 if possible. How we order the other frambuffers is of less importance,
but the average user shouldn't need to play around with kernel parameters
to make the machine boot sensibly.

> It's probably not a big deal to use the default sti (sti=) for stifb,
> but I'd prefer either a video="???" solution or the pdc console path. If we
> decide on a solution, I'm going to implement it (if nobody else wants
> to do it :-)).
> 
> Thomas.

I'll certainly help with any testing I can - can't promise too many programming
hours right now though, unfortunately :(

-Andy

------------------------------------------------------------
Få din egen @start.no-adresse gratis på http://www.start.no/
