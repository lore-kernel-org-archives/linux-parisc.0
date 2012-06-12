From: Kautuk Consul <consul.kautuk@gmail.com>
Subject: Re: [PATCH 17/19 v2] parisc/mm/fault.c: Port OOM changes to do_page_fault
Date: Tue, 12 Jun 2012 21:25:56 +0530
Message-ID: <CAFPAmTQCRzKDTSTC+sHu4vPUgNYN70XqY4BzgPA_=jxJ4EOVLQ@mail.gmail.com>
References: <1333195588-5490-1-git-send-email-consul.kautuk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: jejb@parisc-linux.org, Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1333195588-5490-1-git-send-email-consul.kautuk@gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi,

Can you please review this patch ?

Many archs have actually accepted this change so I think maybe this is =
okay. :)

Thanks,
Kautuk.

On Sat, Mar 31, 2012 at 5:36 PM, Kautuk Consul <consul.kautuk@gmail.com=
> wrote:
> Commit d065bd810b6deb67d4897a14bfe21f8eb526ba99
> (mm: retry page fault when blocking on disk transfer) and
> commit 37b23e0525d393d48a7d59f870b3bc061a30ccdb
> (x86,mm: make pagefault killable)
>
> The above commits introduced changes into the x86 pagefault handler
> for making the page fault handler retryable as well as killable.
>
> These changes reduce the mmap_sem hold time, which is crucial
> during OOM killer invocation.
>
> Signed-off-by: Kautuk Consul <consul.kautuk@gmail.com>
> ---
> =A0arch/parisc/mm/fault.c | =A0 29 ++++++++++++++++++++++++-----
> =A01 files changed, 24 insertions(+), 5 deletions(-)
>
> diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
> index 18162ce..bd66ed6 100644
> --- a/arch/parisc/mm/fault.c
> +++ b/arch/parisc/mm/fault.c
> @@ -175,10 +175,12 @@ void do_page_fault(struct pt_regs *regs, unsign=
ed long code,
> =A0 =A0 =A0 =A0struct mm_struct *mm =3D tsk->mm;
> =A0 =A0 =A0 =A0unsigned long acc_type;
> =A0 =A0 =A0 =A0int fault;
> + =A0 =A0 =A0 unsigned int flags =3D FAULT_FLAG_ALLOW_RETRY | FAULT_F=
LAG_KILLABLE;
>
> =A0 =A0 =A0 =A0if (in_atomic() || !mm)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto no_context;
>
> +retry:
> =A0 =A0 =A0 =A0down_read(&mm->mmap_sem);
> =A0 =A0 =A0 =A0vma =3D find_vma_prev(mm, address, &prev_vma);
> =A0 =A0 =A0 =A0if (!vma || address < vma->vm_start)
> @@ -201,7 +203,12 @@ good_area:
> =A0 =A0 =A0 =A0 * fault.
> =A0 =A0 =A0 =A0 */
>
> - =A0 =A0 =A0 fault =3D handle_mm_fault(mm, vma, address, (acc_type &=
 VM_WRITE) ? FAULT_FLAG_WRITE : 0);
> + =A0 =A0 =A0 fault =3D handle_mm_fault(mm, vma, address,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 flags | ((acc_type & VM=
_WRITE) ? FAULT_FLAG_WRITE : 0));
> +
> + =A0 =A0 =A0 if ((fault & VM_FAULT_RETRY) && fatal_signal_pending(cu=
rrent))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
> +
> =A0 =A0 =A0 =A0if (unlikely(fault & VM_FAULT_ERROR)) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/*
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * We hit a shared mapping outside of =
the file, or some
> @@ -214,10 +221,22 @@ good_area:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto bad_area;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0BUG();
> =A0 =A0 =A0 =A0}
> - =A0 =A0 =A0 if (fault & VM_FAULT_MAJOR)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 current->maj_flt++;
> - =A0 =A0 =A0 else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 current->min_flt++;
> + =A0 =A0 =A0 if (flags & FAULT_FLAG_ALLOW_RETRY) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (fault & VM_FAULT_MAJOR)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 current->maj_flt++;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 current->min_flt++;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (fault & VM_FAULT_RETRY) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 flags &=3D ~FAULT_FLAG_=
ALLOW_RETRY;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* No need to up_rea=
d(&mm->mmap_sem) as we would
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* have already relea=
sed it in __lock_page_or_retry
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* in mm/filemap.c.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto retry;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 }
> =A0 =A0 =A0 =A0up_read(&mm->mmap_sem);
> =A0 =A0 =A0 =A0return;
>
> --
> 1.7.5.4
>
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
