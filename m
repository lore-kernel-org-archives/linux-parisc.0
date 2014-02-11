From: Guy Martin <gmsoft@tuxicoman.be>
Subject: Kernel panic with 3.13.2 and SLAB
Date: Tue, 11 Feb 2014 11:52:01 +0100
Message-ID: <8885305a922f01cd7bd484e884667588@tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi,

I've recently upgraded from 3.12.4 to 3.13.2 and the kernel did not boot 
with the exact same config.

Here is an excerpt of the panic :

[    9.080000] ------------[ cut here ]------------
[    9.208000] WARNING: at mm/slab.c:2614
[    9.208000] Modules linked in:
[    9.348000] CPU: 3 PID: 1 Comm: swapper/0 Not tainted 3.13.2 #1
[    9.348000] task: 000000007fc75178 ti: 000000007fc78000 task.ti: 
000000007fc78000
[    9.488000]
[    9.488000]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[    9.624000] PSW: 00001000000001000000000000001110 Not tainted
[    9.624000] r00-03  000000000804000e 0000000000000000 
00000000402862b4 000000007fc78650
[    9.764000] r04-07  000000004091a300 000000007fc02080 
00000001437e40e0 0000000040a64030
[    9.904000] r08-11  000000007fd4da00 00000001437e4100 
000000000000000f 000f000000000000
[   10.044000] r12-15  000000007fc02088 ffffffffc0000000 
0000000000100100 000000004096a300
[   10.044000] r16-19  0000000040969b00 00000000000001ff 
0000000040969b00 0000000000000001
[   10.184000] r20-23  0000000000000000 000000007fc020a8 
0000000000000001 bff405fd00000000
[   10.320000] r24-27  000000007fc78740 00000000006fc81c 
00000000007fc020 000000004091a300
[   10.460000] r28-31  000000023f804040 00000000409c2740 
000000007fc78770 000000007fc020a8
[   10.604000] sr00-03  0000000000000000 0000000000000000 
0000000000000000 0000000000000000
[   10.604000] sr04-07  0000000000000000 0000000000000000 
0000000000000000 0000000000000000
[   10.740000]
[   10.740000] IASQ: 0000000000000000 0000000000000000 IAOQ: 
00000000402864f8 00000000402864fc
[   10.880000]  IIR: 03ffe01f    ISR: 0000000010240000  IOR: 
0000040df93e40f8
[   11.016000]  CPU:        3   CR30: 000000007fc78000 CR31: 
ffffffffdffffaef
[   11.156000]  ORIG_R28: 000000004096a300
[   11.156000]  IAOQ[0]: cache_alloc_refill+0x4c8/0xbf8
[   11.296000]  IAOQ[1]: cache_alloc_refill+0x4cc/0xbf8
[   11.296000]  RP(r2): cache_alloc_refill+0x284/0xbf8
[   11.436000] Backtrace:
[   11.436000]  [<0000000040285fa8>] kmem_cache_alloc+0x1c8/0x250
[   11.436000]  [<0000000040257100>] kmem_cache_create_memcg+0xd0/0x3a8
[   11.576000]  [<000000004025742c>] kmem_cache_create+0x54/0x68
[   11.712000]  [<000000004011daf4>] 0x4011daf4
[   11.712000]  [<000000004015d0b4>] do_one_initcall+0x1ac/0x230
[   11.756000] random: nonblocking pool is initialized
[   11.852000]  [<0000000040101a5c>] 0x40101a5c
[   11.992000]  [<0000000040152d38>] kernel_init+0x30/0x2a0
[   11.992000]  [<000000004014b020>] end_fault_vector+0x20/0xc0
[   12.132000]  [<0000000040152d08>] kernel_init+0x0/0x2a0
[   12.132000]
[   12.132000] ---[ end trace 436196ee1e834c21 ]---



The full kernel logs can be found here : http://bpaste.net/show/177607/


And kconfig here : http://bpaste.net/show/177929/


I switched from SLAB to SLUB and the problem went away. However, this 
used to work in 3.12.4.


Regards,
   Guy



