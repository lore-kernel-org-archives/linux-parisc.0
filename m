From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: what's parisc execve_wrapper doing in the end?
Date: Fri, 05 Oct 2012 15:47:56 +0100
Message-ID: <1349448476.3638.60.camel@dabdike.int.hansenpartnership.com>
References: <20121004045150.GH23473@ZenIV.linux.org.uk>
	 <1349343019.2706.3.camel@dabdike.int.hansenpartnership.com>
	 <1349435268.3638.42.camel@dabdike.int.hansenpartnership.com>
	 <1349444664.3638.46.camel@dabdike.int.hansenpartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1349444664.3638.46.camel@dabdike.int.hansenpartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 2012-10-05 at 14:44 +0100, James Bottomley wrote:
> On Fri, 2012-10-05 at 12:07 +0100, James Bottomley wrote:
> > I tried out the code at
> > 
> > git://git.kernel.org/pub/scm/linux/kernel/git/viro/signal.git
> > experimental-kernel_thread
> > 
> > and it gives me this panic on boot.
> 
> OK, found the fix:  the idle thread is a kernel thread, but it doesn't
> come through kernel_thread().  The fix is to check for it (fortunately
> it has the signal usp == 0).
> 
> I'm now getting as freeing the init memory, which then hangs, so I
> suspect some type of execve failure trying to start the initrd... I'm
> debugging.

And the fix for this one is below: ret_from_kernel_execve has pt_regs in
%r26 ... it needs to be in %r16 for intr_return, so we just copy them
over.

With this, I can bring up the kernel all the way to a login prompt with
no apparent ill effects.

James

---

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 272c7a0..dd137fc 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -744,7 +744,8 @@ ENDPROC(ret_from_kernel_thread)
 ENTRY(ret_from_kernel_execve)
 	mfctl   %cr30, %r1
 	ldo	THREAD_SZ_ALGN(%r1), %r30
-	b,n	intr_return    /* forward */
+	b	intr_return    /* forward */
+	copy	%r26,%r16      /* pt_regs into r16 */
 ENDPROC(ret_from_kernel_execve)
 
 


