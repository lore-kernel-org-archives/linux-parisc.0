Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 24193482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  6 Jun 2002 10:19:43 -0600 (MDT)
Message-Id: <200206061619.g56GJdiE004367@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] kdb getting healthier? (PCI guru needed, that's you willy!)
To: carlos@baldric.uwo.ca (Carlos O'Donell Jr.)
Date: Thu, 6 Jun 2002 12:19:39 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: tausq@debian.org, patrick@tykepenguin.com,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <20020606092115.C6900@systemhalted> from "Carlos O'Donell Jr." at Jun 6, 2002 09:21:15 am
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

> -       table->end = base_addr + end[-1].region_end;
> +       table->end = base_addr + end[0].region_end - sizeof(struct unwind_table_entry);
>         table->table = (struct unwind_table_entry *)table_start;
>         table->length = end - start;
>         table->next = NULL;
> 
> Is this a gcc-ism we're seeing?
> Note-to-self: Look at .S produced from compiling unwind.c

It's definitely dangerous to use array indexes outside the bounds
of the array, particularly on the PA.  There can be problems with
space register selection, although I wouldn't expect this to be a in
the linux kernel.  You can avoid index insns with "-mdisable-indexing".
Let me know if you see anything strange in the assembler output.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
