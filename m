From: John David Anglin <dave.anglin@bell.net>
Subject: Re: possible virtual aliasing issues on parisc ?
Date: Sun, 4 Nov 2012 19:29:06 -0500
Message-ID: <BLU0-SMTP69F46452FE3E7DDDF6109997640@phx.gbl>
References: <CANN689E4p3woSkdLavyyPA2gZUmVvOAW4w0R6fo9exRPQDa=JA@mail.gmail.com> <1351848864.2439.18.camel@dabdike.int.hansenpartnership.com> <1351854504.2439.20.camel@dabdike.int.hansenpartnership.com> <CANN689HPeQhYCDcFenTH35iBL8zV7vpHvsQUJQOD=Vz3Z9D3bQ@mail.gmail.com> <1351859453.2439.24.camel@dabdike.int.hansenpartnership.com>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Michel Lespinasse <walken@google.com>,
	Helge Deller <deller@gmx.de>,
	Parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1351859453.2439.24.camel@dabdike.int.hansenpartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2-Nov-12, at 8:30 AM, James Bottomley wrote:

> On Fri, 2012-11-02 at 04:20 -0700, Michel Lespinasse wrote:
>> On Fri, Nov 2, 2012 at 4:08 AM, James Bottomley
>> <James.Bottomley@hansenpartnership.com> wrote:
>>> On Fri, 2012-11-02 at 09:34 +0000, James Bottomley wrote:
>>>>> Looking at the arch/parisc/kernel/sys_parisc.c implementation of
>>>>> get_shared_area(), I do have a concern though. The function  
>>>>> basically
>>>>> ignores the pgoff argument, so that if one creates a shared  
>>>>> mapping of
>>>>> pages 0-N of a file, and then a separate shared mapping of pages  
>>>>> 1-N
>>>>> of that same file, both will have the same cache offset for their
>>>>> starting address.
>>>>>
>>>>> This looks like this would create obvious aliasing issues. Am I
>>>>> misreading this ? I can't understand how this could work good  
>>>>> enough
>>>>> to be undetected, so there must be something I'm missing here ???
>>>>
>>>> No, I think it does.
>>>>
>>>> I also think the pgoff != 0 case is rare, so it doesn't show very  
>>>> often.
>>>> To test this, I booted up with a printk for every pgoff != 0 and it
>>>> didn't trigger, so it's probably not seen in the ordinary course of
>>>> events.
>>>
>>> I got it to show: Git uses mmap2 with large page offsets.   
>>> However, it
>>> seems to use offsets with a granularity of 16MB which is 4x our  
>>> aliasing
>>> congruency, so an equivalency problem still wouldn't show up.
>>
>> All right. Thanks for looking it up - I just wasn't sure if my  
>> reading
>> of the code was correct (and, I am surprised this isn't more  
>> common :)
>
> Well, I can fix it like this, but until something actually causes an
> inequivalency, I'll keep it as a low priority bug fix.
>
> James
>
> ---
>
> diff --git a/arch/parisc/kernel/sys_parisc.c b/arch/parisc/kernel/ 
> sys_parisc.c
> index 7426e40..f76c108 100644
> --- a/arch/parisc/kernel/sys_parisc.c
> +++ b/arch/parisc/kernel/sys_parisc.c
> @@ -73,6 +73,8 @@ static unsigned long get_shared_area(struct  
> address_space *mapping,
> 	struct vm_area_struct *vma;
> 	int offset = mapping ? get_offset(mapping) : 0;
>
> +	offset = (offset + (pgoff << PAGE_SHIFT)) & 0x3FF000;
> +
> 	addr = DCACHE_ALIGN(addr - offset) + offset;
>
> 	for (vma = find_vma(current->mm, addr); ; vma = vma->vm_next) {


I have the sense that this may fix
http://thread.gmane.org/gmane.linux.ports.parisc/4027/focus=4278
as I haven't seen the problem since I added the above change to my
patch list.

The check for inequivalent aliases in flush_dcache_page isn't  
perfect.  I've only seen
it trigger when a core dump is generated.

Dave
--
John David Anglin	dave.anglin@bell.net



