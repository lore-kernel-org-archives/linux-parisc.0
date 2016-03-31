From: Simone Mannori <simone.mannori@gmail.com>
Subject: Re: Kernel Panic on 4 cores hp c8000
Date: Thu, 31 Mar 2016 19:52:27 +0200
Message-ID: <CACrbsaDmyLfATgQckhyp1OdzH+ex_po5h6bMDFJBP5_XS_EqPw@mail.gmail.com>
References: <CACrbsaA0fw4KeKkcO5zZ50yMLsoysqJE6+ShfejCxDG9Zhns1Q@mail.gmail.com>
	<56FD5C30.4020409@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <56FD5C30.4020409@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

>From the boot messages looks like a bug in the "autofs4" module:

[   28.916000] systemd[1]: Inserted module 'autofs4'
[   28.988000] systemd[1]: Set hostname to <blsw>.
[   29.064000] systemd[1]: /etc/mtab is not a symlink or not pointing
to /proc/self/mounts. This is not supported anymore. Please make sure
to replace this file by a symlink to avoid incorrect or misleading
mount(8) output.
[   32.132000] Backtrace:
[   32.132000]  [<00000000401fcab4>] handle_percpu_irq+0xac/0xe8
[   32.132000]  [<00000000401f6bbc>] generic_handle_irq+0x4c/0x68
[   32.132000]  [<00000000401612a4>] call_on_stack+0x18/0x24
[   32.132000]  [<000000004017370c>] execute_on_irq_stack+0x5c/0xa8
[   32.132000]  [<000000004015fe5c>] _switch_to_ret+0xd9c/0xf40
[   32.132000]  [<00000000401604f4>] intr_save+0x18/0x11c
[   32.132000]  [<0000000040160820>] dtlb_miss_20w+0xc8/0x108
[   32.132000]  [<0000000040160568>] intr_save+0x8c/0x11c
[   32.132000]  [<000000004015fee8>] _switch_to_ret+0xe28/0xf40
[   32.132000]  [<000000004015e9a4>] end_linux_gateway_page+0x9a4/0x1000
[   32.132000]  [<000000004015de60>] cas2_end+0x85c/0x9fc
[   32.132000]  [<00000000401604a4>] intr_extint+0x20c/0x244
[   32.132000]  [<000000004015dbe8>] cas2_end+0x5e4/0x9fc
[   32.132000]  [<000000004015dd50>] cas2_end+0x74c/0x9fc
[   32.132000]  [<00000000405a8ea4>] __sk_run_filter+0x156c/0x1738
[   32.132000]
[   32.132000]
[   32.132000] Bad Address (null pointer deref?): Code=26
regs=0000000041f7a340 (Addr=0000000000000000)
[   32.132000] CPU: 0 PID: 0 Comm: swapper/0 Not tainted
3.16.0-4-parisc64-smp #1 Debian 3.16.7-ckt4-3
[   32.132000] task: 0000000040984e18 ti: 00000000408c8000 task.ti:
00000000408c8000
