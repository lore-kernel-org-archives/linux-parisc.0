From: Kyle McMartin <kyle@engsoc.org>
Subject: Re: [parisc-linux] ipv6 problem with 2.6.7-pa1
Date: Mon, 21 Jun 2004 10:24:34 -0400
Message-ID: <20040621142434.GB28438@engsoc.org>
References: <20040621153015.596e4014.gmsoft@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Guy Martin <gmsoft@gentoo.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040621153015.596e4014.gmsoft@gentoo.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Jun 21, 2004 at 03:30:15PM +0200, Guy Martin wrote:
> skput:over: 10271684:194 put:138 dev:<NULL>kernel BUG at net/core/skbuff.c:88!
> Kernel addresses on the stack:

The fact that dev is NULL is kind of suspect. I'm not exactly sure, but
I do not think this is a PA-RISC bug. Perhaps netdev@oss.sgi.com could
be more helpful in debugging this.

>  [<10327bc0>] ip6_forward+0x1c4/0x434
>  [<10106138>] dump_stack+0x18/0x24
>  [<10271a4c>] i596_interrupt+0x930/0xdf0
>  [<10121a00>] activate_task+0x44/0xa8
>  [<104205b4>] start_kernel+0x4/0x1e4
>  [<101078ec>] do_irq+0x14c/0x154
>  [<102da778>] dev_watchdog+0x88/0xf4
>  [<10107ab4>] do_irq_mask+0xb4/0xcc
>  [<10129d34>] tasklet_action+0x78/0xe4
>  [<102377ec>] busdev_barked+0x3c/0x44
>  [<101078ec>] do_irq+0x14c/0x154
>  [<10102840>] __sched_text_end+0x44/0x48
>  [<101079f0>] do_cpu_irq_mask+0xfc/0x10c
>  [<101717a8>] may_open+0x58/0x1c8
>  [<1010c068>] intr_return+0x0/0x14
>  [<10112368>] cpu_idle+0x28/0x3c
>  [<101717a8>] may_open+0x58/0x1c8
>  [<10160c30>] dentry_open+0x154/0x238
>  [<101744b0>] locate_fd+0x154/0x190
>  [<104205b4>] start_kernel+0x4/0x1e4
>  [<10112378>] cpu_idle+0x38/0x3c
>  [<10420768>] start_kernel+0x1b8/0x1e4
> 

> KERNEL: assertion (!atomic_read(&skb->users)) failed at net/core/dev.c (1666)
> 
I think this is a symptom of the problem, afaict it does contribute.

Cheers,
-- 
Kyle McMartin
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
