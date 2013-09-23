From: Felipe Pena <felipensp@gmail.com>
Subject: Re: [PATCH 1/1] arch/parisc: mm: fix uninitialized variable usage
Date: Sun, 22 Sep 2013 21:23:09 -0300
Message-ID: <CA+5g0SKx-xGs1RiyDGYsCKMCzQN3QoEt+n=+Yiguk5iZs=0=oA@mail.gmail.com>
References: <1379873866-29219-1-git-send-email-felipensp@gmail.com> <20130922225809.GL856@cmpxchg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>,
	linux-parisc@vger.kernel.org, Michal Hocko <mhocko@suse.cz>,
	linux-kernel@vger.kernel.org,
	Kautuk Consul <consul.kautuk@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Helge Deller <deller@gmx.de>
To: Johannes Weiner <hannes@cmpxchg.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130922225809.GL856@cmpxchg.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hello Johannes,

On Sun, Sep 22, 2013 at 7:58 PM, Johannes Weiner <hannes@cmpxchg.org> wrote:
> Hello Felipe,
>
> On Sun, Sep 22, 2013 at 03:17:46PM -0300, Felipe Pena wrote:
>> The FAULT_FLAG_WRITE flag has been set based on uninitialized variable
>
> Oops, you are right.
>
>> Signed-off-by: Felipe Pena <felipensp@gmail.com>
>> ---
>>  arch/parisc/mm/fault.c |    5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
>> index d10d27a..6b38026 100644
>> --- a/arch/parisc/mm/fault.c
>> +++ b/arch/parisc/mm/fault.c
>> @@ -182,8 +182,6 @@ void do_page_fault(struct pt_regs *regs, unsigned long code,
>>
>>       if (user_mode(regs))
>>               flags |= FAULT_FLAG_USER;
>> -     if (acc_type & VM_WRITE)
>> -             flags |= FAULT_FLAG_WRITE;
>>  retry:
>>       down_read(&mm->mmap_sem);
>>       vma = find_vma_prev(mm, address, &prev_vma);
>> @@ -201,6 +199,9 @@ good_area:
>>       if ((vma->vm_flags & acc_type) != acc_type)
>>               goto bad_area;
>>
>> +     if (acc_type & VM_WRITE)
>> +             flags |= FAULT_FLAG_WRITE;
>
> Can acc_type actually change between between the first round and a
> retry?  Otherwise, it might make sense to pull this up and place it
> next to the flag initialization instead of pulling one flag down.

>From what I've analyzed, this make sense. I'll make the suggested
changes and send another patch.

Thanks.

-- 
Regards,
Felipe Pena
