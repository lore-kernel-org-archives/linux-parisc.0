Return-Path: <carlos@baldric.uwo.ca>
Received: from fep01-mail.bloor.is.net.cable.rogers.com
	(fep01-mail.bloor.is.net.cable.rogers.com [66.185.86.71])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7932848AC
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 13 Apr 2004 08:28:37 -0600 (MDT)
Date: Tue, 13 Apr 2004 10:28:24 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: James Bottomley <James.Bottomley@steeleye.com>
Subject: Re: [parisc-linux] Proposal for altering our Page Table layouts
Message-ID: <20040413142824.GK21362@baldric.uwo.ca>
References: <200404122331.i3CNVxI03436@udlkern.fc.hp.com>
	<1081813454.2234.51.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1081813454.2234.51.camel@mulgrave>
Cc: John Marvin <jsm@udlkern.fc.hp.com>,
	PARISC list <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


Yes, Linux assumes a lot about the general layout of the pte tables.

> I think we can all agree that the results presented in the paper show
> (albeit indirectly) that IPT performs worse than a 2 level page table
> (FMPT in the paper).

Correct.
 
> However, as far as linux goes, the abstraction would actually cover a 1
> level page table as well ... and we could make a HPT directly emulate a
> 1-level table as long as we did the hash chain walking within the
> pgd_offset macro.

Yes.

> > If you can't do it (i.e. hide it completely within the parisc arch code) then
> > you need to be talking to Linus and convince him first, unless you are
> > advocating maintaining a large patch against machine independent code.
> 
> However, realistically, I think a global HPT is incompatible with the
> way linux does VM and a local HPT (one per process) while possible, gets
> us into awful memory allocation problems to the extent that it's not
> worth bothering with.  Therefore, I think a 2 level table will be
> optimal for us.

Yes, two-level / three-level systems are lower order allocations. The
difficult issue with HPT's is that we have no clear mechanism for
aliases, and shared mappings, possibly requiring more initial pgdir's or
some such hackery.

James, I meant only to hash out other possible alternatives, merely
being the pot stirrer or devils advocate :)

I think your idea is exactly what we need to cleanup that chunk of code,
possibly finding mistakes along the way. When you need help just holler.

c.
