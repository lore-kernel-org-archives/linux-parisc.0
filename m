From: gregkh <gregkh@linuxfoundation.org>
Subject: Re: [GIT PULL] parisc fixes for kernel v4.19
Date: Wed, 3 Oct 2018 16:02:26 -0700
Message-ID: <20181003230226.GB27729@kroah.com>
References: <20181002210213.GA17826@ls3530.fritz.box>
 <20181002211645.GA6454@kroah.com>
 <ad45f249-e064-d5a4-c658-eaa03bb3a04a@gmx.de>
 <20181002222452.GB11788@kroah.com>
 <dbfa0162-8ed1-b16e-a418-da3b92c76230@gmx.de>
 <20181003181612.GB28575@kroah.com>
 <CAK8P3a2ntPX4+LbYWJbDG1k-8NwkhyY0nYk-mfZU2FBF_h23Yw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller@gmx.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        James.Bottomley@hansenpartnership.com,
        John David Anglin <dave.anglin@bell.net>
To: Arnd Bergmann <arnd@arndb.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a2ntPX4+LbYWJbDG1k-8NwkhyY0nYk-mfZU2FBF_h23Yw@mail.gmail.com>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Oct 03, 2018 at 09:49:08PM +0200, Arnd Bergmann wrote:
> On Wed, Oct 3, 2018 at 8:16 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> > On Wed, Oct 03, 2018 at 04:47:30PM +0200, Helge Deller wrote:
> > > On 03.10.2018 00:24, Greg Kroah-Hartman wrote:
> > > > On Tue, Oct 02, 2018 at 11:46:11PM +0200, Helge Deller wrote:
> > > >>
> > > >> I've tagged it for stable release.
> > > >> So, it can go in now, or just wait until -rc1 and go in later.
> > > >
> > > > Why is a major API change a viable stable change?
> > >
> > > Of course it's not.
> > > Esp. not if an API has been used already.
> > > IMHO, this case is really different though...
> > >
> > > > What bugfix does it provide?
> > >
> > > It fixes that code in stable kernels which would return wrong
> > > time values *if* someone would create a libc for 64-bit parisc
> > > and would run it with those "stable" kernels.
> > > Fixing it now has no side-effects, the change is a trivial
> > > 2-line-removal patch, would bring the code in sync with
> > > newer kernel source code, and it really fixes existing code.
> > >
> > > I still believe that this justifies for a backport.
> > >
> > > Nevertheless, if you really disagree, I'm fine dropping the
> > > backport to stable and will only push it in the next
> > > merge window for v4.20.
> >
> > To clarify, you have no users of this api anywhere (hopefully), and so
> > the patch in question prevents anyone from using the api in the future.
> > This makes the suseconds_t handling easier for some reason because only
> > sparc32 is a "problem" now, right?
> >
> > So I don't see the "bug" that is being fixed here.  I would have pushed
> > back on the submission for this for the stable trees as well, this isn't
> > anything that anyone is using, so there's nothing to "fix" that I can
> > tell.
> >
> > Yes, doing it in the "future" is fine, to prevent anyone from making
> > this mistake (are new machines even being made for this arch?)  But I
> > don't see how this is a -stable issue.
> 
> The issue here is that glibc has in theory supported 64-bit parisc
> user space for a long time, but it has never worked because of the
> mismatch. It is very likely that there other problems like it that
> /also/ prevent it from working.
> 
> Between changing kernel or glibc, I think it's clear that the glibc
> has made the better choice of being compatible with all other
> architectures (except sparc64), so changing the kernel is better
> here.
> 
> Between fixing it this late, or doing it for the next merge window,
> I don't care. There clearly are no users that are affected by it
> today, and if there were, this would fix an important bug, both
> security (kernel stack information leak) and functionality
> (improving accuracy of gettimeofday() from seconds to
> microseconds).
> 
> Between backporting it to stable or not, I'd be in favor of the
> backport: If we ever want to support 64-bit user space on parisc,
> then it's better to have stable kernels get the same working
> ABI that new kernels have after the fix (and any other fixes we
> may require on top). Or to put it another way: If the argument is
> that there won't ever be a 64-bit user space for parisc and we don't
> care about it, then we'd be better of removing all native 64-bit
> syscalls from arch/parisc/kernel/syscall_table.S.

Ok, then let's treat this like any other arch/driver/subsystem that we
remove.  Drop the file(s) in a -rc1 merge window and then if anyone
object to it later on because they really were using it, you can easily
revert that change.

We do not backport removals of drivers/subsystems/arches to stable
kernels, so this shouldn't happen here either.

thanks,

greg k-h
