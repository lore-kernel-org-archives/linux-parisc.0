From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] [workqueue] check values of pwq and wq in print_worker_info()
 before use
Date: Wed, 02 Oct 2013 00:07:36 +0200
Message-ID: <524B47A8.1010701@gmx.de>
References: <20131001203520.GA8248@p100.box>  <20131001204352.GA27149@mtj.dyndns.org> <1380663645.2081.29.camel@dabdike>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Cc: Tejun Heo <tj@kernel.org>, Libin <huawei.libin@huawei.com>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1380663645.2081.29.camel@dabdike>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 10/01/2013 11:40 PM, James Bottomley wrote:
> On Tue, 2013-10-01 at 16:43 -0400, Tejun Heo wrote:
>> Hello,
>>
>> On Tue, Oct 01, 2013 at 10:35:20PM +0200, Helge Deller wrote:
>>> print_worker_info() includes no validity check on the pwq and wq
>>> pointers before handing them over to the probe_kernel_read() functions.
>>>
>>> It seems that most architectures don't care about that, but at least on
>>> the parisc architecture this leads to a kernel crash since accesses to
>>> page zero are protected by the kernel for security reasons.
>>>
>>> Fix this problem by verifying the contents of pwq and wq before usage.
>>> Even if probe_kernel_read() usually prevents such crashes by disabling
>>> page faults, clean code should always include such checks. 
>>>
>>> Without this fix issuing "echo t > /proc/sysrq-trigger" will immediately
>>> crash the Linux kernel on the parisc architecture.
>>
>> Hmm... um had similar problem but the root cause here is that the arch
>> isn't implementing probe_kernel_read() properly.  We really have no
>> idea what the pointer value may be at the dump point and that's why we
>> use probe_kernel_read().  If something like the above is necessary for
>> the time being, the correct place would be the arch
>> probe_kernel_read() implementation.  James, would it be difficult
>> implement proper probe_kernel_read() on parisc?
> 
> The problem seems to be that some traps bypass our exception table
> handling.  

Yes, that's correct.
It's trap #26 and we directly call parisc_terminate() for fault_space==0
without checking the exception table.
See my patch I posted a few hours ago which fixes this:
https://patchwork.kernel.org/patch/2971701/

> Helge, do you have the actual stack trace for this?  That
> should show where the exception handling is missing.

Here it is:
[47072.976000] ksoftirqd/0     R  running task        0     3      2 0x00000000
[47072.976000] Backtrace:
[47072.976000]  [<0000000040113a54>] __schedule+0x62c/0x808
[47072.976000]
[47072.976000] kworker/0:0H    S 00000000401040c0     0     5      2 0x00000000
[47073.468000] Backtrace:
[47073.468000]  [<0000000040464264>] pa_memcpy+0x44/0xb0
[47073.468000]  [<00000000404643e0>] __copy_from_user+0x60/0x90
[47073.468000]  [<00000000401d99bc>] __probe_kernel_read+0x54/0x90
[47073.468000]  [<000000004016cc70>] print_worker_info+0x158/0x2c0
[47073.468000]  [<0000000040185a60>] sched_show_task+0x1c8/0x210
[47073.468000]  [<0000000040185b64>] show_state_filter+0xbc/0x138
[47073.468000]  [<00000000404e85c4>] sysrq_handle_showstate+0x34/0x48
[47073.468000]  [<00000000404e9154>] __handle_sysrq+0x174/0x2f0
[47073.468000]  [<00000000404e933c>] write_sysrq_trigger+0x6c/0x90
[47073.468000]  [<00000000402ca2fc>] proc_reg_write+0xbc/0x130
[47073.468000]  [<0000000040236d44>] vfs_write+0x114/0x268
[47073.468000]  [<00000000402373a4>] SyS_write+0x94/0xf8
[47073.468000]  [<0000000040105fc0>] syscall_exit+0x0/0x14
[47073.468000]
[47073.468000]
[47073.468000] Kernel Fault: Code=26 regs=00000000958a09b0 (Addr=0000000000000008)
[47073.468000] CPU: 0 PID: 30189 Comm: bash Not tainted 3.12.0-rc3-64bit+ #1
[47073.468000] task: 000000007ba64100 ti: 00000000958a0000 task.ti: 00000000958a0000
[47073.468000]
[47073.468000]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[47073.468000] PSW: 00001000000001001111111100001110 Not tainted
[47073.468000] r00-03  000000ff0804ff0e 00000000958a08c0 0000000040464264 00000000958a0960
[47073.468000] r04-07  0000000040d73db0 0000000000000008 0000000000000008 00000000958a06f8
[47073.468000] r08-11  00000000958a0600 0000000040c49d18 00000000af535494 00000000958a0370
[47073.468000] r12-15  0000000000000000 0000000000000000 000000000010e7e8 00000000000fde28
[47073.468000] r16-19  0000000000000000 00000000000c7800 0000000000000000 0000000000000000
[47073.468000] r20-23  00000000958a06e0 0000000000000018 0000000000000018 0000000000000003
[47073.468000] r24-27  0000000000000008 0000000000000008 00000000958a06f8 0000000040d73db0
[47073.468000] r28-31  00000000958a06f8 00000000958a0930 00000000958a09b0 0000000000000008
[47073.468000] sr00-03  0000000005dc5000 0000000000000000 0000000000000000 0000000005dc5000
[47073.468000] sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000
[47073.468000]
[47073.468000] IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000040463fdc 0000000040463fe0
[47073.468000]  IIR: 0fe25033    ISR: 0000000000000000  IOR: 0000000000000008
[47073.468000]  CPU:        0   CR30: 00000000958a0000 CR31: 0000000011111111
[47073.468000]  ORIG_R28: 00000000958a0b40
[47073.468000]  IAOQ[0]: pa_memcpy_internal+0xec/0x2b4
[47073.468000]  IAOQ[1]: pa_memcpy_internal+0xf0/0x2b4
[47073.468000]  RP(r2): pa_memcpy+0x44/0xb0
[47073.468000] Backtrace:
[47073.468000]  [<0000000040464264>] pa_memcpy+0x44/0xb0
[47073.468000]  [<00000000404643e0>] __copy_from_user+0x60/0x90
[47073.468000]  [<00000000401d99bc>] __probe_kernel_read+0x54/0x90
[47073.468000]  [<000000004016cc70>] print_worker_info+0x158/0x2c0
[47073.468000]  [<0000000040185a60>] sched_show_task+0x1c8/0x210
[47073.468000]  [<0000000040185b64>] show_state_filter+0xbc/0x138
[47073.468000]  [<00000000404e85c4>] sysrq_handle_showstate+0x34/0x48
[47073.468000]  [<00000000404e9154>] __handle_sysrq+0x174/0x2f0
[47073.468000]  [<00000000404e933c>] write_sysrq_trigger+0x6c/0x90
[47073.468000]  [<00000000402ca2fc>] proc_reg_write+0xbc/0x130
[47073.468000]  [<0000000040236d44>] vfs_write+0x114/0x268
[47073.468000]  [<00000000402373a4>] SyS_write+0x94/0xf8
[47073.468000]  [<0000000040105fc0>] syscall_exit+0x0/0x14
[47073.468000]
[47073.468000] Kernel panic - not syncing: Kernel Fault

