From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] Don't mlock guardpage if the stack is growing up
Date: Sun, 8 May 2011 14:47:33 -0700
Message-ID: <BANLkTikEpaRZK3X4YReeQAwgcv3HAGUwSw@mail.gmail.com>
References: <alpine.DEB.2.00.1105082045250.15552@artax.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	Hugh Dickins <hughd@google.com>,
	Oleg Nesterov <oleg@redhat.com>
To: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1105082045250.15552@artax.karlin.mff.cuni.cz>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, May 8, 2011 at 11:55 AM, Mikulas Patocka
<mikulas@artax.karlin.mff.cuni.cz> wrote:
>
> This patch fixes lvm2 on PA-RISC (and possibly other architectures wi=
th
> up-growing stack). lvm2 calculates the number of used pages when lock=
ing
> and when unlocking and reports an internal error if the numbers misma=
tch.

This patch won't apply on current kernels (including stable) because
of commit a1fde08c74e9 that changed the test of "pages" to instead
just test "flags & FOLL_MLOCK".

That should be trivial to fix up.

However, I really don't much like this complex test:

> =A0static inline int stack_guard_page(struct vm_area_struct *vma, uns=
igned long addr)
> =A0{
> - =A0 =A0 =A0 return (vma->vm_flags & VM_GROWSDOWN) &&
> + =A0 =A0 =A0 return ((vma->vm_flags & VM_GROWSDOWN) &&
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(vma->vm_start =3D=3D addr) &&
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 !vma_stack_continue(vma->vm_prev, addr)=
;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 !vma_stack_continue(vma->vm_prev, addr)=
) ||
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0((vma->vm_flags & VM_GROWSUP) &&
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 (vma->vm_end =3D=3D addr + PAGE_SIZE) &=
&
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 !vma_stack_growsup_continue(vma->vm_nex=
t, addr + PAGE_SIZE));
> =A0}

in that format. It gets really hard to read, and I think you'd be
better off writing it as two helper functions (or macros) for the two
cases, and then have

  static inline int stack_guard_page(struct vm_area_struct *vma,
unsigned long addr)
  {
    return stack_guard_page_growsdown(vma, addr) ||
      stack_guard_page_growsup(vma, addr);
  }

I'd also like to verify that it doesn't actually generate any extra
code for the common case (iirc VM_GROWSUP is 0 for the architectures
that don't need it, and so the compiler shouldn't generate any extra
code, but I'd like that mentioned and verified explicitly).

Hmm?

Other than that it looks ok to me.

That said, could we please fix LVM to not do that crazy sh*t in the
first place? The STACK_GROWSUP case is never going to have a lot of
testing, this is just sad.

                   Linus
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
