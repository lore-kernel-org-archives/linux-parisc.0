From: Graham Gower <graham.gower@gmail.com>
Subject: Re: bad address in handle_percpu_irq
Date: Sun, 16 Aug 2015 20:09:31 +0930
Message-ID: <55D06863.1090506@gmail.com>
References: <55D0313E.3090602@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <55D0313E.3090602@gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


Further to this, if I boot single user I can get a shell, then <Ctrl-D> to
continue booting, whereupon the same panic may occur.

I'm unsure if this is related, but I noticed I can reliably trigger a system
freeze when changing runlevels. The system no longer responds to ping.
The sequence of events is (starting in runlevel 5):

root@wills:~# telinit 1
[ 604.336000] systemd-journald[169]: Received request to flush runtime journal from PID 1
Welcome to rescuGive root password for maintenance
(or type Control-D to continue):
root@wills:~# telinit 5
Hangup
root@wills:~# 
[ 610.908000] systemd-journald[169]: Received request to flush runtime journal from PID 1

root@wills:~#
Debian GNU/Linux stretch/sid wills ttyS0

wills login:


### At this point I have both a shell and a login prompt vying for input,
### pressing <Ctrl-D> in an attempt to exit the shell produces the freeze.

[  848.108000] INFO: task agetty:592 blocked for more than 120 seconds.
[  848.184000]       Not tainted 4.1.0-1-parisc64-smp #1
[  848.244000] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[  848.336000] agetty          D 00000000401630c0     0   592      1 0x00000110
[  848.420000] Backtrace:
[  848.448000]  [<000000004016c9b8>] __schedule+0x2a8/0x750
[  848.512000]  [<000000004016cea8>] schedule+0x48/0xc8
[  848.572000]  [<00000000401704a4>] schedule_timeout+0x1d4/0x240
[  848.644000]  [<000000004017106c>] ldsem_down_write+0x164/0x2d0
[  848.712000]  [<0000000040171b2c>] tty_ldisc_lock+0x2c/0xa8
[  848.780000]  [<00000000404e1e94>] tty_ldisc_hangup+0x12c/0x2e8
[  848.848000]  [<00000000404d6390>] __tty_hangup+0x498/0x680
[  848.916000]  [<00000000404d6c1c>] disassociate_ctty+0x94/0x420
[  848.984000]  [<00000000401a217c>] do_exit+0x99c/0xd18
[  849.044000]  [<00000000401a25b0>] do_group_exit+0x50/0xf0
[  849.108000]  [<00000000401a2670>] SyS_exit_group+0x20/0x28
[  849.176000]  [<0000000040164fc0>] syscall_exit+0x0/0x14
[  849.240000]
[  969.256000] INFO: task agetty:592 blocked for more than 120 seconds.
[  969.332000]       Not tainted 4.1.0-1-parisc64-smp #1
[  969.392000] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[  969.484000] agetty          D 00000000401630c0     0   592      1 0x00000110
[  969.568000] Backtrace:
[  969.596000]  [<000000004016c9b8>] __schedule+0x2a8/0x750
[  969.660000]  [<000000004016cea8>] schedule+0x48/0xc8
[  969.720000]  [<00000000401704a4>] schedule_timeout+0x1d4/0x240
[  969.792000]  [<000000004017106c>] ldsem_down_write+0x164/0x2d0
[  969.860000]  [<0000000040171b2c>] tty_ldisc_lock+0x2c/0xa8
[  969.928000]  [<00000000404e1e94>] tty_ldisc_hangup+0x12c/0x2e8
[  969.996000]  [<00000000404d6390>] __tty_hangup+0x498/0x680
[  970.064000]  [<00000000404d6c1c>] disassociate_ctty+0x94/0x420
[  970.132000]  [<00000000401a217c>] do_exit+0x99c/0xd18
[  970.192000]  [<00000000401a25b0>] do_group_exit+0x50/0xf0
[  970.256000]  [<00000000401a2670>] SyS_exit_group+0x20/0x28
[  970.324000]  [<0000000040164fc0>] syscall_exit+0x0/0x14
[  970.384000]

On 16/08/15 16:14, Graham Gower wrote:
> Hi,
> 
> I'm seeing the panic below on a c8000. It happens sometimes when booting, just
> before the login prompt is to appear. I've seen it with older kernels too, going
> back to at least 3.19.
> 
> -Graham
> 
> 
> [   62.596000] Backtrace:
> [   62.596000]  [<00000000401fdb60>] handle_percpu_irq+0xb0/0xf0
> [   62.596000]  [<00000000401f7894>] generic_handle_irq+0x4c/0x68
> [   62.596000]  [<0000000040177670>] execute_on_irq_stack+0x90/0xa8
> [   62.596000]  [<0000000040178574>] do_cpu_irq_mask+0x1ec/0x3e0
> [   62.596000]  [<0000000040164074>] intr_return+0x0/0xc
> [   62.596000]
> [   62.596000]
> [   62.596000] Bad Address (null pointer deref?): Code=26 regs=0000000042a0a070 (Addr=0000000000000000)
> [   62.596000] CPU: 0 PID: 444 Comm: (agetty) Not tainted 4.1.0-1-parisc64-smp #1 Debian 4.1.3-1
> [   62.596000] task: 000000007a9a7538 ti: 000000007dc38000 task.ti: 000000007dc38000
> [   62.596000]
> [   62.596000]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> [   62.596000] PSW: 00001000000001001111111100001110 Not tainted
> [   62.596000] r00-03  000000ff0804ff0e 00000000408b8f30 00000000401fdb60 0000000042a09f80
> [   62.596000] r04-07  000000004089ff30 0000000000000000 0000000000000000 0000000000000000
> [   62.596000] r08-11  0000000042a0a040 000000000000004c 0000000040932d40 000000000000004c
> [   62.596000] r12-15  000000000000004c 0000000000000001 00000000408d4f30 0000000000000001
> [   62.596000] r16-19  00000000408b8f30 00000000408b8f30 0000000000000202 00000000028b3000
> [   62.596000] r20-23  0000000042a0d020 bff7ffffffffffff 0000000040948420 fffc000000000000
> [   62.596000] r24-27  0000000042a099d0 0000000000000000 0000000040932d40 000000004089ff30
> [   62.596000] r28-31  0008000000000000 0000000042a09f50 0000000042a0a070 bff4000000000000
> [   62.596000] sr00-03  000000000013f800 0000000000000000 0000000000000000 000000000013b000
> [   62.596000] sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [   62.596000]
> [   62.596000] IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000401f861c 00000000401f8620
> [   62.596000]  IIR: 0ca010dc    ISR: 0000000000000000  IOR: 0000000000000000
> [   62.596000]  CPU:        0   CR30: 000000007dc38000 CR31: ffffffffdbfeffff
> [   62.596000]  ORIG_R28: 0000000040948420
> [   62.596000]  IAOQ[0]: handle_irq_event_percpu+0x8c/0x250
> [   62.596000]  IAOQ[1]: handle_irq_event_percpu+0x90/0x250
> [   62.596000]  RP(r2): handle_percpu_irq+0xb0/0xf0
> [   62.596000] Backtrace:
> [   62.596000]  [<00000000401fdb60>] handle_percpu_irq+0xb0/0xf0
> [   62.596000]  [<00000000401f7894>] generic_handle_irq+0x4c/0x68
> [   62.596000]  [<0000000040177670>] execute_on_irq_stack+0x90/0xa8
> [   62.596000]  [<0000000040178574>] do_cpu_irq_mask+0x1ec/0x3e0
> [   62.596000]  [<0000000040164074>] intr_return+0x0/0xc
> [   62.596000]
> <Cpu0> 0300109100e00000  0000000000000000  CC_PROCS_ENTRY_OUT
> [   62.596000] Kernel panic - not syncing: Bad Address (null pointer deref?)
> <Cpu0> 78000c6200e00000  a0e008c01100b009  CC_PAT_ENCODED_FIELD_WARNING
> <Cpu0> 76000c6800e00000  0000000000000520  CC_PAT_DATA_FIELD_WARNING
> <Cpu0> 0300109100e00000  0000000000000000  CC_PROCS_ENTRY_OUT
> [   62.596000] ---[ end Kernel panic - not syncing: Bad Address (null pointer deref?)
> 
