From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [git patches] parisc fixes for 2.6.24
Date: Sun, 16 Dec 2007 13:29:38 -0500 (EST)
Message-ID: <200712161829.lBGITcOV013611@hiauly1.hia.nrc.ca>
References: <20071206201928.GA8778@hera.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: kyle@hera.kernel.org (Kyle McMartin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20071206201928.GA8778@hera.kernel.org> from "Kyle McMartin" at Dec 6, 2007 08:19:28 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Kyle,

> are available in the git repository at:
> 
>   /pub/scm/linux/kernel/git/kyle/parisc-2.6.git master

I built a SMP PA8800 configuration from this respository yesterday.
Aside from the timeout issue that I've mentioned before, I've experienced
erratic login behavior with this new kernel.  I see this in the debug log:

Dec 16 11:28:39 mx3210 kernel:
Dec 16 11:28:39 mx3210 kernel: do_page_fault() pid=1460 command='login' type=15
address=0xff0ca4e0
Dec 16 11:28:39 mx3210 kernel: vm_start = 0xfaf7d000, vm_end = 0xfaf93000
Dec 16 11:28:39 mx3210 kernel:
Dec 16 11:28:39 mx3210 kernel:      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
Dec 16 11:28:39 mx3210 kernel: PSW: 00000000000011001000000000001111 Not tainted
Dec 16 11:28:39 mx3210 kernel: r00-03  000000ff000c800f 0000000000000000 0000000
0405f3eeb 00000000faf80bc0
Dec 16 11:28:39 mx3210 kernel: r04-07  0000000040631d74 000000006e6f626f 0000000
0ffffffff 0000000000000000
Dec 16 11:28:39 mx3210 kernel: r08-11  0000000000000003 00000000faf80c88 0000000000000000 0000000040002130
Dec 16 11:28:39 mx3210 kernel: r12-15  0000000040634454 0000000000000000 00000000ffffffff 00000000ffffffff
Dec 16 11:28:39 mx3210 kernel: r16-19  000000006e6f626f 0000000040633574 0000000041111008 0000000040631d74
Dec 16 11:28:39 mx3210 kernel: r20-23  0000000004149814 0000000000000000 0000000004149814 0000000000004000
Dec 16 11:28:39 mx3210 kernel: r24-27  0000000000000018 000000004525a820 000000004525a820 0000000000019014
Dec 16 11:28:39 mx3210 kernel: r28-31  0000000004149840 000000000000636b 00000000ff0ca500 0000000041052605
Dec 16 11:28:39 mx3210 kernel: sr00-03  000000000f9f7000 0000000000000000 0000000000000000 000000000f9f7000
Dec 16 11:28:39 mx3210 kernel: sr04-07  000000000f9f7000 000000000f9f7000 000000000f9f7000 000000000f9f7000
Dec 16 11:28:39 mx3210 kernel:
Dec 16 11:28:39 mx3210 kernel:       VZOUICununcqcqcqcqcqcrmunTDVZOUI
Dec 16 11:28:39 mx3210 kernel: FPSR: 00001000000000000000000000000000
Dec 16 11:28:39 mx3210 kernel: FPER1: 00000000
Dec 16 11:28:39 mx3210 kernel: fr00-03  0800000000000000 0000000000000000 0000000000000000 0000000000000000
Dec 16 11:28:39 mx3210 kernel: fr04-07  00000000405cc000 00000000404b3780 00000000404a9780 00000000404a94c0
Dec 16 06:47:38 mx3210 identd[6240]: started
Dec 16 11:28:39 mx3210 kernel:
Dec 16 11:28:39 mx3210 kernel: do_page_fault() pid=1460 command='login' type=15
address=0xff0ca4e0
Dec 16 11:28:39 mx3210 kernel: vm_start = 0xfaf7d000, vm_end = 0xfaf93000
Dec 16 06:47:38 mx3210 identd[6240]: started
Dec 16 11:28:39 mx3210 kernel:
Dec 16 11:28:39 mx3210 kernel: do_page_fault() pid=1460 command='login' type=15 address=0xff0ca4e0
Dec 16 11:28:39 mx3210 kernel: vm_start = 0xfaf7d000, vm_end = 0xfaf93000
Dec 16 11:28:39 mx3210 kernel:
Dec 16 11:28:39 mx3210 kernel:      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
Dec 16 11:28:39 mx3210 kernel: PSW: 00000000000011001000000000001111 Not tainted
Dec 16 11:28:39 mx3210 kernel: r00-03  000000ff000c800f 0000000000000000 0000000
0405f3eeb 00000000faf80bc0
Dec 16 11:28:39 mx3210 kernel: r04-07  0000000040631d74 000000006e6f626f 0000000
0ffffffff 0000000000000000
Dec 16 11:28:39 mx3210 kernel: r08-11  0000000000000003 00000000faf80c88 0000000000000000 0000000040002130
Dec 16 11:28:39 mx3210 kernel: r12-15  0000000040634454 0000000000000000 00000000ffffffff 00000000ffffffff
Dec 16 11:28:39 mx3210 kernel: r16-19  000000006e6f626f 0000000040633574 0000000041111008 0000000040631d74
Dec 16 11:28:39 mx3210 kernel: r20-23  0000000004149814 0000000000000000 0000000004149814 0000000000004000
Dec 16 11:28:39 mx3210 kernel: r24-27  0000000000000018 000000004525a820 000000004525a820 0000000000019014
Dec 16 11:28:39 mx3210 kernel: r28-31  0000000004149840 000000000000636b 00000000ff0ca500 0000000041052605
Dec 16 11:28:39 mx3210 kernel: sr00-03  000000000f9f7000 0000000000000000 0000000000000000 000000000f9f7000
Dec 16 11:28:39 mx3210 kernel: sr04-07  000000000f9f7000 000000000f9f7000 000000000f9f7000 000000000f9f7000
Dec 16 11:28:39 mx3210 kernel:
Dec 16 11:28:39 mx3210 kernel:       VZOUICununcqcqcqcqcqcrmunTDVZOUI
Dec 16 11:28:39 mx3210 kernel: FPSR: 00001000000000000000000000000000
Dec 16 11:28:39 mx3210 kernel: FPER1: 00000000
Dec 16 11:28:39 mx3210 kernel: fr00-03  0800000000000000 0000000000000000 0000000000000000 0000000000000000
Dec 16 11:28:39 mx3210 kernel: fr04-07  00000000405cc000 00000000404b3780 00000000404a9780 00000000404a94c0
Dec 16 11:28:39 mx3210 kernel: fr08-11  00000000401b195c 0000000000000001 00000000405b9540 0000000000000802
Dec 16 11:28:39 mx3210 kernel: fr12-15  0000000000000001 00000000404a94c0 000000007fc40108 00000000405f3b40
Dec 16 11:28:39 mx3210 kernel: fr16-19  00000000405ef528 fffffffffffff000 0000000000000000 0000000000000802
Dec 16 11:28:39 mx3210 kernel: fr20-23  000000007f4fa000 000000007fc403a8 0000000000000000 00000000cccccccd
Dec 16 11:28:39 mx3210 kernel: fr24-27  000000a355555556 3fe0000000000000 412e848000000000 00000000001e8480
Dec 16 11:28:39 mx3210 kernel: fr28-31  0000000000000802 000000007f4fa000 000000007fc403a8 00000000405b9540
Dec 16 11:28:39 mx3210 kernel:
Dec 16 11:28:39 mx3210 kernel: IASQ: 000000000f9f7000 000000000f9f7000 IAOQ: 00000000405f428b 00000000405f422b
Dec 16 11:28:39 mx3210 kernel:  IIR: 6bd33fc1    ISR: 000000000f9f7000  IOR: 00000000ff0ca4e0
Dec 16 11:28:39 mx3210 kernel:  CPU:        1   CR30: 000000007e380000 CR31: fffffff0f0e098e0
Dec 16 11:28:39 mx3210 kernel:  ORIG_R28: 0000000000000000
Dec 16 11:28:39 mx3210 kernel:  IAOQ[0]: per_cpu__runqueues+0x748/0x14c0
Dec 16 11:28:39 mx3210 kernel:  IAOQ[1]: per_cpu__runqueues+0x6e8/0x14c0
Dec 16 11:28:39 mx3210 kernel:  RP(r2): per_cpu__runqueues+0x3a8/0x14c0

dave@hiauly6:~$ disasm 0x6bd33fc1
   0:   6b d3 3f c1     stw r19,-20(sp)

This insn saves the PIC register.  Typically, this save occurs in
a function's prologue after the new frame is allocated.

The stack pointer (0xff0ca500) is clearly bad:

(gdb) p 0xff0ca500 - 0xfaf7d000
$1 = 68474112 (0x414d500)
(gdb) p 0xff0ca4e0 - 0xfaf7d000
$2 = 68474080
(gdb) p 0xfaf93000 - 0xfaf7d000
$3 = 90112

$ ulimit -s
16384 (kbytes)

It's not clear how the stack pointer got corrupted but it is correctly
rounded.  I haven't seen this problem with my 2.6.22 builds.

I think the following code is the problem.  We seem to just have
done an alloca:

(gdb) disass 0x405f4258 0x405f4298
Dump of assembler code from 0x405f4258 to 0x405f4298:
0x405f4258 <nscd_getgr_r+1628>: cmpb,= r5,ret0,0x405f3fec <nscd_getgr_r+1008>
0x405f425c <nscd_getgr_r+1632>: copy r4,r19
0x405f4260 <nscd_getgr_r+1636>: b,l 0x405f3f14 <nscd_getgr_r+792>,r0
0x405f4264 <nscd_getgr_r+1640>: copy r15,r7
0x405f4268 <nscd_getgr_r+1644>: ldo -38(sp),ret0
0x405f426c <nscd_getgr_r+1648>: depw,z r31,29,30,r20
0x405f4270 <nscd_getgr_r+1652>: stw r20,3c(r3)
0x405f4274 <nscd_getgr_r+1656>: copy ret0,r9
0x405f4278 <nscd_getgr_r+1660>: ldo 46(r20),ret0
0x405f427c <nscd_getgr_r+1664>: depwi 0,31,6,ret0
0x405f4280 <nscd_getgr_r+1668>: add,l sp,ret0,sp
0x405f4284 <nscd_getgr_r+1672>: b,l 0x405f4228 <nscd_getgr_r+1580>,r0
0x405f4288 <nscd_getgr_r+1676>: stw r19,-20(sp)
0x405f428c <nscd_getgr_r+1680>: ldo 46(r22),r20
0x405f4290 <nscd_getgr_r+1684>: depwi 0,31,6,r20
0x405f4294 <nscd_getgr_r+1688>: add,l sp,r20,sp

ret0 is 0x4149840.  So, the previous stack pointer was 0xfaf80cc0.
This is in the vm range.  ret0 is set from r31.  It's not clear
what sets r31 as this block is entered with a branch.

I wasn't able to get an assembly dump with symbols.  We have the
following libraries:

(gdb) info shared
>From        To          Syms Read   Shared Object Library
0x400fe380  0x40116d74  Yes         /lib/ld.so.1
0x4004c9b0  0x40053588  Yes         /lib/libcrypt.so.1
0x4045ff0c  0x404664a4  Yes         /lib/libpam.so.0
0x40301b40  0x40302cb0  Yes         /lib/libpam_misc.so.0
0x4050cb60  0x405fe6e0  Yes         /lib/libc.so.6
0x400e6ce4  0x400e80b0  Yes         /lib/libdl.so.2

The above suggests a bug in the libc nscd support or the kernel
support for it in 2.6.24-rc4.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
