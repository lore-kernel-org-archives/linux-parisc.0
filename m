From: Guy Martin <gmsoft@gentoo.org>
Subject: [parisc-linux] 2.6.20-rc7 killed my K410
Date: Sat, 3 Feb 2007 23:33:44 +0100
Message-ID: <20070203233344.2c2cc197.gmsoft__19100.0725179494$1416624274$gmane$org@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



Hi all,

I recently tried the latest git as of today and it broke badly my K410.
The last kernel I tried was 2.6.20-rc6. Git version again but this one was working fine (in UP, SMP was more badly broken than 2.6.19.1-pa0)
It corrupted the stable storage in a way that the HWversion value differs from the expected value and fails.

In my first try of booting this kernel it also corrupted the stable storage but it still reached the pdc console and I could recover it by going in COnfiguration -> DEfault. It was not possible to set any path anymore using pa pri 10/0.1 nor read any path before using this command.

Do you know a way to recover from this ?


This is the last boot attempt. For this one I disabled all CPU but the first one and palo had the nosmp option set anyway.


PALO(F0) partition contains:                                                                                                                                                                                        
    0/vmlinux32 4748163 bytes @ 0x48000                                                                                                                                                                             
                                                                                                                                                                                                                    
Information: No console specified on kernel command line. This is normal.
PALO will choose the console currently used by firmware (serial).
Command line for kernel: 'root=/dev/md0 nosmp console=ttyB0 palo_kernel=2/vmlinux'
Selected kernel: /vmlinux from partition 2
ELF32 executable
Entry 00100500 first 00100000 n 3
Segment 0 load 00100000 size 3425668 mediaptr 0x1000
Segment 1 load 00445000 size 376832 mediaptr 0x346000
Segment 2 load 00500000 size 289928 mediaptr 0x3a2000
Branching to kernel entry point 0x00100500.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org
                                                                                                                                                                                                                    
[4294667.296000] Linux version 2.6.20-rc7 (root@fridge) (gcc version 4.1.1 (Gentoo 4.1.1-r3)) #5 SMP Sat Feb 3 16:30:11 CET 2007
[4294667.296000] FP[0] enabled: Rev 1 Model 11
[4294667.296000] The 32-bit Kernel has started...
[4294667.296000] Initialized PDC Console for debugging.
[4294667.296000] Determining PDC firmware type: System Map.
[4294667.296000] model f0190000 00000491 00000000 00000002 00000000 100000f1 00000004 0000008a 0000008a
[4294667.296000] vers  0000000d
[4294667.296000] CPUID vers 11 rev 13 (0x0000016d)
[4294667.296000] model 9000/800 Series HPUX HPUX HPUX.
[4294667.296000] ------------[ cut here ]------------
[4294667.296000] kernel BUG at arch/parisc/kernel/cache.c:232!
[4294667.296000]
[4294667.296000]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[4294667.296000] PSW: 00000000000001000000000000001111 Not tainted
[4294667.296000] r00-03  0004000f 1046d010 10510c70 00800327
[4294667.296000] r04-07  10500088 0009b404 10504000 000000f2
[4294667.296000] r08-11  000000f3 000000f0 0004000e 1050d128
[4294667.296000] r12-15  0000004d 0000004d 00000003 f0000bf8
[4294667.296000] r16-19  f0001570 f0000074 f000006c 00000000
[4294667.296000] r20-23  00000000 00000010 fffffff8 00000000
[4294667.296000] r24-27  004a6a48 0000000f 00000002 1046f010
[4294667.296000] r28-31  101076d4 10482010 10500240 004a6cb8
[4294667.296000] sr00-03  00000000 00000000 00000000 00000000
[4294667.296000] sr04-07  00000000 00000000 00000000 00000000
[4294667.296000]
[4294667.296000] IASQ: 00000000 00000000 IAOQ: 101076d4 101076d8
[4294667.296000]  IIR: 03ffe01f    ISR: 00000000  IOR: 004a6cb8
[4294667.296000]  CPU:        0   CR30: 10500000 CR31: 10504000
[4294667.296000]  ORIG_R28: 00000000
[4294667.296000]  IAOQ[0]: disable_sr_hashing+0x48/0xa4
[4294667.296000]  IAOQ[1]: disable_sr_hashing+0x4c/0xa4
[4294667.296000]  RP(r2): paging_init+0x48/0x750
[4294667.296000] Backtrace:
[4294667.296000]  [<10108db8>] die_if_kernel+0x130/0x198
[4294667.296000]  [<1024e21c>] report_bug+0xa0/0xb4
[4294667.296000]  [<1010902c>] handle_interruption+0x20c/0x60c
[4294667.296000]  [<1010f604>] real32_call+0x110/0x11c
[4294667.296000]  [<1010f604>] real32_call+0x110/0x11c
[4294667.296000]  [<1010f918>] pdc_iodc_putc+0x104/0x130
[4294667.296000]  [<1010d090>] intr_check_sig+0x0/0x34
[4294667.296000]  [<10113e70>] pdc_console_write+0x20/0x38
[4294667.296000]  [<101076d8>] disable_sr_hashing+0x4c/0xa4
[4294667.296000]  [<1010f604>] real32_call+0x110/0x11c
[4294667.296000]  [<101a30b4>] seq_lseek+0x0/0x2f8
[4294667.296000]  [<103a9558>] xfrm6_beet_output+0x0/0x100
[4294667.296000]  [<103a5f64>] ip6_fl_gc+0x0/0x1a8
[4294667.296000]  [<101382e0>] proc_dointvec_jiffies+0x0/0x38
[4294667.296000]  [<103a249c>] ipv6_nodata_rcv+0x0/0x20
[4294667.296000]  [<103a1424>] tcp_v6_rcv+0x0/0xab4
[4294667.296000]
[4294667.296000] Kernel panic - not syncing: Attempted to kill the idle task!
[4294667.296000]       


The chassis code when I try to boot now :

FLT    301A      REMOTE:  disabled   inactive   multiple      ACCESS FAULT: 00
CM> sl
                         ----- Front Panel displays -----

FLT  301A        INIT C30C        TEST 8120        INIT 10CA        INIT 10CA
INIT 1033        TEST 1033        INIT 10CA        INIT 10CA        INIT C30C
TEST 400E        INIT 103C        TEST 4060        TEST 4040        TEST 4030
TEST 4020        TEST 4010        TEST 4000        INIT 10CA        INIT C30C
TEST C2E0        TEST C265        TEST C264        TEST C262        TEST C261
TEST C260        TEST C240        TEST 000F        TEST 000E        TEST 000D
TEST 000C        TEST 000B        TEST 000A        TEST 0009        TEST 0008
TEST 0007        TEST 0006        TEST 0005        TEST 0004        TEST 0003
TEST 0002        INIT CD70        TEST CD70        INIT CD21        TEST CD21
INIT CD20        TEST CD20        TEST CD1A        TEST CD1B        TEST CD1C



-- 
Guy Martin
Gentoo Linux - HPPA port Lead
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
