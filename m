Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 91A71483A
	for <parisc-linux@parisc-linux.org>; Tue, 18 Mar 2003 08:10:48 -0700 (MST)
Date: Tue, 18 Mar 2003 16:10:44 +0100
Subject: Re: [parisc-linux] CVSy stuff
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Mime-Version: 1.0 (Apple Message framework v551)
Cc: parisc-linux@parisc-linux.org
To: Matthew Wilcox <willy@debian.org>
From: Thibaut VARENE <varenet@esiee.fr>
In-Reply-To: <20030318143337.GF14520@parcelfarce.linux.theplanet.co.uk>
Message-Id: <CAA37AAB-5953-11D7-8A4F-0030656F07A2@esiee.fr>
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

Le mardi, 18 mar 2003, =E0 15:33 Europe/Paris, Matthew Wilcox a =E9crit =
:
>
> So how about this model...
>
> 1. -> linus
> 1.1 -> LINUS_260
> 1.2 -> LINUS_261
> 1.2.1 -> parisc_261
> 1.2.1.1 -> CVS261_PA1
> 1.2.1.2 -> CVS261_PA2
> ...
> 1.3 -> LINUS_262
> 1.3.1 -> parisc_262
> 1.3.1.1 -> CVS262_PA1
>
> OK, this model clearly fits CVS' needs much better.  How about ours?
> Well, it sucks that you're always developing on a branch.  It sucks =
for
> people who're used to doing 'cvs up -A' to get to the trunk, because
> they now get Linus instead of us.  It also sucks that you stay on
> parisc_261 when you type "cvs up", so you have to explictly say "cvs
> up -rparisc_262".
>
> However, it doesn't have the suckitude of vendor branches, and it=20
> allows
> us to reasonably use cvs diff -rlinus.  Choose your suck.

Well, as a matter of fact, it sucks.

Now, we have several alternatives:
* Use BK.
* Upgrade DSL2 to an arse-kicking Quad-P4Xeon 3 point oh fuckin' six=20
sweet gigahertz.
You won't see anymore lag.

More seriously, I'm no CVS/SCM guru either, and I think that scheme=20
*could* work,
assuming we slap ourselves with some tyrannosaurus' tails to get used=20
to these CVS
habits.

My own concern is that I don't really see the need for a 4th depth=20
level. Stop at
'parisc' branch and work on it seems fairly enough to me, i mean, do we=20=

really want
to be able to retrieve any '-paXX' subversion, which are usually more=20
or less about
changing a dozen of lines in a couple of files in the worse case ?

I'd apply that well known sentence taken from Linux' Coding Styles:
"if you need more than 3 levels of indentation, you're screwed anyway,=20=

and should fix
your program."
I'd say the same goes for CVS branches depth.

I also confess my lack of CVS knowledge, but I like the way gcc/gdb and=20=

other gnu
projects manage their CVS; that is having their trunk on HEAD, and=20
branches
corresponding to releases. I guess this is related to that=20
heavily-sucking-vendor-
branches-stuff-willy-hates, and I'm not even certain we could do the=20
same on a kernel
development tree, so I won't ask more. Just wanted to express my view :)

HTH,


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/=
