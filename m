Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA00727
	for <parisc-linux@puffin.external.hp.com>; Sat, 6 Nov 1999 12:49:15 -0700
Date: Sat, 6 Nov 1999 20:51:25 +0100
From: Philipp Rumpf <prumpf@mathe.stud.uni-erlangen.de>
To: Matthew Wilcox <Matthew.Wilcox@genedata.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] pgtable.h:acc_rights()
Message-Id: <19991106205125.L11609@mathe.stud.uni-erlangen.de>
References: <19991106172023.L25252@mencheca.ch.genedata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <19991106172023.L25252@mencheca.ch.genedata.com>
List-ID: <linux-parisc.vger.kernel.org>

> Why is acc_rights written like this?

See my commit message.  Basically that works around the "pages mapped read-only
when they should be read-write" problem Thomas reported.

> of course, it should be rewritten to look much cleaner.  In fact,
> by renumbering the bits, we could get that for free (as long as we put
> a big fat warning above the #defines of _PAGE_* to warn that the
> constants are in that order for hardware efficiency).

We are still looking for the optimal layout of the 12 _PAGE_* bits we have.
The word we need to translate to looks like this:

0  1  2  3  4  5  ... 11 12 13 ... 31
X  X  T  D  B  \__ ____/  U \_______/
             access rights  access id

X - don't care (it looks like)
T - page reference trap
D - dirty
B - break
U - uncacheable

access rights is

 5  6  7  8  9 10 11
\______/ \___/ \___/
type      PL1   PL2

000: read-only
001: read-write
010: read-execute
011: read-write-execute
100: promote to PL 0.
101: promote to PL 1.
110: promote to PL 2.
111: remain at PL 3.

we don't need the B and T bits.  We don't need access types 101, 110, 111.  We only
need one bit for bits 8 .. 11 (they are either all 1 or all 0, so we can do an extrs).

We do need a "referenced" bit (not sure whether the dirty bit can do that for us more
efficiently) and a "valid" bit in addition to what the hardware gets to see.

So, I am just thinking of what the reason was we cannot just store bits 1 .. 12 in the
12 LSBs of the PTE, use bit 1 as a valid bit and be happy.  I am pretty sure there was
one.

> Anyway, I'm after a spare bit in the pte for _PAGE_GATEWAY.  As I
> understand it (from the mk_pte() macro), there are 12 bits available,
> only 8 of which are used, so I can nobble one of them to mark a page
> as being a gateway, right?

I would rather see a completely rewritten TLB insertion handler and either saving a
7-bit access rights field or a "I am special" bit / bit pattern.  The idea behind that
is it is used to re-insert BTLB entries / large mappings so we don't fault for every
single page and gateway pages would fit nicely into that.

	Philipp Rumpf
