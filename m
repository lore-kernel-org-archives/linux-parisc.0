Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id RAA24516
	for <parisc-linux@puffin.external.hp.com>; Fri, 22 Oct 1999 17:41:23 -0600
Date: Sat, 23 Oct 1999 01:42:17 +0200
From: Philipp Rumpf <prumpf@suse.de>
To: frowand@cup.hp.com
Cc: parisc-linux@thepuffingroup.com, Paul Bame <bame@debian.fc.hp.com>
Subject: Re: [parisc-linux] Boot messages from C3000 console
Message-ID: <19991023014216.C22908@suse.de>
References: <Pine.LNX.4.10.9910212221480.18206-100000@vodka.thepuffingroup.com> <99102217512801.00256@P100> <38109F94.7DA3551A@hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <38109F94.7DA3551A@hp.com>; from Frank Rowand on Fri, Oct 22, 1999 at 10:32:04AM -0700
List-ID: <linux-parisc.vger.kernel.org>

> one line comment would have made it obvious that the code was calling
> PDC_BLOCK_TLB().  For me, just annoying - for someone who might be missing one

I agree that adding "using PDC_BLOCK_TLB" to the "setup the BTLB" comment might
have been a good idea.

> understand some trivial code.  I want to encourage people to make the code
> easily readable so I don't have to waste a lot of time when my help is requested
> to debug or contribute code.
>
> saying that the sequence that I had to read in head.S to figure out the
> cause of the HPMC on the C3000 needed at least a comment to make it readable

I somehow get the impression what you are suggesting is the author of this
code (i.e. me) wrote this code, left for some weeks and you were forced to fix
this bug.  What I did was to leave for 38 hours.  

Of course it would be nice to have as little code as possible in the tree only
the author understands, and we don't have very much, but I don't think we'll
ever get rid of the last bits of "unreadable" code (in fact, there's enough of
that in the architecture-independent parts to spend a long and busy life
ranting about it).  You found some.

Now what you could have done is comment the code, change the code to use
#defines, yell at the author, yell at the author in public, or start a
discussion on how to avoid ever having any unreadable code in the kernel at
all.

You chose (possibly among other possibilities) to have a discussion.  I am
not sure which effect you intended it to have, but I am pretty sure the effect
it is going to have, if any, is to waste lots of time that otherwise would
have gone into development, both in the discussion itself and in enforcing
any rules that we "agree upon" (i.e. about which one side gets too tired to
argue about).

My impression is we'll save a lot of time by simply yelling at each other
about bad code as long as the number of developers and users is as low as it
currently is and most likely will be within the next 6 months.

	Philipp Rumpf
