Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id CAA17487
	for <parisc-linux@puffin.external.hp.com>; Mon, 20 Nov 2000 02:11:28 -0700
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id UAA29641;
	Mon, 20 Nov 2000 20:05:58 +1100
Date: Mon, 20 Nov 2000 20:05:58 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Stan Sieler <sieler@allegro.com>
cc: John Marvin <jsm@udlkern.fc.hp.com>, parisc-linux@puffin.external.hp.com,
        parisc-linux@thepuffingroup.com
Subject: Re: Single-stepping
In-Reply-To: <200011200724.XAA07561@opus.allegro.com>
Message-ID: <Pine.LNX.4.21.0011201912260.15391-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Sun, 19 Nov 2000, Stan Sieler wrote:

> > bad idea after all, especially since the added syscall and task switch
> > overhead can be quite small if the kernel only supports single-step by
> > one instruction.
> 
> why the limit?  We've used multi-instruction "single step" (oxymoron :)
> for about 15 years on PA-RISC...no problems, efficient, and *very*
> useful!

Because you would then need to save and restore cr0 on task switches (or
only allow one task to be single-stepped at a time).  That's four
instructions and two extra memory accesses per task switch.  Which might
not seem very much, but at some point somebody will no doubt start caring
about pa-linux performance.  For a single-step by one, you can simply set
cr0 to zero on a task switch, and possibly avoid touching cr0 on a task
switch at all with careful attention to various trap handlers.

Here's the idea.  The tail of syscall_restore (64-bit stuff pruned) will
look like the following, with the first three instructions being the added
code to support single-step (and also wide/narrow switching for 64-bit)

	ldi	3,%r20
	mtctl	$r20,%cr0	/* recovery counter, ptrace single-step */
	LDREG	TASK_PT_PSW(%r1),%r20

	mtctl	%r1,%cr30			   /* intrhandler okay. */
	mfsp	%sr3,%r1			   /* Get users space id */
	mtsp	%r1,%sr4			   /* Restore sr4 */
	mtsp	%r1,%sr5			   /* Restore sr5 */
	mtsp	%r1,%sr6			   /* Restore sr6 */

	depi	3,31,2,%r31		/* ensure return to user mode. */

	mtsm	%r20				   /* restore irq state */
	mfctl	%cr27,%r20
	be	0(%sr3,%r31)			   /* return to user space */
	mtsp	%r1,%sr7			   /* Restore sr7 */

ptrace will fiddle with TASK_PT_PSW, setting the R bit and clearing the I
bit to enable the recovery counter - which will start counting down at the
mtsm instruction above, and reach zero on the user-space instruction, so
we'll trap after executing one user-space instruction.  The task-switch
nonsense is to handle the case where we page-fault on the instruction and
switch to another task also doing single-stepping.  You want to ensure cr0
is zero when we finally get back to the original task.

Now it might turn out that having extra instructions in the syscall path
is worse than extra code and memory accesses on task switch.  If that
turns out to be true, then you'll probably get your multi-step ptrace. :-)

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
