Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 954AB4842
	for <parisc-linux@lists.parisc-linux.org>; Thu,  6 Jun 2002 13:35:25 -0600 (MDT)
Message-Id: <200206061935.g56JZKpd012149@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] kdb getting healthier? (PCI guru needed, that's you willy!)
To: carlos@baldric.uwo.ca (Carlos O'Donell Jr.)
Date: Thu, 6 Jun 2002 15:35:19 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: tausq@debian.org, parisc-linux@lists.parisc-linux.org
In-Reply-To: <20020606145733.C8107@systemhalted> from "Carlos O'Donell Jr." at Jun 6, 2002 02:57:33 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> It should really be something like:
> 
> table->end = base_addr + (&end[0] - sizeof(struct unwind_table_entry))->region_end;

You should be able to just do something like

struct unwind_table_entry *p = end;
...
table->end = base_addr + (--p)->region_end;

> 
> I'm pretty sure that the end[-1] is causing a processor fault. 
> Which then causes kdb to kick-in, but the unwind table isn't
> built yet so it can't find a matching entry.
> 
> If this doesn't work, then how is one supposed to correctly get
> the last table entry? :)
> 
>  (end == __stop___unwind)
> 
>   __start___unwind = .;         /* unwind info */
>   .PARISC.unwind : { *(.PARISC.unwind) }
>   __stop___unwind = .;

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
