Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sh.od.inet (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id E08B94848
	for <parisc-linux@lists.parisc-linux.org>; Fri,  3 May 2002 11:48:23 -0600 (MDT)
Received: (from carlos@localhost)
	by sh.od.inet (8.11.6/8.11.0) id g43HmNs23599
	for parisc-linux@lists.parisc-linux.org; Fri, 3 May 2002 13:48:23 -0400
Date: Fri, 3 May 2002 13:48:23 -0400
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20020503134823.A23583@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] traps.c - void show_stack(struct pt_regs *regs)
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

pa,

-pa23

linux/arch/parisc/traps.c

    159                 cr30 = mfctl(30);
    160                 cr31 = mfctl(31);
    161                 stack_start = sp & ~(ISTACK_SIZE - 1);
    162                 if (stack_start == cr31) {
...
    189                 }
    190                 else
    191                 {
    192                     /* Stack Dump! */
    193                     printk(KERN_CRIT "WARNING! Stack pointer and cr30 do not correspond!\n");
    194                     printk(KERN_CRIT "Dumping virtual address stack instead\n");
    195                     dump_stack((unsigned long)__va(stack_start), (unsigned long)__va(sp), 0);
    196                 }

Line 193:

	Why do we say cr30 does not correspond to stack pointer?

c.
