Return-Path: <rkeene@rkeene.org>
Received: from mail.oc9.org (unknown [209.224.199.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7EF4A484A
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 20 Apr 2004 06:48:47 -0600 (MDT)
Date: Tue, 20 Apr 2004 07:48:12 -0500 (CDT)
From: Roy Keene <rkeene@rkeene.org>
To: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] Kernel 2.4 bug (fwd)
In-Reply-To: <20040420114128.GE18329@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.LNX.4.58.0404200746120.11253@hammer.oc9.org>
References: <Pine.LNX.4.58.0404200039410.31608@hammer.oc9.org>
	<20040420114128.GE18329@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

http://parisc-linux.org/   -> "Bug Reporting" (http://bugs.parisc-linux.org/Reporting.html)

How to report a bug in PA-RISC Linux

Send mail to submit@bugs.parisc-linux.org, as described below.

Please don't report several unrelated bugs - especially ones in different
packages - in one message. Also, please don't mail your bug report to any
mailing lists or recipients other than submit@bugs.parisc-linux.org (for
details of how to do this right, see below).



If these are informational only messages they may not be what's causing
the crashes, but they're all I see before the crash occurs (immediately
before)

On Tue, 20 Apr 2004, Matthew Wilcox wrote:

> On Tue, Apr 20, 2004 at 12:41:23AM -0500, Roy Keene wrote:
> > Btw, `submit@bugs.parisc-linux.org' doesn't work.
>
> Where do you see that email address still?  It should have been removed ...
>
> > (double free() shouldn't cause the kernel to give page faults, running it
> >  enough times eventually crashes the kernel)
>
> What you see there is debug information to help you diagnose your app's
> breakage ;-).  You can turn it off by changing #define PRINT_USER_FAULTS
> to #undef PRINT_USER_FAULTS in arch/parisc/mm/fault.c.  I believe the
> Debian kernel does this by default.
>
> Eventually crashinig the kernel is a different matter.  Can you provide
> more information about this?
>
> --
> "Next the statesmen will invent cheap lies, putting the blame upon
> the nation that is attacked, and every man will be glad of those
> conscience-soothing falsities, and will diligently study them, and refuse
> to examine any refutations of them; and thus he will by and by convince
> himself that the war is just, and will thank God for the better sleep
> he enjoys after this process of grotesque self-deception." -- Mark Twain
>
