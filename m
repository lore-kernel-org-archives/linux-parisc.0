Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from amanda.ybsoft.com (lametoby.ybsoft.com [63.224.241.66])
	by dsl2.external.hp.com (Postfix) with ESMTP id D0121482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 13 Jul 2001 11:01:14 -0600 (MDT)
Received: from beavis.ybsoft.com (ns1.ybsoft.com [10.0.0.2])
	by amanda.ybsoft.com (Postfix) with ESMTP id CEA335873A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 13 Jul 2001 04:02:35 -0600 (MDT)
Date: Fri, 13 Jul 2001 11:01:10 -0600
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010713110110.A9795@beavis.ybsoft.com>
Reply-To: rbradetich@uswest.net
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
From: rbrad@beavis.ybsoft.com (Ryan Bradetich)
Subject: [parisc-linux] help debuging HMPC
List-ID: <linux-parisc.vger.kernel.org>

Hello parisc-linux hackers,

Now that I am starting to have time to devote on this port again, 
I started to look into the HPMC crash when doing a cpio from the 
scsi cdrom drive to a hard drive again.  I origionally tried to
debug the problem using printk statements in the ccio code, and
John Marvin helped me identify a problem I was experiencing while
attempting to debug with printk's .

http://lists.parisc-linux.org/pipermail/parisc-linux/2001-May/012579.html

Now I am trying to debug the problem using a different approach 
that does not use printk statements.  The HPMC is extremely
reproducable, and the IAOQ always points to the _gsc_readl
function and GR 2 always points to the dino_in32 function as 
the _gsc_readl function caller.

This is the instruction that causes the HPMC (IAOQ address - 8):
	ldwa  r0(r26),r26

Looking up the value of GR26 from the register dump gives me random
addresses.  The last three addresses I recorded using this kernel are:

	GR26: 0x00ff9000
	GR26: 0x002e8800
	GR26: 0x000a1000

My (limited) understanding of appropriate values for an address
being passed to the _gsc_readl function would be an I/O address,
which is >= 0xf0000000.  If my understanding is correct, then the
C200+ is properly HPMC'ing because of the invalid I/O address.

To verify my assumptions about the bad value in the GR26, I added
a global variable rbrad_debug to the dino.c code which will save 
the value off in memory (since I can not use printk :() the address 
value being passed to _gsc_readl from the dino_in32 function and 
use the ser mr <addr> [len] of the pdc to read the contents of
the rbrad_debug variable after the machine had HPMC'd.

Doing this gave me unexpected results also. (The results did not
match GR26 and they were not always >= 0xf0000000).  So I made
rbrad_debug an array of u32 and set known values in array indexes
0, 2, and 4 and used array indexes 1 and 3 to store the addresses
being written by gsc_writel (I stored this value for curiosity sakes) 
and gsc_readl.  If the known addresses were present in the the proper
index of the array, then it would increase my trust in the values being
returned in the unknown indexes.

To my surprise, I am not getting the expected values back even in the
known indexes when I do the ser mr <addr> 5 in the boot menu after the
HPMC.

This leaves me to consider two things:
	1. Am I using the ser mr <addr> len incorrectly?

	I grabbed the address from the system map and in this case:
	102db05c D rbrad_debug

		Main Menu: Enter command > ser mr 0x102db05c 5

   		0x102db05c  3fa276cd  5faa1b4c  7f44ed9a  bf543698  
   		0x102db06c  fe89db34  


	Next I though of getting rid of the 0x10000000 since that is
	where I believe we relocate the kernel to in vm.
	
		Main Menu: Enter command > ser mr 0x002db05c 5

		0x002db05c  0fc1bc54  f97e75b0  1f8378a8  f2fceb60  
		0x002db06c  3f06f150  

	Index 0, 2, and 4 should all be 0 if I were going to trust
	these values.

	2. Is memory getting stomped again like it did before when
	I was trying to debug using printk statements.

	Two things kinda indicate this is happening again to me (but
	I could also be mis-reading the results).
		a. I am not getting the known results back in the
		   indexes I expected.

		b. The address present in the IAOQ is not present in
		   the stack trace that is dumped.  The IAOQ value is:
		
			IAOQ: 102200d0 102207e4	

		and this is the stack dump range:

			Dumping Stack from 10320000 to 10320a40:

		running the astk command from the build-tools also does
		not show the dino_in32 or the _gsc_readl addresses in
		the stack trace either.

I have a bunch of files saved off in ~rbrad on p.e.h.c for people to look
at if they are interested.  I'm not going to attach them to this email 
since I (appropriately) got spanked last time for doing that :).   If people
do not have access to p.e.h.c and would like to get a copy of the files,
send me private email (rbradetich@uswest.net), and we can arrange a 
method to get the files for you.

The files on p.e.h.c/~rbrad are:
	vmlinux - The kernel used for the c200.log
	System.map - The System.map for the vmlinux kernel
	dino.patch - My patch to dino.c which addes rbrad_debug
	c200.log - The entire console log of the HPMC including:
		- Commands used to create the HPMC
		- The Stack Trace and register dump
		- The results from the ser mr commands
		- and the PIM dump for the HPMC

Hopefully this provides enough information for people interested in helping
debug the problem, if it doesn't let me know what additional information
you need and I will working on getting the information to you.

Thanks!

- Ryan

-- 
