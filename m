Return-Path: <dave@hiauly1.hia.nrc.ca>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2B00448A9
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 25 Apr 2004 20:00:28 -0600 (MDT)
Message-Id: <200404260200.i3Q20KMx013937@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: [parisc-linux-cvs] 7300LC
To: tausq@debian.org
Date: Sun, 25 Apr 2004 22:00:20 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <20040426014111.GC3965@tausq.org> from "Randolph Chung" at Apr 25,
	2004 06:41:11 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: willy@debian.org, parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> willy, kyle found out that this doesn't work:
> 
> > > Split out 7300LC from 7100LC and PREFETCH from PA20.
> 
> extern inline void prefetchw(const void *addr)
> {
>         __asm__("ldd 0(%0), %%r0" : : "r" (addr));
> }
> 
> on pa11 gas won't assemble the ldd insn.

Right.  "ldd" requires pa20.

It looks like the 7300LC is PCX-L2.  I think this is PA 1.1e chip.
<http://www.openpa.net/cpu.html#xl2>.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
