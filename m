Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sh.od.inet (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id B9FB5482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  6 Jun 2002 07:21:17 -0600 (MDT)
Date: Thu, 6 Jun 2002 09:21:15 -0400
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: Randolph Chung <tausq@debian.org>
Cc: patrick@tykepenguin.com, parisc-linux@lists.parisc-linux.org
Message-ID: <20020606092115.C6900@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] kdb getting healthier? (PCI guru needed, that's you willy!)
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

Randolph,

I think I was able to get kdb to stop dying inside unwind_table_init.

--- unwind.c.orig       Thu Jun  6 08:51:02 2002
+++ unwind.c    Thu Jun  6 08:51:49 2002
@@ -106,7 +106,7 @@
        table->base_addr = base_addr;
        table->gp = gp;
        table->start = base_addr + start[0].region_start;
-       table->end = base_addr + end[-1].region_end;
+       table->end = base_addr + end[0].region_end - sizeof(struct unwind_table_entry);
        table->table = (struct unwind_table_entry *)table_start;
        table->length = end - start;
        table->next = NULL;

Is this a gcc-ism we're seeing?
Note-to-self: Look at .S produced from compiling unwind.c

On another note, we have no code that calls unwind_table_add so I've
#if'd it out. Which makes me wonder... which change was the fix? 
Time to go back to square one and try them out independantly.

The kernel still goes into an infinite loop of unknown origin:
---
PCI or EISA Bus Adapter 0 is not registered...
---
(see ./arch/parisc/kernel/pci.c' -> PCI_PORT_IN)
Don't know where this gets called from, or how the ugly macro
expands :)

Sadly I think I zapped my VGA out on the 712/60 (A common occurence?).
It no longer produces _any_ video signals.
I may have to drag a 715/50 back to my house...

c.
