From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] printk-formats.txt: Add examples for %pS and %pF
Date: Wed, 23 Aug 2017 21:36:21 +0200
Message-ID: <b8fe55d6-9dfe-ee6e-8a78-357f1ba3b9a7@gmx.de>
References: <20170810173533.GA11600@ls3530.fritz.box>
 <20170811001521.GA520@jagdpanzerIV.localdomain>
 <47718712-9eb2-8ad7-965e-d0971d07e985@gmx.de>
 <20170815113625.GA2738@pathway.suse.cz>
 <d5fda170-e95b-024e-59ad-650b4db78ba6@gmx.de>
 <20170823144824.GE27895@pathway.suse.cz>
 <20170823104947.3d84737e@gandalf.local.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
To: Steven Rostedt <rostedt@goodmis.org>,
        Petr Mladek <pmladek@suse.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170823104947.3d84737e@gandalf.local.home>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 23.08.2017 16:49, Steven Rostedt wrote:
> On Wed, 23 Aug 2017 16:48:24 +0200
> Petr Mladek <pmladek@suse.com> wrote:
> 
>> +
>> +	printk("Going to call: %pF\n", gettimeofday);
>> +	printk("Going to call: %pF\n", p->func);
>> +	printk("%s: called from %pS\n", __func__, _RET_IP_);
>> +	printk("%s: called from %pS\n", __func__, __builtin_return_address(0));
>> +	printk("Faulted at %pS\n", (void *)regs->ip);
>> +	printk(" %s%pB\n", reliable ? "" : "? ", (void *)*stack);
> 
> Much better!

Petr, that's really much better.

I've already pushed the part which restructured the text upstream.
I'll push this part of the patch (which adds the examples) for v4.14.

Thanks,
Helge  
