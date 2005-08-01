From: Carlos O'Donell <carlos@systemhalted.org>
Subject: [parisc-linux] pa_memcpy kernel crashing testcase == "glibc +nptl
	+testsuite", and some tests.
Date: Mon, 1 Aug 2005 11:15:12 -0400
Message-ID: <20050801151506.GW9703@systemhalted.org>
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


parisc,

Luckily I found an excellent testcase that crashes the kernel *every*
time, thus enabling me to test a patch from Randolph to see if the
recent stability issues could be fixed.

Kernel 2.6.13-rc3-pa0
gcc version 3.3.6 (Debian 1:3.3.6-7)

64-bit kernel, UP, on an a500 (PA8700) with 1.5GB of RAM.
Running the glibc testsuite with NPTL enabled causes the machine
to consistently HPMC.
---------------------------------------------------------------------
Backtrace:
 [<000000001032d994>] copy_to_user+0x34/0x40
 [<0000000010172284>] sys_timer_create+0x294/0x8c8
 [<0000000010184d04>] compat_sys_timer_create+0x74/0xa8
 [<0000000010107f8c>] syscall_exit+0x0/0x14


Kernel Fault: Code=15 regs=00000000484cc480 (Addr=00000000c064cb48)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001001111111100001111 Not tainted
r00-03  0000000000000000 0000000010677e28 000000001032d994 0000000000000000
r04-07  00000000106dfc00 0000000060e59e80 0000000000000000 00000000c064cb48
r08-11  00000000484cc190 0000000000000001 00000000000e8608 0000000000000000
r12-15  00000000000e8648 00000000000e88e8 00000000000aa000 00000000000eac08
r16-19  00000000000ecc08 00000000000e8648 0000000000000000 0000000000000000
r20-23  00000000484cc000 00000000484cc280 00000000484cc281 00000000c064cb48
r24-27  0000000000000004 00000000484cc280 00000000c064cb48 00000000106dfc00
r28-31  0000000000000000 00000000c064cb48 00000000484cc480 0000000000000004
sr0-3   0000000002014000 0000000000000000 0000000000000000 0000000002014000
sr4-7   0000000000000000 0000000000000000 0000000000000000 0000000000000000

      VZOUICununcqcqcqcqcqcrmunTDVZOUI
FPSR: 00000000000000000000000000000000
FPER1: 00000000
fr00-03  0000000000000000 0000000000000000 0000000000000000 0000000000000000
fr04-07  00000000101f7be4 00000000000000fa 0000000012623c18 0000000000000000
fr08-11  00000000106dfc00 0000000000000002 00000000106dfc00 0000000000000802
fr12-15  000f41fa2f2149c0 0000000000000020 fffffffffffffc18 0000000000000000
fr16-19  000000001019baa0 00000000125c7000 00000000101cb07c 00000000125c7000
fr20-23  00000000125c7000 0000000000000000 0000000000000043 0000000000000228
fr24-27  000fb909ffe5cb9a 3fe0000000000000 412e848000000000 00000000125c7000
fr28-31  0000000000001000 00000000106dfc00 000000001077f240 0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 000000001032d678 000000001032d67c
 IIR: 0fb39222    ISR: 0000000000000000  IOR: 00000000c064cb48
 CPU:        0   CR30: 00000000484cc000 CR31: 00000000106a0000
 ORIG_R28: 00000000106dfc00
 IAOQ[0]: pa_memcpy+0x178/0x32c
 IAOQ[1]: pa_memcpy+0x17c/0x32c
 RP(r2): copy_to_user+0x34/0x40
Kernel panic - not syncing: Kernel Fault
---------------------------------------------------------------------

Applying Randolph's patch to remove fpregs and the double word copies
using thos registers can be found at:
http://www.parisc-linux.org/~tausq/fpreg.diff

Same kernel with that patch applied still crash.

This can mean any number of things, but it could mean:

a. There is another path in the kernel code corrupting fp registers.
b. The optimal pa_memcpy is too optimal and exposes other bugs?

I think that 'a.' is the most plausible.
Any thoughts about catching the culprit?

Cheers,
Carlos.

NOTE:
Even with Randolph's patch the following functions use fpregs heavily:
__muldi3 : Heavy fpregs usage
__divdi3 : "
__moddi3 : "
__udivdi3 : "
__umoddi3 : "

The following functions save/restore fpregs:
linux_gateway_entry - Save fpregs
_switch_to - Save fpregs
_switch_to_ret - Restore fpregs
intr_restore - Restore fpregs
L4^B1 - Save fpregs?
L4^B2 - Save fpregs?
syscall_restore - Load fpregs

The following functions have a weird sequence involving fr31R?
schedule
    1010e8c4:   68 d4 00 98     stw r20,4c(r6)
    1010e8c8:   5c df 00 9a     fldw 4c(r6),fr31R
    1010e8cc:   00 13 18 60     mtsm r19
io_schedule
    10110d14:   68 d3 24 88     stw r19,1244(r6)
    10110d18:   5c df 24 8a     fldw 1244(r6),fr31R
    10110d1c:   00 14 18 60     mtsm r20
__down_read
__down_write
sys_ptrace
load_elf_binary
dev_ifname32
sched_setaffinity
get_task_mm
copy_mm
copy_fs_struct
copy_files
unshare_files
copy_process
profile_hit
release_task
daemonize
get_file_struct
...
And many more. This load to fr31R is discarded and never used.


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
