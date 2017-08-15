From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] printk-formats.txt: Add examples for %pS and %pF
Date: Tue, 15 Aug 2017 17:35:52 -0400
Message-ID: <20170815173552.01d7fb1c@gandalf.local.home>
References: <20170810173533.GA11600@ls3530.fritz.box>
        <20170815084654.20fc23c0@gandalf.local.home>
        <7beee4c4-6565-69ea-a220-59c83bbb6c35@gmx.de>
        <b94857ad-8c10-618c-1a04-5859cc5ac04b@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <b94857ad-8c10-618c-1a04-5859cc5ac04b@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 15 Aug 2017 21:47:27 +0200
Helge Deller <deller@gmx.de> wrote:

> > Very interesting!
> > 
> > This code:
> > void smp_cpus_done() {
> > printk("Called from %pF.\n", smp_cpus_done);
> > printk("Called from %pf.\n", smp_cpus_done);
> > printk("Called in %pS.\n", __func__);
> > printk("Called in %ps.\n", __func__);
> > printk("Called in %pF.\n", __func__);
> > printk("Called in %pf.\n", __func__);
> > 
> > gives:
> >  Called from smp_cpus_done+0x0/0x1b8.
> >  Called from smp_cpus_done.
> >  Called in __func__.28197+0x0/0x20.
> >  Called in __func__.28197.
> >  Called in 0x5041524953433332.
> >  Called in 0x5041524953433332.
> > 
> > So, the correct usage is:
> > printk("Called in %pS.\n", __func__);  
> 
> I'm wrong.
> The correct usage would be:
>  printk("Called in %s.\n", __func__);
> 
> __func__ is just a pointer to a string.

OK, I'm still on vacation :-/

Yeah, I was looking for usages of %pF, and came across this:

		pr_warn("%s: NULL omap_sr from %pF\n",
			__func__, (void *)_RET_IP_);

And not noticing the first "%s" :-p

-- Steve

