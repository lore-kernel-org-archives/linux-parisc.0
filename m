Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [156.153.255.205])
	by dsl2.external.hp.com (Postfix) with ESMTP id D1A254829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 13 Dec 2002 06:42:45 -0700 (MST)
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel6.hp.com (Postfix) with ESMTP id 85F90D8E
	for <parisc-linux@lists.parisc-linux.org>; Fri, 13 Dec 2002 08:42:40 -0500 (EST)
Received: (from jsm@localhost)
	by udlkern.fc.hp.com (8.9.3 (PHNE_18979)/8.9.3 SMKit7.01) id GAA14970
	for parisc-linux@lists.parisc-linux.org; Fri, 13 Dec 2002 06:42:40 -0700 (MST)
Date: Fri, 13 Dec 2002 06:42:40 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200212131342.GAA14970@udlkern.fc.hp.com>
To: parisc-linux@lists.parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Re: fic problem
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

>               __asm__ __volatile__("fic (%0)" :: "r" (spot) );

The assembler should not allow this, but it does. The problem is that
whoever wrote the assembly/disassembly support for parisc didn't really
understand the difference between instructions with 2 bit s fields and
3 bit s fields. fdc has a 2 bit s field, so when you specify "fdc (%0)"
it puts a 0 in the s field, which tells the processor to use the space
registers associated with the top two bits of the address (sr4-sr7). But
if you disassemble the instruction it will print "fdc (sr0,<register>),
which is incorrect, since sr0 is not involved.

fic has a 3 bit s field. In that case, the space register must be specified
explicitly. specifying "fic (%0)" should be illegal. But instead the
assembler just puts a zero in the s field of the instruction. But in this
case it does mean to use sr0. So when you specify "fic (%0)", you are
really specifying "fic (sr0,%0)". Since sr0 is a scratch space register,
you probably have not set it to anything appropriate, so that is probably
why the fic instruction is segfaulting on you (assuming "spot" is a legal
address in your address space).

On parisc linux we use a linear, non segmented address space, so all four
quadrants of the address space are in the same parisc space. That means
that sr4 through sr7 are set to the same value while running in user space.
So, you should change your call to fic to use any of those 4 space registers.
The general convention has been to use sr7. So instead of specifying
"fic (%0)", you should specify "fic (sr7,%0)".

John Marvin
jsm@fc.hp.com
