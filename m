Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA16696
	for <parisc-linux@puffin.external.hp.com>; Tue, 9 May 2000 17:44:30 -0600
Received: from l3107mxr.atl.hp.com (l3107mxr.atl.hp.com [15.19.254.19])
	by cosrel2.hp.com (Postfix) with ESMTP id 4076C194
	for <parisc-linux@thepuffingroup.com>; Tue,  9 May 2000 10:13:48 -0600 (MDT)
Received: from endor.fc.hp.com (endor.fc.hp.com [15.1.49.59])
	by l3107mxr.atl.hp.com (Postfix) with ESMTP id 268B44FDF2
	for <parisc-linux@thepuffingroup.com>; Tue,  9 May 2000 12:13:58 -0400 (EDT)
To: Philipp Rumpf <prumpf@puffin.external.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Tree Issues 
In-reply-to: Your message of "Tue, 09 May 2000 10:37:07 MDT."
             <20000509103707.A13782@puffin.external.hp.com>
Date: Tue, 09 May 2000 10:00:40 -0600
From: Paul Bame <bame@endor.fc.hp.com>
Message-Id: <E12pCR6-0000sW-00@endor.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

= For various reasons, most of which I do not want to discuss in public,

I suspect the reasons you are not discussing may be the most
important ones since the ones you mention here seem resolvable.

= I am quite unhappy with the code that currently is in the tree;  most
= of it is unreviewed,

Indeed we're *all* guilty of checking in a few bad hacks "just to make it
work".

= and too much of it is in a state now where I
= think it is easier to rewrite it from scratch than to maintain it
= long-term.

This is a common point on many projects.  Especially when people learn
as they code, they make unwise decisions especially in the beginning,
which are best re-written at some point.

My hope was that we'd charge ahead to a working user land and tool
chain and then after enabling userland work to proceed, we'd go back
to clean up the kernel simultaneously with supporting 64 bit where
we'd get the chance to "do it right".

Do you feel a re-write is a faster way of enabling user-land
development to go forward than adding a few more hacks to our
existing hacks?

= This is not about individuals' contributions;  no-one can
= be blamed for submitting working code and relying on the tree
= maintainer to make sure some standards of quality and consistency are
= met.

Nobody is acting as this type of tree maintainer, and I for one would
welcome someone to review my checked-in code and let's me know what's
stupid about it.  The tree maintainer could even maintain a CVS tag
which designates the "maintainer's version" of the code.

= I am going to try to set up a sourceforge.net project to keep my
= modifications publicly-visible now;  while I'm not perfectly happy
= with announcing anything before people can actually look at my code,
= I couldn't think of any better way to do it.

I am willing to set up linux-2.3-prumpf on puffin.external.hp.com.
There's sufficient space to host another linux tree.

= To everyone whom I am not going to work with in the future, it has
= been a lot of fun to do so, even though I believe I'm going to have
= more fun with what I am going to do now.

I'll be interested to see what you'll be doing now.  It sounds
like you'll be fulfilling a role we need for the TPG port.
I'm a little surprised you're going elsewhere to do it, rather than 
just starting to do it with the TPG crowd and seeing what happens.

Good luck, and thanks for all your help so far.

	-Paul Bame
