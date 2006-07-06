From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Mysterious hangs with parisc
Date: Thu, 06 Jul 2006 18:22:40 +0000
Message-ID: <44AD54F0.90508@tiscali.be>
References: <20060624015935.GJ12481@quicksilver.road.mcmartin.ca>	<200606240241.k5O2fALQ001885@hiauly1.hia.nrc.ca>
	<20060705164734.GB30640@athena.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: James.Bottomley@SteelEye.com,
 John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060705164734.GB30640@athena.road.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



Kyle McMartin wrote:
> On Fri, Jun 23, 2006 at 10:41:09PM -0400, John David Anglin wrote:
> 
>>This is not to say that the locking code can't be improved.  As far
>>as I can tell, hpux doesn't spin.  It has pre-abitration, priorities
>>for waiters, etc.  When a lock is released, suwaiters is called to
>>pass the lock in a fair way to another waiter if there is one.
>>
> 
> 
> HPUX spinlocks /do/ spin, afaict. They just keep track of how long
> they've been spinning for (and panic after 60 seconds.) On release of
> a spinlock, they also donate it to another cpu, which is, I guess, the
> arbitration thing. I can back this up with disassembly, but I wouldn't
> be comfortable doing it over mail, due to copyright infringement and
> blah blah.
> 
> Cheers,
> 	 Kyle M.

Cool ;-)

That said to followup another related thread <http://lists.parisc-linux.org/pipermail/parisc-linux/2006-July/029481.html>, the 
do_gettimeofday() jejb's patch doesn't help:

after just some hours of my stress test:

top - 17:52:25 up 21:57,  3 users,  load average: 8.16, 7.18, 6.91
Tasks:  84 total,   5 running,  79 sleeping,   0 stopped,   0 zombie
Cpu0  : 53.7% us, 35.3% sy,  0.0% ni,  0.0% id,  0.0% wa,  0.0% hi, 11.0% si
Cpu1  : 86.1% us, 10.2% sy,  0.0% ni,  0.0% id,  0.7% wa,  0.0% hi,  2.9% si
Mem:   4114224k total,  4018628k used,    95596k free,   483816k buffers
Swap:   250872k total,        4k used,   250868k free,   436632k cached


I still encountered the well know BUG: soft lockup detected
BUG: soft lockup detected on CPU#1!
Backtrace:
  [<00000000101122b0>] dump_stack+0x18/0x28
  [<0000000010171c60>] softlockup_tick+0x128/0x158
  [<0000000010151a00>] run_local_timers+0x28/0x38
  [<0000000010152770>] update_process_times+0x58/0xd8
  [<000000001011cc08>] smp_do_timer+0x70/0x80
  [<00000000101134b4>] timer_interrupt+0xdc/0x1e0
  [<0000000010171e04>] handle_IRQ_event+0x74/0xd0
  [<0000000010171f1c>] __do_IRQ+0xbc/0x268
  [<0000000010113e74>] do_cpu_irq_mask+0x114/0x1e0
  [<0000000010104074>] intr_return+0x0/0x1c

BUG: soft lockup detected on CPU#0!
Backtrace:
  [<00000000101122b0>] dump_stack+0x18/0x28
  [<0000000010171c60>] softlockup_tick+0x128/0x158
  [<0000000010151a00>] run_local_timers+0x28/0x38
  [<0000000010152770>] update_process_times+0x58/0xd8
  [<000000001011cc08>] smp_do_timer+0x70/0x80
  [<00000000101134b4>] timer_interrupt+0xdc/0x1e0
  [<0000000010171e04>] handle_IRQ_event+0x74/0xd0
  [<0000000010171f1c>] __do_IRQ+0xbc/0x268
  [<0000000010113e74>] do_cpu_irq_mask+0x114/0x1e0
  [<0000000010104074>] intr_return+0x0/0x1c

(only a small diff with previous failures: here it shows also 'CPU#1!')

Otoh previous test seems to show that older gcc-3.3 would produce a more operational kernel but I haven't any idea where to look for?

All guide line would be welcome.

Thanks,
     Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
