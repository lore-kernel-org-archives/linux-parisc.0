From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] printk-formats.txt: Add examples for %pS and %pF
Date: Fri, 11 Aug 2017 09:31:28 +0200
Message-ID: <47718712-9eb2-8ad7-965e-d0971d07e985@gmx.de>
References: <20170810173533.GA11600@ls3530.fritz.box>
 <20170811001521.GA520@jagdpanzerIV.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20170811001521.GA520@jagdpanzerIV.localdomain>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 11.08.2017 02:15, Sergey Senozhatsky wrote:
> On (08/10/17 19:35), Helge Deller wrote:
>> Sometimes people seems unclear when to use the %pS or %pF printk format.
>> Adding some examples may help to avoid such mistakes.
>>
>> See for example commit 51d96dc2e2dc ("random: fix warning message on ia64 and
>> parisc") which fixed such a wrong format string.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>>
>> diff --git a/Documentation/printk-formats.txt b/Documentation/printk-formats.txt
>> index 65ea591..be8c05b 100644
>> --- a/Documentation/printk-formats.txt
>> +++ b/Documentation/printk-formats.txt
>> @@ -73,6 +73,12 @@ actually function descriptors which must first be resolved. The ``F`` and
>>  ``f`` specifiers perform this resolution and then provide the same
>>  functionality as the ``S`` and ``s`` specifiers.
>>  
>> +Examples::
>> +
>> +	printk("Called from %pS.\n", __builtin_return_address(0));
>> +	printk("Called from %pS.\n", (void *)regs->ip);
>> +	printk("Called from %pF.\n", &gettimeofday);
> 
> sorry, but how does it help?
> 
> 
> there is this paragraph
> 
> : On ia64, ppc64 and parisc64 architectures function pointers are
> : actually function descriptors which must first be resolved. The ``F`` and
> : ``f`` specifiers perform this resolution and then provide the same
> : functionality as the ``S`` and ``s`` specifiers.
> 
> which supposed to explain everything in details. the examples
> don't make it any `clearer', IMHO.

Experts surely do know what function descriptors are.
Nevertheless even those often get it wrong as can be seen in
various commits.

The hope with this patch is to show widely-used examples
and avoid additional commits afterwards to fix it up.

This patch was meant to be RFC.
If you decide not to take it, I'm fine as well.

> *may be* on "ia64, ppc64 and parisc64" we can somehow check
> that the pointer, which we pass as %pS, belongs to .text and
> print some build-time warnings. well, if it's actually a
> problem. dunno.

I think it's not needed. Those bugs will be seen and fixed.

Helge
