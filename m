Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pogo.mtv1.steeleye.com (host194.steeleye.com [66.206.164.34])
	by dsl2.external.hp.com (Postfix) with ESMTP id BBAF94829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 20 Dec 2002 22:03:42 -0700 (MST)
Received: (from root@localhost)
	by pogo.mtv1.steeleye.com (8.9.3/8.9.3) id VAA14452
	for <parisc-linux@lists.parisc-linux.org>; Fri, 20 Dec 2002 21:03:37 -0800
Received: from mulgrave (jejb@localhost)
	by localhost.localdomain (8.11.6/linuxconf) with ESMTP id gBL53XV11940;
	Fri, 20 Dec 2002 23:03:33 -0600
Message-Id: <200212210503.gBL53XV11940@localhost.localdomain>
To: grundler@dsl2.external.hp.com (Grant Grundler)
Cc: James Bottomley <James.Bottomley@SteelEye.com>,
	Randolph Chung <randolph@tausq.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.5 randomly kills applications with page faults 
In-Reply-To: Message from grundler@dsl2.external.hp.com (Grant Grundler)
   of "Fri, 20 Dec 2002 21:34:48 MST." <20021221043448.GB26293@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 20 Dec 2002 23:03:33 -0600
From: James Bottomley <James.Bottomley@steeleye.com>
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

grundler@dsl2.external.hp.com said:
> I'm worried about sr7 getting modified without the user stack pointer
> getting saved to the proper place. It might not be a problem at all. I
> just don't know all the uses of user/kernel stacks in the interrupt
> code paths. I'm wondering if the entire code sequence I quoted needs
> to block interrupts while setting up the syscall. 

I don't think that's a problem.

An interruption can occur anywhere, and thus it saves all registers.  The only 
problem is that on parisc there aren't separate irq stacks, so the 
interruption expects to be able to use the current kernel stack (whatever it 
is).  As long as the kernel stack is always correctly set up when %sr7 points 
to kernel space, we should be fine.  If we take an interruption before zeroing 
sr7, we go through the procedure to obtain a kernel stack for an executing 
user process (however, in this case, the interruption will stash the registers 
in the task structure, so we can't modify the task structure until we've 
changed sr7 to kernel space).  Also note, we can't use the kernel stack until 
sr7 is in kernel space.

James
