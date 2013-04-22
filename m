From: John David Anglin <dave.anglin@bell.net>
Subject: Re: HPPA TODO discussion
Date: Mon, 22 Apr 2013 19:46:17 -0400
Message-ID: <BLU0-SMTP89ECD6DE64096062F05B0E97CB0@phx.gbl>
References: <514C43F3.4040206@gmail.com> <51631E58.40703@gmx.de>
 <516325C4.3060601@bell.net> <516476B2.5070203@gmx.de>
 <51647BD0.5090703@bell.net> <51647ED6.3010308@gmx.de>
 <516484DC.7010807@bell.net> <516487C1.7040004@gmx.de>
 <BLU0-SMTP703D62CA01367F237EF15197C60@phx.gbl> <5165C155.1080703@gmx.de>
 <5165D983.6070507@bell.net> <BLU0-SMTP7629CCB47BE1ED29C8DBC997C00@phx.gbl>,
 <BLU0-SMTP89ED49182B52087410DC597C10@phx.gbl>
 <trinity-b2b2fe55-7479-4bce-9acd-f3ba1a954ba3-1365778076698@3capp-gmx-bs09>
 <516824BD.7020205@bell.net> <BLU0-SMTP18CB6AE03CF38381ECF94397C20@phx.gbl>
 <5169BBD1.2070008@gmx.de> <BLU0-SMTP78F7D0C880682B1681B9EC97C20@phx.gbl>
 <BLU0-SMTP497EDB1FFDDD314EFF5C8D97C20@phx.gbl> <516B1F86.5010602@gmx.de>,
 <BLU0-SMTP678DA690D56A8DFF593E5597C30@phx.gbl>
 <trinity-917bdd57-1051-47af-9bdb-c85910d4d390-1366023186058@3capp-gmx-bs13>
 <516C00EC.3010102@bell.net> <516DAB97.8090905@gmx.de>
 <BLU0-SMTP14CBF9C6918F6A65C6484D97CE0@phx.gbl>
 <BLU0-SMTP985F9D0870B28DBF795DC297CE0@phx.gbl> <516F0E50.5040202@gmx.de>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: linux-parisc List <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <516F0E50.5040202@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 17-Apr-13, at 5:04 PM, Helge Deller wrote:

>>> Have you had a chance to try my patch on a UP machine?  With the  
>>> additional locking,
>>> there's an increased chance that lockups might occur.  That's the  
>>> risk.
>
> Yes, I'm running your patch on a UP (PA8600 CPU) and a SMP (PA8500 I  
> think) machine.
> No lockups until now, only the do_softirq() crashes I mentioned above.

I don't think I should upload my Debian kernel build.  It suffers  
seriously from the do_softirq() crashes.
It gets to the login console and dies either immediately or after I  
hit a carriage return.

[ ok ] Starting Postfix Mail Transport Agent: postfix.

Debian GNU/Linux 7.0 mx3210 ttyS1

mx3210 login: [  235.148000] Backtrace:
[  235.148000]  [<0000000040116878>] do_softirq+0x50/0x68
[  235.148000]  [<0000000040146ad8>] irq_exit+0x60/0x80
[  235.148000]  [<000000004011baf4>] do_cpu_irq_mask+0x214/0x2a0
[  235.148000]  [<0000000040105074>] intr_return+0x0/0x4
[  235.148000]  [<00000000401040c0>] _switch_to_ret+0x0/0xf40
[  235.148000]
[  235.148000]
[  235.148000] Kernel Fault: Code=26 regs=000000007ecf07f0  
(Addr=0000000000000010)
[  235.148000]
[  235.148000]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[  235.148000] PSW: 00001000000001000000000000001111 Not tainted
[  235.148000] r00-03  000000000804000f 000000004065c080  
0000000040146728 0000000000000001
[  235.148000] r04-07  000000004080fd00 0000000000000048  
000000000000000a 000000007ecf07c0
[  235.148000] r08-11  0000000040824500 0000000000200040  
0000000000000003 0000000040838d00
[  235.148000] r12-15  0000000040755740 0000000040838500  
0000000040837500 0000000040838d00
[  235.148000] r16-19  0000000040824500 0000000000000100  
0000000000000009 0000000042606b24
[  235.148000] r20-23  ffe0000000000000 0000000042606020  
8000000000000000 000000000000c7e0
[  235.148000] r24-27  0000000000000001 0000000040660200  
000000004065c0c8 000000004080fd00
[  235.148000] r28-31  0000000000000000 000000007ecf07c0  
000000007ecf07f0 0000000001d7f000
[  235.148000] sr00-03  0000000000b16000 0000000000000000  
0000000000000000 0000000000b16000
[  235.148000] sr04-07  0000000000000000 0000000000000000  
0000000000000000 0000000000000000
[  235.148000]
[  235.148000] IASQ: 0000000000000000 0000000000000000 IAOQ:  
00000000401466bc 00000000401466c0
[  235.148000]  IIR: 53820020    ISR: 0000000000000000  IOR:  
0000000000000010
[  235.148000]  CPU:        3   CR30: 000000007ecf0000 CR31:  
ffffffffffffffff
[  235.148000]  ORIG_R28: 0000000000000000
[  235.148000]  IAOQ[0]: __do_softirq+0x144/0x280
[  235.148000]  IAOQ[1]: __do_softirq+0x148/0x280
[  235.148000]  RP(r2): __do_softirq+0x1b0/0x280
[  235.148000] Backtrace:
[  235.148000]  [<0000000040116878>] do_softirq+0x50/0x68
[  235.148000]  [<0000000040146ad8>] irq_exit+0x60/0x80
[  235.148000]  [<000000004011baf4>] do_cpu_irq_mask+0x214/0x2a0
[  235.148000]  [<0000000040105074>] intr_return+0x0/0x4
[  235.148000]  [<00000000401040c0>] _switch_to_ret+0x0/0xf40
[  235.148000]
[  235.148000] Kernel panic - not syncing: Kernel Fault

This reminds me of the two hacks that I once had:

diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index 3aca9f2..b891626 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -582,6 +582,7 @@ out_eoi:
  void
  handle_percpu_irq(unsigned int irq, struct irq_desc *desc)
  {
+       struct irqaction *action;
         struct irq_chip *chip = irq_desc_get_chip(desc);

         kstat_incr_irqs_this_cpu(irq, desc);
@@ -589,7 +590,9 @@ handle_percpu_irq(unsigned int irq, struct  
irq_desc *desc)
         if (chip->irq_ack)
                 chip->irq_ack(&desc->irq_data);

-       handle_irq_event_percpu(desc, desc->action);
+       action = desc->action;
+       if (action)
+               handle_irq_event_percpu(desc, action);

         if (chip->irq_eoi)
                 chip->irq_eoi(&desc->irq_data);
diff --git a/kernel/softirq.c b/kernel/softirq.c
index ed567ba..0344acb 100644
--- a/kernel/softirq.c
+++ b/kernel/softirq.c
@@ -259,7 +259,7 @@ restart:
                 }
                 h++;
                 pending >>= 1;
-       } while (pending);
+       } while (pending && h >= (struct softirq_action *)0x1000);

         local_irq_disable();

In the last, I had decided that we had run off the pending queue.  You  
were going to
ask around about this bug.

Then, I tried to boot twice 2.6.39-rc7+.  Both failed with lockups:

[ ok ] Starting Postfix Mail Transport Agent: postfix.

Debian GNU/Linux 7.0 mx3210 ttyS1

mx3210 login: BUG: soft lockup - CPU#3 stuck for 4278967496s! [swapper/ 
3:0]
Modules linked in: iscsi_tcp libiscsi_tcp libiscsiBUG: soft lockup -  
CPU#2 stuck for 4278967496s! [swapper/2:0]
Modules linked in: iscsi_tcp libiscsi_tcp libiscsi  
scsi_transport_iscsi nfsd exportfs ipv6 ext2 ext3 mbcache jbd dm_mod  
zalon7xx lasi700 53c700 hilkbd sd_mod crc_t10dif sg sr_mod cdrom tg3  
sym53c8xx pata_cmd64x scsi_transport_spi ptp pps_core libata scsi_mod

      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001001111111100001111 Not tainted
r00-03  000000ff0804ff0f 000000004074fff0 00000000401255a0  
000000007f0ec190
r04-07  000000004073c7f0 000000007f0ec1f0 0000000000000002  
0000000000000002
r08-11  000000f0f0d08440 0200000000000000 000000000804000e  
00000000407678fc
r12-15  0000000000000041 0000000040826500 0000000040837d00  
0000000040660300
r16-19  fffffff0f0d00b0c 0000000000000004 0000000040826500  
000000000800000e
r20-23  0000000001d75000 000000007f257e00 000000007f7c1cc0  
000000000800000e
r24-27  000000000800000e 0000000000000000 000000004250d748  
000000004073c7f0
r28-31  0000000000000008 000000007f0ec1f0 000000007f0ec220  
0000000040684444
sr00-03  0000000000963000 0000000000963000 0000000000000000  
0000000000963000
sr04-07  0000000000000000 0000000000000000 0000000000000000  
0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000401255b4  
00000000401255b8
  IIR: 03c008bc    ISR: 000000004075eff0  IOR: ffffffffc0000000
  CPU:        2   CR30: 000000007f0ec000 CR31: ffffffffffffffff
  ORIG_R28: 000000004060ac30
  IAOQ[0]: cpu_idle+0x8c/0xc0
  IAOQ[1]: cpu_idle+0x90/0xc0
  RP(r2): cpu_idle+0x78/0xc0
Backtrace:
  [<0000000040767ab0>] smp_callin+0x1b8/0x1d8

BUG: soft lockup - CPU#1 stuck for 4278967496s! [swapper/1:0]
Modules linked in: iscsi_tcp libiscsi_tcp libiscsi  
scsi_transport_iscsi nfsd exportfs ipv6 ext2 ext3 mbcache jbd dm_mod  
zalon7xx lasi700 53c700 hilkbd sd_mod crc_t10dif sg sr_mod cdrom tg3  
sym53c8xx pata_cmd64x scsi_transport_spi ptp pps_core libata scsi_mod

      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000011001111111100001111 Not tainted
r00-03  000000ff080cff0f 000000004074fff0 00000000401255a0  
000000007f0e4190
r04-07  000000004073c7f0 000000007f0e41f0 0000000000000001  
0000000000000001
r08-11  000000f0f0d08440 0100000000000000 000000000804000e  
00000000407678fc
r12-15  00000000409ba638 00000000409ba638 00000000405ec040  
0000000000000001
r16-19  fffffff0f0d00b0c 000000007eab57a8 0000000040668580  
000000000800000e
r20-23  0000000001d6b000 000000007f257ec0 000000007f7c1cc0  
000000000800000e
r24-27  000000000800000e 0000000000000000 0000000042503748  
000000004073c7f0
r28-31  0000000000000008 000000007f0e41f0 000000007f0e4220  
0000000040684444
sr00-03  0000000000963000 0000000000963000 0000000000000000  
0000000000963000
sr04-07  0000000000000000 0000000000000000 0000000000000000  
0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000401255c0  
00000000401255b4
  IIR: 0805025d    ISR: 000000004075eff0  IOR: ffffffffc0000000
  CPU:        1   CR30: 000000007f0e4000 CR31: ffffffffffffffff
  ORIG_R28: 000000004060ac30
  IAOQ[0]: cpu_idle+0x98/0xc0
  IAOQ[1]: cpu_idle+0x8c/0xc0
  RP(r2): cpu_idle+0x78/0xc0
Backtrace:
  [<0000000040767ab0>] smp_callin+0x1b8/0x1d8

BUG: soft lockup - CPU#0 stuck for 4278967497s! [swapper/0:0]
Modules linked in: iscsi_tcp libiscsi_tcp libiscsi  
scsi_transport_iscsi nfsd exportfs ipv6 ext2 ext3 mbcache jbd dm_mod  
zalon7xx lasi700 53c700 hilkbd sd_mod crc_t10dif sg sr_mod cdrom tg3  
sym53c8xx pata_cmd64x scsi_transport_spi ptp pps_core libata scsi_mod

      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001001111111100001111 Not tainted
r00-03  000000ff0804ff0f 000000004074fff0 00000000401255a0  
00000000405e82e0
r04-07  000000004073c7f0 00000000405e8340 0000000040691070  
000000004078fb98
r08-11  0000000040691008 00000000424f6100 000000000804000e  
000000004011b244
r12-15  0000000000000fe7 000000004067a768 0000000000000fe6  
0000000000000001
r16-19  00000000f0d00b0c 0000000000000fe7 0000000000000fe6  
000000000800000e
r20-23  0000000001d61000 000000000800000f 000000007f7c1cc0  
000000000800000e
r24-27  000000000800000e 0000000000000000 00000000424f9748  
000000004073c7f0
r28-31  00000000405e8000 00000000405e8340 00000000405e8370  
0000000040684444
sr00-03  0000000000963000 0000000000963000 0000000000000000  
0000000000963000
sr04-07  0000000000000000 0000000000000000 0000000000000000  
0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000401255b8  
00000000401255bc
  IIR: 539c0020    ISR: 000000004075eff0  IOR: ffffffffc0000000
  CPU:        0   CR30: 00000000405e8000 CR31: 2001001408940008
  ORIG_R28: 000000004060ac30
  IAOQ[0]: cpu_idle+0x90/0xc0
  IAOQ[1]: cpu_idle+0x94/0xc0
  RP(r2): cpu_idle+0x78/0xc0
Backtrace:
  [<000000004010bc48>] rest_init+0xe0/0xf8
  [<0000000040760f14>] start_kernel+0x7a4/0x7d0
  [<00000000404ec278>] rpc_pipe_ioctl+0xf0/0x118
  [<00000000404adb4c>] ip_mroute_getsockopt+0x84/0x118
  [<000000004048ae10>] udp_ioctl+0x80/0xc8
  [<0000000040486ba0>] raw_sendmsg+0x290/0x8b0
  [<0000000040465998>] do_tcp_getsockopt.isra.21+0x270/0x6c0
  [<0000000040441864>] compat_sys_getsockopt+0x1ec/0x228
  [<00000000404415b0>] compat_sys_setsockopt+0x1d8/0x2a0
  [<0000000040440f00>] cmsghdr_from_user_compat_to_kern+0x2a8/0x2f8
  [<0000000040440a9c>] get_compat_msghdr+0x11c/0x170


  scsi_transport_iscsi nfsd exportfs ipv6 ext2 ext3 mbcache jbd dm_mod  
zalon7xx lasi700 53c700 hilkbd sd_mod crc_t10dif sg sr_mod cdrom tg3  
sym53c8xx pata_cmd64x scsi_transport_spi ptp pps_core libata scsi_mod

      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001001111111100001111 Not tainted
r00-03  000000ff0804ff0f 000000004074fff0 00000000401255a0  
000000007f0f0190
r04-07  000000004073c7f0 000000007f0f01f0 0000000000000003  
0000000000000003
r08-11  000000f0f0d08440 0300000000000000 000000000804000e  
00000000407678fc
r12-15  000000004060ac30 000000004071b3b0 0000000000000000  
0000000000000001
r16-19  fffffff0f0d00b0c 000000004074eff0 000000004250f750  
000000000800000e
r20-23  0000000001d7f000 000000000800000f 000000007e2dc0c0  
000000000800000e
r24-27  000000000800000e 0000000000000000 0000000042517748  
000000004073c7f0
r28-31  000000007f0f0000 000000007f0f01f0 000000007f0f0220  
0000000040684444
sr00-03  0000000000aa6000 0000000000000000 0000000000000000  
0000000000aa6000
sr04-07  0000000000000000 0000000000000000 0000000000000000  
0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000401255b8  
00000000401255bc
  IIR: 539c0020    ISR: 000000004075eff0  IOR: ffffffffc0000000
  CPU:        3   CR30: 000000007f0f0000 CR31: ffffffffffffffff
  ORIG_R28: 000000004060ac30
  IAOQ[0]: cpu_idle+0x90/0xc0
  IAOQ[1]: cpu_idle+0x94/0xc0
  RP(r2): cpu_idle+0x78/0xc0
Backtrace:
  [<0000000040767ab0>] smp_callin+0x1b8/0x1d8

Since the number of seconds is wrong in the lockup message (e.g., "  
CPU#0 stuck for 4278967497s!"),
it occurred to me that something isn't being initialized properly.   
So, I powered the machine down and
rebooted again.  This time it booted 3.9-rc7+ successfully.

Dave
--
John David Anglin	dave.anglin@bell.net



