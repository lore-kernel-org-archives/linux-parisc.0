Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id IAA22917
	for <parisc-linux@puffin.external.hp.com>; Thu, 16 Dec 1999 08:58:59 -0700
Received: from xboibrg2.boi.hp.com (xboibrg2.boi.hp.com [15.56.8.172])
	by atlrel2.hp.com (Postfix) with ESMTP id DB939530
	for <parisc-linux@thepuffingroup.com>; Thu, 16 Dec 1999 11:01:15 -0500 (EST)
Message-ID: <56D553C0B61BD311AD2300A0C9F485C202E9D88F@xfc02.fc.hp.com>
From: "FINK,MARTIN \(HP-FtCollins,ex1\)" <martin_fink@hp.com>
To: parisc-linux@thepuffingroup.com
Subject: RE: [parisc-linux] Puffin sells out!
Date: Thu, 16 Dec 1999 09:01:13 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

Some good questions here.  Let's see if I can address some of this....

> Regarding checking in code, that is a good idea.  Jeff Law at Cygnus
> controls the gcc development with an iron hand, trying to 
> ensure that each
> modification is justified and the side effects are understood.  Quite
> a few patches and small fixes haven't made it into the linux 
> CVS because
> no one has this responsibility.  Somebody needs to be in 
> charge.  Cygnus
> uses separate lists for bug discussion, patches, etc.  Paul Bame has
> helped getting some of my stuff in.
> 

I expect that Alex and the Puffin Group to do the source management
and make sure the submissions are sane.  As part of HP's contribution
to the effort, we supply systems and provide administrative assistance 
for the systems used for source management.  At one point, there will be
a merge back to the main kernel tree.  I'm not sure how the "arch"
PA specific stuff will be maintain after that.  Paul works for one
of my managers.

> The community understands that HP has been funding and supporting the
> port.  The big question is the level of support enough?  How important
> is linux to HP's future?  At least two years ago, SGI decided IRIX was
> dying and agressively started to support linux development for their
> machines.  Red Hat currently has a market capitalization on the order
> of $16 billion.  Linuxcare just had a major capital infusion 
> from Dell,
> Sun, Motorola and Oracle.  I can't predict the future but it 
> sure looks
> like the landscape is changing fast.  You know what HP is spending, so
> how does it compare?  Is it enough to ensure that HP remains a player?

I think we have to be careful here, because there are some key 
differences.  There is no question in my mind that Linux is very
important to HP.  However, where SGI made the decision to eventually
replace IRIX with Linux, HP still has full intent to aggressively
support, enhance, and continue development of HP-UX.  HP-UX is still
the #1 UNIX out there and HP is very committed to that customer base.
However, we have customers and potential customers that would like
to see support of Linux from HP.  To that end, HP is investing in
a large number of areas.  That includes Linux on PA, Linux on IA-32,
Linux on IA-64, etc. etc.  Also, don't forget that we have printers
and networking devices and other businesses also investing in Linux.
HP made some very substantial contributions to the Linux/IA-64 port
to get it where it is today.  So, will HP be a major Linux player? -
Absolutely!  If you have any doubt that HP can flex its $42Billion
muscle against Sun, IBM and DELL - just watch!

> 
> Alan Cox correctly stated the concerns of the external community.
> How it is managed is very important.  If the community feels Linuxcare
> is using the community to further its own ends, they won't be 
> happy about
> contributing.  This is what I trying to convey when I originally wrote
> "Puffin sells out!".  The balance with HP isn't particular 
> important as
> long as the external community can contribute as peers.  My 
> sense is the
> external community loves challenge and will endeavour to find the best
> solution possible.  On the otherhand, it is not well 
> organized and there
> are all levels of expertise.
> 
> I like contributing because it is fun and challenging.

All I can say at this point is that, that's what we're trying
to do.  If I took over 90% of the Linux/PA development, it would
be tough for the community to be contributing as peers.  So,
when someone thinks there's a problem - speak up - I am
listening.

> 
> The spare time comment concerns me and again reflects on HP's 
> commitment.
> On the otherhand, the pace of providing documentation probably hasn't
> significantly impacted the pace of code development.  I would guess
> that documentation on graphics adapters will be needed in the 
> near future.
> None of this seems to be available.

Let me clarify.  The real job of the hardware engineers who own most 
of the docs is to do more hardware.  The docs they write are normally
done for internal use and internal partners.  They may reference
information that is proprietary, trade secret, or licensed from other
companies we have as partners.  Their job is not to do Linux, or 
HP-UX, or NT, or any other OS.  But, most of them are really excited
about the work we're doing and giving time from their day and night
jobs to make sure we're successful.  So, not only do you have an HP
commitment with hard dollars behind it, you have the emotional
commitment of engineers at HP (which may in fact be more valuable :)).
The graphics side is also something we're managing and pulling docs
for.  Most of the requests we've received are for our very old
workstations and we have to go and dig-out the docs and find someone
who still remembers the stuff :).  We'll probably be careful with
the brand new stuff.  HP has leadership graphics that no one else
can touch right now.  How we do that is still covered by patent,
copyright and trade secret.  We are working on a number of 
different alternatives to get the community what they need without
giving away the goose.  Again, if you have a specific need, speak
up - we'll get you what we can.

> 
> If you have time while you're in town, give me a call.  Maybe we can
> go for a beer or such.  Possibly, some of the Linuxcare 
> Puffins would like
> to go as well.
> 

Probably not this go-around.  When I'm in town meeting with Alex on
official business, we can probably arrange that.

> Dave
> -- 
> J. David Anglin                                  dave.anglin@nrc.ca
> National Research Council of Canada              (613) 
> 990-0752 (FAX: 952-6605)
> 

+=====================================================================+
| Martin Fink                 | E-mail: mailto:martin_fink@hp.com     |
| UNIX Development Lab        | Phone:  970-898-7076                  |
| Hewlett-Packard Co.         | FAX:    970-898-2838                  |
| 3404 East Harmony Road      | ===================================== |
| Ft. Collins, CO, USA, 80528 | Web:    http://www.hp.com/            |
+=====================================================================+    
