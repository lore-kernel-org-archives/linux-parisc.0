Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id BAA23081
	for <hppa-linux@sod.res.cmu.edu>; Tue, 23 Mar 1999 01:57:03 -0500
Date: Mon, 22 Mar 1999 22:57:57 -0800 (PST)
From: Kumar <kumar@ix.netcom.com>
To: hppa-linux@thepuffingroup.com
cc: kumar@ix.netcom.com
Message-ID: <Pine.LNX.3.96.990322224839.335B-100000@quark.ix.netcom.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [hppa-linux] Linux Kernel and PA-RISC
List-ID: <linux-parisc.vger.kernel.org>






This is a long one. So bear with me.

In the process of trying to know more about PA-RISC, I ended up
doing a following comparative analysis between PA and 80386:

Take a 80386 -

Make segment registers 32 bits wide and instead of defining
how much memory is covered by each segment using Global descriptor
table etc, make each segments of same size that is  32 bits. 

Take out the special meaning assigned to segment registers by hardware
i.e no CS, DS, ES etc etc. Call these new segment registers "spaces"
each capable of addressing 4 Gig of memory. 

So now we have this 2 dimensional virtual address space, %sr.%offset.

Instead of going through a pdir->page_table->page combination as done
in x86, just use a TLB black box:


	%sr.%offset-------->[TLB black-box]---------->a physical page in 
		                       a flat physical address space.

One of the issues while porting Linux to 80386 would be how to implement
this TLB black-box.

I expect folks to correct me if I have faltered or  made any wrong assumptions
so far.


On a x86 Linux box, at any given time following is happening.

Kernel space is defined by 2 segments in GDT, one each for code and data.
User space is defined by 2 segments in GDT, one each for code and data.
There might be others ( Like stack, though i believe u can use data segment).

When a process makes a syscall going through an interrupt gate:

One of things that we do is to save every thing ( HW state), change
CS and DS to those of kernel space, giving a 32 bit virtual address and
depend on  pdir->page_table->page mumbo jumbo to start executing and fetching
instruction in kernel.


My understanding of PA equivalent:

	Since there is no special meaning (except %sr0 which i think is
	used for branch and link space) to any space registers, Juse use
	by convention a particular space register and a value in this space
	register to define Kernel space. 

	There is no segment level protection here ?
	All protection is through protection identifiers and other fields
	in tlb entry data structures. One of the important field here is
	privilege level of the page defined by a particular tlb entry.

	A process makes a syscall by executing a gate instruction on a 
	privileged page, that braches to a syscall entry point in kernel
	and also increases your privilege level.

	To move from real mode to Virtual mode:

	Set things up ( i.e. create pdir and map everything correctly)
	Hope you are executing on a page thats equivalently mapped.
	Turn on I and D bits in PSW and you are in protected mode.

	
	One other question is whats happening to space registers when
	you are running in real mode ?

I hope, this "magnum opus" is enough for today :-)

-pkd
