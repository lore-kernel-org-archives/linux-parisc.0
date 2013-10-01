From: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH] [workqueue] check values of pwq and wq in
 print_worker_info() before use
Date: Tue, 1 Oct 2013 16:43:52 -0400
Message-ID: <20131001204352.GA27149@mtj.dyndns.org>
References: <20131001203520.GA8248@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Libin <huawei.libin@huawei.com>, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20131001203520.GA8248@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hello,

On Tue, Oct 01, 2013 at 10:35:20PM +0200, Helge Deller wrote:
> print_worker_info() includes no validity check on the pwq and wq
> pointers before handing them over to the probe_kernel_read() functions.
> 
> It seems that most architectures don't care about that, but at least on
> the parisc architecture this leads to a kernel crash since accesses to
> page zero are protected by the kernel for security reasons.
> 
> Fix this problem by verifying the contents of pwq and wq before usage.
> Even if probe_kernel_read() usually prevents such crashes by disabling
> page faults, clean code should always include such checks. 
> 
> Without this fix issuing "echo t > /proc/sysrq-trigger" will immediately
> crash the Linux kernel on the parisc architecture.

Hmm... um had similar problem but the root cause here is that the arch
isn't implementing probe_kernel_read() properly.  We really have no
idea what the pointer value may be at the dump point and that's why we
use probe_kernel_read().  If something like the above is necessary for
the time being, the correct place would be the arch
probe_kernel_read() implementation.  James, would it be difficult
implement proper probe_kernel_read() on parisc?

Thanks.

-- 
tejun
