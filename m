Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA09703
	for <parisc-linux@puffin.external.hp.com>; Fri, 15 Sep 2000 06:06:23 -0600
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by cosrel1.hp.com (Postfix) with ESMTP id 4D6CE549
	for <parisc-linux@thepuffingroup.com>; Fri, 15 Sep 2000 06:06:55 -0600 (MDT)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.3 SMKit7.0) id GAA17924 for parisc-linux@thepuffingroup.com; Fri, 15 Sep 2000 06:06:45 -0600 (MDT)
Date: Fri, 15 Sep 2000 06:06:45 -0600 (MDT)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200009151206.GAA17924@udlkern.fc.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] 32 bit compiler bug causing kernel crashes
List-ID: <linux-parisc.vger.kernel.org>


I've been investigating a problem that was leading to the kernel executing
a break 0,0 (executing 0) at random times. I've tracked the problem down
to a compiler bug.

When the kernel hit the break instruction it was always at the same
location in the kernel (in __rpc_execute() in net/sunrpc/sched.c).
Since the 0 wasn't on a cache line boundary, and since it was in
kernel text (which isn't modified after palo loads it), I suspected
that the problem was not a cache flush bug, but was instead either
someone directly scribbling on the kernel, or someone dma'ing
into it. In order to eliminate the first possibility I modified the
kernel vm mappings to make the kernel text read only (and added some
code in the trap handler to catch it instead of passing it to
do_page_fault()). Well I caught some code in the act, and it was
quite close to the instruction that was being zero'd:

	c0205b24 <.L1770>:
1--->   c0205b24:       0c 86 12 80     stw  r6,0(sr0,r4)
	c0205b28:       40 73 01 08     ldb 84(sr0,r3),r19
	c0205b2c:       08 b3 02 13     and r19,r5,r19
	c0205b30:       86 60 20 0a     cmpib,=,n 0,r19,c0205b3c <.L1809>
2--->   c0205b34:       e8 5f 1b 85     b,l c02058fc <__rpc_atrun+0x40>,rp
	c0205b38:       34 42 3f d1     ldo -18(rp),rp

	c0205b3c <.L1809>:
3--->   c0205b3c:       0d 00 12 80     stw  r0,0(sr0,r8)


"1--->" above points to the instruction that was being zeroed in error.
"2--->" above is a branch to schedule() (in kernel/sched.c).
"3--->" above is the instruction caught writing into "1--->" above

r8 contained 0xc0205b24. So I wondered how it got that value, since
it should be pointing to the current task structure (current->).
I thought perhaps there was still some old "r8 hack" code around,
and just yesterday I noticed some cruft in entry.S dealing with r8,
but although superfluous, it was not the problem, since the registers
were saved before r8 was used. I checked through all of the trap
paths, and couldn't find anyplace that was trashing r8.

So then I wondered how r8 was always getting 0xc0205b24, and figured that
that value must be used somewhere. I noticed the .L1770 label, and
figured that it must be there for a reason, but I couldn't find a
branch to it. I then noticed the ldo -18(rp),rp after the branch
to schedule. Ooooh, score a point for gcc. That's an optimization I've
never seen in the hp-ux compiler. schedule is in the bottom of a loop,
so this modification of rp in the delay slot causes schedule to return
to the top of the loop, i.e. <.L1770>. This means that 0xc0205b24
is in r2 when schedule is called. So I decided to look at schedule
to see if I could get a clue how the value of r2 was getting transferred
into r8. So here is the code at the beginning of schedule():

	c0114404 <schedule>:
	c0114404:       08 03 02 41     copy r3,r1
	c0114408:       08 1e 02 43     copy sp,r3
4--->   c011440c:       0c 68 12 90     stw  r8,8(sr0,r3)
	c0114410:       08 1e 02 48     copy sp,r8
	c0114414:       6b c2 3f d9     stw rp,-14(sr0,sp)
	c0114418:       08 08 02 53     copy r8,r19
5--->   c011441c:       6f c1 01 00     stw,ma r1,80(sr0,sp)

This is not good. At "4--->" above r8 is being saved above the stack
pointer, i.e. before the stack pointer is incremented at "5--->" above.
This is a compiler bug, and I rebuilt my compiler from top of branch
sources to make sure that it is still there. It is.

For many of you, this is obvious, but just to finish this long winded
story, if an interrupt comes in between "4--->" and "5--->" above, the
stored value of r8 will get trashed because the stack pointer is
still pointing below it. When an interrupt comes in, a trap frame will
be stored starting at the stack pointer, and guess what register is
going to be saved at sp+8? Yep, r2.

John Marvin
jsm@fc.hp.com
