Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mwinf0203.wanadoo.fr (smtp5.wanadoo.fr [193.252.22.29])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4DF174829
	for <parisc-linux@parisc-linux.org>; Wed,  9 Apr 2003 11:23:22 -0600 (MDT)
From: pageexec@freemail.hu
To: grsecurity@grsecurity.net
Date: Wed, 09 Apr 2003 19:23:15 +0200
MIME-Version: 1.0
Subject: Re: [parisc-linux] parisc-linux.org kernel
Reply-To: pageexec@freemail.hu
Cc: <willy@debian.org>, <parisc-linux@parisc-linux.org>,
	<grundler@dsl2.external.hp.com>
Message-ID: <3E947323.14900.19F1E3AF@localhost>
In-reply-to: <52352.145.253.137.30.1049874876.squirrel@nikita.ath.cx>
References: <20030409054929.GB21306@dsl2.external.hp.com>
Content-type: text/plain; charset=US-ASCII
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

> okay, after getting all the people together on one "desk", now here is the
> essential question to Brad and his team:
> when will we have a 2.5.* Patch for grsecurity?

i can speak for the PaX part only, and the answer is that "i don't know".
personally, i'll be interested in porting PaX to 2.6 when it's actually
out and working stable (enough). but that's not the only limiting factor
in our case, the several big changes to the linux VM make it absolutely
not trivial to port PaX (huge page support, rmap, accounting, non-linear
mappings, UML, etc). if you really need a timeframe, i'd say maybe in 6
months (give or take a few) i'll look at the situation again.

> > To willy's credit, he's attempted to merge 2.4 parisc changes upstream
> > at least twice but was torpedo'd both times.
> 
> i don`t want to know ;-)

actually, i'd like to (feel free to answer off-list), since for all the
other archs grsec/PaX runs on we could compile a working kernel from the
vanilla tree - it just seems a mystery why parisc is an exception (not
blaming anyone, just would like to see it more clear).
