Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id DAA08270
	for <parisc-linux@puffin.external.hp.com>; Tue, 22 Jun 1999 03:45:30 -0600
Date: Tue, 22 Jun 1999 11:45:18 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: Larry Dwyer <larry_dwyer@hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HPUX binary compatibility
Message-ID: <19990622114518.U30362@mencheca.ch.genedata.com>
References: <19990620194015.J30362@mencheca.ch.genedata.com> <3.0.3.32.19990621143929.01891a44@hpuxmail.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3.0.3.32.19990621143929.01891a44@hpuxmail.cup.hp.com>; from Larry Dwyer on Mon, Jun 21, 1999 at 02:39:29PM -0700
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Jun 21, 1999 at 02:39:29PM -0700, Larry Dwyer wrote:
> I would encourage converging the vector constants for Linux on PA with the
> same constants for HP-UX on PA.
> 
> If there are some extra constants in Linux, I can arrange to have them
> reserved in HP-UX.
> 
> Do not assume they are reserved until I post to this group (in other words,
> every enq needs an ack).  It is best to send mail directly to me since I do
> not read this mailing list as often as I ought to.

That's perfect.  We're pretty flexible for the moment as we don't
have any userland yet.  There are 24 error codes defined in Linux which
are not defined in HPUX.  How about reserving the block from 129-192
for Linux error numbers?

(if you're interested, these are defined in linux/asm-parisc/errno.h).

I'm not entirely sure what to do about signals.  Linux has only one signal
which HP/UX does not -- SIGSTKFLT.  As I said, I reused _SIGGFAULT as
we don't have a use for it in Linux (yet?).  What do you think is the
right thing to do here?  I'm extremely reluctant to place it after the
realtime signals, or move the realtime signals, and there aren't any gaps
(unless you count _SIGRESERVE.  hmm.. but Linux has a SIGRESERVE too,
maybe that will get used officially one day.)

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson
