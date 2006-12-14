From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] killing a set of user processes causes system
Date: Thu, 14 Dec 2006 14:14:28 -0500 (EST)
Message-ID: <200612141914.kBEJETU6021023__9832.32013318247$1416624232$gmane$org@hiauly1.hia.nrc.ca>
References: <119aab440612140929i3f5ea59dvb002b6fa525978ff@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440612140929i3f5ea59dvb002b6fa525978ff@mail.gmail.com>
	from "Carlos O'Donell" at Dec 14, 2006 12:29:26 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Yes. We talked about this before. You have to set up a serial console
> to your C3K, and issue a SYSRQ-T to show where the process is stuck in
> the kernel.

I know but that's a problem.  Can't capture enough info to graphics
console.  Don't have the right cable for a serial console, so I would
probably have to build it.  The machine's downtown and I haven't been
driving for the last two weeks.  Before that, Luxcom was sucking up
most of my time.

I've now using ethernet consoles for the servers but that's not an
option for the c3k.  Really, it would be great if it were possible
to do a SYSRQ-T over a standard ssh link.

The reason I haven't been driving is I had an eye operation two weeks
ago to correct a tear in my retina.  Not much warning, just an increase
in the number of floaters in the eye.  So, I booked an eye appointment.
The doctor saw the problem and referred me to another doctor in his
clinic who specializes in retina problems.  He looked at me and referred
me to a doctor at the General who specializes in surgery.  Went in the
same morning to the General and they did the first stage of the procedure
(laser welding + gas bubble to hold the retina in place and to dry out
fluid behind it).

Apparently, if the tear had got much larger, I would have had
to undergo major surgery.  There's no option since the tear would
have progressively got larger resulting in blindness in the eye.  This
problem apparently happens to about 1 in 10000 around 60.  So, far
the results of the surgery seem good but can't be certain until the
gas bubble disappears.

> FYI I've been running gcc builds on my c3k to reproduce this, but I
> haven't seen anything like this.

Java testsuite on head.  I think the binutils testsuite still has
problems when it is run when the machine is under load.

> Sorry to everyone who thinks I fell off the surface of the earth...
> it's true. I'm back on my thesis writing schedule, which means hours
> in the evenings are gone :(
> 
> I have a defense date in March! :)

Hey, spring graduation!  Good luck.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
