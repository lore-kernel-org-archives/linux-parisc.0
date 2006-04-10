From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] [RFC] pselect/ppoll support
Date: Sun, 9 Apr 2006 22:16:15 -0400
Message-ID: <20060410021615.GC27661@quicksilver.road.mcmartin.ca>
References: <20060409182521.GA27661@quicksilver.road.mcmartin.ca>
	<119aab440604091906m19b9bf33yfd9e8b1cbff22844@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440604091906m19b9bf33yfd9e8b1cbff22844@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Apr 09, 2006 at 10:06:03PM -0400, Carlos O'Donell wrote:
> > -       .export sys_rt_sigsuspend_wrapper
> > -sys_rt_sigsuspend_wrapper:
<snip>
> > -
> > -       bv      %r0(%r2)
> > -       nop
> > -
> 
> This needs more review.
>

As far as I could tell, this was just massaging to get the pt_regs
for sys_rt_sigsuspend, so if we use the generic one, it could go too.
 
> > -asmlinkage int
> > -sys_rt_sigsuspend(sigset_t __user *unewset, size_t sigsetsize, struct pt_regs *regs)
> 
> You've switched over to the kernel generic version of
> sys_rt_sigsuspend, and you will have to review if it does exactly what
> our version was doing. I suspect it's slightly different, and you
> problems start here.
> 

I did a quick comparison of the two, and it seemed to be mostly the
same. Someone who is more clued in should make sure I'm not on drugs
though.

<snip>
> I believe we've always had a race condition in this trampoline.
> I'm raising this issue so we can remember that it's there or
> completely squash the issue. While returning to userspace
> you *cannot* take another restart since the restarts are not
> nestable. You must disable restarts and then reenable them
> when you return from the trampoline. Linus wrote an email about
> this issue. Has this been fixed for us?
>

NFC.
 
> > +       if (!user_mode(regs))
> > +               return;
> 
> Don't delete the comment unless you are willing to replace it with
> one that explains why this might be the case. Please think about
> kernel mode threads and why we don't do this for them.
>

I'm just playing follow the leader through most of this routine.
 
> > -       while (1) {
> > -
> Have other arches changed their handlers?
> Are we no longer required to loop in an attempt to deliver the signal?
>

We loop in entry.S if we still have SIGPENDING set. AFAICT, this 
looping was redundant. Unless we can jump out of do_signal without
hitting intr_check_sig && syscall_check_sig, I'm not sure...

Cheers!
	Kyle 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
