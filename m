From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] C3000 HPMC with high NFS traffic. 99% it's ASTRO's
	fault?
Date: Fri, 13 Aug 2004 10:55:58 -0400
Message-ID: <20040813145557.GB31035@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
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


pa,

Thoughts?

kernel BUG at kernel/printk.c:590!
Backtrace:
 [<10129bac>] acquire_console_sem+0x2c/0x88
 [<1012a134>] unregister_console+0x18/0x88
 [<101168e8>] pdc_console_restart+0x4c/0x68
 [<10108d10>] handle_interruption+0x30/0x560
 [<10110088>] intr_check_sig+0x0/0xc

kernel BUG at kernel/printk.c:590!
Backtrace:
 [<10129bac>] acquire_console_sem+0x2c/0x88
 [<1012a134>] unregister_console+0x18/0x88
 [<101168e8>] pdc_console_restart+0x4c/0x68
 [<10108d10>] handle_interruption+0x30/0x560
 [<10110088>] intr_check_sig+0x0/0xc

kernel BUG at kernel/printk.c:590!
Backtrace:
 [<10129bac>] acquire_console_sem+0x2c/0x88
 [<10129fb0>] register_console+0xa8/0x214
 [<10108d10>] handle_interruption+0x30/0x560
 [<10110088>] intr_check_sig+0x0/0xc

Backtrace:
 [<10108c8c>] parisc_terminate+0x60/0xb4
 [<10108e24>] handle_interruption+0x144/0x560
 [<10110088>] intr_check_sig+0x0/0xc

High Priority Machine Check (HPMC): Code=1 regs=103b1080
(Addr=00000000)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111000001110 Not tainted
r00-03  00000000 104a6010 10117f5c 4fdee220
r04-07  4fdee2a8 00000011 37861900 4fdee000
r08-11  00000000 4da3e060 4da3e19c 00000000
r12-15  000005a8 00073748 00000040 00000000
r16-19  00000070 3f1042cc 00000000 fed30000
r20-23  00000000 4fdf3910 10230470 00000080
r24-27  00000000 fee01008 4ffb6a40 103ae010
r28-31  5e601f03 00000000 3f1047c0 10117f5c
sr0-3   00000000 00000000 00000000 00000059
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 10230498 1023049c
 IIR: 0e600193    ISR: a627fffb  IOR: 4c130000
 CPU:        0   CR30: 3f104000 CR31: 10444000
 ORIG_R28: 00000000
 IAOQ[0]: lba_astro_out32+0x28/0x38
 IAOQ[1]: lba_astro_out32+0x2c/0x38
 RP(r2): outl+0x5c/0x78
---

CVS head, 32-bit kernel, 2.6.8-rc2-pa7.

processor       : 0
cpu family      : PA-RISC 2.0
cpu             : PA8500 (PCX-W)
cpu MHz         : 400.000000
model           : 9000/785/C3000
model name      : AllegroHigh W
hversion        : 0x00005bb0
sversion        : 0x00000481
I-cache         : 512 KB
D-cache         : 1024 KB (WB, 0-way associative)
ITLB entries    : 160
DTLB entries    : 160 - shared with ITLB
BTLB            : not supported
bogomips        : 799.53
software id     : 2011698862

Searching for devices...
Found devices:
1. Astro BC Runway Port at 0xfed00000 [10] { 12, 0x0, 0x582, 0x0000b }
2. Elroy PCI Bridge at 0xfed30000 [10/0] { 13, 0x0, 0x782, 0x0000a }
3. Elroy PCI Bridge at 0xfed32000 [10/1] { 13, 0x0, 0x782, 0x0000a }
4. Elroy PCI Bridge at 0xfed38000 [10/4] { 13, 0x0, 0x782, 0x0000a }
5. Elroy PCI Bridge at 0xfed3c000 [10/6] { 13, 0x0, 0x782, 0x0000a }
6. AllegroHigh W at 0xfffa0000 [32] { 0, 0x0, 0x5bb, 0x00004 }
7. Memory at 0xfed10200 [49] { 1, 0x0, 0x086, 0x00009 }
CPU(s): 1 x PA8500 (PCX-W) at 400.000000 MHz
SBA found Astro 2.1 at 0xfed00000
lba version TR2.1 (0x2) found at 0xfed30000
WARNING: Ignoring enabled ELMMIO BASE 0xf8000000  SIZE 0xfc000000
PCI: Enabled native mode for NS87415 (pif=0x8f)
lba version TR2.1 (0x2) found at 0xfed32000
WARNING: Ignoring enabled ELMMIO BASE 0xf8000000  SIZE 0xfc000000
lba version TR2.1 (0x2) found at 0xfed38000
WARNING: Ignoring enabled ELMMIO BASE 0xf8000000  SIZE 0xfc000000
iosapic: hpa not registered for 0000:02:03.0
lba version TR2.1 (0x2) found at 0xfed3c000
WARNING: Ignoring enabled ELMMIO BASE 0xf8000000  SIZE 0xfc000000
iosapic: hpa not registered for 0000:03:02.0

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
