Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailout07.sul.t-online.com (mailout07.sul.t-online.com [194.25.134.83])
	by dsl2.external.hp.com (Postfix) with ESMTP id EE4A64829
	for <parisc-linux@parisc-linux.org>; Wed,  9 Apr 2003 01:54:27 -0600 (MDT)
Message-ID: <52352.145.253.137.30.1049874876.squirrel@nikita.ath.cx>
Date: Wed, 9 Apr 2003 09:54:36 +0200 (CEST)
Subject: Re: [parisc-linux] parisc-linux.org kernel
From: "Alexander Gabert" <pappy@nikita.ath.cx>
To: <grsecurity@grsecurity.net>
In-Reply-To: <20030409054929.GB21306@dsl2.external.hp.com>
References: <20030408165306.GA15433@nikita.ath.cx>
        <20030408165825.GB23430@parcelfarce.linux.theplanet.co.uk>
        <20030408170612.GA15497@nikita.ath.cx>
        <20030408170839.GC23430@parcelfarce.linux.theplanet.co.uk>
        <20030409054929.GB21306@dsl2.external.hp.com>
Cc: <willy@debian.org>, <parisc-linux@parisc-linux.org>,
	<grundler@dsl2.external.hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
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

hello from cold dark wet germany,


okay, after getting all the people together on one "desk", now here is the
essential question to Brad and his team:
when will we have a 2.5.* Patch for grsecurity?


background:
Alan Cox and Matthew Wilcox wouldn`t mind if someone tries to merge both
2.4.*.
but i don`t mind if it takes 2 months or more until we have a kernel.org
2.5 patch that
a) the grsec patch applies without hunks on unified 2.5 parisc source
b) parisc-linux.org is then mainstreamed in 2.5 and will discontinue
"split development"c) parisc-linux kernel _boots_ and _works_ and is _continued_ to be
developed in _MAINSTREAM_ not in parisc-linux.org CVS
i want that to happen anyway.  not just for grsec patches.
it is a sad joke that parisc-linux.org kernels are good and the kernel.org
parisc source is just a silly excuse for not having the parisc-linux.org
sources melt in.  sorry for that.
Grant Grundler said:
> On Tue, Apr 08, 2003 at 06:08:39PM +0100, Matthew Wilcox wrote:
>> bits and pieces are being merged from the parisc tree into marcelo's
>> tree, but it's just not worth fighting to get this stuff merged.

right, in this stadium i can "oversee" the necessary patches:

i strip the nonparisc, multiplatform support away with a perl script,
fiddle with about 3-4 hunks that have to be taken out because they already
exist in parisc source (for example latest ptrace kernel exploit), another
6-10 "look at it and try to intelligently put it into the slightly
different parisc source" and the rest is "make up" like double insertions,
typos and the like :-)
> If anyone is interested in "fighting" to merge the outstanding
> parisc linux changes, I can help a bit. I just don't have as much time
> these days...hopefully more this summer.

okay, i get you.

> To willy's credit, he's attempted to merge 2.4 parisc changes upstream
> at least twice but was torpedo'd both times.

i don`t want to know ;-)

>> we're mostly
>> merged for 2.5 and i'd rather spend my time working on that.

okay, this basically means to wait for a 2.5.* grsec patch and in the
meantime continue hacking in the grsec patches by hand, which is just what
i would prefer as the way to go for the next months.
> me too - I'd rather see you working on something you care about.
> I'm very happy to see you (and several others) taking good care of 2.5.
> And I think it's a bit much for anyone to do both - that's mostly why I
> *haven't* been doing much with 2.5.
>
> thanks,
> grant

with the help of the PaX team, yesterday i managed to get the 199f patch
going on my 712, with all GRKERNSEC* options enabled but just a little
PAGEEXEC "brute disabled routine" in binfmt_elf.c that inverses the
behaviour of chpax -p, i will get into that later today when i come home.
http://nikita.ath.cx/users/pappy/grsec/199f/parisc-linux-2.4.20-pa32-grsecurity-1.9.9f-parisc-only.patch
thanks for your support and that you are dealing with this issue so
friendly and open minded.

bye,


Alex
