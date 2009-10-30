From: Helge Deller <deller@gmx.de>
Subject: Re: Out of order unwind entry warning
Date: Fri, 30 Oct 2009 23:47:07 +0100
Message-ID: <4AEB6CEB.6010205@gmx.de>
References: <20091029233501.152D1500F@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org,
	carlos@systemhalted.org, randolph@tausq.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091029233501.152D1500F@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 10/30/2009 12:35 AM, John David Anglin wrote:
>>
>> On 10/29/2009 10:07 PM, John David Anglin wrote:
>>>>> Still need to look at readelf -u on .o's.
>>>>
>>>> Yes, I see this too. readelf -u doesn't print any longer the second line of:
>>>> <arch_mod_section_prepend>: [0x1011fc4c-0x1011fc74]
>>>>              Entry_GR=1 Save_SP Total_frame_size=8
>>>
>>> Actually, the entries are still there.  For weak functions that
>>> are not used, they appear as "<foo+x>:" where foo is the closest
>>> preceding symbol before the unused weak function.  In practice,
>>> the code shouldn't be entered, so the lack of an associated function
>>> symbol shouldn't matter.
>>>
>>> I have a fix for the readelf -u bug.  See below.
>>
>> Sorry, but I don't fully understand...
>>
>> With your patch to gas, the unwind info for the weak functions are completely gone in the final executable (which is good).
>
> I don't think I changed this.  In the testcase that you sent, I see
>
> <a>: [0x104a0-0x104b8]
>          Entry_GR=1 Save_SP Total_frame_size=8
> <a+1c>: [0x104bc-0x104d8]
> 	Entry_GR=1 Save_SP Total_frame_size=8
> <z>: [0x104dc-0x104f4]
> 	Entry_GR=1 Save_SP Total_frame_size=8
> <main>: [0x104f8-0x10544]
> 	Entry_GR=1 Save_SP Total_frame_size=8
> <f>: [0x10548-0x10564]
> 	Entry_GR=2 Save_SP Save_RP Total_frame_size=8
>
> The weak version of f is the<a+1c>  entry.
>
>> But "readelf -u" doesn't show the "Entry_GR=..." lines for _any_ function any longer (in the final executable).
>> I really mean _all_ functions, weak, non-weak, standard, ...
>
> That's not what I'm seeing.  The old and new versions seem similar
> (i.e., with respect to missing "Entry_GR=...").  Didn't touch the
> code that extracts and prints this stuff.
>
> The lack of "Entry_GR=..." stuff for an entry probably indicates
> that there isn't a .CALLINFO directive for the function in question.
> This could happen if the function is handcoded assembler.  However,
> it is legitimate for a function not to have any of the unwind stuff
> set (e.g., function doesn't save any registers or allocate a frame).
> I think GCC gets this right but it never has been looked at with a
> magnifying glass.
>
>> The patch you attached only changes the start and end addresses of the symbols...?
>
> Yes, and only for .o's.  In final executables, there are no relocations
> in the .PARISC.unwind section.  So, the values printed should be unaffected.
>
> In the .o case, the code was in effect doing the SEGREL relocation twice
> leading to offsets twice as big as they should have been.  It still runs
> through the relocations if present, but uses the value from doing the
> relocation if one is present.  Compare what you see now with objdump -d
> and readelf -u on a .o.

Hi Dave,

you are probably correct. Nevertheless, your patches seem to have side-effects.
With your patches, the testcase from me now looks correct (as you explained above).

But when compiling the kernel something is still wrong.
I tried it a few times now, recompiled binutils, the kernel and so on.
I'm not 100% sure that I did everything correct, but I still think there is
something wrong...

This is what I get with your patches:
/opt/cross-hppa-4.4.neu/bin/hppa-linux-readelf -u vmlinux
...
--------------------------------------------------------------
<arch_mod_section_prepend>: [0x1011fc00-0x1011fc28]

<module_arch_cleanup>: [0x1011fc2c-0x1011fc6c]

<apply_relocate>: [0x1011fc70-0x1011fca4]
         Entry_GR=2 Save_SP Save_RP Total_frame_size=8
<module_finalize>: [0x1011fca8-0x1011fe8c]
         Entry_GR=1 Save_SP Save_RP Total_frame_size=24
<get_stub>: [0x1011fe90-0x1011ffb4]

<apply_relocate_add>: [0x1011ffb8-0x101205b8]

<module_frob_arch_sections>: [0x101205bc-0x10120758]

<module_free>: [0x1012075c-0x101207a4]

<module_alloc>: [0x101207a8-0x101207e4]

<dump_trace>: [0x101207e8-0x10120904]

<save_stack_trace_tsk>: [0x10120908-0x10120958]

<save_stack_trace>: [0x1012095c-0x101209b8]

<sgl_frnd>: [0x101209bc-0x10120b8c]
         Entry_GR=1 Save_SP Total_frame_size=8
<dbl_frnd>: [0x10120b90-0x10120e74]
         Entry_GR=1 Save_SP Total_frame_size=8
--------------------------------------------------------------

As you can see, a few Entry_GR lines are missing.
Even for C-functions for which Entry_GR was there with the old toolchain.
I sadly can not see any reason or logic in why specific functions don't
have their Entry_GR lines any longer.

Here for reference what I see with the old (unpatched) toolchain:
(as you can see arch_mod_section_prepend() is there twice again -> because
of the old unpatched toolchain)

--------------------------------------------------------------
/opt/cross-hppa-4.4/bin/hppa-linux-readelf -u vmlinux
...
<arch_mod_section_prepend>: [0x1011fc00-0x1011fc28]
         Entry_GR=1 Save_SP Total_frame_size=8
<arch_mod_section_prepend>: [0x1011fc00-0x10167dec]
         Entry_GR=1 Save_SP Total_frame_size=8
<module_arch_cleanup>: [0x1011fc2c-0x1011fc6c]
         Entry_GR=2 Save_SP Save_RP Total_frame_size=8
<apply_relocate>: [0x1011fc70-0x1011fca4]
         Entry_GR=1 Save_SP Save_RP Total_frame_size=8
<module_finalize>: [0x1011fca8-0x1011fe8c]
         Entry_GR=11 Save_SP Save_RP Total_frame_size=16
<get_stub>: [0x1011fe90-0x1011ffb4]
         Entry_GR=1 Save_SP Total_frame_size=8
<apply_relocate_add>: [0x1011ffb8-0x101205b8]
         Entry_GR=16 Save_SP Save_RP Total_frame_size=24
<module_frob_arch_sections>: [0x101205bc-0x10120758]
         Entry_GR=10 Save_SP Save_RP Total_frame_size=16
<module_free>: [0x1012075c-0x101207a4]
         Entry_GR=3 Save_SP Save_RP Total_frame_size=8
<module_alloc>: [0x101207a8-0x101207e4]
         Entry_GR=1 Save_SP Save_RP Total_frame_size=8
<dump_trace>: [0x101207e8-0x10120904]
         Entry_GR=7 Save_SP Save_RP Total_frame_size=80
<save_stack_trace_tsk>: [0x10120908-0x10120958]
         Entry_GR=2 Save_SP Save_RP Total_frame_size=8
<save_stack_trace_tsk>: [0x10120908-0x1015c7ac]
         Entry_GR=2 Save_SP Save_RP Total_frame_size=8
<save_stack_trace>: [0x1012095c-0x101209b8]
         Entry_GR=2 Save_SP Save_RP Total_frame_size=8
<sgl_frnd>: [0x101209bc-0x10120b8c]
         Entry_GR=1 Save_SP Total_frame_size=8
<dbl_frnd>: [0x10120b90-0x10120e74]
         Entry_GR=1 Save_SP Total_frame_size=8
--------------------------------------------------------------

Helge
