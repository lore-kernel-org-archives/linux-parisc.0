Return-Path: <epotter@eep.burdell.org>
Received: from keymaster (dsl027-162-176.atl1.dsl.speakeasy.net
	[216.27.162.176])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6B2C94855
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 14 Feb 2004 20:07:24 -0700 (MST)
Received: from keymaster (localhost [127.0.0.1])
	by keymaster (8.12.9/8.12.9) with ESMTP id i1F32viD012926
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 14 Feb 2004 22:02:57 -0500 (EST)
Received: from localhost (epotter@localhost)
	by keymaster (8.12.9/8.12.9/Submit) with ESMTP id i1F32vuY012923
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 14 Feb 2004 22:02:57 -0500 (EST)
Date: Sat, 14 Feb 2004 22:02:57 -0500 (EST)
From: Elliott Potter <epotter@eep.burdell.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.GSO.4.44.0402142137500.12861-100000@keymaster>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] C3000 video options
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hello all,

I just got my fancy new Visualize C3000 workstation and am busily
installing linux on it.  Whee!  So far, things have gone smoothly but I
I've come across the issue that the computer has an fx4 graphics card,
which is apparently unsupported.  I stared at list archives for a while
and found that the A4977A Visualize EG card is supported, and I'm
working on picking up one of those.  But it seems a shame to take this
nice 64-bit PCI generally kick-butt card out and stuff in an entry-level
32-bit PCI card with 8-bit color depth.  Are there other options?  So
far I've seen:

1) At some point, hp released the fx5 and fx10 graphics adapters, which
replaced the fx4 and fx6 cards, and said that they would be supported
under Linux.  But they accomplished that by releasing a binary form of
its proprietary X server, which is no longer supported.  The Customer
Advisory:
http://wwss1pro.compaq.com/support/reference_library/viewdocument.asp?source=WV031007_CW01.xml&dt=3
suggests that "customers can purchase current graphics adapters that are
more powerful than hp fx5 or fx10 graphics adapters for a fraction of
the original cost."  But they don't say (for example) what graphics
adapters, or if they have linux support.  Did they come out with
something?

2) Someone posted on the list that you could get a PCI Nvidia Voodoo2
card and maybe it would work, but when he tried it he got nothing except
corrupted nvram.  That doesn't sound very promising, but I thought I'd
ask.

3) There are other PCI graphics cards (even 64-bit PCI) out there that
work on other *nix systems (AS/*****, SUN, etc.); is everyone's (or just
HP's) firmware so different that one has to get a graphics card just for
the HP?



TIA,
--
Elliott
