From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] printk-formats.txt: Add examples for %pS and %pF
Date: Tue, 15 Aug 2017 21:47:27 +0200
Message-ID: <b94857ad-8c10-618c-1a04-5859cc5ac04b@gmx.de>
References: <20170810173533.GA11600@ls3530.fritz.box>
 <20170815084654.20fc23c0@gandalf.local.home>
 <7beee4c4-6565-69ea-a220-59c83bbb6c35@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
To: Steven Rostedt <rostedt@goodmis.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <7beee4c4-6565-69ea-a220-59c83bbb6c35@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 15.08.2017 21:41, Helge Deller wrote:
> On 15.08.2017 14:46, Steven Rostedt wrote:
>> On Thu, 10 Aug 2017 19:35:33 +0200
>> Helge Deller <deller@gmx.de> wrote:
>>
>>> Sometimes people seems unclear when to use the %pS or %pF printk format.
>>> Adding some examples may help to avoid such mistakes.
>>>
>>> See for example commit 51d96dc2e2dc ("random: fix warning message on ia64 and
>>> parisc") which fixed such a wrong format string.
>>>
>>> Signed-off-by: Helge Deller <deller@gmx.de>
>>>
>>> diff --git a/Documentation/printk-formats.txt b/Documentation/printk-formats.txt
>>> index 65ea591..be8c05b 100644
>>> --- a/Documentation/printk-formats.txt
>>> +++ b/Documentation/printk-formats.txt
>>> @@ -73,6 +73,12 @@ actually function descriptors which must first be resolved. The ``F`` and
>>>  ``f`` specifiers perform this resolution and then provide the same
>>>  functionality as the ``S`` and ``s`` specifiers.
>>>  
>>> +Examples::
>>> +
>>> +	printk("Called from %pS.\n", __builtin_return_address(0));
>>> +	printk("Called from %pS.\n", (void *)regs->ip);
>>> +	printk("Called from %pF.\n", &gettimeofday);
>>
>> Is the '&' really necessary? 
> The '&' is not necessary. The compiler doesn't complain either.
> 
>> What about using the example:
>> 	printk("Called in %pF.\n", __func__);
> 
> Very interesting!
> 
> This code:
> void smp_cpus_done() {
> printk("Called from %pF.\n", smp_cpus_done);
> printk("Called from %pf.\n", smp_cpus_done);
> printk("Called in %pS.\n", __func__);
> printk("Called in %ps.\n", __func__);
> printk("Called in %pF.\n", __func__);
> printk("Called in %pf.\n", __func__);
> 
> gives:
>  Called from smp_cpus_done+0x0/0x1b8.
>  Called from smp_cpus_done.
>  Called in __func__.28197+0x0/0x20.
>  Called in __func__.28197.
>  Called in 0x5041524953433332.
>  Called in 0x5041524953433332.
> 
> So, the correct usage is:
> printk("Called in %pS.\n", __func__);

I'm wrong.
The correct usage would be:
 printk("Called in %s.\n", __func__);

__func__ is just a pointer to a string.

Helge

> 
> But it should have printed
>  Called from smp_cpus_done+0x0/0x1b8.
> which means the (parisc?) printk resolver doesn't work correctly.
> 
> In assembly code a pointer to this object is handed to printk:
>         .type   __func__.28197, @object
>         .size   __func__.28197, 14
> __func__.28197:
>         .stringz        "smp_cpus_done"
> 
> I'll look into this problem.
> 
> Helge
> 

