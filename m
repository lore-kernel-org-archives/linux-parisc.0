Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 09B1E4840
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 12 Apr 2004 17:53:45 -0600 (MDT)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i3CNiGa18548; Mon, 12 Apr 2004 19:44:16 -0400
Subject: Re: [parisc-linux] Proposal for altering our Page Table layouts
From: James Bottomley <James.Bottomley@steeleye.com>
To: John Marvin <jsm@udlkern.fc.hp.com>
In-Reply-To: <200404122331.i3CNVxI03436@udlkern.fc.hp.com>
References: <200404122331.i3CNVxI03436@udlkern.fc.hp.com>
Content-Type: text/plain
Date: 12 Apr 2004 18:44:13 -0500
Message-Id: <1081813454.2234.51.camel@mulgrave>
Mime-Version: 1.0
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Mon, 2004-04-12 at 18:31, John Marvin wrote:
> Let's not forget that the machine independent VM code assumes a 2 or 3
> level page table, walks those page tables, allocates page tables, etc.
> So, let's forget about theory for a minute, and start talking
> realistically.  Have you considered how you would abstract an inverted
> page table design so that it would fit within the machine independent VM
> design for page table support?  I haven't given it more than about 5
> minutes of thought, but I don't see a way of doing it (Note that I am
> not for this idea at all).

I think we can all agree that the results presented in the paper show
(albeit indirectly) that IPT performs worse than a 2 level page table
(FMPT in the paper).

However, as far as linux goes, the abstraction would actually cover a 1
level page table as well ... and we could make a HPT directly emulate a
1-level table as long as we did the hash chain walking within the
pgd_offset macro.

> If you can't do it (i.e. hide it completely within the parisc arch code) then
> you need to be talking to Linus and convince him first, unless you are
> advocating maintaining a large patch against machine independent code.

However, realistically, I think a global HPT is incompatible with the
way linux does VM and a local HPT (one per process) while possible, gets
us into awful memory allocation problems to the extent that it's not
worth bothering with.  Therefore, I think a 2 level table will be
optimal for us.

James
