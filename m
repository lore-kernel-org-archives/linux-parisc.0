Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 43585482B
	for <parisc-linux@parisc-linux.org>; Tue, 30 Jul 2002 13:53:19 -0600 (MDT)
Message-Id: <200207301953.g6UJrDrs020716@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] GCC CVS strange update?
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Date: Tue, 30 Jul 2002 15:53:12 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@parisc-linux.org
In-Reply-To: <20020730192041.GD6502@systemhalted> from "Carlos O'Donell" at Jul 30, 2002 03:20:41 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> dwarf2 exception support isn't in 3.2 for hppa?
> I'm confused, I believed that dwarf2 exception support wasn't
> goin to be in 3.1, but surely in 3.2? 

It's not a typo.  What was 3.2 is now 3.3.  As was noted, 3.2
is going to be identical to 3.1.1 except for a c++ abi change.
3.2 should be out this week barring unforeseen problems.  The
3.1 branch has only been open for regression fixing for some
time now.

3.3 is scheduled to go into stage3 (bug fixing) on Aug. 15.
The 3.3 release is scheduled for Dec. 15.  The numbering change
hasn't affected the schedule for the next release from the
mainline.

Clear?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
