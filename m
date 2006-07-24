From: "Thibaut VARENE" <T-Bone@parisc-linux.org>
Subject: [parisc-linux] Fwd: [BUG] 2.6.17 hangs on ppc/ia64/parisc and won't
	load init
Date: Sun, 23 Jul 2006 23:41:02 -0400
Message-ID: <7d01f9f00607232041i620d523at60687f9392c3c8d0@mail.gmail.com>
References: <7d01f9f00607232039g3d480198w7e206050bca36b0c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
To: parisc-linux <parisc-linux@lists.parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <7d01f9f00607232039g3d480198w7e206050bca36b0c@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi pa-ckers,

Here's what I just sent to lkml

----------

Hi,

I have this very strange bug and i know this is not the kind of bug
report you expect from me. I really have very limited information and
apologize since it doesn't meet the 'standard'.
Below is a brain dump of everything I know so far and will gladly
answer questions.

Quick summary:
The machine dies, and when I reboot it, it is so whacked it won't load
init, whether it's /sbin/init or /bin/sh. Happened on totally
different hw (ppc, ia64, parisc) running totally different workloads.
2.6.16 seems to work fine, and I don't know how to reproduce this bug.
Haven't tried 2.6.18-rc yet.

The long story:
My ppc machine (Pegasos II, 512MB, 1Ghz G4, 40GB PATA, radeon 9200,
reiserfs root disk) hung using 2.6.17-ck1 kernel and debian etch. This
is my main desktop machine and as expected using Xorg 7.1, firefox, a
few remote X apps etc...
After that machine hung I reset it. The boot process was stuck at
Loading INIT. Reset again and tried with init=/bin/sh. It took approx
5 minutes to get the "sh-3.1#" prompt. Then 'ls' would work.But 'ls
-l' would hang, as well as many other simple commands (I don't
remember exactly which i tried but i tried a few). I could kill the
stuck process with SysRQ. Note, all the machines I'm describing here
use LDAP to get regular users credentials, root is local though. To
make sure that the 5 minutes delay wasn't caused by some LDAP lookup
timing out, I tried to boot init=/bin/sh on a similar setup of a
working machine, and the "sh-3.1#" prompt came immediately, so there
is something else going on.

Fortunately, I had a second system partition on the same disk and was
able to boot from it fine (using the kernel that crashed, meaning the
binary apparently wasn't corrupted). Reiserfs utils attempted to
repair the root partition which was (according to those utils) badly
broken. Still, I could chroot into the original root partition, run ls
and
other commandline tools.
Except 'du -sh etc' came up with something like "2.1T". At that point
I knew something was terribly wrong ;P

So I reformatted that partition to ext3 to get rid of one possible
cause of the problem, and built a new 2.6.17-ck1 kernel. That new
setup lasted for less than a day before dying again. At that point I
gave up breaking my main system and considered it safe to get back to
known-working 2.6.16-ish.

At that point I was also thinking I could have bad hw (eg disk).
The following should convince you it's not.

A few days after the PPC machine events, one of my ia64 headless
servers (rx2600, McKinley 900MHz SMP, 4GB RAM, 36GB SCSI), running
debian etch and 2.6.17-pa3 (from the parisc CVS tree, basically
mainline 2.6.17 on ia64), crashed without any output on the console
after a couple weeks uptime. When I rebooted it, guess what, it would
hang calling init. That time, I booted from another partition as well,
and tried to reinstall all 'base' (ie, essential to the system)
packages, including init and friends. It didn't help. The symptoms
were exactly the same; I couldn't recover the system and had to
reinstall it. I don't recall if the root file system was either ext3
or xfs. I'm certain it was not reiserfs.

Finally, most recently (yesterday to be precise), on of my parisc
system (rp3440, pa8800 SMP 800MHz, 4GB RAM, 73GB SCSI) crashed while I
was using it, and again exposed the exact same symptoms. It was
running  debian sid and 2.6.17-rc6-pa3 64bit. It was up for a
few hours. Interestingly, I experienced much longer uptimes with that
very same machine/kernel. The machine was running gdb when it died,
and this time I got a stack dump on the console. I don't totally trust
parisc stack unwinder but here it is anyway:

BUG: soft lockup detected on CPU#1!
Backtrace:
 [<0000000010112aa0>] dump_stack+0x18/0x28
 [<0000000010172558>] softlockup_tick+0x130/0x160
 [<0000000010152630>] run_local_timers+0x28/0x38
 [<0000000010152708>] update_process_times+0xc8/0x128
 [<000000001011d9d8>] smp_do_timer+0x60/0x80
 [<0000000010113a5c>] timer_interrupt+0xec/0x1f0
 [<00000000101726fc>] handle_IRQ_event+0x74/0xf8
 [<0000000010172838>] __do_IRQ+0xb8/0x260
 [<00000000101145f8>] do_cpu_irq_mask+0x130/0x1f8
 [<0000000010104074>] intr_return+0x0/0x1c

BUG: soft lockup detected on CPU#0!
Backtrace:
 [<0000000010112aa0>] dump_stack+0x18/0x28
 [<0000000010172558>] softlockup_tick+0x130/0x160
 [<0000000010152630>] run_local_timers+0x28/0x38
 [<0000000010152708>] update_process_times+0xc8/0x128
 [<000000001011d9d8>] smp_do_timer+0x60/0x80
 [<0000000010113a5c>] timer_interrupt+0xec/0x1f0
 [<00000000101726fc>] handle_IRQ_event+0x74/0xf8
 [<0000000010172838>] __do_IRQ+0xb8/0x260
 [<00000000101145f8>] do_cpu_irq_mask+0x130/0x1f8
 [<0000000010104074>] intr_return+0x0/0x1c
 [<0000000010167708>] hrtimer_run_queues+0x198/0x268
 [<000000001015239c>] run_timer_softirq+0x54/0x2c0
 [<000000001014b8cc>] __do_softirq+0x15c/0x180
 [<000000001010ec14>] do_softirq+0x64/0x70
 [<000000001014ba1c>] irq_exit+0x6c/0x78
 [<0000000010114680>] do_cpu_irq_mask+0x1b8/0x1f8

This bug (so far) never killed our systems as badly as what I'm
describing, so it could be something else. The rp3440 machine was
using an ext3 fs.

I can probably provide configs for the ppc and parisc kernels. But the
ia64 config is gone unfortunately.

So far, here's what I can infer:
- it's not a particular fs' problem (affected reiserfs, ext3fs)
- it's in generic code (affected ppc, ia64 and parisc)
- it's probably in 'core' code actually (totally different
configurations, yet affected all of them)
- it has an impact on fs coherency (that's the only explanation i can
come up with to explain the fact that init=/bin/sh won't work)
- 2.6.16 doesn't seem to be affected (at least not to that extent)

HTH, and again, feel free to ask questions

T-Bone

-- 
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
