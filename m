Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 64DD34838
	for <parisc-linux@parisc-linux.org>; Tue, 18 Mar 2003 08:26:51 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 18vIzK-0007Ys-65; Tue, 18 Mar 2003 15:26:50 +0000
Date: Tue, 18 Mar 2003 15:26:50 +0000
From: Matthew Wilcox <willy@debian.org>
To: Thibaut VARENE <varenet@esiee.fr>
Cc: Matthew Wilcox <willy@debian.org>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] CVSy stuff
Message-ID: <20030318152650.GI14520@parcelfarce.linux.theplanet.co.uk>
References: <20030318143337.GF14520@parcelfarce.linux.theplanet.co.uk> <CAA37AAB-5953-11D7-8A4F-0030656F07A2@esiee.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <CAA37AAB-5953-11D7-8A4F-0030656F07A2@esiee.fr>
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

On Tue, Mar 18, 2003 at 04:10:44PM +0100, Thibaut VARENE wrote:
> Le mardi, 18 mar 2003, à 15:33 Europe/Paris, Matthew Wilcox a écrit :
> >1. -> linus
> >1.1 -> LINUS_260
> >1.2 -> LINUS_261
> >1.2.1 -> parisc_261
> >1.2.1.1 -> CVS261_PA1
> >1.2.1.2 -> CVS261_PA2
> >...
> >1.3 -> LINUS_262
> >1.3.1 -> parisc_262
> >1.3.1.1 -> CVS262_PA1
> 
> Well, as a matter of fact, it sucks.
> 
> Now, we have several alternatives:
> * Use BK.

Sorry, I don't think we have the bandwidth to deal with the ensuing
flame-war on parisc-linux ;-)

> * Upgrade DSL2 to an arse-kicking Quad-P4Xeon 3 point oh fuckin' six 
> sweet gigahertz.
> You won't see anymore lag.

Heh.

> More seriously, I'm no CVS/SCM guru either, and I think that scheme 
> *could* work,
> assuming we slap ourselves with some tyrannosaurus' tails to get used 
> to these CVS
> habits.
> 
> My own concern is that I don't really see the need for a 4th depth 
> level. Stop at
> 'parisc' branch and work on it seems fairly enough to me, i mean, do we 
> really want
> to be able to retrieve any '-paXX' subversion, which are usually more 
> or less about
> changing a dozen of lines in a couple of files in the worse case ?

Ah, grasshopper.  This is just your lack of CVS knowledge ;-)

To quote from the CVS info docs:

Branches and revisions
======================

   Ordinarily, a file's revision history is a linear series of
increments (*note Revision numbers::):
            ! 1.1 !----! 1.2 !----! 1.3 !----! 1.4 !----! 1.5 !
   Each branch has a "branch number", consisting of an odd number of
period-separated decimal integers.  The branch number is created by
appending an integer to the revision number where the corresponding
branch forked off.  Having branch numbers allows more than one branch
to be forked off from a certain revision.

   All revisions on a branch have revision numbers formed by appending
an ordinal number to the branch number.  The following figure
illustrates branching with an example.

                                                           +-------------+
                                Branch 1.2.2.3.2 ->        ! 1.2.2.3.2.1 !
                                                         / +-------------+
                                                        /
                                                       /
                      +---------+    +---------+    +---------+
     Branch 1.2.2 -> _! 1.2.2.1 !----! 1.2.2.2 !----! 1.2.2.3 !
                    / +---------+    +---------+    +---------+
                   /
                  /
     +-----+    +-----+    +-----+    +-----+    +-----+
     ! 1.1 !----! 1.2 !----! 1.3 !----! 1.4 !----! 1.5 !  <- The main trunk
     +-----+    +-----+    +-----+    +-----+    +-----+
                     !
                     !
                     !   +---------+    +---------+    +---------+
     Branch 1.2.4 -> +---! 1.2.4.1 !----! 1.2.4.2 !----! 1.2.4.3 !
                         +---------+    +---------+    +---------+

   The exact details of how the branch number is constructed is not
something you normally need to be concerned about, but here is how it
works: When CVS creates a branch number it picks the first unused even
integer, starting with 2.  So when you want to create a branch from
revision 6.4 it will be numbered 6.4.2.  All branch numbers ending in a
zero (such as 6.4.0) are used internally by CVS (*note Magic branch
numbers::).  The branch 1.1.1 has a special meaning.  *Note Tracking
sources::.

... rereading that myself, I realise I made a mistake in my original
exposition.  It should have been:

1. -> linus
1.1 -> LINUS_260
1.2 -> LINUS_261
1.2.2 -> parisc_261
1.2.2.1 -> CVS261_PA1
1.2.2.2 -> CVS261_PA2
...
1.3 -> LINUS_262
1.3.2 -> parisc_262
1.3.2.1 -> CVS262_PA1

One other convention which I believe mang borrowed from mozilla is
the practice of denoting branch tags in lower case and normal tags in
upper case.  I have preserved that here.

> I also confess my lack of CVS knowledge, but I like the way gcc/gdb and 
> other gnu
> projects manage their CVS; that is having their trunk on HEAD, and 

Hold it right there, buddy.  After reading the documentation a few months
ago, Paul and I decided that HEAD was the work of the devil, never
made any sense and nobody was allowed to even say the word any more.
90% of the time people say HEAD, they mean trunk.  What HEAD _actually_
does is take the latest revision of a file on _any_ branch.  Not a smart
idea when you have multiple independent branches.

> branches
> corresponding to releases. I guess this is related to that 
> heavily-sucking-vendor-
> branches-stuff-willy-hates, and I'm not even certain we could do the 
> same on a kernel
> development tree, so I won't ask more. Just wanted to express my view :)

Vendor branches are the aforementioned 1.1.1 branch.  Again, let me quote
from the manual:

   If you modify a program to better fit your site, you probably want
to include your modifications when the next release of the program
arrives.  CVS can help you with this task.

   In the terminology used in CVS, the supplier of the program is
called a "vendor".  The unmodified distribution from the vendor is
checked in on its own branch, the "vendor branch".  CVS reserves branch
1.1.1 for this use.


In fact, the vendor branch is far too magic for us.  It has the bizarre
property that any new files you commit to it will appear on the trunk
without being merged to the trunk.  So we Don't Use Vendor Branches
because it doesn't let us control what's going on properly.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
