Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA01843
	for <parisc-linux@puffin.external.hp.com>; Tue, 21 Nov 2000 10:16:32 -0700
Received: from carmen.fc.hp.com (carmen.fc.hp.com [15.1.51.72])
	by atlrel1.hp.com (Postfix) with ESMTP id 210E75CA
	for <parisc-linux@thepuffingroup.com>; Tue, 21 Nov 2000 12:18:44 -0500 (EST)
Received: from carmen.fc.hp.com (localhost [127.0.0.1])
	by carmen.fc.hp.com (Postfix) with ESMTP id E16FA37CA7
	for <parisc-linux@thepuffingroup.com>; Tue, 21 Nov 2000 10:20:35 -0700 (MST)
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 21 Nov 2000 10:20:35 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20001121172035.E16FA37CA7@carmen.fc.hp.com>
Subject: [parisc-linux] kernel BUG at sched.c:692!
List-ID: <linux-parisc.vger.kernel.org>

I arrived this morning to discover both my B160 and my C3000 were printing the 
following as fast as they could,

Scheduling in interrupt
kernel BUG at sched.c:692!

Looking at linux/kernel/sched.c here's the relevant section,

690 scheduling_in_interrupt:
691         printk("Scheduling in interrupt\n");
692         BUG();
693         return;

scheduling_in_interrupt is called from line 516. Here's some context,

500 asmlinkage void schedule(void)
501 {
502         struct schedule_data * sched_data;
503         struct task_struct *prev, *next, *p;
504         struct list_head *tmp;
505         int this_cpu, c;
506
507         if (!current->active_mm) BUG();
508         if (tq_scheduler)
509                 goto handle_tq_scheduler;
510 tq_scheduler_back:
511
512         prev = current;
513         this_cpu = prev->processor;
514
515         if (in_interrupt())
516                 goto scheduling_in_interrupt;
517
518         release_kernel_lock(prev, this_cpu);


I thought it was odd that both systems chose to freak out last night when I 
have never seen this problem on either of them. The B160 is running a slightly 
newer kernel and had been up for about 3 days as of last night. The C3K had 
been up for 4-5 days. When I left last night the B160 was doing a build 
although the it looks like the build died before this problem occurred. The 
C3K was idle.

Any ideas?

Thanks,

-- 
Matt Taggart
taggart@fc.hp.com
