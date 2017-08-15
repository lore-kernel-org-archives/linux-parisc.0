From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] printk-formats.txt: Add examples for %pS and %pF
Date: Tue, 15 Aug 2017 21:58:33 +0200
Message-ID: <d5fda170-e95b-024e-59ad-650b4db78ba6@gmx.de>
References: <20170810173533.GA11600@ls3530.fritz.box>
 <20170811001521.GA520@jagdpanzerIV.localdomain>
 <47718712-9eb2-8ad7-965e-d0971d07e985@gmx.de>
 <20170815113625.GA2738@pathway.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
To: Petr Mladek <pmladek@suse.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170815113625.GA2738@pathway.suse.cz>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 15.08.2017 13:36, Petr Mladek wrote:
> On Fri 2017-08-11 09:31:28, Helge Deller wrote:
>> On 11.08.2017 02:15, Sergey Senozhatsky wrote:
>>> On (08/10/17 19:35), Helge Deller wrote:
>>>> Sometimes people seems unclear when to use the %pS or %pF printk format.
>>>> Adding some examples may help to avoid such mistakes.
>>>>
>>>> See for example commit 51d96dc2e2dc ("random: fix warning message on ia64 and
>>>> parisc") which fixed such a wrong format string.
>>>>
>>>> Signed-off-by: Helge Deller <deller@gmx.de>
>>>>
>>>> diff --git a/Documentation/printk-formats.txt b/Documentation/printk-formats.txt
>>>> index 65ea591..be8c05b 100644
>>>> --- a/Documentation/printk-formats.txt
>>>> +++ b/Documentation/printk-formats.txt
>>>> @@ -73,6 +73,12 @@ actually function descriptors which must first be resolved. The ``F`` and
>>>>  ``f`` specifiers perform this resolution and then provide the same
>>>>  functionality as the ``S`` and ``s`` specifiers.
>>>>  
>>>> +Examples::
>>>> +
>>>> +	printk("Called from %pS.\n", __builtin_return_address(0));
>>>> +	printk("Called from %pS.\n", (void *)regs->ip);
>>>> +	printk("Called from %pF.\n", &gettimeofday);
>>>
>>> there is this paragraph
>>>
>>> : On ia64, ppc64 and parisc64 architectures function pointers are
>>> : actually function descriptors which must first be resolved. The ``F`` and
>>> : ``f`` specifiers perform this resolution and then provide the same
>>> : functionality as the ``S`` and ``s`` specifiers.
>>>
>>> which supposed to explain everything in details. the examples
>>> don't make it any `clearer', IMHO.
>>
>> Experts surely do know what function descriptors are.
>> Nevertheless even those often get it wrong as can be seen in
>> various commits.
> 
> It seems that these specifiers are used the wrong way on many
> locations. 

Yes. %pF usage in mm/memblock.c is just one example.

> They might be worth fixing but I cannot test it easily.

I can check and send patches at some point.
 
> Hmm, using %pF might actually cause a crash when used
> on direct function address.

Probably won't happen on parisc, but basically you are right.


>> The hope with this patch is to show widely-used examples
>> and avoid additional commits afterwards to fix it up.
> 
> IMHO, one problem is that the meaning of ''F'' and ''f''
> is hidden at the end of the section. Also the first line
> 
>   'For printing symbols and function pointers. The ``S`` and ``s`` '
> 
> kind of invites to use ``S`` and ``s`` even for function pointers.
> I suggest to switch the order, slightly retranslate, add the
> examples, see below.
> 
> 
>> This patch was meant to be RFC.
>> If you decide not to take it, I'm fine as well.
>>
>>> *may be* on "ia64, ppc64 and parisc64" we can somehow check
>>> that the pointer, which we pass as %pS, belongs to .text and
>>> print some build-time warnings. well, if it's actually a
>>> problem. dunno.
> 
> I think that it would need to be a runtime check because many/most
> printed addresses are not statically defined.
> 
> 
>> I think it's not needed. Those bugs will be seen and fixed.
> 
> I am not sure how many people are familiar with this problem.
> I might help to avoid some headaches when debugging.
> 
> If we add the warning, it should be ratelimited to reduce messing
> of the original message.
> 
> I do not have strong opinion about it.
> 
> 
> Here is the updated patch with my proposed changes.
> Feel free to update it:

Much better!
Thanks a lot.

Maybe we should mention usage of __func__ with '%s' (see other thread).

And _RET_IP_ is worth mentioning beside __builtin_return_address(0) too,
because it's used quite often wrongly.
   
Helge

> From ef983c65095cada994c1fe531e2b98e936c943bf Mon Sep 17 00:00:00 2001
> From: Helge Deller <deller@gmx.de>
> Date: Tue, 15 Aug 2017 11:34:19 +0200
> Subject: [PATCH] printk-formats.txt: Better describe the difference between
>  %pS and %pF
> 
> Sometimes people seems unclear when to use the %pS or %pF printk format.
> For example, see commit 51d96dc2e2dc ("random: fix warning message on ia64
> and parisc") which fixed such a wrong format string.
> 
> The documentation should be more clear about the difference.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> [pmladek@suse.com: Restructure the entire section]
> Signed-off-by: Petr Mladek <pmladek@suse.com>
> ---
>  Documentation/printk-formats.txt | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/printk-formats.txt b/Documentation/printk-formats.txt
> index 65ea5915178b..074670b98bac 100644
> --- a/Documentation/printk-formats.txt
> +++ b/Documentation/printk-formats.txt
> @@ -58,20 +58,23 @@ Symbols/Function Pointers
>  	%ps	versatile_init
>  	%pB	prev_fn_of_versatile_init+0x88/0x88
>  
> -For printing symbols and function pointers. The ``S`` and ``s`` specifiers
> -result in the symbol name with (``S``) or without (``s``) offsets. Where
> -this is used on a kernel without KALLSYMS - the symbol address is
> -printed instead.
> +The ``F`` and ``f`` specifiers are for printing function pointers,
> +for example, f->func, &gettimeofday. They have the same result as
> +``S`` and ``s`` specifiers. But they do an extra conversion on
> +ia64, ppc64 and parisc64 architectures where the function pointers
> +are actually function descriptors.
> +
> +The ``S`` and ``s`` specifiers can be used for printing symbols
> +from direct addresses, for example, __builtin_return_address(0),
> +(void *)regs->ip. They result in the symbol name with (``S``) or
> +without (``s``) offsets. If KALLSYMS are disabled then the symbol
> +address is printed instead.
>  
>  The ``B`` specifier results in the symbol name with offsets and should be
>  used when printing stack backtraces. The specifier takes into
>  consideration the effect of compiler optimisations which may occur
>  when tail-call``s are used and marked with the noreturn GCC attribute.
>  
> -On ia64, ppc64 and parisc64 architectures function pointers are
> -actually function descriptors which must first be resolved. The ``F`` and
> -``f`` specifiers perform this resolution and then provide the same
> -functionality as the ``S`` and ``s`` specifiers.
>  
>  Kernel Pointers
>  ===============
> 
