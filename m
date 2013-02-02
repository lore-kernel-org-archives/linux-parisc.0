From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 17/19 v2] parisc/mm/fault.c: Port OOM changes to do_page_fault
Date: Sat, 02 Feb 2013 20:58:25 +0100
Message-ID: <510D6FE1.7060507@gmx.de>
References: <1333195588-5490-1-git-send-email-consul.kautuk@gmail.com> <CAFPAmTQCRzKDTSTC+sHu4vPUgNYN70XqY4BzgPA_=jxJ4EOVLQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: Kautuk Consul <consul.kautuk@gmail.com>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CAFPAmTQCRzKDTSTC+sHu4vPUgNYN70XqY4BzgPA_=jxJ4EOVLQ@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Kautuk,

sorry for the very late reply!

Anyway, the patch seems OK, and we will include it in the next parisc kernel.

THANKS!!!

Helge

@Dave, James: 
- This is the patch "11" in Dave's package...
- Kautuk even sent a testcase: http://marc.info/?l=linux-mm&m=133319623304492&w=2




On 06/12/2012 05:55 PM, Kautuk Consul wrote:
> Hi,
> 
> Can you please review this patch ?
> 
> Many archs have actually accepted this change so I think maybe this is okay. :)
> 
> Thanks,
> Kautuk.
> 
> On Sat, Mar 31, 2012 at 5:36 PM, Kautuk Consul <consul.kautuk@gmail.com> wrote:
>> Commit d065bd810b6deb67d4897a14bfe21f8eb526ba99
>> (mm: retry page fault when blocking on disk transfer) and
>> commit 37b23e0525d393d48a7d59f870b3bc061a30ccdb
>> (x86,mm: make pagefault killable)
>>
>> The above commits introduced changes into the x86 pagefault handler
>> for making the page fault handler retryable as well as killable.
>>
>> These changes reduce the mmap_sem hold time, which is crucial
>> during OOM killer invocation.
>>
>> Signed-off-by: Kautuk Consul <consul.kautuk@gmail.com>
>> ---
>>  arch/parisc/mm/fault.c |   29 ++++++++++++++++++++++++-----
>>  1 files changed, 24 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
>> index 18162ce..bd66ed6 100644
>> --- a/arch/parisc/mm/fault.c
>> +++ b/arch/parisc/mm/fault.c
>> @@ -175,10 +175,12 @@ void do_page_fault(struct pt_regs *regs, unsigned long code,
>>        struct mm_struct *mm = tsk->mm;
>>        unsigned long acc_type;
>>        int fault;
>> +       unsigned int flags = FAULT_FLAG_ALLOW_RETRY | FAULT_FLAG_KILLABLE;
>>
>>        if (in_atomic() || !mm)
>>                goto no_context;
>>
>> +retry:
>>        down_read(&mm->mmap_sem);
>>        vma = find_vma_prev(mm, address, &prev_vma);
>>        if (!vma || address < vma->vm_start)
>> @@ -201,7 +203,12 @@ good_area:
>>         * fault.
>>         */
>>
>> -       fault = handle_mm_fault(mm, vma, address, (acc_type & VM_WRITE) ? FAULT_FLAG_WRITE : 0);
>> +       fault = handle_mm_fault(mm, vma, address,
>> +                       flags | ((acc_type & VM_WRITE) ? FAULT_FLAG_WRITE : 0));
>> +
>> +       if ((fault & VM_FAULT_RETRY) && fatal_signal_pending(current))
>> +               return;
>> +
>>        if (unlikely(fault & VM_FAULT_ERROR)) {
>>                /*
>>                 * We hit a shared mapping outside of the file, or some
>> @@ -214,10 +221,22 @@ good_area:
>>                        goto bad_area;
>>                BUG();
>>        }
>> -       if (fault & VM_FAULT_MAJOR)
>> -               current->maj_flt++;
>> -       else
>> -               current->min_flt++;
>> +       if (flags & FAULT_FLAG_ALLOW_RETRY) {
>> +               if (fault & VM_FAULT_MAJOR)
>> +                       current->maj_flt++;
>> +               else
>> +                       current->min_flt++;
>> +               if (fault & VM_FAULT_RETRY) {
>> +                       flags &= ~FAULT_FLAG_ALLOW_RETRY;
>> +
>> +                        /* No need to up_read(&mm->mmap_sem) as we would
>> +                        * have already released it in __lock_page_or_retry
>> +                        * in mm/filemap.c.
>> +                        */
>> +
>> +                       goto retry;
>> +               }
>> +       }
>>        up_read(&mm->mmap_sem);
>>        return;
>>
>> --
>> 1.7.5.4
>>

