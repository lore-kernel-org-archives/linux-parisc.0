Received: from rhirst.linuxcare.com (sleepie.demon.co.uk [194.222.23.208])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id GAA25911
	for <parisc-linux@puffin.external.hp.com>; Thu, 16 Nov 2000 06:20:47 -0700
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id EA18EB007; Thu, 16 Nov 2000 13:20:17 +0000 (GMT)
Date: Thu, 16 Nov 2000 13:20:17 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@puffin.external.hp.com
Subject: Re: Single-stepping
Message-ID: <20001116132017.W32715@linuxcare.com>
References: <200011161244.FAA03502@udlkern.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200011161244.FAA03502@udlkern.fc.hp.com>; from jsm@udlkern.fc.hp.com on Thu, Nov 16, 2000 at 05:44:55AM -0700
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Nov 16, 2000 at 05:44:55AM -0700, John Marvin wrote:
> > Current code does
> >
> >     /* Nullified, just crank over the queue. */
> >     task_regs(child)->iaoq[0] = task_regs(child)->iaoq[1];
> >     task_regs(child)->iasq[0] = task_regs(child)->iasq[1];
> >     task_regs(child)->iaoq[1] = task_regs(child)->iaoq[0] + 4;
> >
> > Does that look right to you?
> 
> Yes, that is the correct way to do it (I'll assume the duplicated line
> is just a cut/paste error).

It's not duplicated (iaoq v. iasq).

> > At the moment my test harness notes IAOQ=0x100 and stops single stepping,
> > but obviously the kernel needs to enforce that.
> >
> You should also be checking the space. But yes, the kernel needs to enforce
> this for security reasons. You should be able to do it in the recovery
> counter trap handler (rather than having to test for it in the syscall
> path, which affects all processes).

I might come back to you on that when I've thought some more.

Thanks,
  Richard
