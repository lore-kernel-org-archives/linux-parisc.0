From: Helge Deller <deller-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [GIT PULL] parisc updates for v3.14
Date: Sun, 2 Feb 2014 12:15:52 +0100
Message-ID: <20140202111552.GA2221@ls3530.box>
References: <20140201202320.GA1313@p100.box>
 <CAFLxGvy7vbKmQzyNvTbk35DX5cFGS99CE=nYE_Q0c=LVuD1x9A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller-Mmb7MZpHnFY@public.gmane.org>,
	Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
To: Richard Weinberger <richard.weinberger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>,
	Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>,
	linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,
	James Bottomley <James.Bottomley-d9PhHud1JfjCXq6kfMZ53/egYHeGw8Jk@public.gmane.org>,
	James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>,
	linux-metag-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Return-path: <linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFLxGvy7vbKmQzyNvTbk35DX5cFGS99CE=nYE_Q0c=LVuD1x9A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <linux-metag.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

* Richard Weinberger <richard.weinberger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> On Sat, Feb 1, 2014 at 9:23 PM, Helge Deller <deller-Mmb7MZpHnFY@public.gmane.org> wrote:
> > please pull the latest updates for the parisc architecture from:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-for-3.14
> >
> > The three major changes in this patchset is a implementation for flexible
> > userspace memory maps, ....
> >
> > The change to fs/exec.c only touches code which affects parisc since it's
> > inside a #ifdef CONFIG_STACK_GROWSUP section (and parisc is the only platform
> > where the stack grows upwards).
> 
> What about metag?

Great! I didn't know that we now have another platform where the stack
grows upwards! Now we are not alone in this regard!

Anyway, the suggested & untested patch below should fix the metag arch
to cope which my changes to fs/exec.c  (unless the metag people want to
implement proper stack randomization too).  Either I can push it via the
parisc tree, or you can take it via the metag tree. Please let me know.


> > Helge Deller (5):
> >       parisc: add flexible mmap memory layout support
> > ...
> >  fs/exec.c                             |   3 +
(see:
http://git.kernel.org/cgit/linux/kernel/git/deller/parisc-linux.git/commit/?h=for-next&id=13de8ec38997357c9865a36a587439d9c5678932 )



[PATCH] metag: define STACK_RND_MASK as -1
 
Signed-off-by: Helge Deller <deller-Mmb7MZpHnFY@public.gmane.org>

diff --git a/arch/metag/include/asm/elf.h b/arch/metag/include/asm/elf.h
index d2baf69..089e37a 100644
--- a/arch/metag/include/asm/elf.h
+++ b/arch/metag/include/asm/elf.h
@@ -100,7 +100,7 @@ typedef unsigned long elf_fpregset_t;
 
 #define ELF_PLATFORM  (NULL)
 
-#define STACK_RND_MASK (0)
+#define STACK_RND_MASK (-1)
 
 #ifdef CONFIG_METAG_USER_TCM
 


--
To unsubscribe from this list: send the line "unsubscribe linux-metag" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
