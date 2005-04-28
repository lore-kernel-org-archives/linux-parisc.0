From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] ssm/rsm sequences
Date: Thu, 28 Apr 2005 08:58:34 -0600
Message-ID: <20050428145834.GA10171@colo.lackof.org>
References: <20050425165540.GD12325@colo.lackof.org>
	<200504251744.j3PHixu9015886@hiauly1.hia.nrc.ca>
	<20050427022925.GH2612@colo.lackof.org>
	<20050427052055.GJ2612@colo.lackof.org>
	<20050427150050.GB21784@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050427150050.GB21784@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Grant Grundler wrote:
> Here's a new patch WITHOUT the s/__lp64__/CONFIG_64BIT/ changes.

I tested this patch on a500 and the kernel blew up when
/etc/init.d/firewall script was started.
Something in iptables triggered a WARN_ON in our smp_call_function.
Thinking this might be related to the missing "ssm/nop*8" sequence,
I removed the ifdef around the pcxt_ssm_bug so it's always used.
Still panics in basically the same way:

....
Setting up IP spoofing protection: rp_filter.
Configuring network interfaces...done.
Starting portmap daemon: portmap.

Setting the System Clock using the Hardware Clock as reference...
System Clock set. Local time: Thu Apr 28 07:29:51 PDT 2005

eth10: Setting full-duplex based on MII#1 link partner capability of 41e1.
Initializing random number generator...done.
Recovering nvi editor sessions... done.
Setting up X server socket directory /tmp/.X11-unix...tg3: eth11: Link is up at 1000 Mbps, full duplex.
tg3: eth11: Flow control is off for TX and off for RX.
done.
Setting up ICE socket directory /tmp/.ICE-unix...done.
INIT: Entering runlevel: 2
Starting system log daemon: syslogd.
Starting kernel log daemon: klogd.
Starting firewall (iptables):Badness in smp_call_function at arch/parisc/kernel/smp.c:340
Backtrace:
 [<0000000010114d70>] dump_stack+0x18/0x28
 [<000000001011f74c>] smp_call_function+0x474/0x480
 [<00000000101ab470>] unmap_vm_area+0xa0/0x328
 [<00000000101abe4c>] remove_vm_area+0x94/0xd8
 [<00000000101abf3c>] __vunmap+0xac/0x1e0
 [<00000000101ac098>] vfree+0x28/0x80
 [<0000000000398bb0>] do_ipt_set_ctl+0x1040/0x1268 [ip_tables]
 [<00000000103c8598>] nf_sockopt+0x200/0x3c0
 [<00000000103c8774>] nf_setsockopt+0x1c/0x28
 [<00000000103e4b98>] ip_setsockopt+0x288/0xdc0
 [<0000000010408324>] raw_setsockopt+0x3c/0x90
 [<00000000103aad70>] sock_common_setsockopt+0x28/0x38
 [<00000000103a6f68>] sys_setsockopt+0x90/0xf8
 [<00000000103cb2a0>] compat_sys_setsockopt+0x538/0x548
 [<0000000010107fb4>] syscall_exit+0x0/0x14

SMP CALL FUNCTION TIMED OUT! (cpu=0), try 1
SMP CALL FUNCTION TIMED OUT! (cpu=0), try 2
SMP CALL FUNCTION TIMED OUT! (cpu=0), try 3
SMP CALL FUNCTION TIMED OUT! (cpu=0), try 4
SMP CALL FUNCTION TIMED OUT! (cpu=0), try 5
SMP CALL FUNCTION TIMED OUT! (cpu=0), try 6
...


Looks like unmap_vm_area() has changed for every 2.6.12-rc release.
I expect the WARN_ON is invoked via flush_tlb_kernel_range().
Anyone have a clue what's up here?

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
