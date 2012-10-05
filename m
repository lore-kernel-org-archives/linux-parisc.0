From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: what's parisc execve_wrapper doing in the end?
Date: Fri, 05 Oct 2012 14:44:24 +0100
Message-ID: <1349444664.3638.46.camel@dabdike.int.hansenpartnership.com>
References: <20121004045150.GH23473@ZenIV.linux.org.uk>
	 <1349343019.2706.3.camel@dabdike.int.hansenpartnership.com>
	 <1349435268.3638.42.camel@dabdike.int.hansenpartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1349435268.3638.42.camel@dabdike.int.hansenpartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 2012-10-05 at 12:07 +0100, James Bottomley wrote:
> I tried out the code at
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/viro/signal.git
> experimental-kernel_thread
> 
> and it gives me this panic on boot.

OK, found the fix:  the idle thread is a kernel thread, but it doesn't
come through kernel_thread().  The fix is to check for it (fortunately
it has the signal usp == 0).

I'm now getting as freeing the init memory, which then hangs, so I
suspect some type of execve failure trying to start the initrd... I'm
debugging.

James

---

diff --git a/arch/parisc/kernel/process.c b/arch/parisc/kernel/process.c
index a67f122..44e8534 100644
--- a/arch/parisc/kernel/process.c
+++ b/arch/parisc/kernel/process.c
@@ -254,7 +254,7 @@ copy_thread(unsigned long clone_flags, unsigned long usp,
 	extern void * const hpux_child_return;
 #endif
 
-	if (unlikely(p->flags & PF_KTHREAD)) {
+	if (unlikely((p->flags & PF_KTHREAD) && usp != 0)) {
 		memset(cregs, 0, sizeof(struct pt_regs));
 		/* kernel thread */
 		cregs->ksp = (unsigned long)stack + THREAD_SZ_ALGN;


