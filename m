Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA11867
	for <parisc-linux@puffin.external.hp.com>; Thu, 13 Jan 2000 10:44:46 -0700
Date: Thu, 13 Jan 2000 11:43:13 -0500
From: Matthew Wilcox <willy@thepuffingroup.com>
To: Paul Bame <bame@endor.fc.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 2.3 whining
Message-ID: <20000113114313.J11300@thepuffingroup.com>
References: <387D2F0A.F41A4129@thepuffingroup.com> <E128mPU-0000c6-00@endor.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E128mPU-0000c6-00@endor.fc.hp.com>; from Paul Bame on Thu, Jan 13, 2000 at 08:43:40AM -0700
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Jan 13, 2000 at 08:43:40AM -0700, Paul Bame wrote:
> A lot of code cleanup occurred and several defects were fixed in 2.2
> since the beginning of December.  Much of this effort (my effort is
> why I'm upset, and some good efforts by John David Angelin too) is now
> gone.  The dirty code and defects, which *were* fixed, are now holding
> us all back in 2.3!  Things could've been done better.

It isn't gone.  It's all still there in the 2.2 tree.  All that needs to
be done is to move the fixes across to the 2.3 tree.  There are plenty of
examples of this sort of thing in regular Linux development.  Just ask
Alan; he's moved fixes from 2.0 to 2.2 and is right now moving fixes
to 2.3 from the 2.2 branch.  I appreciate it's not a simple process,
but it's a lot easier than tracking down all the bugs again by hand.
I attempted to reinsert some of your changes, but I really didn't
understand the code well enough to do it.

> When the 2.3 CVS tree was started, it would've been better to copy the
> RCS files (and tag the 2.2 ones) instead of checking in a newly-numbered
> revision with no past
> history attached.  Because of the way it was done, it's unnecessarily
> difficult to tell which 2.2 file version was used to begin the
> 2.3 port (because all the versions are 1.1 again), and thus
> difficult to figure out which changes need to be re-merged.  Also the
> comments from the previous authors have been lost in the 2.3 tree.

The trouble is that doing it the way you suggest was almost impossible.
The only realistic way to get the 2.3 stuff running was to  apply the
diff between 2.2.x and the parisc tree to Linus' 2.3 tree which is not
maintained in CVS.  As a result, yes, we lost the tags.  I did attempt
to explain to you that we can retrieve diffs between any given date that
you want; such as the start of December and now in the 2.2 tree.

Those $Log$ comments are a really bad idea, btw.  They grow too long
and contain too much irrelevant crap.  If you want to write a comment,
add it manually.

> And an explanation of why the defects and improvements
> I (and JDA) contributed were wrong for the project too.  I'm willing
> to learn.

They weren't wrong for the project, they just slipped into a crack.
If I understood this section of the kernel well enough, I would have
added them back before we opened the 2.3 tree.
