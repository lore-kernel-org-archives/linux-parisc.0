Return-Path: <dave@hiauly1.hia.nrc.ca>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2876A482C
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 28 Mar 2004 16:00:10 -0700 (MST)
Message-Id: <200403282300.i2SN08Lr010402@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] spinlock align code triggering bug in gcc?
To: randolph@tausq.org
Date: Sun, 28 Mar 2004 18:00:08 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <20040328233235.GL750@tausq.org> from "Randolph Chung" at Mar 28,
	2004 03:32:35 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> > > {standard input}:3701: Error: Field not properly aligned [8] (-183).
> > > {standard input}:3701: Error: Invalid operands
> > 
> > Take a look at the assembler output for the above line.
> 
> i did, it's a "ldd -183(%r3), %rN" (i don't remember the target register
> right now)

It's the "183" that's the problem.  Can you see where that is coming from?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
