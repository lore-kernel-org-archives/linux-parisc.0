Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id AAA22016
	for <parisc-linux@puffin.external.hp.com>; Thu, 18 Nov 1999 00:58:33 -0700
Sender: phi@hpfrcu81.france.hp.com
Message-ID: <3833B29E.5793D0E6@hpfrcu03.france.hp.com>
Date: Thu, 18 Nov 1999 09:02:38 +0100
From: Philippe Benard <phi@hpfrcu03.france.hp.com>
MIME-Version: 1.0
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: frowand@cup.hp.com, Philipp.H.Rumpf@mathe.stud.uni-erlangen.de,
        sieler@allegro.com, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] depi?
References: <199911180533.AAA01349@hiauly1.hia.nrc.ca>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

John David Anglin wrote:
> 
> I think what is being suggested is to run with the space registers all
> zero and swap the TLB contents on context switches in order to changing
> the mapping from virtual to physical.  However, I doubt this is efficient.

This is what I undesrtand now too, at first I though it was flat 4Gb shared
between the OS and the processes (ala 2Gb each), then space flip enter in
action with flat 4Gb per threads (pardon proceses for now), and then a flat
4Gb for the kernel itself.

I don't really see the implementation of a previous mail of someone saying the
user VAS quad usage would be TEXT/DATA/SHARED1/SHARE2 if all the SR's are the
same, I still have some ProtID problem I don't see how efficiently sharing is
implemented (TEXT/SHARED1/SHARED2). I bet this is adressed, I just don't have
the design document.

And more than that, context switching is a pain on all machine, register
save/restore, priv promot, etc... cost a lot, I don't see a global TLB purge
on context switch as a booster (again assuming it is what happen)

And my last point with no proof.
1) If now processes and the OS have a flat 4Gb in front of them, then the OS
can be located anywhere (beside some things like 0 for NULL deref traping) i.e
any quad

2) If a concept like equivalently map exist, it may or may not provide a gain.
This is a degree of liberty.

3) Choosing to locate the kernel text in second, third or fourth quad prevent
using of equiv mem. remove 1 degre of liberty.

4) For now it is claimed that equiv mem address non-existing problem (sic),
then is useless, then not considered, then any quad could be choosen and the
one choosen is the one that remove the equiv map potential, actually since
there are 4 quad and the quad came from a red hat, we got 3 chances over 4 to
get one that will remove us 1 degree of liberty.

My feeling is since equiv map doesn't seems to be needed in this
implementation, and since it was written that any quad could have been
choosen, I would have choosen the one that still allow me to have quiv mem
should a boo boo happen and made it necessary, in other words I like to keep
my degree of liberty even if I'm not using it (for now).

------------------------------------------

Designing a ASL (addr space layout) implementation onto an architecture
(specially this one) is something tough, and not uniq. For instance designing
the ASL for 64bit wide for HP-UX (with the constraint of being able to run
narrow process un-recompiled) was pretty interesting and did provide several
options. 

I admit I didn't browse the web that much but will accept any pointer, for now
I desesperatly looking at the puffin/doc page and see nothing but pure HP doc,
no linux design options. What I'd like is a document that gives the design
orientation, all this discovery about space usage is pure guessing from mail
to mail, boucing from 1 flat 4Gb for all to 4Gb per process/kernel.

Some may say, linux is not doc, it is hack n run, but on the long run I'm
affraid that hack n run will type more text (try and fail code) than writing
the design options. For instance the ASL document for HP-UX wide is 22 pages
total, with TOC and figures, and pseudo-code algorithm.
Remember Djikstra (well the old timer may, the bambinos may take Kurt Cobain
as an example :-) "You should pay the programmers a very good salary, don't
hesitate to bump their salary, BUT make them pay any puch in their punched
card" The idea behind, think before code after, Kurt tried it the other way,
he choose to shoot first and think after oops :-)

Actually I did find a book on linux internals (some years ago) that did speak
a bit about VAS, but the arch indep part speak a lot about design option based
on x86 and MMU) which definilty doesn't apply here then not so indep...


Phi
