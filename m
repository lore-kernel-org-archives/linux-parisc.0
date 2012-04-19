From: Guy Martin <gmsoft@tuxicoman.be>
Subject: Boot failure with 32bit kernel
Date: Thu, 19 Apr 2012 10:26:08 +0200
Message-ID: <20120419102608.1834003e@driller.lan>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/VXS4p+1wRZqOPyUqkJVPNyZ"
To: linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--MP_/VXS4p+1wRZqOPyUqkJVPNyZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all,

I compiled a kernel with a few additional features and I was unable to
boot it. It seems that if the entry point is not 0x00100000 in vmlinux,
the boot process fails right after "Total Memory: 2048 MB".
This is the only common denominator I could find.

I've been able to reproduce this with :
 - C3600 and J5600
 - kernel 3.2.12 and 3.3.1
 - gcc 4.5.3
 - ld 2.21 and 2.22
 - palo 1.17 and 1.18


I've attached the boot output of a working and 2 broken kernels. I've
also attached a non working kconfig. To have this one, I started
from a working config and then I've added XFS as I know it's a big
chunk of code and was likely to increase the resulting binary size.

With 3.2.12, I had a working kernel until I tried
CONFIG_CC_OPTIMIZE_FOR_SIZE=y. When I did this, the resulting kernel
was slightly smaller but the entry point was further than 0x00100000.


The 10 first lines of System.map from the working 3.3.1 kernel :
10100000 T _stext
10100000 A _text
10100000 T stext
10100020 t $bss_loop
10100088 t $pgt_fill_loop
10100100 t $is_pa20
10100108 t $install_iva
10100180 t aligned_rfi
10100200 T flush_tlb_all_local
1010024c t .L11

The same from the non working 3.3.1 one :
10100000 A _text
10100100 T _stext
10100100 T stext
10100120 t $bss_loop
10100188 t $pgt_fill_loop
10100200 t $is_pa20
10100208 t $install_iva
10100280 t aligned_rfi
10100300 T flush_tlb_all_local
1010034c t .L11

I've also taken the only sparc I had out of the room but it didn't
help :)

Is this a known issue ?

Let me know if you need more details.

Thanks,
  Guy
--MP_/VXS4p+1wRZqOPyUqkJVPNyZ
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=working-output.txt

HARD Booted.
palo ipl 1.17 root@hope Sun Nov 21 23:43:13 CET 2010

Partition Start(MB) End(MB) Id Type
1               1      39   f0 Palo
2              40      78   83 ext2
3              79   16300   83 ext2
4           16301   17359   82 swap

PALO(F0) partition contains:

Information: No console specified on kernel command line. This is normal.
PALO will choose the console currently used by firmware (serial).Current co=
mmand line:
2/vmlinux root=3D/dev/sda3 video=3Dmatroxfb:mem:2M,noaccel,init panic=3D5 c=
onsole=3DttyS0
 0: 2/vmlinux
 1: root=3D/dev/sda3
 2: video=3Dmatroxfb:mem:2M,noaccel,init
 3: panic=3D5
 4: console=3DttyS0

<#>    edit the numbered field
'b'    boot with this command line
'r'    restore command line
'l'    list dir
? 0
2/vmlinux.test
Current command line:
2/vmlinux.test root=3D/dev/sda3 video=3Dmatroxfb:mem:2M,noaccel,init panic=
=3D5 console=3DttyS0
 0: 2/vmlinux.test
 1: root=3D/dev/sda3
 2: video=3Dmatroxfb:mem:2M,noaccel,init
 3: panic=3D5
 4: console=3DttyS0

<#>    edit the numbered field
'b'    boot with this command line
'r'    restore command line
'l'    list dir
? b

Command line for kernel: 'root=3D/dev/sda3 video=3Dmatroxfb:mem:2M,noaccel,=
init panic=3D5 console=3DttyS0 palo_kernel=3D2/vmlinux.test'
Selected kernel: /vmlinux.test from partition 2
ELF32 executable
Entry 00100000 first 00100000 n 3
Segment 0 load 00100000 size 4915200 mediaptr 0x1000
Segment 1 load 005ec000 size 126000 mediaptr 0x4b1000
Segment 2 load 0060b000 size 109532 mediaptr 0x4d0000
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 3.2.12 (root@hope) (gcc version 4.5.3 (Gentoo 4.5.3-r2 p1.1, =
pie-0.4.7) ) #3 Tue Apr 17 19:17:18 CEST 2012
unwind_init: start =3D 0x10517000, end =3D 0x1054fdc0, entries =3D 14556
FP[0] enabled: Rev 1 Model 16
The 32-bit Kernel has started...
bootconsole [ttyB0] enabled
Initialized PDC Console for debugging.
Determining PDC firmware type: System Map.
model 00005cf0 00000481 00000000 00000002 77b310ff 100000f0 00000008 000000=
b2 000000b2
vers  00000300
CPUID vers 17 rev 10 (0x0000022a)
capabilities 0x3
model 9000/785/C3600
Total Memory: 2048 MB
LCD display at f05d0008,f05d0000 registered
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 520192
Kernel command line: root=3D/dev/sda3 video=3Dmatroxfb:mem:2M,noaccel,init =
panic=3D5 console=3DttyS0 palo_kernel=3D2/vmlinux.test
PID hash table entries: 4096 (order: 2, 16384 bytes)
Dentry cache hash table entries: 262144 (order: 8, 1048576 bytes)
Inode-cache hash table entries: 131072 (order: 7, 524288 bytes)
Memory: 2071756k/2097152k available (3236k kernel code, 25396k reserved, 15=
42k data, 232k init)
virtual kernel memory layout:
    vmalloc : 0x00008000 - 0x0f000000   ( 239 MB)
    memory  : 0x10000000 - 0x90000000   (2048 MB)
      .init : 0x105ec000 - 0x10626000   ( 232 kB)
      .data : 0x10429024 - 0x105aa8b0   (1542 kB)
      .text : 0x10100000 - 0x10429024   (3236 kB)
SLUB: Genslabs=3D11, HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D1, N=
odes=3D1
NR_IRQS:96
Console: colour dummy device 160x64
Calibrating delay loop... 1099.77 BogoMIPS (lpj=3D2199552)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 512
NET: Registered protocol family 16
EISA bus registered
Searching for devices...
Found devices:


--MP_/VXS4p+1wRZqOPyUqkJVPNyZ
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=broken-output.txt

HARD Booted.
palo ipl 1.17 root@hope Sun Nov 21 23:43:13 CET 2010

Partition Start(MB) End(MB) Id Type
1               1      39   f0 Palo
2              40      78   83 ext2
3              79   16300   83 ext2
4           16301   17359   82 swap

PALO(F0) partition contains:

Information: No console specified on kernel command line. This is normal.
PALO will choose the console currently used by firmware (serial).Current co=
mmand line:
2/vmlinux root=3D/dev/sda3 video=3Dmatroxfb:mem:2M,noaccel,init panic=3D5 c=
onsole=3DttyS0
 0: 2/vmlinux
 1: root=3D/dev/sda3
 2: video=3Dmatroxfb:mem:2M,noaccel,init
 3: panic=3D5
 4: console=3DttyS0

<#>    edit the numbered field
'b'    boot with this command line
'r'    restore command line
'l'    list dir
? 0
2/vmlinux.test
Current command line:
2/vmlinux.test root=3D/dev/sda3 video=3Dmatroxfb:mem:2M,noaccel,init panic=
=3D5 console=3DttyS0
 0: 2/vmlinux.test
 1: root=3D/dev/sda3
 2: video=3Dmatroxfb:mem:2M,noaccel,init
 3: panic=3D5
 4: console=3DttyS0

<#>    edit the numbered field
'b'    boot with this command line
'r'    restore command line
'l'    list dir
? b

Command line for kernel: 'root=3D/dev/sda3 video=3Dmatroxfb:mem:2M,noaccel,=
init panic=3D5 console=3DttyS0 palo_kernel=3D2/vmlinux.test'
Selected kernel: /vmlinux.test from partition 2
ELF32 executable
Entry 00100080 first 00100000 n 3
Segment 0 load 00100000 size 4702208 mediaptr 0x1000
Segment 1 load 005b8000 size 124364 mediaptr 0x47d000
Segment 2 load 005d7000 size 109520 mediaptr 0x49c000
Branching to kernel entry point 0x00100080.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 3.2.12 (root@hope) (gcc version 4.5.3 (Gentoo 4.5.3-r2 p1.1, =
pie-0.4.7) ) #4 Tue Apr 17 14:54:36 CEST 2012
unwind_init: start =3D 0x104e1000, end =3D 0x1051a960, entries =3D 14742
FP[0] enabled: Rev 1 Model 16
The 32-bit Kernel has started...
bootconsole [ttyB0] enabled
Initialized PDC Console for debugging.
Determining PDC firmware type: System Map.
model 00005cf0 00000481 00000000 00000002 77b310ff 100000f0 00000008 000000=
b2 000000b2
vers  00000300
CPUID vers 17 rev 10 (0x0000022a)
capabilities 0x3
model 9000/785/C3600
Total Memory: 2048 MB
      _______________________________=20
     < Your System ate a SPARC! Gah! >
      -------------------------------=20
             \   ^__^
                 (__)\       )\/\
                  U  ||----w |
                     ||     ||
swapper (pid 0): Protection id trap (code 7)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001110 Not tainted
r00-03  0004ff0e 1059a000 10112cb4 00000000
r04-07  00000001 105201cc 10524000 1052e178
r08-11  1052e194 10524020 00000000 00100000
r12-15  00080000 00000000 005f1fff 1055a33c
r16-19  1059a000 00080000 10524000 00007155
r20-23  00000000 10716000 00000000 00000001
r24-27  00000000 00000000 00000000 10524000
r28-31  00000000 03a37905 105202c0 00000000
sr00-03  00000000 00000000 00000000 00000000
sr04-07  00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 10100484 10100488
 IIR: 43ffff40    ISR: 00000000  IOR: 00000000
 CPU:        0   CR30: 10520000 CR31: 11111111
 ORIG_R28: 00000000
 IAOQ[0]: flush_instruction_cache_local+0x0/0x28
 IAOQ[1]: flush_instruction_cache_local+0x4/0x28
 RP(r2): flush_cache_all_local+0x10/0x24
Backtrace:
 [<10112cb4>] flush_cache_all_local+0x10/0x24
 [<105baee4>] paging_init+0x78c/0x830
 [<105bb4b0>] setup_arch+0x5c/0x80
 [<105b86bc>] start_kernel+0x80/0x374
 [<10113464>] start_parisc+0x4c/0x68

Backtrace:
 [<10113b94>] die_if_kernel+0x138/0x1b0
 [<10114320>] handle_interruption+0x48c/0x63c
 [<10104078>] intr_check_sig+0x0/0x34
 [<10118b9c>] pdc_console_write+0x30/0x58
 [<10100488>] flush_instruction_cache_local+0x4/0x28

---[ end trace 139ce121c98e96c9 ]---
Kernel panic - not syncing: Attempted to kill the idle task!
Backtrace:
 [<1010ebd0>] panic+0x94/0x268
 [<10131dd0>] do_exit+0xb4/0x5b8
 [<10113bfc>] die_if_kernel+0x1a0/0x1b0
 [<10114320>] handle_interruption+0x48c/0x63c
 [<10104078>] intr_check_sig+0x0/0x34
 [<10118b9c>] pdc_console_write+0x30/0x58
 [<10100488>] flush_instruction_cache_local+0x4/0x28


--MP_/VXS4p+1wRZqOPyUqkJVPNyZ
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=broken2-output.txt

Booting...=20
Boot IO Dependent Code (IODC) revision 0


HARD Booted.
palo ipl 1.18 root@hope Fri Apr 13 00:26:11 CEST 2012

Partition Start(MB) End(MB) Id Type
1               1      39   f0 Palo
2              40      78   83 ext2
3              79   16300   83 ext2
4           16301   17359   82 swap

PALO(F0) partition contains:

Information: No console specified on kernel command line. This is normal.
PALO will choose the console currently used by firmware (serial).Current co=
mmand line:
2/vmlinux root=3D/dev/sda3 video=3Dmatroxfb:mem:2M,noaccel,init panic=3D5 c=
onsole=3DttyS0
 0: 2/vmlinux
 1: root=3D/dev/sda3
 2: video=3Dmatroxfb:mem:2M,noaccel,init
 3: panic=3D5
 4: console=3DttyS0

<#>    edit the numbered field
'b'    boot with this command line
'r'    restore command line
'l'    list dir
? 0
2/vmlinux.test
Current command line:
2/vmlinux.test root=3D/dev/sda3 video=3Dmatroxfb:mem:2M,noaccel,init panic=
=3D5 console=3DttyS0
 0: 2/vmlinux.test
 1: root=3D/dev/sda3
 2: video=3Dmatroxfb:mem:2M,noaccel,init
 3: panic=3D5
 4: console=3DttyS0

<#>    edit the numbered field
'b'    boot with this command line
'r'    restore command line
'l'    list dir
? b

Command line for kernel: 'root=3D/dev/sda3 video=3Dmatroxfb:mem:2M,noaccel,=
init panic=3D5 console=3DttyS0 palo_kernel=3D2/vmlinux.test'
Selected kernel: /vmlinux.test from partition 2
ELF32 executable
Entry 00100100 first 00100000 n 3
Segment 0 load 00100000 size 5332992 mediaptr 0x1000
Segment 1 load 00644000 size 118480 mediaptr 0x517000
Segment 2 load 00661000 size 27504 mediaptr 0x534000
Branching to kernel entry point 0x00100100.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 3.3.1 (root@hope) (gcc version 4.5.3 (Gentoo 4.5.3-r2 p1.1, p=
ie-0.4.7) ) #4 Wed Apr 18 16:45:35 CEST 2012
unwind_init: start =3D 0x10579000, end =3D 0x105b5fb0, entries =3D 15611
FP[0] enabled: Rev 1 Model 16
The 32-bit Kernel has started...
bootconsole [ttyB0] enabled
Initialized PDC Console for debugging.
Determining PDC firmware type: System Map.
model 00005cf0 00000481 00000000 00000002 77b310ff 100000f0 00000008 000000=
b2 000000b2
vers  00000300
CPUID vers 17 rev 10 (0x0000022a)
capabilities 0x3
model 9000/785/C3600
Total Memory: 2048 MB
      _______________________________=20
     < Your System ate a SPARC! Gah! >
      -------------------------------=20
             \   ^__^
                 (__)\       )\/\
                  U  ||----w |
                     ||     ||
swapper (pid 0): Protection id trap (code 7)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001110 Not tainted
r00-03  0004ff0e 10634000 10112cf0 00000000
r04-07  105c0014 105c0000 105bc1cc 105c9bb8
r08-11  105c9bd4 105c0020 105f3800 00000668
r12-15  00100000 00080000 105c0000 105f3f70
r16-19  00080000 10634000 00667fff 000078b5
r20-23  1078c000 00000000 00000000 00000001
r24-27  00000000 00000000 00000000 105c0000
r28-31  00000000 0000078c 105bc2c0 00000000
sr00-03  00000000 00000000 00000000 00000000
sr04-07  00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 10100484 10100488
 IIR: 43ffff40    ISR: 00000000  IOR: 00000000
 CPU:        0   CR30: 105bc000 CR31: 11111111
 ORIG_R28: 00000000
 IAOQ[0]: flush_instruction_cache_local+0x0/0x28
 IAOQ[1]: flush_instruction_cache_local+0x4/0x28
 RP(r2): flush_cache_all_local+0x10/0x24
Backtrace:
 [<10112cf0>] flush_cache_all_local+0x10/0x24
 [<10646f00>] paging_init+0x7a4/0x848
 [<106474a4>] setup_arch+0x5c/0x80
 [<106446c8>] start_kernel+0x80/0x37c
 [<101134cc>] start_parisc+0x4c/0x68

Backtrace:
 [<10113ba0>] die_if_kernel+0xac/0x1bc
 [<101143cc>] handle_interruption+0x47c/0x718
 [<10104078>] intr_check_sig+0x0/0x34
 [<101191fc>] pdc_console_write+0x30/0x58
 [<10100488>] flush_instruction_cache_local+0x4/0x28

---[ end trace 139ce121c98e96c9 ]---
Kernel panic - not syncing: Attempted to kill the idle task!
      _______________________________=20
     < Your System ate a SPARC! Gah! >
      -------------------------------=20
             \   ^__^
                 (__)\       )\/\
                  U  ||----w |
                     ||     ||
swapper (pid 0): Protection id trap (code 7)
die_if_kernel() recursion detected.
  =20

--MP_/VXS4p+1wRZqOPyUqkJVPNyZ
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=linux-3.3.1-broken.config

#
# Automatically generated file; DO NOT EDIT.
# Linux/parisc 3.3.1 Kernel Configuration
#
CONFIG_PARISC=3Dy
CONFIG_MMU=3Dy
CONFIG_STACK_GROWSUP=3Dy
CONFIG_RWSEM_GENERIC_SPINLOCK=3Dy
# CONFIG_ARCH_HAS_ILOG2_U32 is not set
# CONFIG_ARCH_HAS_ILOG2_U64 is not set
CONFIG_GENERIC_BUG=3Dy
CONFIG_GENERIC_HWEIGHT=3Dy
CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
CONFIG_HAVE_LATENCYTOP_SUPPORT=3Dy
CONFIG_STACKTRACE_SUPPORT=3Dy
CONFIG_NEED_DMA_MAP_STATE=3Dy
CONFIG_NEED_SG_DMA_LENGTH=3Dy
CONFIG_DEFCONFIG_LIST=3D"/lib/modules/$UNAME_RELEASE/.config"
CONFIG_HAVE_IRQ_WORK=3Dy
CONFIG_IRQ_WORK=3Dy

#
# General setup
#
CONFIG_EXPERIMENTAL=3Dy
CONFIG_BROKEN_ON_SMP=3Dy
CONFIG_INIT_ENV_ARG_LIMIT=3D32
CONFIG_CROSS_COMPILE=3D""
CONFIG_LOCALVERSION=3D""
# CONFIG_LOCALVERSION_AUTO is not set
CONFIG_DEFAULT_HOSTNAME=3D"(none)"
CONFIG_SWAP=3Dy
CONFIG_SYSVIPC=3Dy
CONFIG_SYSVIPC_SYSCTL=3Dy
CONFIG_POSIX_MQUEUE=3Dy
CONFIG_POSIX_MQUEUE_SYSCTL=3Dy
CONFIG_BSD_PROCESS_ACCT=3Dy
# CONFIG_BSD_PROCESS_ACCT_V3 is not set
# CONFIG_FHANDLE is not set
# CONFIG_TASKSTATS is not set
# CONFIG_AUDIT is not set
CONFIG_HAVE_GENERIC_HARDIRQS=3Dy

#
# IRQ subsystem
#
CONFIG_GENERIC_HARDIRQS=3Dy
CONFIG_GENERIC_IRQ_PROBE=3Dy

#
# RCU Subsystem
#
CONFIG_TINY_RCU=3Dy
# CONFIG_PREEMPT_RCU is not set
# CONFIG_RCU_TRACE is not set
# CONFIG_TREE_RCU_TRACE is not set
CONFIG_IKCONFIG=3Dy
CONFIG_IKCONFIG_PROC=3Dy
CONFIG_LOG_BUF_SHIFT=3D16
# CONFIG_CGROUPS is not set
# CONFIG_CHECKPOINT_RESTORE is not set
CONFIG_NAMESPACES=3Dy
# CONFIG_UTS_NS is not set
# CONFIG_IPC_NS is not set
# CONFIG_USER_NS is not set
# CONFIG_PID_NS is not set
# CONFIG_NET_NS is not set
# CONFIG_SCHED_AUTOGROUP is not set
# CONFIG_SYSFS_DEPRECATED is not set
# CONFIG_RELAY is not set
CONFIG_BLK_DEV_INITRD=3Dy
CONFIG_INITRAMFS_SOURCE=3D""
CONFIG_RD_GZIP=3Dy
CONFIG_RD_BZIP2=3Dy
CONFIG_RD_LZMA=3Dy
CONFIG_RD_XZ=3Dy
CONFIG_RD_LZO=3Dy
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_SYSCTL=3Dy
CONFIG_ANON_INODES=3Dy
# CONFIG_EXPERT is not set
# CONFIG_SYSCTL_SYSCALL is not set
CONFIG_KALLSYMS=3Dy
CONFIG_KALLSYMS_ALL=3Dy
CONFIG_HOTPLUG=3Dy
CONFIG_PRINTK=3Dy
CONFIG_BUG=3Dy
CONFIG_ELF_CORE=3Dy
CONFIG_BASE_FULL=3Dy
CONFIG_FUTEX=3Dy
CONFIG_EPOLL=3Dy
CONFIG_SIGNALFD=3Dy
CONFIG_TIMERFD=3Dy
CONFIG_EVENTFD=3Dy
CONFIG_SHMEM=3Dy
CONFIG_AIO=3Dy
# CONFIG_EMBEDDED is not set
CONFIG_HAVE_PERF_EVENTS=3Dy

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=3Dy
# CONFIG_PERF_COUNTERS is not set
# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
CONFIG_VM_EVENT_COUNTERS=3Dy
CONFIG_PCI_QUIRKS=3Dy
CONFIG_SLUB_DEBUG=3Dy
# CONFIG_COMPAT_BRK is not set
# CONFIG_SLAB is not set
CONFIG_SLUB=3Dy
# CONFIG_PROFILING is not set
CONFIG_HAVE_OPROFILE=3Dy
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=3Dy

#
# GCOV-based kernel profiling
#
# CONFIG_HAVE_GENERIC_DMA_COHERENT is not set
CONFIG_SLABINFO=3Dy
CONFIG_RT_MUTEXES=3Dy
CONFIG_BASE_SMALL=3D0
CONFIG_MODULES=3Dy
# CONFIG_MODULE_FORCE_LOAD is not set
CONFIG_MODULE_UNLOAD=3Dy
CONFIG_MODULE_FORCE_UNLOAD=3Dy
# CONFIG_MODVERSIONS is not set
# CONFIG_MODULE_SRCVERSION_ALL is not set
CONFIG_INIT_ALL_POSSIBLE=3Dy
CONFIG_BLOCK=3Dy
CONFIG_LBDAF=3Dy
CONFIG_BLK_DEV_BSG=3Dy
CONFIG_BLK_DEV_BSGLIB=3Dy
# CONFIG_BLK_DEV_INTEGRITY is not set

#
# Partition Types
#
# CONFIG_PARTITION_ADVANCED is not set
CONFIG_MSDOS_PARTITION=3Dy

#
# IO Schedulers
#
CONFIG_IOSCHED_NOOP=3Dy
CONFIG_IOSCHED_DEADLINE=3Dy
CONFIG_IOSCHED_CFQ=3Dy
# CONFIG_DEFAULT_DEADLINE is not set
CONFIG_DEFAULT_CFQ=3Dy
# CONFIG_DEFAULT_NOOP is not set
CONFIG_DEFAULT_IOSCHED=3D"cfq"
# CONFIG_INLINE_SPIN_TRYLOCK is not set
# CONFIG_INLINE_SPIN_TRYLOCK_BH is not set
# CONFIG_INLINE_SPIN_LOCK is not set
# CONFIG_INLINE_SPIN_LOCK_BH is not set
# CONFIG_INLINE_SPIN_LOCK_IRQ is not set
# CONFIG_INLINE_SPIN_LOCK_IRQSAVE is not set
CONFIG_INLINE_SPIN_UNLOCK=3Dy
# CONFIG_INLINE_SPIN_UNLOCK_BH is not set
CONFIG_INLINE_SPIN_UNLOCK_IRQ=3Dy
# CONFIG_INLINE_SPIN_UNLOCK_IRQRESTORE is not set
# CONFIG_INLINE_READ_TRYLOCK is not set
# CONFIG_INLINE_READ_LOCK is not set
# CONFIG_INLINE_READ_LOCK_BH is not set
# CONFIG_INLINE_READ_LOCK_IRQ is not set
# CONFIG_INLINE_READ_LOCK_IRQSAVE is not set
CONFIG_INLINE_READ_UNLOCK=3Dy
# CONFIG_INLINE_READ_UNLOCK_BH is not set
CONFIG_INLINE_READ_UNLOCK_IRQ=3Dy
# CONFIG_INLINE_READ_UNLOCK_IRQRESTORE is not set
# CONFIG_INLINE_WRITE_TRYLOCK is not set
# CONFIG_INLINE_WRITE_LOCK is not set
# CONFIG_INLINE_WRITE_LOCK_BH is not set
# CONFIG_INLINE_WRITE_LOCK_IRQ is not set
# CONFIG_INLINE_WRITE_LOCK_IRQSAVE is not set
CONFIG_INLINE_WRITE_UNLOCK=3Dy
# CONFIG_INLINE_WRITE_UNLOCK_BH is not set
CONFIG_INLINE_WRITE_UNLOCK_IRQ=3Dy
# CONFIG_INLINE_WRITE_UNLOCK_IRQRESTORE is not set
# CONFIG_MUTEX_SPIN_ON_OWNER is not set
# CONFIG_FREEZER is not set

#
# Processor type and features
#
# CONFIG_PA7000 is not set
# CONFIG_PA7100LC is not set
# CONFIG_PA7200 is not set
# CONFIG_PA7300LC is not set
CONFIG_PA8X00=3Dy
CONFIG_PA20=3Dy
CONFIG_PREFETCH=3Dy
# CONFIG_64BIT is not set
CONFIG_PARISC_PAGE_SIZE_4KB=3Dy
# CONFIG_PARISC_PAGE_SIZE_16KB is not set
# CONFIG_PARISC_PAGE_SIZE_64KB is not set
# CONFIG_SMP is not set
CONFIG_ARCH_FLATMEM_ENABLE=3Dy
# CONFIG_PREEMPT_NONE is not set
CONFIG_PREEMPT_VOLUNTARY=3Dy
# CONFIG_PREEMPT is not set
# CONFIG_HZ_100 is not set
CONFIG_HZ_250=3Dy
# CONFIG_HZ_300 is not set
# CONFIG_HZ_1000 is not set
CONFIG_HZ=3D250
# CONFIG_SCHED_HRTICK is not set
CONFIG_SELECT_MEMORY_MODEL=3Dy
CONFIG_FLATMEM_MANUAL=3Dy
CONFIG_FLATMEM=3Dy
CONFIG_FLAT_NODE_MEM_MAP=3Dy
CONFIG_PAGEFLAGS_EXTENDED=3Dy
CONFIG_SPLIT_PTLOCK_CPUS=3D4
# CONFIG_COMPACTION is not set
# CONFIG_PHYS_ADDR_T_64BIT is not set
CONFIG_ZONE_DMA_FLAG=3D0
CONFIG_VIRT_TO_BUS=3Dy
# CONFIG_KSM is not set
CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
CONFIG_NEED_PER_CPU_KM=3Dy
# CONFIG_CLEANCACHE is not set
# CONFIG_HPUX is not set

#
# Bus options (PCI, PCMCIA, EISA, GSC, ISA)
#
# CONFIG_GSC is not set
CONFIG_PCI=3Dy
# CONFIG_ARCH_SUPPORTS_MSI is not set
# CONFIG_PCI_DEBUG is not set
# CONFIG_PCI_STUB is not set
# CONFIG_PCI_IOV is not set
# CONFIG_PCI_PRI is not set
# CONFIG_PCI_PASID is not set
CONFIG_PCI_LBA=3Dy
CONFIG_IOSAPIC=3Dy
CONFIG_IOMMU_SBA=3Dy
CONFIG_IOMMU_HELPER=3Dy
# CONFIG_PCCARD is not set
CONFIG_HOTPLUG_PCI=3Dm
# CONFIG_HOTPLUG_PCI_FAKE is not set
# CONFIG_HOTPLUG_PCI_CPCI is not set
# CONFIG_HOTPLUG_PCI_SHPC is not set

#
# PA-RISC specific drivers
#
CONFIG_SUPERIO=3Dy
CONFIG_CHASSIS_LCD_LED=3Dy
# CONFIG_PDC_CHASSIS is not set
CONFIG_PDC_CHASSIS_WARN=3Dy
CONFIG_PDC_STABLE=3Dy

#
# Executable file formats
#
CONFIG_BINFMT_ELF=3Dy
CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=3Dy
# CONFIG_HAVE_AOUT is not set
# CONFIG_BINFMT_MISC is not set
CONFIG_NET=3Dy

#
# Networking options
#
CONFIG_PACKET=3Dy
CONFIG_UNIX=3Dy
# CONFIG_UNIX_DIAG is not set
CONFIG_XFRM=3Dy
CONFIG_XFRM_USER=3Dm
# CONFIG_XFRM_SUB_POLICY is not set
# CONFIG_XFRM_MIGRATE is not set
# CONFIG_XFRM_STATISTICS is not set
CONFIG_XFRM_IPCOMP=3Dm
CONFIG_NET_KEY=3Dm
# CONFIG_NET_KEY_MIGRATE is not set
CONFIG_INET=3Dy
CONFIG_IP_MULTICAST=3Dy
# CONFIG_IP_ADVANCED_ROUTER is not set
CONFIG_IP_PNP=3Dy
# CONFIG_IP_PNP_DHCP is not set
CONFIG_IP_PNP_BOOTP=3Dy
# CONFIG_IP_PNP_RARP is not set
# CONFIG_NET_IPIP is not set
# CONFIG_NET_IPGRE_DEMUX is not set
# CONFIG_IP_MROUTE is not set
# CONFIG_ARPD is not set
# CONFIG_SYN_COOKIES is not set
# CONFIG_INET_AH is not set
# CONFIG_INET_ESP is not set
# CONFIG_INET_IPCOMP is not set
# CONFIG_INET_XFRM_TUNNEL is not set
CONFIG_INET_TUNNEL=3Dm
CONFIG_INET_XFRM_MODE_TRANSPORT=3Dy
CONFIG_INET_XFRM_MODE_TUNNEL=3Dy
CONFIG_INET_XFRM_MODE_BEET=3Dy
# CONFIG_INET_LRO is not set
# CONFIG_INET_DIAG is not set
# CONFIG_TCP_CONG_ADVANCED is not set
CONFIG_TCP_CONG_CUBIC=3Dy
CONFIG_DEFAULT_TCP_CONG=3D"cubic"
# CONFIG_TCP_MD5SIG is not set
CONFIG_IPV6=3Dm
# CONFIG_IPV6_PRIVACY is not set
# CONFIG_IPV6_ROUTER_PREF is not set
# CONFIG_IPV6_OPTIMISTIC_DAD is not set
# CONFIG_INET6_AH is not set
# CONFIG_INET6_ESP is not set
CONFIG_INET6_IPCOMP=3Dm
# CONFIG_IPV6_MIP6 is not set
CONFIG_INET6_XFRM_TUNNEL=3Dm
CONFIG_INET6_TUNNEL=3Dm
CONFIG_INET6_XFRM_MODE_TRANSPORT=3Dm
CONFIG_INET6_XFRM_MODE_TUNNEL=3Dm
CONFIG_INET6_XFRM_MODE_BEET=3Dm
# CONFIG_INET6_XFRM_MODE_ROUTEOPTIMIZATION is not set
CONFIG_IPV6_SIT=3Dm
# CONFIG_IPV6_SIT_6RD is not set
CONFIG_IPV6_NDISC_NODETYPE=3Dy
CONFIG_IPV6_TUNNEL=3Dm
# CONFIG_IPV6_MULTIPLE_TABLES is not set
# CONFIG_IPV6_MROUTE is not set
# CONFIG_NETWORK_SECMARK is not set
# CONFIG_NETWORK_PHY_TIMESTAMPING is not set
CONFIG_NETFILTER=3Dy
CONFIG_NETFILTER_DEBUG=3Dy
# CONFIG_NETFILTER_ADVANCED is not set

#
# Core Netfilter Configuration
#
# CONFIG_NETFILTER_NETLINK_LOG is not set
# CONFIG_NF_CONNTRACK is not set
# CONFIG_NETFILTER_XTABLES is not set
# CONFIG_IP_VS is not set

#
# IP: Netfilter Configuration
#
# CONFIG_NF_DEFRAG_IPV4 is not set
# CONFIG_IP_NF_IPTABLES is not set

#
# IPv6: Netfilter Configuration
#
# CONFIG_NF_DEFRAG_IPV6 is not set
# CONFIG_IP6_NF_IPTABLES is not set
# CONFIG_IP_DCCP is not set
# CONFIG_IP_SCTP is not set
# CONFIG_RDS is not set
# CONFIG_TIPC is not set
# CONFIG_ATM is not set
# CONFIG_L2TP is not set
# CONFIG_BRIDGE is not set
# CONFIG_NET_DSA is not set
# CONFIG_VLAN_8021Q is not set
# CONFIG_DECNET is not set
# CONFIG_LLC2 is not set
# CONFIG_IPX is not set
# CONFIG_ATALK is not set
# CONFIG_X25 is not set
# CONFIG_LAPB is not set
# CONFIG_ECONET is not set
# CONFIG_WAN_ROUTER is not set
# CONFIG_PHONET is not set
# CONFIG_IEEE802154 is not set
# CONFIG_NET_SCHED is not set
# CONFIG_DCB is not set
# CONFIG_BATMAN_ADV is not set
# CONFIG_OPENVSWITCH is not set
CONFIG_BQL=3Dy

#
# Network testing
#
CONFIG_NET_PKTGEN=3Dm
# CONFIG_HAMRADIO is not set
# CONFIG_CAN is not set
# CONFIG_IRDA is not set
# CONFIG_BT is not set
# CONFIG_AF_RXRPC is not set
# CONFIG_WIRELESS is not set
# CONFIG_WIMAX is not set
# CONFIG_RFKILL is not set
# CONFIG_NET_9P is not set
# CONFIG_CAIF is not set
# CONFIG_CEPH_LIB is not set
# CONFIG_NFC is not set

#
# Device Drivers
#

#
# Generic Driver Options
#
CONFIG_UEVENT_HELPER_PATH=3D"/sbin/hotplug"
# CONFIG_DEVTMPFS is not set
# CONFIG_STANDALONE is not set
# CONFIG_PREVENT_FIRMWARE_BUILD is not set
CONFIG_FW_LOADER=3Dy
CONFIG_FIRMWARE_IN_KERNEL=3Dy
CONFIG_EXTRA_FIRMWARE=3D""
# CONFIG_DEBUG_DRIVER is not set
# CONFIG_DEBUG_DEVRES is not set
# CONFIG_SYS_HYPERVISOR is not set
# CONFIG_GENERIC_CPU_DEVICES is not set
# CONFIG_DMA_SHARED_BUFFER is not set
# CONFIG_CONNECTOR is not set
# CONFIG_MTD is not set
# CONFIG_PARPORT is not set
CONFIG_BLK_DEV=3Dy
# CONFIG_BLK_CPQ_DA is not set
# CONFIG_BLK_CPQ_CISS_DA is not set
# CONFIG_BLK_DEV_DAC960 is not set
CONFIG_BLK_DEV_UMEM=3Dm
# CONFIG_BLK_DEV_COW_COMMON is not set
CONFIG_BLK_DEV_LOOP=3Dy
CONFIG_BLK_DEV_LOOP_MIN_COUNT=3D8
CONFIG_BLK_DEV_CRYPTOLOOP=3Dm

#
# DRBD disabled because PROC_FS, INET or CONNECTOR not selected
#
# CONFIG_BLK_DEV_NBD is not set
# CONFIG_BLK_DEV_NVME is not set
# CONFIG_BLK_DEV_SX8 is not set
# CONFIG_BLK_DEV_UB is not set
# CONFIG_BLK_DEV_RAM is not set
# CONFIG_CDROM_PKTCDVD is not set
# CONFIG_ATA_OVER_ETH is not set
# CONFIG_BLK_DEV_HD is not set
# CONFIG_BLK_DEV_RBD is not set

#
# Misc devices
#
# CONFIG_SENSORS_LIS3LV02D is not set
# CONFIG_PHANTOM is not set
# CONFIG_INTEL_MID_PTI is not set
# CONFIG_SGI_IOC4 is not set
# CONFIG_TIFM_CORE is not set
# CONFIG_ENCLOSURE_SERVICES is not set
# CONFIG_HP_ILO is not set
# CONFIG_PCH_PHUB is not set
# CONFIG_C2PORT is not set

#
# EEPROM support
#
# CONFIG_EEPROM_93CX6 is not set
# CONFIG_CB710_CORE is not set

#
# Texas Instruments shared transport line discipline
#

#
# Altera FPGA firmware download module
#
CONFIG_HAVE_IDE=3Dy
CONFIG_IDE=3Dy

#
# Please see Documentation/ide/ide.txt for help/info on IDE drives
#
CONFIG_IDE_XFER_MODE=3Dy
CONFIG_IDE_ATAPI=3Dy
# CONFIG_BLK_DEV_IDE_SATA is not set
CONFIG_IDE_GD=3Dy
CONFIG_IDE_GD_ATA=3Dy
# CONFIG_IDE_GD_ATAPI is not set
CONFIG_BLK_DEV_IDECD=3Dm
CONFIG_BLK_DEV_IDECD_VERBOSE_ERRORS=3Dy
# CONFIG_BLK_DEV_IDETAPE is not set
# CONFIG_IDE_TASK_IOCTL is not set
CONFIG_IDE_PROC_FS=3Dy

#
# IDE chipset support/bugfixes
#
# CONFIG_BLK_DEV_PLATFORM is not set
CONFIG_BLK_DEV_IDEDMA_SFF=3Dy

#
# PCI IDE chipsets support
#
CONFIG_BLK_DEV_IDEPCI=3Dy
# CONFIG_IDEPCI_PCIBUS_ORDER is not set
# CONFIG_BLK_DEV_GENERIC is not set
# CONFIG_BLK_DEV_OPTI621 is not set
CONFIG_BLK_DEV_IDEDMA_PCI=3Dy
# CONFIG_BLK_DEV_AEC62XX is not set
# CONFIG_BLK_DEV_ALI15X3 is not set
# CONFIG_BLK_DEV_AMD74XX is not set
# CONFIG_BLK_DEV_CMD64X is not set
# CONFIG_BLK_DEV_TRIFLEX is not set
# CONFIG_BLK_DEV_CS5520 is not set
# CONFIG_BLK_DEV_CS5530 is not set
# CONFIG_BLK_DEV_HPT366 is not set
# CONFIG_BLK_DEV_JMICRON is not set
# CONFIG_BLK_DEV_SC1200 is not set
# CONFIG_BLK_DEV_PIIX is not set
# CONFIG_BLK_DEV_IT8172 is not set
# CONFIG_BLK_DEV_IT8213 is not set
# CONFIG_BLK_DEV_IT821X is not set
CONFIG_BLK_DEV_NS87415=3Dm
# CONFIG_BLK_DEV_PDC202XX_OLD is not set
# CONFIG_BLK_DEV_PDC202XX_NEW is not set
# CONFIG_BLK_DEV_SVWKS is not set
CONFIG_BLK_DEV_SIIMAGE=3Dm
# CONFIG_BLK_DEV_SLC90E66 is not set
# CONFIG_BLK_DEV_TRM290 is not set
# CONFIG_BLK_DEV_VIA82CXXX is not set
# CONFIG_BLK_DEV_TC86C001 is not set
CONFIG_BLK_DEV_IDEDMA=3Dy

#
# SCSI device support
#
CONFIG_SCSI_MOD=3Dy
# CONFIG_RAID_ATTRS is not set
CONFIG_SCSI=3Dy
CONFIG_SCSI_DMA=3Dy
# CONFIG_SCSI_TGT is not set
# CONFIG_SCSI_NETLINK is not set
CONFIG_SCSI_PROC_FS=3Dy

#
# SCSI support type (disk, tape, CD-ROM)
#
CONFIG_BLK_DEV_SD=3Dy
CONFIG_CHR_DEV_ST=3Dm
# CONFIG_CHR_DEV_OSST is not set
CONFIG_BLK_DEV_SR=3Dm
# CONFIG_BLK_DEV_SR_VENDOR is not set
CONFIG_CHR_DEV_SG=3Dy
# CONFIG_CHR_DEV_SCH is not set
CONFIG_SCSI_MULTI_LUN=3Dy
# CONFIG_SCSI_CONSTANTS is not set
# CONFIG_SCSI_LOGGING is not set
# CONFIG_SCSI_SCAN_ASYNC is not set
CONFIG_SCSI_WAIT_SCAN=3Dm

#
# SCSI Transports
#
CONFIG_SCSI_SPI_ATTRS=3Dy
# CONFIG_SCSI_FC_ATTRS is not set
CONFIG_SCSI_ISCSI_ATTRS=3Dm
# CONFIG_SCSI_SAS_ATTRS is not set
# CONFIG_SCSI_SAS_LIBSAS is not set
# CONFIG_SCSI_SRP_ATTRS is not set
CONFIG_SCSI_LOWLEVEL=3Dy
# CONFIG_ISCSI_TCP is not set
# CONFIG_ISCSI_BOOT_SYSFS is not set
# CONFIG_SCSI_CXGB3_ISCSI is not set
# CONFIG_SCSI_CXGB4_ISCSI is not set
# CONFIG_SCSI_BNX2_ISCSI is not set
# CONFIG_SCSI_BNX2X_FCOE is not set
# CONFIG_BE2ISCSI is not set
# CONFIG_BLK_DEV_3W_XXXX_RAID is not set
# CONFIG_SCSI_HPSA is not set
# CONFIG_SCSI_3W_9XXX is not set
# CONFIG_SCSI_3W_SAS is not set
# CONFIG_SCSI_ACARD is not set
# CONFIG_SCSI_AACRAID is not set
# CONFIG_SCSI_AIC7XXX is not set
# CONFIG_SCSI_AIC7XXX_OLD is not set
# CONFIG_SCSI_AIC79XX is not set
# CONFIG_SCSI_AIC94XX is not set
# CONFIG_SCSI_MVSAS is not set
# CONFIG_SCSI_MVUMI is not set
# CONFIG_SCSI_DPT_I2O is not set
# CONFIG_SCSI_ADVANSYS is not set
# CONFIG_SCSI_ARCMSR is not set
# CONFIG_MEGARAID_NEWGEN is not set
# CONFIG_MEGARAID_LEGACY is not set
# CONFIG_MEGARAID_SAS is not set
# CONFIG_SCSI_MPT2SAS is not set
# CONFIG_SCSI_HPTIOP is not set
# CONFIG_LIBFC is not set
# CONFIG_LIBFCOE is not set
# CONFIG_FCOE is not set
# CONFIG_SCSI_DMX3191D is not set
# CONFIG_SCSI_FUTURE_DOMAIN is not set
# CONFIG_SCSI_IPS is not set
# CONFIG_SCSI_INITIO is not set
# CONFIG_SCSI_INIA100 is not set
# CONFIG_SCSI_STEX is not set
CONFIG_SCSI_SYM53C8XX_2=3Dy
CONFIG_SCSI_SYM53C8XX_DMA_ADDRESSING_MODE=3D0
CONFIG_SCSI_SYM53C8XX_DEFAULT_TAGS=3D16
CONFIG_SCSI_SYM53C8XX_MAX_TAGS=3D64
CONFIG_SCSI_SYM53C8XX_MMIO=3Dy
# CONFIG_SCSI_IPR is not set
# CONFIG_SCSI_QLOGIC_1280 is not set
# CONFIG_SCSI_QLA_FC is not set
# CONFIG_SCSI_QLA_ISCSI is not set
# CONFIG_SCSI_LPFC is not set
# CONFIG_SCSI_DC395x is not set
# CONFIG_SCSI_DC390T is not set
# CONFIG_SCSI_NSP32 is not set
# CONFIG_SCSI_DEBUG is not set
# CONFIG_SCSI_PMCRAID is not set
# CONFIG_SCSI_PM8001 is not set
# CONFIG_SCSI_SRP is not set
# CONFIG_SCSI_BFA_FC is not set
# CONFIG_SCSI_DH is not set
# CONFIG_SCSI_OSD_INITIATOR is not set
CONFIG_ATA=3Dm
# CONFIG_ATA_NONSTANDARD is not set
CONFIG_ATA_VERBOSE_ERROR=3Dy
CONFIG_SATA_PMP=3Dy

#
# Controllers with non-SFF native interface
#
# CONFIG_SATA_AHCI is not set
# CONFIG_SATA_AHCI_PLATFORM is not set
# CONFIG_SATA_INIC162X is not set
# CONFIG_SATA_ACARD_AHCI is not set
# CONFIG_SATA_SIL24 is not set
CONFIG_ATA_SFF=3Dy

#
# SFF controllers with custom DMA interface
#
# CONFIG_PDC_ADMA is not set
# CONFIG_SATA_QSTOR is not set
# CONFIG_SATA_SX4 is not set
CONFIG_ATA_BMDMA=3Dy

#
# SATA SFF controllers with BMDMA
#
# CONFIG_ATA_PIIX is not set
# CONFIG_SATA_MV is not set
# CONFIG_SATA_NV is not set
# CONFIG_SATA_PROMISE is not set
# CONFIG_SATA_SIL is not set
# CONFIG_SATA_SIS is not set
# CONFIG_SATA_SVW is not set
# CONFIG_SATA_ULI is not set
CONFIG_SATA_VIA=3Dm
# CONFIG_SATA_VITESSE is not set

#
# PATA SFF controllers with BMDMA
#
# CONFIG_PATA_ALI is not set
# CONFIG_PATA_AMD is not set
# CONFIG_PATA_ARTOP is not set
# CONFIG_PATA_ATIIXP is not set
# CONFIG_PATA_ATP867X is not set
# CONFIG_PATA_CMD64X is not set
# CONFIG_PATA_CS5520 is not set
# CONFIG_PATA_CS5530 is not set
# CONFIG_PATA_CS5536 is not set
# CONFIG_PATA_CYPRESS is not set
# CONFIG_PATA_EFAR is not set
# CONFIG_PATA_HPT366 is not set
# CONFIG_PATA_HPT37X is not set
# CONFIG_PATA_HPT3X2N is not set
# CONFIG_PATA_HPT3X3 is not set
# CONFIG_PATA_IT8213 is not set
# CONFIG_PATA_IT821X is not set
# CONFIG_PATA_JMICRON is not set
# CONFIG_PATA_MARVELL is not set
# CONFIG_PATA_NETCELL is not set
# CONFIG_PATA_NINJA32 is not set
# CONFIG_PATA_NS87415 is not set
# CONFIG_PATA_OLDPIIX is not set
# CONFIG_PATA_OPTIDMA is not set
# CONFIG_PATA_PDC2027X is not set
# CONFIG_PATA_PDC_OLD is not set
# CONFIG_PATA_RADISYS is not set
# CONFIG_PATA_RDC is not set
# CONFIG_PATA_SC1200 is not set
# CONFIG_PATA_SCH is not set
# CONFIG_PATA_SERVERWORKS is not set
# CONFIG_PATA_SIL680 is not set
# CONFIG_PATA_SIS is not set
# CONFIG_PATA_TOSHIBA is not set
# CONFIG_PATA_TRIFLEX is not set
CONFIG_PATA_VIA=3Dm
# CONFIG_PATA_WINBOND is not set

#
# PIO-only SFF controllers
#
# CONFIG_PATA_CMD640_PCI is not set
# CONFIG_PATA_MPIIX is not set
# CONFIG_PATA_NS87410 is not set
# CONFIG_PATA_OPTI is not set
# CONFIG_PATA_RZ1000 is not set

#
# Generic fallback / legacy drivers
#
# CONFIG_ATA_GENERIC is not set
# CONFIG_PATA_LEGACY is not set
CONFIG_MD=3Dy
# CONFIG_BLK_DEV_MD is not set
CONFIG_BLK_DEV_DM=3Dm
# CONFIG_DM_DEBUG is not set
CONFIG_DM_CRYPT=3Dm
CONFIG_DM_SNAPSHOT=3Dm
# CONFIG_DM_THIN_PROVISIONING is not set
CONFIG_DM_MIRROR=3Dm
# CONFIG_DM_RAID is not set
# CONFIG_DM_LOG_USERSPACE is not set
CONFIG_DM_ZERO=3Dm
# CONFIG_DM_MULTIPATH is not set
# CONFIG_DM_DELAY is not set
CONFIG_DM_UEVENT=3Dy
# CONFIG_DM_FLAKEY is not set
# CONFIG_TARGET_CORE is not set
# CONFIG_FUSION is not set

#
# IEEE 1394 (FireWire) support
#
# CONFIG_FIREWIRE is not set
# CONFIG_FIREWIRE_NOSY is not set
# CONFIG_I2O is not set
CONFIG_NETDEVICES=3Dy
CONFIG_NET_CORE=3Dy
CONFIG_BONDING=3Dm
CONFIG_DUMMY=3Dm
# CONFIG_EQUALIZER is not set
# CONFIG_NET_FC is not set
CONFIG_MII=3Dm
# CONFIG_NET_TEAM is not set
# CONFIG_MACVLAN is not set
# CONFIG_NETCONSOLE is not set
# CONFIG_NETPOLL is not set
# CONFIG_NET_POLL_CONTROLLER is not set
CONFIG_TUN=3Dm
# CONFIG_VETH is not set
# CONFIG_ARCNET is not set

#
# CAIF transport drivers
#
CONFIG_ETHERNET=3Dy
# CONFIG_NET_VENDOR_3COM is not set
# CONFIG_NET_VENDOR_ADAPTEC is not set
# CONFIG_NET_VENDOR_ALTEON is not set
# CONFIG_NET_VENDOR_AMD is not set
# CONFIG_NET_VENDOR_ATHEROS is not set
# CONFIG_NET_VENDOR_BROADCOM is not set
# CONFIG_NET_VENDOR_BROCADE is not set
# CONFIG_NET_CALXEDA_XGMAC is not set
# CONFIG_NET_VENDOR_CHELSIO is not set
# CONFIG_NET_VENDOR_CISCO is not set
# CONFIG_DNET is not set
CONFIG_NET_VENDOR_DEC=3Dy
CONFIG_NET_TULIP=3Dy
# CONFIG_DE2104X is not set
CONFIG_TULIP=3Dm
# CONFIG_TULIP_MWI is not set
CONFIG_TULIP_MMIO=3Dy
CONFIG_TULIP_NAPI=3Dy
# CONFIG_TULIP_NAPI_HW_MITIGATION is not set
CONFIG_DE4X5=3Dm
# CONFIG_WINBOND_840 is not set
# CONFIG_DM9102 is not set
# CONFIG_ULI526X is not set
# CONFIG_NET_VENDOR_DLINK is not set
# CONFIG_NET_VENDOR_EMULEX is not set
# CONFIG_NET_VENDOR_EXAR is not set
# CONFIG_NET_VENDOR_HP is not set
# CONFIG_NET_VENDOR_INTEL is not set
# CONFIG_IP1000 is not set
# CONFIG_JME is not set
# CONFIG_NET_VENDOR_MARVELL is not set
# CONFIG_NET_VENDOR_MELLANOX is not set
# CONFIG_NET_VENDOR_MICREL is not set
# CONFIG_NET_VENDOR_MYRI is not set
# CONFIG_FEALNX is not set
# CONFIG_NET_VENDOR_NATSEMI is not set
# CONFIG_NET_VENDOR_NVIDIA is not set
# CONFIG_NET_VENDOR_OKI is not set
# CONFIG_ETHOC is not set
# CONFIG_NET_PACKET_ENGINE is not set
# CONFIG_NET_VENDOR_QLOGIC is not set
# CONFIG_NET_VENDOR_REALTEK is not set
# CONFIG_NET_VENDOR_RDC is not set
# CONFIG_NET_VENDOR_SEEQ is not set
# CONFIG_NET_VENDOR_SILAN is not set
# CONFIG_NET_VENDOR_SIS is not set
# CONFIG_SFC is not set
# CONFIG_NET_VENDOR_SMSC is not set
# CONFIG_NET_VENDOR_STMICRO is not set
# CONFIG_NET_VENDOR_SUN is not set
# CONFIG_NET_VENDOR_TEHUTI is not set
# CONFIG_NET_VENDOR_TI is not set
# CONFIG_NET_VENDOR_VIA is not set
# CONFIG_FDDI is not set
# CONFIG_HIPPI is not set
# CONFIG_PHYLIB is not set
# CONFIG_PPP is not set
# CONFIG_SLIP is not set
# CONFIG_TR is not set

#
# USB Network Adapters
#
# CONFIG_USB_CATC is not set
# CONFIG_USB_KAWETH is not set
# CONFIG_USB_PEGASUS is not set
# CONFIG_USB_RTL8150 is not set
# CONFIG_USB_USBNET is not set
# CONFIG_USB_IPHETH is not set
# CONFIG_WLAN is not set

#
# Enable WiMAX (Networking options) to see the WiMAX drivers
#
# CONFIG_WAN is not set
# CONFIG_VMXNET3 is not set
# CONFIG_ISDN is not set
# CONFIG_PHONE is not set

#
# Input device support
#
CONFIG_INPUT=3Dy
# CONFIG_INPUT_FF_MEMLESS is not set
# CONFIG_INPUT_POLLDEV is not set
# CONFIG_INPUT_SPARSEKMAP is not set

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=3Dy
# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D1600
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D1200
# CONFIG_INPUT_JOYDEV is not set
# CONFIG_INPUT_EVDEV is not set
# CONFIG_INPUT_EVBUG is not set

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=3Dy
# CONFIG_KEYBOARD_ATKBD is not set
# CONFIG_KEYBOARD_LKKBD is not set
# CONFIG_KEYBOARD_NEWTON is not set
# CONFIG_KEYBOARD_OPENCORES is not set
# CONFIG_KEYBOARD_STOWAWAY is not set
# CONFIG_KEYBOARD_SUNKBD is not set
# CONFIG_KEYBOARD_XTKBD is not set
CONFIG_INPUT_MOUSE=3Dy
# CONFIG_MOUSE_PS2 is not set
# CONFIG_MOUSE_SERIAL is not set
# CONFIG_MOUSE_APPLETOUCH is not set
# CONFIG_MOUSE_BCM5974 is not set
# CONFIG_MOUSE_VSXXXAA is not set
# CONFIG_INPUT_JOYSTICK is not set
# CONFIG_INPUT_TABLET is not set
# CONFIG_INPUT_TOUCHSCREEN is not set
# CONFIG_INPUT_MISC is not set

#
# Hardware I/O ports
#
CONFIG_SERIO=3Dm
CONFIG_SERIO_SERPORT=3Dm
# CONFIG_SERIO_PCIPS2 is not set
# CONFIG_SERIO_RAW is not set
# CONFIG_SERIO_ALTERA_PS2 is not set
# CONFIG_SERIO_PS2MULT is not set
# CONFIG_GAMEPORT is not set

#
# Character devices
#
CONFIG_VT=3Dy
CONFIG_CONSOLE_TRANSLATIONS=3Dy
CONFIG_VT_CONSOLE=3Dy
CONFIG_HW_CONSOLE=3Dy
# CONFIG_VT_HW_CONSOLE_BINDING is not set
CONFIG_UNIX98_PTYS=3Dy
# CONFIG_DEVPTS_MULTIPLE_INSTANCES is not set
CONFIG_LEGACY_PTYS=3Dy
CONFIG_LEGACY_PTY_COUNT=3D256
# CONFIG_SERIAL_NONSTANDARD is not set
# CONFIG_NOZOMI is not set
# CONFIG_N_GSM is not set
# CONFIG_TRACE_SINK is not set
# CONFIG_DEVKMEM is not set

#
# Serial drivers
#
CONFIG_SERIAL_8250=3Dy
CONFIG_SERIAL_8250_CONSOLE=3Dy
CONFIG_SERIAL_8250_PCI=3Dy
CONFIG_SERIAL_8250_NR_UARTS=3D13
CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
CONFIG_SERIAL_8250_EXTENDED=3Dy
CONFIG_SERIAL_8250_MANY_PORTS=3Dy
CONFIG_SERIAL_8250_SHARE_IRQ=3Dy
# CONFIG_SERIAL_8250_DETECT_IRQ is not set
# CONFIG_SERIAL_8250_RSA is not set

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_MFD_HSU is not set
# CONFIG_PDC_CONSOLE is not set
CONFIG_SERIAL_CORE=3Dy
CONFIG_SERIAL_CORE_CONSOLE=3Dy
# CONFIG_SERIAL_JSM is not set
# CONFIG_SERIAL_TIMBERDALE is not set
# CONFIG_SERIAL_ALTERA_JTAGUART is not set
# CONFIG_SERIAL_ALTERA_UART is not set
# CONFIG_SERIAL_PCH_UART is not set
# CONFIG_SERIAL_XILINX_PS_UART is not set
# CONFIG_IPMI_HANDLER is not set
# CONFIG_HW_RANDOM is not set
# CONFIG_R3964 is not set
# CONFIG_APPLICOM is not set
CONFIG_RAW_DRIVER=3Dy
CONFIG_MAX_RAW_DEVS=3D256
# CONFIG_TCG_TPM is not set
CONFIG_DEVPORT=3Dy
# CONFIG_RAMOOPS is not set
# CONFIG_I2C is not set
# CONFIG_SPI is not set

#
# PPS support
#
# CONFIG_PPS is not set

#
# PPS generators support
#

#
# PTP clock support
#

#
# Enable Device Drivers -> PPS to see the PTP clock options.
#
# CONFIG_W1 is not set
# CONFIG_POWER_SUPPLY is not set
# CONFIG_HWMON is not set
# CONFIG_THERMAL is not set
# CONFIG_WATCHDOG is not set
CONFIG_SSB_POSSIBLE=3Dy

#
# Sonics Silicon Backplane
#
# CONFIG_SSB is not set
CONFIG_BCMA_POSSIBLE=3Dy

#
# Broadcom specific AMBA
#
# CONFIG_BCMA is not set

#
# Multifunction device drivers
#
# CONFIG_MFD_CORE is not set
# CONFIG_MFD_SM501 is not set
# CONFIG_HTC_PASIC3 is not set
# CONFIG_MFD_TMIO is not set
# CONFIG_ABX500_CORE is not set
# CONFIG_LPC_SCH is not set
# CONFIG_MFD_RDC321X is not set
# CONFIG_MFD_JANZ_CMODIO is not set
# CONFIG_MFD_VX855 is not set
# CONFIG_REGULATOR is not set
# CONFIG_MEDIA_SUPPORT is not set

#
# Graphics support
#
# CONFIG_AGP is not set
CONFIG_VGA_ARB=3Dy
CONFIG_VGA_ARB_MAX_GPUS=3D1
# CONFIG_DRM is not set
# CONFIG_STUB_POULSBO is not set
# CONFIG_VGASTATE is not set
CONFIG_VIDEO_OUTPUT_CONTROL=3Dm
CONFIG_FB=3Dy
# CONFIG_FIRMWARE_EDID is not set
# CONFIG_FB_DDC is not set
# CONFIG_FB_BOOT_VESA_SUPPORT is not set
CONFIG_FB_CFB_FILLRECT=3Dy
CONFIG_FB_CFB_COPYAREA=3Dy
CONFIG_FB_CFB_IMAGEBLIT=3Dy
# CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
# CONFIG_FB_SYS_FILLRECT is not set
# CONFIG_FB_SYS_COPYAREA is not set
# CONFIG_FB_SYS_IMAGEBLIT is not set
# CONFIG_FB_FOREIGN_ENDIAN is not set
# CONFIG_FB_SYS_FOPS is not set
# CONFIG_FB_WMT_GE_ROPS is not set
# CONFIG_FB_SVGALIB is not set
# CONFIG_FB_MACMODES is not set
# CONFIG_FB_BACKLIGHT is not set
# CONFIG_FB_MODE_HELPERS is not set
# CONFIG_FB_TILEBLITTING is not set

#
# Frame buffer hardware drivers
#
# CONFIG_FB_CIRRUS is not set
# CONFIG_FB_PM2 is not set
# CONFIG_FB_CYBER2000 is not set
# CONFIG_FB_ASILIANT is not set
# CONFIG_FB_IMSTT is not set
CONFIG_FB_STI=3Dy
# CONFIG_FB_S1D13XXX is not set
# CONFIG_FB_NVIDIA is not set
# CONFIG_FB_RIVA is not set
# CONFIG_FB_MATROX is not set
# CONFIG_FB_RADEON is not set
# CONFIG_FB_ATY128 is not set
# CONFIG_FB_ATY is not set
# CONFIG_FB_S3 is not set
# CONFIG_FB_SAVAGE is not set
# CONFIG_FB_SIS is not set
# CONFIG_FB_NEOMAGIC is not set
# CONFIG_FB_KYRO is not set
# CONFIG_FB_3DFX is not set
# CONFIG_FB_VOODOO1 is not set
# CONFIG_FB_VT8623 is not set
# CONFIG_FB_TRIDENT is not set
# CONFIG_FB_ARK is not set
# CONFIG_FB_PM3 is not set
# CONFIG_FB_CARMINE is not set
# CONFIG_FB_SMSCUFX is not set
# CONFIG_FB_UDL is not set
# CONFIG_FB_VIRTUAL is not set
# CONFIG_FB_METRONOME is not set
# CONFIG_FB_MB862XX is not set
# CONFIG_FB_BROADSHEET is not set
# CONFIG_BACKLIGHT_LCD_SUPPORT is not set

#
# Console display driver support
#
CONFIG_DUMMY_CONSOLE=3Dy
CONFIG_DUMMY_CONSOLE_COLUMNS=3D160
CONFIG_DUMMY_CONSOLE_ROWS=3D64
CONFIG_FRAMEBUFFER_CONSOLE=3Dy
# CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY is not set
# CONFIG_FRAMEBUFFER_CONSOLE_ROTATION is not set
CONFIG_STI_CONSOLE=3Dy
# CONFIG_FONTS is not set
CONFIG_FONT_8x8=3Dy
CONFIG_FONT_8x16=3Dy
CONFIG_LOGO=3Dy
# CONFIG_LOGO_LINUX_MONO is not set
# CONFIG_LOGO_LINUX_VGA16 is not set
# CONFIG_LOGO_LINUX_CLUT224 is not set
CONFIG_LOGO_PARISC_CLUT224=3Dy
CONFIG_SOUND=3Dy
CONFIG_SOUND_OSS_CORE=3Dy
# CONFIG_SOUND_OSS_CORE_PRECLAIM is not set
CONFIG_SND=3Dy
CONFIG_SND_TIMER=3Dy
CONFIG_SND_PCM=3Dy
CONFIG_SND_SEQUENCER=3Dy
# CONFIG_SND_SEQ_DUMMY is not set
CONFIG_SND_OSSEMUL=3Dy
CONFIG_SND_MIXER_OSS=3Dy
CONFIG_SND_PCM_OSS=3Dy
CONFIG_SND_PCM_OSS_PLUGINS=3Dy
CONFIG_SND_SEQUENCER_OSS=3Dy
# CONFIG_SND_DYNAMIC_MINORS is not set
CONFIG_SND_SUPPORT_OLD_API=3Dy
CONFIG_SND_VERBOSE_PROCFS=3Dy
# CONFIG_SND_VERBOSE_PRINTK is not set
# CONFIG_SND_DEBUG is not set
CONFIG_SND_VMASTER=3Dy
# CONFIG_SND_RAWMIDI_SEQ is not set
# CONFIG_SND_OPL3_LIB_SEQ is not set
# CONFIG_SND_OPL4_LIB_SEQ is not set
# CONFIG_SND_SBAWE_SEQ is not set
# CONFIG_SND_EMU10K1_SEQ is not set
CONFIG_SND_AC97_CODEC=3Dy
CONFIG_SND_DRIVERS=3Dy
# CONFIG_SND_DUMMY is not set
# CONFIG_SND_ALOOP is not set
# CONFIG_SND_VIRMIDI is not set
# CONFIG_SND_MTPAV is not set
# CONFIG_SND_SERIAL_U16550 is not set
# CONFIG_SND_MPU401 is not set
# CONFIG_SND_AC97_POWER_SAVE is not set
CONFIG_SND_PCI=3Dy
CONFIG_SND_AD1889=3Dy
# CONFIG_SND_ALS300 is not set
# CONFIG_SND_ALI5451 is not set
# CONFIG_SND_ATIIXP is not set
# CONFIG_SND_ATIIXP_MODEM is not set
# CONFIG_SND_AU8810 is not set
# CONFIG_SND_AU8820 is not set
# CONFIG_SND_AU8830 is not set
# CONFIG_SND_AW2 is not set
# CONFIG_SND_AZT3328 is not set
# CONFIG_SND_BT87X is not set
# CONFIG_SND_CA0106 is not set
# CONFIG_SND_CMIPCI is not set
# CONFIG_SND_OXYGEN is not set
# CONFIG_SND_CS4281 is not set
# CONFIG_SND_CS46XX is not set
# CONFIG_SND_CS5535AUDIO is not set
# CONFIG_SND_CTXFI is not set
# CONFIG_SND_DARLA20 is not set
# CONFIG_SND_GINA20 is not set
# CONFIG_SND_LAYLA20 is not set
# CONFIG_SND_DARLA24 is not set
# CONFIG_SND_GINA24 is not set
# CONFIG_SND_LAYLA24 is not set
# CONFIG_SND_MONA is not set
# CONFIG_SND_MIA is not set
# CONFIG_SND_ECHO3G is not set
# CONFIG_SND_INDIGO is not set
# CONFIG_SND_INDIGOIO is not set
# CONFIG_SND_INDIGODJ is not set
# CONFIG_SND_INDIGOIOX is not set
# CONFIG_SND_INDIGODJX is not set
# CONFIG_SND_EMU10K1 is not set
# CONFIG_SND_EMU10K1X is not set
# CONFIG_SND_ENS1370 is not set
# CONFIG_SND_ENS1371 is not set
# CONFIG_SND_ES1938 is not set
# CONFIG_SND_ES1968 is not set
# CONFIG_SND_FM801 is not set
# CONFIG_SND_HDA_INTEL is not set
# CONFIG_SND_HDSP is not set
# CONFIG_SND_HDSPM is not set
# CONFIG_SND_ICE1712 is not set
# CONFIG_SND_ICE1724 is not set
# CONFIG_SND_INTEL8X0 is not set
# CONFIG_SND_INTEL8X0M is not set
# CONFIG_SND_KORG1212 is not set
# CONFIG_SND_LOLA is not set
# CONFIG_SND_LX6464ES is not set
# CONFIG_SND_MAESTRO3 is not set
# CONFIG_SND_MIXART is not set
# CONFIG_SND_NM256 is not set
# CONFIG_SND_PCXHR is not set
# CONFIG_SND_RIPTIDE is not set
# CONFIG_SND_RME32 is not set
# CONFIG_SND_RME96 is not set
# CONFIG_SND_RME9652 is not set
# CONFIG_SND_SONICVIBES is not set
# CONFIG_SND_TRIDENT is not set
# CONFIG_SND_VIA82XX is not set
# CONFIG_SND_VIA82XX_MODEM is not set
# CONFIG_SND_VIRTUOSO is not set
# CONFIG_SND_VX222 is not set
# CONFIG_SND_YMFPCI is not set
# CONFIG_SND_USB is not set
# CONFIG_SND_SOC is not set
# CONFIG_SOUND_PRIME is not set
CONFIG_AC97_BUS=3Dy
CONFIG_HID_SUPPORT=3Dy
CONFIG_HID=3Dy
# CONFIG_HIDRAW is not set

#
# USB Input Devices
#
CONFIG_USB_HID=3Dy
# CONFIG_HID_PID is not set
CONFIG_USB_HIDDEV=3Dy

#
# Special HID drivers
#
CONFIG_HID_A4TECH=3Dy
# CONFIG_HID_ACRUX is not set
CONFIG_HID_APPLE=3Dy
CONFIG_HID_BELKIN=3Dy
CONFIG_HID_CHERRY=3Dy
CONFIG_HID_CHICONY=3Dy
# CONFIG_HID_PRODIKEYS is not set
CONFIG_HID_CYPRESS=3Dy
# CONFIG_HID_DRAGONRISE is not set
# CONFIG_HID_EMS_FF is not set
CONFIG_HID_EZKEY=3Dy
# CONFIG_HID_HOLTEK is not set
# CONFIG_HID_KEYTOUCH is not set
CONFIG_HID_KYE=3Dy
# CONFIG_HID_UCLOGIC is not set
# CONFIG_HID_WALTOP is not set
# CONFIG_HID_GYRATION is not set
# CONFIG_HID_TWINHAN is not set
CONFIG_HID_KENSINGTON=3Dy
# CONFIG_HID_LCPOWER is not set
CONFIG_HID_LOGITECH=3Dy
# CONFIG_HID_LOGITECH_DJ is not set
# CONFIG_LOGITECH_FF is not set
# CONFIG_LOGIRUMBLEPAD2_FF is not set
# CONFIG_LOGIG940_FF is not set
# CONFIG_LOGIWHEELS_FF is not set
CONFIG_HID_MICROSOFT=3Dy
CONFIG_HID_MONTEREY=3Dy
# CONFIG_HID_MULTITOUCH is not set
# CONFIG_HID_NTRIG is not set
# CONFIG_HID_ORTEK is not set
# CONFIG_HID_PANTHERLORD is not set
# CONFIG_HID_PETALYNX is not set
# CONFIG_HID_PICOLCD is not set
# CONFIG_HID_PRIMAX is not set
# CONFIG_HID_ROCCAT is not set
# CONFIG_HID_SAMSUNG is not set
# CONFIG_HID_SONY is not set
# CONFIG_HID_SPEEDLINK is not set
# CONFIG_HID_SUNPLUS is not set
# CONFIG_HID_GREENASIA is not set
# CONFIG_HID_SMARTJOYPLUS is not set
# CONFIG_HID_TOPSEED is not set
# CONFIG_HID_THRUSTMASTER is not set
# CONFIG_HID_ZEROPLUS is not set
# CONFIG_HID_ZYDACRON is not set
CONFIG_USB_SUPPORT=3Dy
CONFIG_USB_COMMON=3Dy
CONFIG_USB_ARCH_HAS_HCD=3Dy
CONFIG_USB_ARCH_HAS_OHCI=3Dy
CONFIG_USB_ARCH_HAS_EHCI=3Dy
CONFIG_USB_ARCH_HAS_XHCI=3Dy
CONFIG_USB=3Dy
CONFIG_USB_DEBUG=3Dy
# CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set

#
# Miscellaneous USB options
#
CONFIG_USB_DEVICEFS=3Dy
CONFIG_USB_DEVICE_CLASS=3Dy
# CONFIG_USB_DYNAMIC_MINORS is not set
# CONFIG_USB_MON is not set
# CONFIG_USB_WUSB_CBAF is not set

#
# USB Host Controller Drivers
#
# CONFIG_USB_C67X00_HCD is not set
# CONFIG_USB_XHCI_HCD is not set
# CONFIG_USB_EHCI_HCD is not set
# CONFIG_USB_OXU210HP_HCD is not set
# CONFIG_USB_ISP116X_HCD is not set
# CONFIG_USB_ISP1760_HCD is not set
# CONFIG_USB_ISP1362_HCD is not set
CONFIG_USB_OHCI_HCD=3Dy
# CONFIG_USB_OHCI_BIG_ENDIAN_DESC is not set
# CONFIG_USB_OHCI_BIG_ENDIAN_MMIO is not set
CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
# CONFIG_USB_UHCI_HCD is not set
# CONFIG_USB_SL811_HCD is not set
# CONFIG_USB_R8A66597_HCD is not set

#
# USB Device Class drivers
#
# CONFIG_USB_ACM is not set
# CONFIG_USB_PRINTER is not set
# CONFIG_USB_WDM is not set
# CONFIG_USB_TMC is not set

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#

#
# also be needed; see USB_STORAGE Help for more info
#
CONFIG_USB_STORAGE=3Dm
# CONFIG_USB_STORAGE_DEBUG is not set
# CONFIG_USB_STORAGE_REALTEK is not set
# CONFIG_USB_STORAGE_DATAFAB is not set
# CONFIG_USB_STORAGE_FREECOM is not set
# CONFIG_USB_STORAGE_ISD200 is not set
CONFIG_USB_STORAGE_USBAT=3Dm
CONFIG_USB_STORAGE_SDDR09=3Dm
CONFIG_USB_STORAGE_SDDR55=3Dm
CONFIG_USB_STORAGE_JUMPSHOT=3Dm
# CONFIG_USB_STORAGE_ALAUDA is not set
# CONFIG_USB_STORAGE_ONETOUCH is not set
# CONFIG_USB_STORAGE_KARMA is not set
# CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
# CONFIG_USB_STORAGE_ENE_UB6250 is not set
# CONFIG_USB_UAS is not set
# CONFIG_USB_LIBUSUAL is not set

#
# USB Imaging devices
#
# CONFIG_USB_MDC800 is not set
# CONFIG_USB_MICROTEK is not set

#
# USB port drivers
#
# CONFIG_USB_SERIAL is not set

#
# USB Miscellaneous drivers
#
# CONFIG_USB_EMI62 is not set
# CONFIG_USB_EMI26 is not set
# CONFIG_USB_ADUTUX is not set
# CONFIG_USB_SEVSEG is not set
# CONFIG_USB_RIO500 is not set
# CONFIG_USB_LEGOTOWER is not set
# CONFIG_USB_LCD is not set
# CONFIG_USB_LED is not set
# CONFIG_USB_CYPRESS_CY7C63 is not set
# CONFIG_USB_CYTHERM is not set
# CONFIG_USB_IDMOUSE is not set
# CONFIG_USB_FTDI_ELAN is not set
# CONFIG_USB_APPLEDISPLAY is not set
# CONFIG_USB_LD is not set
# CONFIG_USB_TRANCEVIBRATOR is not set
# CONFIG_USB_IOWARRIOR is not set
# CONFIG_USB_TEST is not set
# CONFIG_USB_ISIGHTFW is not set
# CONFIG_USB_YUREX is not set
# CONFIG_USB_GADGET is not set

#
# OTG and related infrastructure
#
# CONFIG_NOP_USB_XCEIV is not set
# CONFIG_UWB is not set
# CONFIG_MMC is not set
# CONFIG_MEMSTICK is not set
# CONFIG_NEW_LEDS is not set
# CONFIG_ACCESSIBILITY is not set
# CONFIG_INFINIBAND is not set
CONFIG_RTC_LIB=3Dy
CONFIG_RTC_CLASS=3Dy
CONFIG_RTC_HCTOSYS=3Dy
CONFIG_RTC_HCTOSYS_DEVICE=3D"rtc0"
# CONFIG_RTC_DEBUG is not set

#
# RTC interfaces
#
CONFIG_RTC_INTF_SYSFS=3Dy
CONFIG_RTC_INTF_PROC=3Dy
CONFIG_RTC_INTF_DEV=3Dy
# CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
# CONFIG_RTC_DRV_TEST is not set

#
# SPI RTC drivers
#

#
# Platform RTC drivers
#
# CONFIG_RTC_DRV_DS1286 is not set
# CONFIG_RTC_DRV_DS1511 is not set
# CONFIG_RTC_DRV_DS1553 is not set
# CONFIG_RTC_DRV_DS1742 is not set
# CONFIG_RTC_DRV_STK17TA8 is not set
# CONFIG_RTC_DRV_M48T86 is not set
# CONFIG_RTC_DRV_M48T35 is not set
# CONFIG_RTC_DRV_M48T59 is not set
# CONFIG_RTC_DRV_MSM6242 is not set
# CONFIG_RTC_DRV_BQ4802 is not set
# CONFIG_RTC_DRV_RP5C01 is not set
# CONFIG_RTC_DRV_V3020 is not set

#
# on-CPU RTC drivers
#
CONFIG_RTC_DRV_GENERIC=3Dy
# CONFIG_DMADEVICES is not set
# CONFIG_AUXDISPLAY is not set
# CONFIG_UIO is not set

#
# Virtio drivers
#
# CONFIG_VIRTIO_PCI is not set
# CONFIG_VIRTIO_BALLOON is not set
# CONFIG_VIRTIO_MMIO is not set

#
# Microsoft Hyper-V guest support
#
# CONFIG_STAGING is not set

#
# Hardware Spinlock drivers
#
# CONFIG_IOMMU_SUPPORT is not set
# CONFIG_VIRT_DRIVERS is not set
# CONFIG_PM_DEVFREQ is not set

#
# File systems
#
CONFIG_EXT2_FS=3Dy
# CONFIG_EXT2_FS_XATTR is not set
# CONFIG_EXT2_FS_XIP is not set
CONFIG_EXT3_FS=3Dy
# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
# CONFIG_EXT3_FS_XATTR is not set
CONFIG_EXT4_FS=3Dm
CONFIG_EXT4_FS_XATTR=3Dy
CONFIG_EXT4_FS_POSIX_ACL=3Dy
# CONFIG_EXT4_FS_SECURITY is not set
# CONFIG_EXT4_DEBUG is not set
CONFIG_JBD=3Dy
CONFIG_JBD2=3Dm
CONFIG_FS_MBCACHE=3Dm
# CONFIG_REISERFS_FS is not set
# CONFIG_JFS_FS is not set
CONFIG_XFS_FS=3Dy
# CONFIG_XFS_QUOTA is not set
# CONFIG_XFS_POSIX_ACL is not set
# CONFIG_XFS_RT is not set
# CONFIG_XFS_DEBUG is not set
# CONFIG_GFS2_FS is not set
# CONFIG_BTRFS_FS is not set
# CONFIG_NILFS2_FS is not set
CONFIG_FS_POSIX_ACL=3Dy
CONFIG_EXPORTFS=3Dy
CONFIG_FILE_LOCKING=3Dy
CONFIG_FSNOTIFY=3Dy
CONFIG_DNOTIFY=3Dy
CONFIG_INOTIFY_USER=3Dy
# CONFIG_FANOTIFY is not set
# CONFIG_QUOTA is not set
# CONFIG_QUOTACTL is not set
# CONFIG_AUTOFS4_FS is not set
# CONFIG_FUSE_FS is not set

#
# Caches
#
# CONFIG_FSCACHE is not set

#
# CD-ROM/DVD Filesystems
#
CONFIG_ISO9660_FS=3Dy
CONFIG_JOLIET=3Dy
CONFIG_ZISOFS=3Dy
# CONFIG_UDF_FS is not set

#
# DOS/FAT/NT Filesystems
#
CONFIG_FAT_FS=3Dm
# CONFIG_MSDOS_FS is not set
CONFIG_VFAT_FS=3Dm
CONFIG_FAT_DEFAULT_CODEPAGE=3D437
CONFIG_FAT_DEFAULT_IOCHARSET=3D"iso8859-1"
# CONFIG_NTFS_FS is not set

#
# Pseudo filesystems
#
CONFIG_PROC_FS=3Dy
CONFIG_PROC_KCORE=3Dy
CONFIG_PROC_SYSCTL=3Dy
CONFIG_PROC_PAGE_MONITOR=3Dy
CONFIG_SYSFS=3Dy
CONFIG_TMPFS=3Dy
# CONFIG_TMPFS_POSIX_ACL is not set
# CONFIG_TMPFS_XATTR is not set
# CONFIG_HUGETLB_PAGE is not set
# CONFIG_CONFIGFS_FS is not set
CONFIG_MISC_FILESYSTEMS=3Dy
# CONFIG_ADFS_FS is not set
# CONFIG_AFFS_FS is not set
# CONFIG_HFS_FS is not set
# CONFIG_HFSPLUS_FS is not set
# CONFIG_BEFS_FS is not set
# CONFIG_BFS_FS is not set
# CONFIG_EFS_FS is not set
# CONFIG_LOGFS is not set
# CONFIG_CRAMFS is not set
# CONFIG_SQUASHFS is not set
# CONFIG_VXFS_FS is not set
# CONFIG_MINIX_FS is not set
# CONFIG_OMFS_FS is not set
# CONFIG_HPFS_FS is not set
# CONFIG_QNX4FS_FS is not set
# CONFIG_ROMFS_FS is not set
# CONFIG_PSTORE is not set
# CONFIG_SYSV_FS is not set
# CONFIG_UFS_FS is not set
CONFIG_NETWORK_FILESYSTEMS=3Dy
CONFIG_NFS_FS=3Dy
CONFIG_NFS_V3=3Dy
# CONFIG_NFS_V3_ACL is not set
# CONFIG_NFS_V4 is not set
# CONFIG_ROOT_NFS is not set
CONFIG_NFSD=3Dy
CONFIG_NFSD_V3=3Dy
# CONFIG_NFSD_V3_ACL is not set
# CONFIG_NFSD_V4 is not set
CONFIG_LOCKD=3Dy
CONFIG_LOCKD_V4=3Dy
CONFIG_NFS_COMMON=3Dy
CONFIG_SUNRPC=3Dy
# CONFIG_CEPH_FS is not set
# CONFIG_CIFS is not set
# CONFIG_NCP_FS is not set
# CONFIG_CODA_FS is not set
# CONFIG_AFS_FS is not set
CONFIG_NLS=3Dy
CONFIG_NLS_DEFAULT=3D"iso8859-1"
CONFIG_NLS_CODEPAGE_437=3Dm
# CONFIG_NLS_CODEPAGE_737 is not set
# CONFIG_NLS_CODEPAGE_775 is not set
CONFIG_NLS_CODEPAGE_850=3Dm
# CONFIG_NLS_CODEPAGE_852 is not set
# CONFIG_NLS_CODEPAGE_855 is not set
# CONFIG_NLS_CODEPAGE_857 is not set
# CONFIG_NLS_CODEPAGE_860 is not set
# CONFIG_NLS_CODEPAGE_861 is not set
# CONFIG_NLS_CODEPAGE_862 is not set
# CONFIG_NLS_CODEPAGE_863 is not set
# CONFIG_NLS_CODEPAGE_864 is not set
# CONFIG_NLS_CODEPAGE_865 is not set
# CONFIG_NLS_CODEPAGE_866 is not set
# CONFIG_NLS_CODEPAGE_869 is not set
# CONFIG_NLS_CODEPAGE_936 is not set
# CONFIG_NLS_CODEPAGE_950 is not set
# CONFIG_NLS_CODEPAGE_932 is not set
# CONFIG_NLS_CODEPAGE_949 is not set
# CONFIG_NLS_CODEPAGE_874 is not set
# CONFIG_NLS_ISO8859_8 is not set
# CONFIG_NLS_CODEPAGE_1250 is not set
# CONFIG_NLS_CODEPAGE_1251 is not set
CONFIG_NLS_ASCII=3Dm
CONFIG_NLS_ISO8859_1=3Dm
# CONFIG_NLS_ISO8859_2 is not set
# CONFIG_NLS_ISO8859_3 is not set
# CONFIG_NLS_ISO8859_4 is not set
# CONFIG_NLS_ISO8859_5 is not set
# CONFIG_NLS_ISO8859_6 is not set
# CONFIG_NLS_ISO8859_7 is not set
# CONFIG_NLS_ISO8859_9 is not set
# CONFIG_NLS_ISO8859_13 is not set
# CONFIG_NLS_ISO8859_14 is not set
CONFIG_NLS_ISO8859_15=3Dm
# CONFIG_NLS_KOI8_R is not set
# CONFIG_NLS_KOI8_U is not set
CONFIG_NLS_UTF8=3Dm

#
# Kernel hacking
#
# CONFIG_PRINTK_TIME is not set
CONFIG_DEFAULT_MESSAGE_LOGLEVEL=3D4
CONFIG_ENABLE_WARN_DEPRECATED=3Dy
CONFIG_ENABLE_MUST_CHECK=3Dy
CONFIG_FRAME_WARN=3D1024
CONFIG_MAGIC_SYSRQ=3Dy
CONFIG_STRIP_ASM_SYMS=3Dy
# CONFIG_UNUSED_SYMBOLS is not set
# CONFIG_DEBUG_FS is not set
CONFIG_HEADERS_CHECK=3Dy
# CONFIG_DEBUG_SECTION_MISMATCH is not set
CONFIG_DEBUG_KERNEL=3Dy
# CONFIG_DEBUG_SHIRQ is not set
# CONFIG_LOCKUP_DETECTOR is not set
# CONFIG_HARDLOCKUP_DETECTOR is not set
CONFIG_DETECT_HUNG_TASK=3Dy
CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=3D120
# CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE=3D0
CONFIG_SCHED_DEBUG=3Dy
# CONFIG_SCHEDSTATS is not set
# CONFIG_TIMER_STATS is not set
# CONFIG_DEBUG_OBJECTS is not set
# CONFIG_SLUB_DEBUG_ON is not set
# CONFIG_SLUB_STATS is not set
# CONFIG_DEBUG_RT_MUTEXES is not set
# CONFIG_RT_MUTEX_TESTER is not set
# CONFIG_DEBUG_SPINLOCK is not set
CONFIG_DEBUG_MUTEXES=3Dy
# CONFIG_SPARSE_RCU_POINTER is not set
# CONFIG_DEBUG_ATOMIC_SLEEP is not set
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
# CONFIG_DEBUG_STACK_USAGE is not set
# CONFIG_DEBUG_KOBJECT is not set
CONFIG_DEBUG_BUGVERBOSE=3Dy
# CONFIG_DEBUG_INFO is not set
# CONFIG_DEBUG_VM is not set
# CONFIG_DEBUG_WRITECOUNT is not set
CONFIG_DEBUG_MEMORY_INIT=3Dy
# CONFIG_DEBUG_LIST is not set
# CONFIG_TEST_LIST_SORT is not set
# CONFIG_DEBUG_SG is not set
# CONFIG_DEBUG_NOTIFIERS is not set
# CONFIG_DEBUG_CREDENTIALS is not set
# CONFIG_BOOT_PRINTK_DELAY is not set
# CONFIG_RCU_TORTURE_TEST is not set
# CONFIG_BACKTRACE_SELF_TEST is not set
# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
# CONFIG_FAULT_INJECTION is not set
# CONFIG_LATENCYTOP is not set
# CONFIG_SYSCTL_SYSCALL_CHECK is not set
# CONFIG_DEBUG_PAGEALLOC is not set
# CONFIG_BUILD_DOCSRC is not set
# CONFIG_ATOMIC64_SELFTEST is not set
# CONFIG_SAMPLES is not set
# CONFIG_TEST_KSTRTOX is not set
CONFIG_DEBUG_RODATA=3Dy
# CONFIG_DEBUG_STRICT_USER_COPY_CHECKS is not set

#
# Security options
#
# CONFIG_KEYS is not set
# CONFIG_SECURITY_DMESG_RESTRICT is not set
# CONFIG_SECURITY is not set
# CONFIG_SECURITYFS is not set
CONFIG_DEFAULT_SECURITY_DAC=3Dy
CONFIG_DEFAULT_SECURITY=3D""
CONFIG_CRYPTO=3Dy

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=3Dm
CONFIG_CRYPTO_ALGAPI2=3Dm
CONFIG_CRYPTO_AEAD2=3Dm
CONFIG_CRYPTO_BLKCIPHER=3Dm
CONFIG_CRYPTO_BLKCIPHER2=3Dm
CONFIG_CRYPTO_HASH=3Dm
CONFIG_CRYPTO_HASH2=3Dm
CONFIG_CRYPTO_RNG2=3Dm
CONFIG_CRYPTO_PCOMP2=3Dm
CONFIG_CRYPTO_MANAGER=3Dm
CONFIG_CRYPTO_MANAGER2=3Dm
# CONFIG_CRYPTO_USER is not set
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dy
# CONFIG_CRYPTO_GF128MUL is not set
CONFIG_CRYPTO_NULL=3Dm
CONFIG_CRYPTO_WORKQUEUE=3Dm
# CONFIG_CRYPTO_CRYPTD is not set
# CONFIG_CRYPTO_AUTHENC is not set
CONFIG_CRYPTO_TEST=3Dm

#
# Authenticated Encryption with Associated Data
#
# CONFIG_CRYPTO_CCM is not set
# CONFIG_CRYPTO_GCM is not set
# CONFIG_CRYPTO_SEQIV is not set

#
# Block modes
#
CONFIG_CRYPTO_CBC=3Dm
# CONFIG_CRYPTO_CTR is not set
# CONFIG_CRYPTO_CTS is not set
# CONFIG_CRYPTO_ECB is not set
# CONFIG_CRYPTO_LRW is not set
# CONFIG_CRYPTO_PCBC is not set
# CONFIG_CRYPTO_XTS is not set

#
# Hash modes
#
# CONFIG_CRYPTO_HMAC is not set
# CONFIG_CRYPTO_XCBC is not set
# CONFIG_CRYPTO_VMAC is not set

#
# Digest
#
CONFIG_CRYPTO_CRC32C=3Dm
# CONFIG_CRYPTO_GHASH is not set
# CONFIG_CRYPTO_MD4 is not set
CONFIG_CRYPTO_MD5=3Dm
# CONFIG_CRYPTO_MICHAEL_MIC is not set
# CONFIG_CRYPTO_RMD128 is not set
# CONFIG_CRYPTO_RMD160 is not set
# CONFIG_CRYPTO_RMD256 is not set
# CONFIG_CRYPTO_RMD320 is not set
# CONFIG_CRYPTO_SHA1 is not set
# CONFIG_CRYPTO_SHA256 is not set
# CONFIG_CRYPTO_SHA512 is not set
# CONFIG_CRYPTO_TGR192 is not set
# CONFIG_CRYPTO_WP512 is not set

#
# Ciphers
#
# CONFIG_CRYPTO_AES is not set
# CONFIG_CRYPTO_ANUBIS is not set
# CONFIG_CRYPTO_ARC4 is not set
CONFIG_CRYPTO_BLOWFISH=3Dm
CONFIG_CRYPTO_BLOWFISH_COMMON=3Dm
# CONFIG_CRYPTO_CAMELLIA is not set
# CONFIG_CRYPTO_CAST5 is not set
# CONFIG_CRYPTO_CAST6 is not set
CONFIG_CRYPTO_DES=3Dm
# CONFIG_CRYPTO_FCRYPT is not set
# CONFIG_CRYPTO_KHAZAD is not set
# CONFIG_CRYPTO_SALSA20 is not set
# CONFIG_CRYPTO_SEED is not set
# CONFIG_CRYPTO_SERPENT is not set
# CONFIG_CRYPTO_TEA is not set
# CONFIG_CRYPTO_TWOFISH is not set

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=3Dm
# CONFIG_CRYPTO_ZLIB is not set
# CONFIG_CRYPTO_LZO is not set

#
# Random Number Generation
#
# CONFIG_CRYPTO_ANSI_CPRNG is not set
# CONFIG_CRYPTO_USER_API_HASH is not set
# CONFIG_CRYPTO_USER_API_SKCIPHER is not set
# CONFIG_CRYPTO_HW is not set
# CONFIG_BINARY_PRINTF is not set

#
# Library routines
#
CONFIG_BITREVERSE=3Dy
CONFIG_GENERIC_PCI_IOMAP=3Dy
CONFIG_CRC_CCITT=3Dm
CONFIG_CRC16=3Dm
# CONFIG_CRC_T10DIF is not set
# CONFIG_CRC_ITU_T is not set
CONFIG_CRC32=3Dy
# CONFIG_CRC7 is not set
CONFIG_LIBCRC32C=3Dm
# CONFIG_CRC8 is not set
CONFIG_ZLIB_INFLATE=3Dy
CONFIG_ZLIB_DEFLATE=3Dm
CONFIG_LZO_DECOMPRESS=3Dy
CONFIG_XZ_DEC=3Dy
CONFIG_XZ_DEC_X86=3Dy
CONFIG_XZ_DEC_POWERPC=3Dy
CONFIG_XZ_DEC_IA64=3Dy
CONFIG_XZ_DEC_ARM=3Dy
CONFIG_XZ_DEC_ARMTHUMB=3Dy
CONFIG_XZ_DEC_SPARC=3Dy
CONFIG_XZ_DEC_BCJ=3Dy
# CONFIG_XZ_DEC_TEST is not set
CONFIG_DECOMPRESS_GZIP=3Dy
CONFIG_DECOMPRESS_BZIP2=3Dy
CONFIG_DECOMPRESS_LZMA=3Dy
CONFIG_DECOMPRESS_XZ=3Dy
CONFIG_DECOMPRESS_LZO=3Dy
CONFIG_HAS_IOMEM=3Dy
CONFIG_HAS_IOPORT=3Dy
CONFIG_HAS_DMA=3Dy
CONFIG_DQL=3Dy
CONFIG_NLATTR=3Dy
CONFIG_GENERIC_ATOMIC64=3Dy
# CONFIG_AVERAGE is not set
# CONFIG_CORDIC is not set

--MP_/VXS4p+1wRZqOPyUqkJVPNyZ--

