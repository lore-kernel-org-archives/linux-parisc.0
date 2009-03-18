From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: 2.6.29-rc8: Badness at kernel/smp.c:329
Date: Wed, 18 Mar 2009 20:27:47 +0300
Message-ID: <a4423d670903181027r5370c246x9aed7055403c1c28@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi

Ok, I have finally built the kernel, thanks to all.
Machine has two PA8700 CPUs.
kernel is 32bit

2.6.29-rc8-00174-gee568b2:

 Freeing unused kernel memory: <0>------------[ cut here ]------------
 Badness at kernel/smp.c:329

      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
 PSW: 00000000000001001111011100001110 Not tainted
 r00-03  0004f70e 1058be90 101644f4 10547e90
 r04-07  101004d8 00000000 104eb0e8 101004d8
 r08-11  00000000 00000001 10507548 105c3180
 r12-15  ef821430 00000001 ef844090 1053e840
 r16-19  104eae98 105c3180 10541bc0 105c4000
 r20-23  00000000 105c4000 00000000 00000001
 r24-27  00000000 101004d8 104eb0e8 104eae90
 r28-31  0000000e 00000000 ef8242c0 00800480
 sr00-03  00000000 00000000 00000000 00000000
 sr04-07  00000000 00000000 00000000 00000000

 IASQ: 00000000 00000000 IAOQ: 101644c0 101644c4
  IIR: 03ffe01f    ISR: 1024037e  IOR: 09024260
  CPU:        0   CR30: ef824000 CR31: 40002008
  ORIG_R28: 00000001
  IAOQ[0]: smp_call_function_many+0x2d4/0x2e0
  IAOQ[1]: smp_call_function_many+0x2d8/0x2e0
  RP(r2): smp_call_function+0x28/0x38
 Backtrace:
  [<101644f4>] smp_call_function+0x28/0x38
  [<105a4e90>] _einittext+0x0/0x10
  [<101644f4>] smp_call_function+0x28/0x38
  [<10142968>] on_each_cpu+0x1c/0x50
  [<10116e64>] free_initmem+0x60/0x1d0
  [<10116624>] init_post+0x1c/0x198

 ------------[ cut here ]------------
 Badness at kernel/smp.c:226

      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
 PSW: 00000000000001001111111100001110 Tainted: G        W
 r00-03  0004ff0e 10507e90 101644f4 00000001
 r04-07  00000000 101004d8 00000000 105c4000
 r08-11  105a4ea0 105a4e90 10507548 105c3180
 r12-15  ef821430 00000001 ef844090 1053e840
 r16-19  104eae98 105c3180 10541bc0 0000000e
 r20-23  00000002 104eb0e8 0000001e 00000001
 r24-27  00000000 101004d8 00000001 104eae90
 r28-31  ef824000 00000000 ef8242c0 00000001
 sr00-03  00000000 00000000 00000000 00000000
 sr04-07  00000000 00000000 00000000 00000000

 IASQ: 00000000 00000000 IAOQ: 10164138 1016413c
  IIR: 03ffe01f    ISR: 1024037e  IOR: 09024264
  CPU:        0   CR30: ef824000 CR31: 40002008
  ORIG_R28: 00000001
  IAOQ[0]: smp_call_function_single+0xa0/0x154
  IAOQ[1]: smp_call_function_single+0xa4/0x154
  RP(r2): smp_call_function+0x28/0x38
 Backtrace:
  [<101644f4>] smp_call_function+0x28/0x38
  [<1016a6e0>] __irq_set_trigger+0xa4/0xdc
  [<101642a8>] smp_call_function_many+0xbc/0x2e0
  [<101642a8>] smp_call_function_many+0xbc/0x2e0
  [<101642a8>] smp_call_function_many+0xbc/0x2e0
  [<101642a8>] smp_call_function_many+0xbc/0x2e0
  [<101642a8>] smp_call_function_many+0xbc/0x2e0
  [<101642a8>] smp_call_function_many+0xbc/0x2e0
  [<101642a8>] smp_call_function_many+0xbc/0x2e0
  [<101642a8>] smp_call_function_many+0xbc/0x2e0
  [<101642a8>] smp_call_function_many+0xbc/0x2e0
  [<101642a8>] smp_call_function_many+0xbc/0x2e0
  [<101642a8>] smp_call_function_many+0xbc/0x2e0
  [<101642a8>] smp_call_function_many+0xbc/0x2e0
  [<101642a8>] smp_call_function_many+0xbc/0x2e0
  [<101642a8>] smp_call_function_many+0xbc/0x2e0

 224k freed


Kernel continues working after that.
