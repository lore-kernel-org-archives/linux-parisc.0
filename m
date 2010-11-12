From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: instruction cache flushing issues
Date: Fri, 12 Nov 2010 11:14:25 -0600
Message-ID: <1289582065.3015.47.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
To: Parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

While looking at all the other problems surrounding our coherency
issues:

http://wiki.parisc-linux.org/TestCases

I noticed that we have no nullifier naitlb (non access instruction tlb
miss interruption) handler (we do in the nadtlb handler).  What this
means is that an icache flush to any area always pulls in the tlb entry
(or generates a page fault).  Can anyone remember why we do this?  I
suspect it's because for data, we don't want to prefetch if we have no
TLB entry and the effect on flushing is just incidental.

What I don't like about this behaviour is that if we flush a user
instruction page, we actually cause a TLB entry to be placed there
(where none might have existed before).  This, in turn, causes the CPU
to think it's allowed to do cache movein.  Premature movein (say because
we flush before the data is present) could be one cause of our apparent
icache problems in threading.

James


