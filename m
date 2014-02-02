From: Helge Deller <deller-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [GIT PULL] parisc updates for v3.14 (new pull request)
Date: Sun, 2 Feb 2014 21:20:24 +0100
Message-ID: <20140202202024.GA7924@p100.box>
References: <20140201202320.GA1313@p100.box>
 <CAFLxGvy7vbKmQzyNvTbk35DX5cFGS99CE=nYE_Q0c=LVuD1x9A@mail.gmail.com>
 <20140202111552.GA2221@ls3530.box>
 <CA+55aFyoR0DHsbJ8qaE5mEmveZwnxDpxapXZdxHZ-BJnE0CDLQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller-Mmb7MZpHnFY@public.gmane.org>,
	Richard Weinberger <richard.weinberger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>,
	James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>,
	linux-metag-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>,
	linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,
	James Bottomley <James.Bottomley-d9PhHud1JfjCXq6kfMZ53/egYHeGw8Jk@public.gmane.org>
Return-path: <linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+55aFyoR0DHsbJ8qaE5mEmveZwnxDpxapXZdxHZ-BJnE0CDLQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <linux-metag.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Linus,

* Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>:
> On Sun, Feb 2, 2014 at 3:15 AM, Helge Deller <deller-Mmb7MZpHnFY@public.gmane.org> wrote:
> >
> > Anyway, the suggested & untested patch below should fix the metag arch
> > to cope which my changes to fs/exec.c
> > ...
> > -#define STACK_RND_MASK (0)
> > +#define STACK_RND_MASK (-1)
> 
> I don't think that works. That completely breaks randomize_stack_top().
> So I'm not going to pull the parisc tree, this needs to be resolved sanely.
> In fact, I think that change to fs/exec.c is just completely broken:
> +       /* add some more stack size for stack randomization */
> +       stack_base += STACK_RND_MASK + 1;
> and that "+1" just doesn't make sense, and fundamentally breaks STACK_RND_MASK.
> It also seems to be entirely pointless, since the PAGE_ALIGN() that
> comes right afterwards will effectively do it anyway.
> 
> So NAK on that whole fs/exec.c change. Afaik it's just wrong, and it's stupid.

You are completely right - I have no idea what I was thinking.
I have removed completely the changes to fs/exec.c, built up a new
tree for you to pull and boot-tested it with 32- and 64bit parisc kernels.

Can you please consider pulling this new tree?
The full request follows here:
-------

Hi Linus,

please pull the latest updates for the parisc architecture from:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-3.14

The three major changes in this patchset is a implementation for
flexible userspace memory maps, cache-flushing fixes (again), and a
long-discussed ABI change to make EWOULDBLOCK the same value as EAGAIN.

parisc has been the only platform where we had EWOULDBLOCK != EAGAIN to
keep HP-UX compatibility.  Since we will probably never implement full
HP-UX support, we prefer to drop this compatibility to make it easier
for us with Linux userspace programs which mostly never checked for both
values.  We don't expect major fall-outs because of this change, and if
we face some, we will simply rebuild the necessary applications in the
debian archives.

Thanks,
Helge

----------------------------------------------------------------
Guy Martin (1):
      parisc: Make EWOULDBLOCK be equal to EAGAIN on parisc

Helge Deller (5):
      parisc/sti_console: prefer Linux fonts over built-in ROM fonts
      parisc: fix cache-flushing
      parisc: wire up sched_setattr and sched_getattr
      parisc: convert uapi/asm/stat.h to use native types only
      parisc: add flexible mmap memory layout support

 arch/parisc/include/asm/cacheflush.h  |   2 -
 arch/parisc/include/asm/elf.h         |   4 +
 arch/parisc/include/asm/page.h        |   3 +-
 arch/parisc/include/asm/pgtable.h     |   1 +
 arch/parisc/include/asm/processor.h   |   2 +
 arch/parisc/include/asm/thread_info.h |  10 ++
 arch/parisc/include/uapi/asm/errno.h  |   2 +-
 arch/parisc/include/uapi/asm/stat.h   |  40 +++---
 arch/parisc/include/uapi/asm/unistd.h |   4 +-
 arch/parisc/kernel/cache.c            |  14 ++
 arch/parisc/kernel/process.c          |  21 ++-
 arch/parisc/kernel/sys_parisc.c       | 238 ++++++++++++++++++++++++++++------
 arch/parisc/kernel/syscall_table.S    |   2 +
 drivers/video/console/sticore.c       |   2 +-
 lib/fonts/Kconfig                     |   6 +-
 15 files changed, 278 insertions(+), 73 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe linux-metag" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
