From: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH] [workqueue] check values of pwq and wq in
 print_worker_info() before use
Date: Tue, 1 Oct 2013 18:40:23 -0400
Message-ID: <20131001224023.GA28618@mtj.dyndns.org>
References: <20131001203520.GA8248@p100.box>
 <20131001204352.GA27149@mtj.dyndns.org>
 <524B364B.3010405@gmx.de>
 <20131001210348.GB27149@mtj.dyndns.org>
 <20131001210735.GA27867@mtj.dyndns.org>
 <524B4E0D.9050107@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Libin <huawei.libin@huawei.com>, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <524B4E0D.9050107@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hello,

On Wed, Oct 02, 2013 at 12:34:53AM +0200, Helge Deller wrote:
> Sure, probe_kernel_read() takes care that no segfaults will happen.
> Nevertheless, if we know that "pwq" might become NULL, why access pwq->wq at all?
>   struct pool_workqueue *pwq = NULL;
>   probe_kernel_read(&wq, &pwq>wq, sizeof(wq));
> 
> If you wouldn't have used probe_kernel_read() you would never code it 
> like that. That's what I meant when I wrote "clean coding" (aka "similar
> to what you would have done without probe_kernel_read()").

Because it is using probe_kernel_read() and such test wouldn't mean
anything?  It may be NULL, it may be 1 or full Fs.  NULL is just one
of many illegal pointers which may happen.  Why add code which doesn't
achieve anything when you're explicitly trying to access pointers
which you know could be invalid?  Why is that "clean"?  Is "if (p)
kfree(p)" cleaner than "kfree(p)"?

Thanks.

-- 
tejun
