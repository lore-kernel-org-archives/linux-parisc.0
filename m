Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sh.od.inet (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id 72418485B
	for <parisc-linux@lists.parisc-linux.org>; Thu,  6 Jun 2002 12:57:42 -0600 (MDT)
Date: Thu, 6 Jun 2002 14:57:33 -0400
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: tausq@debian.org, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kdb getting healthier? (PCI guru needed, that's you willy!)
Message-ID: <20020606145733.C8107@systemhalted>
References: <20020606092115.C6900@systemhalted> <200206061619.g56GJdiE004367@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200206061619.g56GJdiE004367@hiauly1.hia.nrc.ca>; from dave@hiauly1.hia.nrc.ca on Thu, Jun 06, 2002 at 12:19:39PM -0400
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

> > -       table->end = base_addr + end[-1].region_end;

> > +       table->end = base_addr + end[0].region_end - sizeof(struct unwind_table_entry);
> >         table->table = (struct unwind_table_entry *)table_start;
> >         table->length = end - start;
> >         table->next = NULL;
> 
> It's definitely dangerous to use array indexes outside the bounds
> of the array, particularly on the PA.  There can be problems with
> space register selection, although I wouldn't expect this to be a in
> the linux kernel.  You can avoid index insns with "-mdisable-indexing".
> Let me know if you see anything strange in the assembler output.
> 
> Dave

That's what I imagined, but only now do I realize that the fix
is completely wrong (my bad).

It should really be something like:

table->end = base_addr + (&end[0] - sizeof(struct unwind_table_entry))->region_end;

I'm pretty sure that the end[-1] is causing a processor fault. 
Which then causes kdb to kick-in, but the unwind table isn't
built yet so it can't find a matching entry.

If this doesn't work, then how is one supposed to correctly get
the last table entry? :)

 (end == __stop___unwind)

  __start___unwind = .;         /* unwind info */
  .PARISC.unwind : { *(.PARISC.unwind) }
  __stop___unwind = .;

c.
