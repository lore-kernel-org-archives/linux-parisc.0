From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] "BUG: soft lockup detected on CPU#0" on recent
	64bit k-2.6.16 (up or smp)
Date: Sun, 16 Apr 2006 20:04:16 +0000
Message-ID: <4442A340.5090807@tiscali.be>
References: <IXNES9$1FC408083B06CF3616F90EC3F405A12F@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <IXNES9$1FC408083B06CF3616F90EC3F405A12F@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



Joel Soete wrote:
>>Hello pa*,
>>
>>Just to report some "BUG: soft lockup detected on CPU#0":
>>on b2k testing k-2.6.16-pa4 64bit up:
>>BUG: soft lockup detected on CPU#0!
>>
> 
> [snip]
> 
> 
>> IAOQ[0]: _read_lock+0x18/0x30
>> IAOQ[1]: _read_lock+0x8/0x30
>> RP(r2): send_group_sig_info+0x3c/0xb0
>>
>>(on this system also with a previous k-2.6.16-rc4-pa1-n4kmp without activity
>>then waiting my request ;-) )
>>
> 
> Hi all,
> 
> Could that be the result of the upstream bug:
> <http://www.kernel.org/pub/linux/kernel/v2.6/ChangeLog-2.6.16.4>
> 
> At least in the way; I will test it ...
> 
mmm, seems to help 64bit up kernel runing for a bit more then 3 days on b2k (building in loop kernel)

OTOH not for smp neither on 32bit nor 64bit:
	* 32bit smp 2.6.17-rc1-pa2 hang after some 2 days of run (loop kernel build) on a d380 with msg:
[230961.320000] BUG: soft lockup detected on CPU#1!
[230961.370000] Backtrace:
[230961.400000]  [<10157900>] softlockup_tick+0xf8/0x140
[230961.460000]  [<1013e080>] update_process_times+0x44/0x94
[230961.500000]  [<10109510>] timer_interrupt+0xcc/0x1e4
[230961.500000]  [<10157a58>] handle_IRQ_event+0x5c/0xa4
[230961.500000]  [<10157b44>] __do_IRQ+0xa4/0x220
[230961.500000]  [<10109ca0>] do_cpu_irq_mask+0xd8/0x1b0
[230961.500000]  [<1010c068>] intr_return+0x0/0x1c
[230961.500000]
[230961.500000] BUG: soft lockup detected on CPU#0!
[230961.500000] Backtrace:
[230961.500000]  [<10157900>] softlockup_tick+0xf8/0x140
[230961.500000]  [<1013e080>] update_process_times+0x44/0x94
[230961.500000]  [<10109510>] timer_interrupt+0xcc/0x1e4
[230961.500000]  [<10157a58>] handle_IRQ_event+0x5c/0xa4
[230961.500000]  [<10157b44>] __do_IRQ+0xa4/0x220
[230961.500000]  [<10109ca0>] do_cpu_irq_mask+0xd8/0x1b0
[230961.500000]  [<1010c068>] intr_return+0x0/0x1c
[230961.500000]

	* 64bit smp still hang silently after a bit more then 2 days of same build loop ;-(
	  (even with DETECT_SOFTLOCKUP = y?)

Joel

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
