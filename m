Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA10995
	for <parisc-linux@puffin.external.hp.com>; Thu, 13 Jan 2000 09:43:17 -0700
Received: from endor.fc.hp.com (endor.fc.hp.com [15.1.49.59])
	by palrel3.hp.com (Postfix) with ESMTP id CD6F119FA
	for <parisc-linux@thepuffingroup.com>; Thu, 13 Jan 2000 07:43:40 -0800 (PST)
To: parisc-linux@thepuffingroup.com
In-reply-to: Your message of "Wed, 12 Jan 2000 20:48:58 EST."
             <387D2F0A.F41A4129@thepuffingroup.com>
Date: Thu, 13 Jan 2000 08:43:40 -0700
From: Paul Bame <bame@endor.fc.hp.com>
Message-Id: <E128mPU-0000c6-00@endor.fc.hp.com>
Subject: [parisc-linux] 2.3 whining
List-ID: <linux-parisc.vger.kernel.org>


A lot of code cleanup occurred and several defects were fixed in 2.2
since the beginning of December.  Much of this effort (my effort is
why I'm upset, and some good efforts by John David Angelin too) is now
gone.  The dirty code and defects, which *were* fixed, are now holding
us all back in 2.3!  Things could've been done better.

When the 2.3 CVS tree was started, it would've been better to copy the
RCS files (and tag the 2.2 ones) instead of checking in a newly-numbered
revision with no past
history attached.  Because of the way it was done, it's unnecessarily
difficult to tell which 2.2 file version was used to begin the
2.3 port (because all the versions are 1.1 again), and thus
difficult to figure out which changes need to be re-merged.  Also the
comments from the previous authors have been lost in the 2.3 tree.

In going to 2.3 the realmode embedded executable stuff I designed has
been obliterated.  I don't know how this was decided but I was not part
of the decision.  Even though it might be the right long-term answer,
consequently we now have fragile real-mode C code as we had before, so it
is not a simple matter to re-merge the 2.2 fixes into 2.3
because you're working against the compiler and some other structural
differences, leaving us with a nice mess.  (jsm thought up a nice
way to avoid my realmode hack, but I have no incentive to
start coding that to see it disappear too).

If my hacking is unhelpful to palinux, I would prefer knowing
that *before* making changes rather than finding out *after*
doing a bunch of work and watching it disappear.

I'm owed an explanation of why the realmode embedded executable
was wrong for the project and is now gone.
And an explanation of why the defects and improvements
I (and JDA) contributed were wrong for the project too.  I'm willing
to learn.

        -P
