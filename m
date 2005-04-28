From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] ssm/rsm sequences
Date: Thu, 28 Apr 2005 13:06:59 -0600
Message-ID: <20050428190659.GD10171@colo.lackof.org>
References: <20050425165540.GD12325@colo.lackof.org>
	<200504251744.j3PHixu9015886@hiauly1.hia.nrc.ca>
	<20050427022925.GH2612@colo.lackof.org>
	<20050427052055.GJ2612@colo.lackof.org>
	<20050427150050.GB21784@colo.lackof.org>
	<20050428145834.GA10171@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050428145834.GA10171@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Apr 28, 2005 at 08:58:34AM -0600, Grant Grundler wrote:
> Grant Grundler wrote:
> > Here's a new patch WITHOUT the s/__lp64__/CONFIG_64BIT/ changes.
> 
> I tested this patch on a500 and the kernel blew up when
> /etc/init.d/firewall script was started.
> Something in iptables triggered a WARN_ON in our smp_call_function.
> Thinking this might be related to the missing "ssm/nop*8" sequence,
> I removed the ifdef around the pcxt_ssm_bug so it's always used.
> Still panics in basically the same way:

I've restored the #ifdef CONFIG_64BIT around pcxt_ssm_bug
so my 64-bit kernels don't use it *and* disabled
/etc/init.d/firewall so iptables doesn't get invoked.
The system boots to a login prompt but when I ssh
to the box, I get the following WARNON with several
different stack traces:

Badness in smp_call_function at arch/parisc/kernel/smp.c:340
Backtrace:
 [<0000000010114cf0>] dump_stack+0x18/0x28
 [<000000001011f6cc>] smp_call_function+0x474/0x480
 [<00000000101130f8>] flush_tlb_all+0x108/0x238
 [<00000000101a6e88>] exit_mmap+0x238/0x2a0
 [<000000001014928c>] mmput+0xdc/0x200
 [<00000000101ce82c>] flush_old_exec+0x8c4/0xe38
 [<000000001012188c>] load_elf_binary+0x56c/0x1970
 [<00000000101cf304>] search_binary_handler+0x174/0x580
 [<00000000102000a8>] compat_do_execve+0x1d0/0x3e0
 [<0000000010124700>] sys32_execve+0x70/0xf8
 [<0000000010107e04>] sys32_execve_wrapper+0x1c/0x30


Badness in smp_call_function at arch/parisc/kernel/smp.c:340
Backtrace:
 [<0000000010114cf0>] dump_stack+0x18/0x28
 [<000000001011f6cc>] smp_call_function+0x474/0x480
 [<00000000101130f8>] flush_tlb_all+0x108/0x238
 [<000000001019e0f0>] unmap_vmas+0x528/0xb78
 [<00000000101a6d5c>] exit_mmap+0x10c/0x2a0
 [<000000001014928c>] mmput+0xdc/0x200
 [<00000000101ce82c>] flush_old_exec+0x8c4/0xe38
 [<000000001012188c>] load_elf_binary+0x56c/0x1970
 [<00000000101cf304>] search_binary_handler+0x174/0x580
 [<00000000102000a8>] compat_do_execve+0x1d0/0x3e0
 [<0000000010124700>] sys32_execve+0x70/0xf8
 [<0000000010107e04>] sys32_execve_wrapper+0x1c/0x30

Besides the basic issue, this also implies flush_tlb_all() is
called twice in the same code path. That might be ok if 
flush_tlb_all() took parameters, but it does not.

Any clue what the basic issue is here?

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
