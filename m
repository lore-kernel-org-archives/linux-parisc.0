Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id C43E54A19
	for <parisc-linux@lists.parisc-linux.org>; Thu, 22 Feb 2001 07:28:44 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id BAA08350;
	Fri, 23 Feb 2001 01:28:36 +1100
Date: Fri, 23 Feb 2001 01:28:36 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: schedule_tail
In-Reply-To: <Pine.LNX.4.21.0102222150310.14557-100000@front.linuxcare.com.au>
Message-ID: <Pine.LNX.4.21.0102230114130.14557-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 22 Feb 2001, Alan Modra wrote:

> First time in do_fork, I see
>  p = 0x14ff0000, current = 0x102cc000 (= init_task)
> 
> first call to ret_from_kernel_thread gives
>  r26 = 0x102cc000, r30 = 0x14ff0500, and called func = init
> 
> so that checks out OK.  Disassmbling schedule_tail doesn't show anything
> bad.
> 
>  copy r3,r1
>  copy sp,r3
>  stw,ma r1,0x40(sp)
>  ldw 0x28(r26),r19
>  depwi 0,27,1,r19
>  stw r19,0x28(r26)
>  ldo 0x40(r3),sp
>  bv (rp)
>  ldw,mb -0x40(sp),r3

This is really crazy (or I am).  I replaced the calls to schedule_tail
with a call to foo_schedule_tail, a local copy of the above without the
bit twiddling.  Still crashed.  OK, so maybe the stack is messed up.
Turn foo_schedule_tail into

foo_schedule_tail:
  bv (%rp)
  nop

It crashes!!  Remove the calls, and it's OK.  What????
