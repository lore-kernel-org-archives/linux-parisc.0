Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 24228482A
	for <parisc-linux@parisc-linux.org>; Thu, 18 Oct 2001 14:21:55 -0600 (MDT)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id tizdiaaa for parisc-linux@parisc-linux.org; Thu, 18 Oct 2001 13:17:14 -0700
Date: Thu, 18 Oct 2001 13:21:45 -0700
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20011018132145.H4123@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] travel backwards in time?
List-ID: <linux-parisc.vger.kernel.org>

Recently Grant and I have observed several hangs in do_gettimeofday on a
c3k running 32 or 64-bit kernels (UP). 

The symptom we see is gettimeoffset returns a negative number which
results in a huge (unsigned) usec offset in do_gettimeofday, which ends
up spinning in a while loop.

On further investigation we found this piece of code that we don't 
quite understand in the gettimeoffset function:


        /* this is the intended time of the next tick */
        last_tick = cpu_data[smp_processor_id()].it_value;
        /* so subtract one tick */
        /* and account for possible difference between wall and actual time */
        last_tick += clocktick * (jiffies - wall_jiffies - 1);
	
The last_tick adjustment looks a bit odd. Looking at ia64, it looks more
like this:

        last_tick -= clocktick * (jiffies - wall_jiffies + 1);

I tried this and couldn't reproduce the hangs anymore, but am not sure
if this is the right fix.

jsm suggested we try an experiment to disable interrupts in the
timer_interrupt handler. I tried that yesterday (add a __cli() call) and
it didn't seem to fix the hangs.

Can someone more familiar with that part of the code (pb?) please comment?

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
