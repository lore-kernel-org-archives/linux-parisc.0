From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: what's parisc execve_wrapper doing in the end?
Date: Fri, 5 Oct 2012 15:48:19 +0100
Message-ID: <20121005144819.GO23473@ZenIV.linux.org.uk>
References: <20121004045150.GH23473@ZenIV.linux.org.uk>
 <1349343019.2706.3.camel@dabdike.int.hansenpartnership.com>
 <1349435268.3638.42.camel@dabdike.int.hansenpartnership.com>
 <1349444664.3638.46.camel@dabdike.int.hansenpartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1349444664.3638.46.camel@dabdike.int.hansenpartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Oct 05, 2012 at 02:44:24PM +0100, James Bottomley wrote:
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

Um...  I see, but I really wonder if that's the right fix.  FWIW, sparc
will have the same problem...  Hell knows.  OTOH, it's a nice way to
get of implicit interplay between copy_thread() and idle_regs() - note
that SMP architectures doing default idle_regs() need to be damn careful
about what they do in their "is that kernel thread" logics; all-zeros
pt_regs might give varying results on user_mode(regs) tests, etc.
Might be better to go for
	if (p->flags & PF_KTHREAD) {
		if (!usp) {
			we are starting an idle thread
		} else {
			we are setting things up for kernel_thread()
		}
	} else {
		we are forking
	}
kind of logics, looking at regs only in the last case.  And to hell with
(separate and overridable) idle_regs() once everything goes that way...
 
> I'm now getting as freeing the init memory, which then hangs, so I
> suspect some type of execve failure trying to start the initrd... I'm
> debugging.

What are you using for toolchain, BTW?  With gcc 4.3 / binutils 2.20
(cross-builds) I'm getting panics from mainline kernel on parisc32 all
way back to 2.6.28...
