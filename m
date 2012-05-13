From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Issue booting v2.6.39 .. v3.4-rc6 on hp712/100
Date: Sun, 13 May 2012 10:11:19 -0400
Message-ID: <BLU0-SMTP437070F1BD4499EDC7F4B897150@phx.gbl>
References: <4FA9975C.5060708@bergerie> <41786065.U2qKzXR3uX@donald.sf-tec.de> <4FAA9382.7040802@bell.net> <4FAADE2A.9080803@bergerie> <BLU0-SMTP65CF901B170B044925E85897160@phx.gbl> <4FAEE943.2030203@gmx.de>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Vincent <vincent.stehle@laposte.net>,
	Rolf Eike Beer <eike-kernel@sf-tec.de>,
	linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4FAEE943.2030203@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 12-May-12, at 6:50 PM, Helge Deller wrote:

> I have my machines now up and running again.

Good.

>
> I tested upstream version (bcc62fb) and got on all my machines the  
> same bug (same Kernel binary started on all):
>
> Backtrace:
> [<1021dc3c>] mpage_readpages+0xf0/0x16c
> [<10257e88>] ext3_readpages+0x28/0x38
> [<101acb90>] __do_page_cache_readahead+0x1e0/0x27c
> [<101acc5c>] ra_submit+0x30/0x40
> [<101acee0>] ondemand_readahead+0xd0/0x26c
>
> or
>
> Backtrace:
> [<1021dc3c>] mpage_readpages+0xf0/0x16c
> [<10257e88>] ext3_readpages+0x28/0x38
> [<101acb90>] __do_page_cache_readahead+0x1e0/0x27c
> [<101acc5c>] ra_submit+0x30/0x40
> [<101acee0>] ondemand_readahead+0xd0/0x26c
> [<101ad1a8>] page_cache_sync_readahead+0x44/0x74
> [<101a38e4>] generic_file_aio_read+0x400/0x764
> [<101e243c>] do_sync_read+0xd4/0x130
> [<101e32f4>] vfs_read+0xac/0x158
> [<101ea47c>] kernel_read+0x40/0x5c
> [<101ea58c>] prepare_binprm+0xf4/0x130
> [<101eae3c>] do_execve+0x2b8/0x3a4
> [<1012199c>] sys_execve+0x64/0x94
> [<10104084>] __execve+0x20/0x34
> [<10136374>] vprintk+0x1e8/0x488
> [<101a83e8>] __free_pages+0x54/0x64

I haven't tried 3.4.  These seem to be new issues.  I will try 3.4  
soon, but
could you try stable 3.3.6?  Stable 3.3 up to 3.3.4 is known to work on
various machines.

>
>
> all logs attached for the 715/64, B160L and C3000 machines.
>
> I'll test tomorrow your patch (but will try to update my binutils/ 
> gcc prior to that).


There are known issues with GCC 4.3 branch.  In particular, the  
delayed branch support
is broken (at least three different bugs).  I would suggest you  
install 4.6.3 from shirka
or magnum.

Dave
--
John David Anglin	dave.anglin@bell.net



