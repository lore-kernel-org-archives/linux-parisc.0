From: Helge Deller <deller@gmx.de>
Subject: Re: parisc boot crash on 3.10-rc1+git
Date: Tue, 14 May 2013 22:29:31 +0200
Message-ID: <51929EAB.3020503@gmx.de>
References: <alpine.SOC.1.00.1305141432120.9094@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: Meelis Roos <mroos@linux.ee>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.SOC.1.00.1305141432120.9094@math.ut.ee>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Meelis,
(I dropped linux-kernel mailing list from CC!)

On 05/14/2013 01:48 PM, Meelis Roos wrote:
> I saw parsic fixes in todays git and gave my RP3440 a test.

Great :-)

> It did not 
> work - first a __schedule_bug, 

I assume you have CONFIG_PREEMPT enabled?
We know it's currently broken.

> then a lot of warnings from 
> drivers/pci/search.c (2 different places) and finally a kernel panic.

See below.

> BUG: scheduling while atomic: swapper/0/0x0000000d
> Modules linked in:
> CPU: 0 PID: 0 Comm: swapper Not tainted 3.10.0-rc1-00087-g674825d #28
> Backtrace:
>  [<0000000040114c90>] show_stack+0x20/0x38
>  [<000000004030066c>] dump_stack+0x3c/0x50
>  [<000000004016b6a8>] __schedule_bug+0x70/0x98
>  [<000000004010fde0>] __schedule+0x368/0x398
>  [<000000004010ff40>] schedule+0x38/0x90
>  [<0000000040110184>] schedule_preempt_disabled+0x2c/0x50

^ yep.... CONFIG_PREEMPT I assume.


> WARNING: at drivers/pci/search.c:110

this line has: WARN_ON(in_interrupt());
I assume this is triggered by CONFIG_PREEMPT as well.

> ------------[ cut here ]------------
> kernel BUG at mm/vmalloc.c:1339!

-> again: BUG_ON(in_interrupt());


Please try again with CONFIG_PREEMPT disabled.

Helge
