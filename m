From: Peter Zijlstra <a.p.zijlstra@chello.nl>
Subject: [parisc-linux] Re: Removing MAX_ARG_PAGES (request for
	comments/assistance)
Date: Wed, 11 Oct 2006 15:14:20 +0200
Message-ID: <1160572460.2006.79.camel__28379.2507056662$1416624192$gmane$org@taijtu>
References: <65dd6fd50610101705t3db93a72sc0847cd120aa05d3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Andrew Morton <akpm@osdl.org>,
 linux-arch@vger.kernel.org,
 Andi Kleen <ak@muc.de>,
 linux-kernel@vger.kernel.org,
 David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org,
 Linus Torvalds <torvalds@osdl.org>,
 Ingo Molnar <mingo@elte.hu>,
 parisc-linux@lists.parisc-linux.org,
 Arjan van de Ven <arjan@infradead.org>
To: Ollie Wild <aaw@google.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <65dd6fd50610101705t3db93a72sc0847cd120aa05d3@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, 2006-10-10 at 17:05 -0700, Ollie Wild wrote:

> +                       vma->vm_flags &= ~VM_EXEC;
> +               // FIXME: Are the next two lines sufficient, or do I need to
> +               // do some additional magic?
> +               vma->vm_flags |= mm->def_flags;
> +               vma->vm_page_prot = protection_map[vma->vm_flags & 0x7];

Yeah, you'll need to change the PTEs for those pages you created by
calling get_user_page() by calling an mprotect like function; perhaps
something like:

 struct vm_area_struct *prev;
 unsigned long vm_flags = vma->vm_flags;

 s/vma->vm_flags/vm_flags/g

 err = mprotect_fixup(vma, &prev, vma->vm_start, vma->vm_end, vm_flags);
 BUG_ON(prev != vma);

mprotect_fixup will then set the new protection on all PTEs and update
vma->vm_flags and vma->vm_page_prot.

> +               /* Move stack pages down in memory. */
> +               if (stack_shift) {
> +                       // FIXME: Verify the shift is OK.
> +

What exactly are you wondering about? the call to move_vma looks sane to
me

> +                       /* This should be safe even with overlap because we
> +                        * are shifting down. */
> +                       ret = move_vma(vma, vma->vm_start,
> +                                       vma->vm_end - vma->vm_start,
> +                                       vma->vm_end - vma->vm_start,
> +                                       vma->vm_start - stack_shift);
> +                       if (ret & ~PAGE_MASK) {
> +                               up_write(&mm->mmap_sem);
> +                               return ret;
> +                       }
>                 }


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
