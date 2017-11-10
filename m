From: "Luck, Tony" <tony.luck@intel.com>
Subject: Re: [PATCHv4 5/6] symbol lookup: introduce
 dereference_symbol_descriptor()
Date: Fri, 10 Nov 2017 10:09:32 -0800
Message-ID: <20171110180931.xhhi35osclzceba2@agluck-desk>
References: <20171109234830.5067-1-sergey.senozhatsky@gmail.com>
 <20171109234830.5067-6-sergey.senozhatsky@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Fenghua Yu <fenghua.yu@intel.com>, Helge Deller <deller@gmx.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        James Bottomley <jejb@parisc-linux.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jessica Yu <jeyu@kernel.org>, Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Return-path: <linux-ia64-owner@vger.kernel.org>
In-Reply-To: <20171109234830.5067-6-sergey.senozhatsky@gmail.com>
List-ID: <linux-ia64.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Nov 10, 2017 at 08:48:29AM +0900, Sergey Senozhatsky wrote:
> -Examples::
> -
> -	printk("Going to call: %pF\n", gettimeofday);
> -	printk("Going to call: %pF\n", p->func);
> -	printk("%s: called from %pS\n", __func__, (void *)_RET_IP_);
> -	printk("%s: called from %pS\n", __func__,
> -				(void *)__builtin_return_address(0));
> -	printk("Faulted at %pS\n", (void *)regs->ip);
> -	printk(" %s%pB\n", (reliable ? "" : "? "), (void *)*stack);

Did you mean to delete the Examples completely?  Wouldn't it
be better to just update (s/%pF/%pS/g)?

-Tony
