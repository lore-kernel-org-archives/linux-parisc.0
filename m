From: Helge Deller <deller@gmx.de>
Subject: Re: Kernel Panic on 4 cores hp c8000
Date: Thu, 31 Mar 2016 19:19:44 +0200
Message-ID: <56FD5C30.4020409@gmx.de>
References: <CACrbsaA0fw4KeKkcO5zZ50yMLsoysqJE6+ShfejCxDG9Zhns1Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
To: Simone Mannori <simone.mannori@gmail.com>,
	linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CACrbsaA0fw4KeKkcO5zZ50yMLsoysqJE6+ShfejCxDG9Zhns1Q@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Simone,

On 31.03.2016 19:00, Simone Mannori wrote:
> I have an HP c8000 with two CPUs (PA-8800, 1GHz four cores) perfectly
> working with HP-UX v11: all the hardware is correcly detected and
> configured.
> 
> I have installed Debian 8.0 "unstable" on a 160G PATA/IDE and on 72G
> SCSI disks. Installation looks good, BUT at boot time I have a kernel
> panic message (please see below for the details). The behaviour is
> deterministic. I'm bootin only with one HD and empty DVD drive.
> 
> If you think useful I can post the complete list of boot messages (I'm
> working using serial console terminal using Serial_A port).
> 
> For the sake of completness, the very same kernel panic arrives using
> keyboard and monitor attached to the video card.
> 
> The c8000 was perfectly OK with both UP-UX and Linux before the CPU
> (from 1 to two PA-8800) upgrade.
> 
> Thanks in adavance for your help. In the meanwhile I'm going to
> step-back to Debian 5. I will keep up updated.

I think Debian 5 will not even install on the C8000..

But you didn't gave any information which kernel version you are using ?

This kernel should be pretty stable on the C8000:
http://backup.parisc-linux.org/kernel/linux-image-4.2.0-1-parisc64-smp_4.2.6-3+b3_hppa.deb

Helge
 
>   Simone Mannori - Italy
> 
> //**------------------------------
> 
> 
> [   44.548000] sr04-07  0000000000000000 0000000000000000 0000000000000000 00000
> 00000000000
> [   44.548000]
> [   44.548000] IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000401f7944 00
> 000000401f7948
> [   44.548000]  IIR: 0ca010dc    ISR: 0000000000000000  IOR: 0000000000000000
> [   44.548000]  CPU:        0   CR30: 000000007f87c000 CR31: fffffff0f0e034e0
> [   44.548000]  ORIG_R28: 00000000ffff068a
> [   44.548000]  IAOQ[0]: handle_irq_event_percpu+0x8c/0x250
> [   44.548000]  IAOQ[1]: handle_irq_event_percpu+0x90/0x250
> [   44.548000]  RP(r2): handle_percpu_irq+0xac/0xe8
> [   44.548000] Backtrace:
> [   44.548000]  [<00000000401fcab4>] handle_percpu_irq+0xac/0xe8
> [   44.548000]  [<00000000401f6bbc>] generic_handle_irq+0x4c/0x68
> [   44.548000]  [<00000000401612a4>] call_on_stack+0x18/0x24
> [   44.548000]
> <Cpu0> 0300109100e00000  0000000000000000  CC_PROCS_ENTRY_OUT
> [   44.548000] Kernel panic - not syncing: Bad Address (null pointer deref?)
> <Cpu0> 78000c6200e00000  a0e008c01100b009  CC_PAT_ENCODED_FIELD_WARNING
> <Cpu0> 76000c6800e00000  0000000000000520  CC_PAT_DATA_FIELD_WARNING
> <Cpu0> 0300109100e00000  0000000000000000  CC_PROCS_ENTRY_OUT
> [   44.548000] ---[ end Kernel panic - not syncing: Bad Address (null pointer de
> ref?)

