Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA14029
	for <parisc-linux@puffin.external.hp.com>; Tue, 9 May 2000 10:37:33 -0600
Received: (from prumpf@localhost)
	by puffin.external.hp.com (8.9.3/8.9.3) id KAA14024
	for parisc-linux@thepuffingroup.com; Tue, 9 May 2000 10:37:07 -0600
Message-ID: <20000509103707.A13782@puffin.external.hp.com>
Date: Tue, 9 May 2000 10:37:07 -0600
From: Philipp Rumpf <prumpf@puffin.external.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Tree Issues
List-ID: <linux-parisc.vger.kernel.org>

Hi,
I just returned from spending a month in California working on stuff
not related to PA-RISC (and a week here trying to get back into
normal life).  If you sent me any email I didn't answer, you should
probably resend it now (if you still care about an answer, that is).

For various reasons, most of which I do not want to discuss in public,
I have decided not to continue merging my kernel changes with the
tree maintained by The Puffin Group / Linuxcare.

I am extremely grateful for TPG's help so far;  their co-operation
with HP in selecting the documentation to be published and making it
actually happen is what made this project possible.

I am quite unhappy with the code that currently is in the tree;  most
of it is unreviewed, and too much of it is in a state now where I
think it is easier to rewrite it from scratch than to maintain it
long-term.  This is not about individuals' contributions;  no-one can
be blamed for submitting working code and relying on the tree
maintainer to make sure some standards of quality and consistency are
met.

Any contributor that should decide (s)he wants to submit their work
to me directly is welcome to do so.  (But please realize that while
I will look at the changes in the TPG tree, I don't know whether TPG
will do the same with my tree).

I am going to try to set up a sourceforge.net project to keep my
modifications publicly-visible now;  while I'm not perfectly happy
with announcing anything before people can actually look at my code,
I couldn't think of any better way to do it.

To everyone whom I am not going to work with in the future, it has
been a lot of fun to do so, even though I believe I'm going to have
more fun with what I am going to do now.

Please feel free to send me any questions or comments either
personally (prumpf@tux.org is my preferred long-term address) or on
this list.

I am going to send a link to more details of the technical / code
changes after I actually put something about it together.

I do not think this fork has to be a permanent one, though I can't
help thinking it is likely to be;  I will be happy to talk to the
TPG/LC tree maintainers once I have a tree which I am happier with
than I am with the current cvs tree.

My apologies to Matthew for sending this right after he returned from
vacation.

	Philipp Rumpf

[There seems to be a common misunderstandment that I am still working
for SuSE GmbH.  I'm not, and I haven't for 6 months;  I'm currently
living on student loan and am not employed by any company]
