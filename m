Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 01CF64829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 21 Oct 2002 11:36:30 -0600 (MDT)
Message-Id: <200210211718.g9LHIeGF016893@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: GSP on A500 - Level 14 Alert - Output overvoltage?
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Date: Mon, 21 Oct 2002 13:18:40 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: grundler@dsl2.external.hp.com,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <20021021170455.GA4751@systemhalted> from "Carlos O'Donell" at Oct 21, 2002 01:04:55 pm
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

> I had assumed that the issue dealt with the internal switching
> supply doing the damage.

Yes, the message indicated that the problem was with a DC supply
voltage.  If it's internal, this could damage the circuits in the
system.  CPU chips normally have very tight voltage requirements
for proper operation.  I would check the manual to see what is
recommended when this error occurs.  You measure the voltages
on an unused drive connector, etc.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
