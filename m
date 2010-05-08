From: =?ISO-8859-1?Q?Thibaut_VAR=C8NE?= <T-Bone@parisc-linux.org>
Subject: Kernel panic in dm_snapshot
Date: Sat, 8 May 2010 12:53:43 +0200
Message-ID: <F96C0F67-A1D4-47AB-9B36-4DEEA129753D@parisc-linux.org>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi pa-ckers.

Attached is the console capture on lafayette after it crashed in  
dm_snapshot.

FWIW, the output looks a bit mingled, and it's not the first time I  
see intertwined output like this, at least on parisc. I wonder if  
something's gone wrong with printk() on SMP machines...

Lafayette is running Linux version 2.6.32-3-parisc64-smp (Debian  
2.6.32-9) (maks@debian.org) (gcc version 4.3.4 (GCC) ) #1 SMP Thu Feb  
25 16:08:05 UTC 2010

HTH

T-Bone

[425641.452000] EXT3 FS on dm-3, internal journal
[425641.456000] EXT3-fs: mounted filesystem with ordered data mode.

Press Q/q to quit, Enter to continue:

[426045.348000] Backtrace:
[426045.348000]  [<0000000020b28bf8>] exit_exception_table+0x68/0x1a8  
[dm_snapshot]
[426045.348000]  [<0000000020b28ee0>] snapshot_dtr+0x1a8/0x390  
[dm_snapshot]
[426045.348000]  [<0000000020731e30>] dm_table_destroy+0xa8/0x1d8  
[dm_mod]
[426045.348000]  [<000000002072aa3c>] __unbind+0x7c/0x1e8 [dm_mod]
[426045.348000]  [<000000002072dda0>] dm_put+0x148/0x2d8 [dm_mod]
[426045.348000]  [<0000000020737054>] dev_remove+0x13c/0x1c8 [dm_mod]
[426045.348000]  [<0000000020737cb4>] ctl_ioctl+0x234/0x2c8 [dm_mod]
[426045.348000]  [<0000000020737da8>] dm_compat_ctl_ioctl+0x18/0x38  
[dm_mod]
[426045.348000]  [<0000000040257444>] compat_sys_ioctl+0x14c/0x4b0
[426045.348000]  [<0000000040104ef8>] syscall_exit+0x0/0x14
[426045.348000]
[426045.348000]
[426045.348000] Bad Address (null pointer deref?): Code=15  
regs=00000001288607e0 (Addr=000000004021d9f8)
[426045.348000]
[426045.348000]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[426045.348000] PSW: 00001000000001100000011000001111 Not tainted
[426045.348000] r00-03  000000e00806060f 00000000406d7c20  
0000000020b28bf8 [426045.348000] r04-07  0000000020b25000  
00000000001bf050 000000000001bf05 0000000023f1b050
[426045.348000] r08-11  000000012941f658 0000000128860730  
0000000000020000 00000000405327c8
[426045.348000] r12-15  0000000040352b28 000000004034f190  
0000000040353534 0000000040352f74

Press Q/q to quit, Enter to continue:

[426045.348000] r16-19  0000000040351744 00000000c138fd04  
0000000040352f74 0000000040e5a000
[426045.348000] r20-23  0000000000000000 000ffffffffc8109  
0000000000000000 0003780
[426045.348000] r24-27  0000000008109af4 0000000008109af4  
00000000405327c8 00000000406b7c20
[426045.348000] r28-31  037fffffff3c39f8 0000000128860730  
00000001288607e0 000ffffffffc8109
[426045.348000] sr00-03  00000000058a6800 0000000000000000  
0000000000000000 00000000058a6800
[426045.348000] sr04-07  0000000000000000 0000000000000000  
0000000000000000 0000000000000000
[426045.348000]
[426045.348000] IASQ: 0000000000000000 0000000000000401f7a48  
00000000401f7a4c
[426045.348000]  IIR: 0f9300df    ISR: 0000000003800000  IOR:  
000000004021d9f8
[426045.348000]  CPU:        0   CR30: 0000000128860000 CR31:  
0000000000008020
[426045.348000]  ORIG_R28: 0000000040352b28
[426045.348000]  IAOQ[0]: kmem_cache_free+0x98/0x110
[426045.348000]  IAOQ[1]: kmem_cache_free+0x9c/0x110
[426045.348000]  RP(r2): exit_exception_table+0x68/0x1a8 [dm_snapshot]
[426045.348000] Backtrace:
[426045.34<0000000020b28bf8>] exit_exception_table+0x68/0x1a8  
[dm_snapshot]
[426045.348000]  [<0000000020b28ee0>] snapshot_dtr+0x1a8/0x390  
[dm_snapshot]
[426045.348000]  [<0000000020731e30>] dm_table_destroy+0xa8/0x1d8  
[dm_mod]
[426045.348000]  [<000000002072aa3c>] __unbind+0x7c/0x1e8 [dm_mod]
[426045.348000]  [<000000002072dda0>] dm_put+0x148/0x2d8 [dm_mod]

Press Q/q to quit, Enter to continue:

[426045.348000]  [<0000000020737054>] dev_remove+0x13c/0x1c8 [dm_mod]
[426045.348000]  [<0000_ioctl+0x234/0x2c8 [dm_mod]
[426045.348000]  [<0000000020737da8>] dm_compat_ctl_ioctl+0x18/0x38  
[dm_mod]
[426045.348000]  [<0000000040257444>] compat_sys_ioctl+0x14c/0x4b0
[426045.348000]  [<0000000040104ef8>] syscall_exit+0x0/0x14
[426045.348000]
[426045.348000] ernel panic - not syncing: Bad Address (null pointer  
deref?)
[426045.348000] Backtrace:
[426045.348000]  [<000000004011d41c>] show_stack+0x14/0x20
[426045.348000]  [<0000000040115e40>] dump_stack+0x18/0x28
[426045.348000]  [<0000000040115f00>] panic+0xb0/0x2c0
[426045.348000]  [<000000004011dab8>] parisc_terminate+0x168/0x170
[426045.348000]  [<000000004011be60>] do_page_fault+0x2f8/0x388
[426045.348000]  [<000000004011e560>] handle_interr50/0x870
[426045.348000]  [<00000000401f7a48>] kmem_cache_free+0x98/0x110
[426045.348000]  [<0000000020b28bf8>] exit_exception_table+0x68/0x1a8  
[dm_snapshot]
[426045.348000]  [<0000000020b28ee0>] snapshot_dtr+0x1a8/0x390  
[dm_snapshot]
[426045.348000]  [<0000000020731e30>] dm_table_destroy+0xa8/0x1d8  
[dm_mod]
[426045.348000]  [<000000002072aa3c>] __unbind+0x7c/0x1e8 [dm_mod]
[426045.348000]  [<000000002072dda0>] dm_put+0x148/0x2d8 [dm_mod]

Press Q/q to quit, Enter to continue:

[<0000000020737054>] dev_remove+0x13c/0x1c8 [dm_mod]
[426045.348000]  [<0000000020737cb4>] ctl_ioctl+0x234/0x2c8 [dm_mod]
[426045.348000]  [<0000000020737da8>] dm_compat_ctl_ioctl+0x18/0x38  
[dm_mod]
[426045.348000]  [<0000000040257444>] compat_sys_ioctl+0x14c/0x4b0
[426045.348000]


