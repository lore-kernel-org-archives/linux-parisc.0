From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] [workqueue] check values of pwq and wq in print_worker_info()
 before use
Date: Tue, 01 Oct 2013 22:53:31 +0200
Message-ID: <524B364B.3010405@gmx.de>
References: <20131001203520.GA8248@p100.box> <20131001204352.GA27149@mtj.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Libin <huawei.libin@huawei.com>, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
To: Tejun Heo <tj@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20131001204352.GA27149@mtj.dyndns.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 10/01/2013 10:43 PM, Tejun Heo wrote:
> Hello,
> 
> On Tue, Oct 01, 2013 at 10:35:20PM +0200, Helge Deller wrote:
>> print_worker_info() includes no validity check on the pwq and wq
>> pointers before handing them over to the probe_kernel_read() functions.
>>
>> It seems that most architectures don't care about that, but at least on
>> the parisc architecture this leads to a kernel crash since accesses to
>> page zero are protected by the kernel for security reasons.
>>
>> Fix this problem by verifying the contents of pwq and wq before usage.
>> Even if probe_kernel_read() usually prevents such crashes by disabling
>> page faults, clean code should always include such checks. 
>>
>> Without this fix issuing "echo t > /proc/sysrq-trigger" will immediately
>> crash the Linux kernel on the parisc architecture.
> 
> Hmm... um had similar problem but the root cause here is that the arch
> isn't implementing probe_kernel_read() properly.  We really have no
> idea what the pointer value may be at the dump point and that's why we
> use probe_kernel_read().  If something like the above is necessary for
> the time being, the correct place would be the arch
> probe_kernel_read() implementation.  James, would it be difficult
> implement proper probe_kernel_read() on parisc?

No, it's not really complicated.
That was my initial way to work around that problem.

But is this really necessary? Isn't a pointer which points to mem zero most
likely wrong on any architecture?

In addition I wrote another patch to work around that problem in the parisc
page fault handler (which is needed anyway) too:
https://patchwork.kernel.org/patch/2971701/

So, in summary my patch here is not really necessary, but for the sake of
clean code I think it doesn't hurt either and as such it would be nice if
you could apply it.

Helge
