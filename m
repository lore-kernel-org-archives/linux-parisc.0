Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel12.hp.com (palrel12.hp.com [156.153.255.237])
	by dsl2.external.hp.com (Postfix) with ESMTP id 88083483E
	for <parisc-linux@lists.parisc-linux.org>; Fri, 19 Sep 2003 12:23:36 -0600 (MDT)
From: "Jim Hull" <jim.hull@hp.com>
To: "'James Bottomley'" <James.Bottomley@steeleye.com>,
	"'Randolph Chung'" <randolph@tausq.org>
Cc: "'PARISC list'" <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] Re: [parisc-linux-cvs] linux-2.6 jejb
Date: Fri, 19 Sep 2003 11:24:50 -0700
Message-ID: <00e301c37edb$50a11f20$f463f40f@jh733133>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
In-Reply-To: <1063980175.1929.7.camel@mulgrave>
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

James Bottomley wrote:

> But it does beg the question: I think all of the PA arch docs require
> the dcache to be flushed before the icache for all icache flushing, so
> is there any point exporting an API that only flushes the icache?

Not true.  If you know that the line can't be in the d-cache, then
flushing the i-cache is sufficient (and vice-versa).  See "Data Cache
Move-In", "Instruction Cache Move-In", and "Cache Flushing" in Appendix
F of "PA-RISC 2.0 Architecture" (aka, "The Kane Book"), for details.

Now, whether pa-linux keeps track of whether a line could be in only the
d- or i-cache, with sufficient accuracy to avoid the other flush, I have
no idea.  HP-UX does attempt to track this, but doing so in every case
can be really tricky, and tracking down the data (or instruction)
corruption bugs when you miss some obscure case is a nightmare (and I
have the scars to prove it :).

 -- Jim
    HP PA-RISC/Itanium Processor Architect
