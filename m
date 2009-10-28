From: Helge Deller <deller@gmx.de>
Subject: Re: Out of order unwind entry warning
Date: Wed, 28 Oct 2009 23:43:36 +0100
Message-ID: <4AE8C918.8060908@gmx.de>
References: <20091028221827.1B7774E38@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-parisc@vger.kernel.org, carlos@systemhalted.org,
	randolph@tausq.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091028221827.1B7774E38@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 10/28/2009 11:18 PM, John David Anglin wrote:
>> On 10/28/2009 12:19 AM, John David Anglin wrote:
>>>>
>>>> I started to look into the problem why we get the
>>>>> WARNING: Out of order unwind entry!
>>>> warning messages at kernel bootup in dmesg.
>>>>
>>>> It's related to a binutils/linker bug, that ld does not correctly
>>>> removes unlink information for unused weak symbols, which have been
>>>> replaced by their non-weak ones.
>>>>
>>>> In my kernel I could track it down to 2 symbols:
>>>> - arch_mod_section_prepend()  from kernel/module.c, and
>>>> - save_stack_trace_tsk().
>>>>
>>>> Here is the extract of the readelf output on vmlinux:
>>>> ...
>>>> <inb>: [0x1011fbd4-0x1011fc48]
>>>>            Entry_GR=1 Save_SP Save_RP Total_frame_size=8
>>>> <arch_mod_section_prepend>: [0x1011fc4c-0x1011fc74]
>>>>            Entry_GR=1 Save_SP Total_frame_size=8
>>>> <arch_mod_section_prepend>: [0x1011fc4c-0x10167cf4]
>>>>            Entry_GR=1 Save_SP Total_frame_size=8
>>>> <module_arch_cleanup>: [0x1011fc78-0x1011fcb8]
>>>>            Entry_GR=2 Save_SP Save_RP Total_frame_size=8
>>>> ...
>>>
>>> It might be useful to know the actual location arch_mod_section_prepend
>>> and whether it follows inb in its .o.  From my understanding of things,
>>> it shouldn't be necessary to remove the unwind info for unused weak
>>> symbols if they aren't garbage collected.  A simple testcase would
>>> be helpful.
>>
>> arch_mod_section_prepend() is here:
>> * arch/parisc/kernel/module.c  - non-weak function
>> * kernel/module.c - weak function
>>
>> inb() is not defined in arch/parisc/kernel/module.c.
>> But during kernel build, all object files in arch/parisc/kernel/*.o are
>> linked together into arch/parisc/kernel/built-in.o:
>>
>> Running readelf: "hppa-linux-readelf -u arch/parisc/kernel/built-in.o" gives:
>> ...
>> <inb>: [0x0-0xe8]
>>           Entry_GR=1 Save_SP Save_RP Total_frame_size=8
>> <arch_mod_section_prepend>: [0x0-0x50]
>>           Entry_GR=1 Save_SP Total_frame_size=8
>> <module_arch_cleanup>: [0x0-0x80]
>>           Entry_GR=2 Save_SP Save_RP Total_frame_size=8
>>
>> So, yes, the non-weak arch_mod_section_prepend() function follows the inb()
>> function in the object file (and in the final vmlinux file as well).
>>
>>>> <arch_mod_section_prepend>: [0x1011fc4c-0x1011fc74]
>>>>            Entry_GR=1 Save_SP Total_frame_size=8
>>>> <arch_mod_section_prepend>: [0x1011fc4c-0x10167cf4]
>>>>            Entry_GR=1 Save_SP Total_frame_size=8
>>
>> The first entry is the non-weak one.
>> The second entry is the remaining part of the weak (dropped) function.
>> It seems only the start address was changed to the start address of the non-weak
>> function, while the end address has been kept unchanged.
>> [0x1011fc4c-0x10167cf4] would mean, that the weak function would be 295KB in size...?
>
> If you run readelf on built-in.o, is the problem present there?

No. Since built-in.o is just an intermediate file, offset starts at 0x0.
<arch_mod_section_prepend>: [0x0-0x50]
         Entry_GR=1 Save_SP Total_frame_size=8
-> seems correct.

> Does this happen with both 32 and 64 bit kernels?

Yes.

> Need to figure out why the start address of the weak function is
> the same as the non-weak function.  My initial guess is that
> RELOC_FOR_GLOBAL_SYMBOL is messing up.

Helge
