From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: 2.6.36 regression : swap support broken
Date: Mon, 13 Dec 2010 08:06:45 -0500 (EST)
Message-ID: <20101213130646.14CD44E2A@hiauly1.hia.nrc.ca>
References: <AANLkTi=5zJeqGSp7QpscVN6k8D-d2NhknzGJmxd8mWcZ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, gmsoft@tuxicoman.be,
	linux-parisc@vger.kernel.org, eike-kernel@sf-tec.de
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=5zJeqGSp7QpscVN6k8D-d2NhknzGJmxd8mWcZ@mail.gmail.com> from "Carlos O'Donell" at Dec 13, 2010 07:52:02 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> >> I think the way to avoid this in the kernel is to stick a "nop" in
> >> the memory barrier. =A0That will avoid a zero length asm and branching
> >> into the delay slot.

This adds about 17000 odd nops ;(

> > A further reason is GCC does not know the length of asm insns. =A0So,
> > using a zero length asm on parisc is asking for trouble.
> 
> The problem is that many applications (including glibc IIRC) expect a
> zero length asm volatile to work correctly. Althought it's asking for
> trouble, I think it's one of these expected things that just has to
> work :-)

Most targets don't have to deal with delay branch sequences and the
fact that the hardware can't deal with a branch to the delay slot.

As I have learned this morning, the length calculated for asms is just
an estimate.  It can be confused by comments, etc.  So, gcc is going to
have to add a nop when it finds an asm after a branch because the size
estimate is unreliable.

I had tried to fix this before but missed the asm_operands case.  The
branch type selection (useskip) also needs to check for asms ;(

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
