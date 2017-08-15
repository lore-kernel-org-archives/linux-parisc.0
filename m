From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] printk-formats.txt: Add examples for %pS and %pF
Date: Tue, 15 Aug 2017 08:46:54 -0400
Message-ID: <20170815084654.20fc23c0@gandalf.local.home>
References: <20170810173533.GA11600@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20170810173533.GA11600@ls3530.fritz.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, 10 Aug 2017 19:35:33 +0200
Helge Deller <deller@gmx.de> wrote:

> Sometimes people seems unclear when to use the %pS or %pF printk format.
> Adding some examples may help to avoid such mistakes.
> 
> See for example commit 51d96dc2e2dc ("random: fix warning message on ia64 and
> parisc") which fixed such a wrong format string.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> diff --git a/Documentation/printk-formats.txt b/Documentation/printk-formats.txt
> index 65ea591..be8c05b 100644
> --- a/Documentation/printk-formats.txt
> +++ b/Documentation/printk-formats.txt
> @@ -73,6 +73,12 @@ actually function descriptors which must first be resolved. The ``F`` and
>  ``f`` specifiers perform this resolution and then provide the same
>  functionality as the ``S`` and ``s`` specifiers.
>  
> +Examples::
> +
> +	printk("Called from %pS.\n", __builtin_return_address(0));
> +	printk("Called from %pS.\n", (void *)regs->ip);
> +	printk("Called from %pF.\n", &gettimeofday);

Is the '&' really necessary? What about using the example:

	printk("Called in %pF.\n", __func__);

?

-- Steve

> +
>  Kernel Pointers
>  ===============
>  

