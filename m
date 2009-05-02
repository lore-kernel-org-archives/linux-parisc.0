From: Helge Deller <deller@gmx.de>
Subject: kernel shutdown stuck with 2.6.30-rc4-32bit
Date: Sat, 02 May 2009 20:00:30 +0200
Message-ID: <49FC8A3E.5060001@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Just faced this in syslog while running "shutdown -r":
...
Stopping system log daemon....                                   
Asking all remaining processes to terminate...BUG: soft lockup - CPU#0 stuck for 61s! [console-kit-dae:2647]
Modules linked in: (none)                                                                                          

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001000000111100001111 Not tainted
r00-03  00040f0f 1068ed58 1013aaf0 8e170440      
r04-07  00000000 106f19d0 106f1a24 8e1703dc      
r08-11  00000050 1068e9d0 00000007 1068e9d0
r12-15  0000000f 40361558 00001000 40049000
r16-19  8ee965a8 00000010 0003ecc0 00000001
r20-23  ffffffff 8ee96288 11147acf 106e19cc
r24-27  ffffffff 105df7a8 1068ed8c 1067b1d0
r28-31  0000000e 106e11d0 8e170500 105bcd4e
sr00-03  00000000 00000000 00000000 00000029
sr04-07  00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 1013aaf4 1013aaf8
 IIR: 486400d0    ISR: 8e1705c8  IOR: 106f19dc
 CPU:        0   CR30: 8e170000 CR31: d22344f0
 ORIG_R28: 107019d0
 IAOQ[0]: vprintk+0x144/0x2d0
 IAOQ[1]: vprintk+0x148/0x2d0
 RP(r2): vprintk+0x140/0x2d0
Backtrace:
 [<1013a904>] printk+0x28/0x38
 [<10111758>] print_fr+0x110/0x144
 [<10111848>] show_regs+0xbc/0x224
 [<10110000>] do_page_fault+0x1ac/0x26c
 [<10112220>] handle_interruption+0x74/0x5e0
 [<10116078>] intr_check_sig+0x0/0x34

Kernel panic - not syncing: softlockup: hung tasks
Backtrace:
 [<10111b5c>] show_stack+0x18/0x28
 [<101119cc>] dump_stack+0x1c/0x2c
 [<101398d8>] panic+0x7c/0x1c4
 [<1016c878>] softlockup_tick+0x194/0x198
 [<10146230>] run_local_timers+0x28/0x38
 [<10145f84>] update_process_times+0x38/0x88
 [<10112838>] timer_interrupt+0xac/0x180
 [<1016d28c>] handle_IRQ_event+0x70/0x150
 [<1016d3d8>] __do_IRQ+0x6c/0x1cc
 [<10112efc>] do_cpu_irq_mask+0x9c/0xd0
 [<10116068>] intr_return+0x0/0x4
