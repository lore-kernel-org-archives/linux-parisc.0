From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: godd news [[WasRe: [parisc-linux] but still panic:
	[WAS:	2.6.10-rc1-pa15 boot fine	on n4k but still	annoying bactrace]]
Date: Sun, 12 Dec 2004 12:00:21 +0000
Message-ID: <41BC32D5.5000607@tiscali.be>
References: <418A81310000E136@mail-7-bnl.tiscali.it>
	<1102645279.3814.1.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1102645279.3814.1.camel@mulgrave>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello James,

James Bottomley wrote:
> On Thu, 2004-12-09 at 18:47 +0000, Joel Soete wrote:
> 
>>Now that's a bit more then 48h that loop is running on n4k with k-2.6.10-rc3-pa3
>>(already rebuild 214 time ;-)
> 
> 
> Well, this isn't necessarily good news.  I still think the problem is
> triggered by a race in the signal code.  However, if its no longer
> tripping, it means that the code has changed to obscure it ... which
> means it's not going to get fixed until it shows up again.
> 
> James
> 
> 
> 
You had right (i was just luky in the previous test):
Backtrace:
  [<0000000010165698>] update_process_times+0x50/0x90
  [<0000000010120fa0>] smp_do_timer+0x78/0x80
  [<0000000010115938>] timer_interrupt+0xd8/0x2f0
  [<0000000010116630>] do_irq+0xd8/0x1e8
  [<0000000010116820>] do_cpu_irq_mask+0xe0/0x150
  [<0000000010107074>] intr_return+0x0/0x24


Kernel Fault: Code=26 regs=0000000068750dc0 (Addr=00000000000000d0)

      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001001111111100001110 Not tainted
r00-03  0000000000000000 ffffffffffff3d80 000000001016554c 000000001061ef20
r04-07  000000008f24f738 00000000000000de 0000000000000000 0000000000000000
r08-11  0000000000000001 0000000068750580 0000000000000010 000000008f24f7d8
r12-15  00000000ffffff7d 0000000000023d30 000000008f24f850 0000000068750410
r16-19  0000000068750580 00000000000eddc8 0000000000000000 0000000000000000
r20-23  0000000037800000 0000000037800000 0000000000000000 0000000000003780
r24-27  0000000000000000 0000000000000000 0000000000003780 000000001061ef20
r28-31  0000000000000000 0000000000000000 0000000068750dc0 000000000000fa00
sr0-3   0000000003e2f000 0000000000000000 0000000000000000 0000000003e2f000
sr4-7   0000000000000000 0000000000000000 0000000000000000 0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000010165554 0000000010165558
  IIR: 527401a0    ISR: 0000000000000000  IOR: 00000000000000d0
  CPU:        0   CR30: 0000000068750000 CR31: 00000000105e4000
  ORIG_R28: 0000000010463c58
  IAOQ[0]: update_one_process+0x74/0x168
  IAOQ[1]: update_one_process+0x78/0x168
  RP(r2): update_one_process+0x6c/0x168
Kernel panic - not syncing: Kernel Fault
  <0>Rebooting in 120 seconds..

this time it panics after 138 loop only?

I well reach to build a kernel with CONFIG_DEBUG_RWLOCK
<http://lists.parisc-linux.org/pipermail/parisc-linux/2004-December/025337.html>

but failed to boot.

Don't you think it could help to debug this pb?

Thanks for all,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
