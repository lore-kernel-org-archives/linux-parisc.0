From: kernel test robot <fengguang.wu@intel.com>
Subject: [arch] ad21fc4faa:  INFO: trying to register non-static key.
Date: Mon, 06 Mar 2017 18:17:48 +0800
Message-ID: <58bd374c.JhGN46g15W1Q1HFD%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="=_58bd374c.J3Hg7F/xfixvxDlduekC4sw75YkQEkERg00qVSlCOnSudHP3"
Cc: LKP <lkp@01.org>, linux-s390@vger.kernel.org,
        linux-parisc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Kees Cook <keescook@chromium.org>, wfg@linux.intel.com
To: Laura Abbott <labbott@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is a multi-part message in MIME format.

--=_58bd374c.J3Hg7F/xfixvxDlduekC4sw75YkQEkERg00qVSlCOnSudHP3
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Greetings,

0day kernel testing robot got the below dmesg and the first bad commit is

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

commit ad21fc4faa2a1f919bac1073b885df9310dbc581
Author:     Laura Abbott <labbott@redhat.com>
AuthorDate: Mon Feb 6 16:31:57 2017 -0800
Commit:     Kees Cook <keescook@chromium.org>
CommitDate: Tue Feb 7 12:32:52 2017 -0800

    arch: Move CONFIG_DEBUG_RODATA and CONFIG_SET_MODULE_RONX to be common
    
    There are multiple architectures that support CONFIG_DEBUG_RODATA and
    CONFIG_SET_MODULE_RONX. These options also now have the ability to be
    turned off at runtime. Move these to an architecture independent
    location and make these options def_bool y for almost all of those
    arches.
    
    Signed-off-by: Laura Abbott <labbott@redhat.com>
    Acked-by: Ingo Molnar <mingo@kernel.org>
    Acked-by: Heiko Carstens <heiko.carstens@de.ibm.com>
    Signed-off-by: Kees Cook <keescook@chromium.org>

0c744ea4f7  Linux 4.10-rc2
ad21fc4faa  arch: Move CONFIG_DEBUG_RODATA and CONFIG_SET_MODULE_RONX to be common
+-------------------------------------------------------+-----------+------------+
|                                                       | v4.10-rc2 | ad21fc4faa |
+-------------------------------------------------------+-----------+------------+
| boot_successes                                        | 920       | 732        |
| boot_failures                                         | 0         | 659        |
| Oops:#[##]                                            | 0         | 657        |
| EIP:__lock_acquire                                    | 0         | 187        |
| Kernel_panic-not_syncing:Fatal_exception_in_interrupt | 0         | 152        |
| BUG:unable_to_handle_kernel                           | 0         | 558        |
| WARNING:at_lib/list_debug.c:#__list_del_entry_valid   | 0         | 99         |
| EIP:rb_erase                                          | 0         | 11         |
| Kernel_panic-not_syncing:Fatal_exception              | 0         | 503        |
| WARNING:at_lib/list_debug.c:#__list_add_valid         | 0         | 34         |
| EIP:__dev_remove_pack                                 | 0         | 36         |
| EIP:SyS_syncfs                                        | 0         | 1          |
| EIP:filp_close                                        | 0         | 239        |
| INFO:trying_to_register_non-static_key                | 0         | 11         |
| EIP:netlink_update_listeners                          | 0         | 17         |
| EIP:bpf_prog_free                                     | 0         | 39         |
| EIP:__fget_light                                      | 0         | 10         |
| EIP:netlink_compare                                   | 0         | 4          |
| EIP:ip_mc_drop_socket                                 | 0         | 20         |
| EIP:inet_release                                      | 0         | 15         |
| EIP:notifier_chain_unregister                         | 0         | 1          |
| EIP:__purge_vmap_area_lazy                            | 0         | 9          |
| WARNING:at_mm/vmalloc.c:#__vunmap                     | 0         | 4          |
| EIP:hashbin_insert                                    | 0         | 5          |
| EIP:__wake_up_common                                  | 0         | 8          |
| EIP:vfs_getattr_nosec                                 | 0         | 2          |
| EIP:sk_del_node_init                                  | 0         | 13         |
| BUG:spinlock_lockup_suspected_on_CPU                  | 0         | 3          |
| EIP:spin_dump                                         | 0         | 3          |
| EIP:SYSC_setsockopt                                   | 0         | 1          |
| EIP:find_vmap_area                                    | 0         | 3          |
| EIP:fanout_add                                        | 0         | 2          |
| EIP:lookup_address_in_pgd                             | 0         | 1          |
| EIP:packet_release                                    | 0         | 3          |
| EIP:notifier_chain_register                           | 0         | 1          |
| EIP:rht_head_hashfn                                   | 0         | 1          |
| EIP:vfs_fsync_range                                   | 0         | 1          |
| WARNING:at_kernel/locking/lockdep.c:#__lock_acquire   | 0         | 1          |
| EIP:do_sys_poll                                       | 0         | 1          |
| EIP:alloc_vmap_area                                   | 0         | 2          |
| EIP:__bpf_prog_release                                | 0         | 1          |
| EIP:rht_deferred_worker                               | 0         | 1          |
| EIP:hashbin_find                                      | 0         | 1          |
| EIP:__hlist_del                                       | 0         | 1          |
| EIP:statfs_by_dentry                                  | 0         | 1          |
| EIP:__unix_find_socket_byname                         | 0         | 2          |
| EIP:dnotify_flush                                     | 0         | 1          |
| EIP:SyS_fchdir                                        | 0         | 1          |
| EIP:__sock_create                                     | 0         | 1          |
| BUG:kernel_reboot-without-warning_in_test_stage       | 0         | 1          |
+-------------------------------------------------------+-----------+------------+

[   20.394006] irda_setsockopt: not allowed to set MAXSDUSIZE for this socket type!
[   20.898917] Fix your initscripts?
[   20.902677] mmap: trinity-c0 (1985) uses deprecated remap_file_pages() syscall. See Documentation/vm/remap_file_pages.txt.
[   20.907974] warning: process `trinity-c0' used the obsolete bdflush system call
[   20.909084] Fix your initscripts?
[   20.914000] INFO: trying to register non-static key.
[   20.914591] the code is fine but needs lockdep annotation.
[   20.915204] turning off the locking correctness validator.
[   20.915819] CPU: 0 PID: 395 Comm: trinity-main Not tainted 4.10.0-rc2-00001-gad21fc4 #1
[   20.916745] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.9.3-20161025_171302-gandalf 04/01/2014
[   20.917897] Call Trace:
[   20.918254]  show_stack+0x5c/0x60
[   20.918693]  dump_stack+0x16/0x18
[   20.919122]  register_lock_class+0x11a/0x2d5
[   20.919633]  ? pvclock_clocksource_read+0xdd/0x1e0
[   20.920183]  __lock_acquire+0xd9/0x55e
[   20.920707]  lock_acquire+0x93/0xf5
[   20.921155]  ? lock_sock_nested+0x32/0xa8
[   20.921698]  _raw_spin_lock_bh+0x48/0x8e
[   20.922185]  ? lock_sock_nested+0x32/0xa8
[   20.922679]  lock_sock_nested+0x32/0xa8
[   20.923156]  ? rcu_read_unlock+0x1f/0x1f
[   20.923645]  lock_sock+0xa/0xc
[   20.924104]  irda_release+0x3e/0x1f8
[   20.924564]  ? __might_sleep+0xb0/0xce
[   20.925035]  sock_release+0x32/0xa9
[   20.925528]  sock_close+0x10/0x14
[   20.925960]  __fput+0x199/0x2b1
[   20.926378]  ____fput+0xd/0xf
[   20.926785]  task_work_run+0x8a/0xb1
[   20.927240]  do_exit+0x5e4/0xddc
[   20.927678]  ? up_read+0x1b/0x2d
[   20.928104]  do_group_exit+0x103/0x103
[   20.928576]  SyS_exit_group+0x16/0x16
[   20.929038]  do_fast_syscall_32+0x11f/0x15b
[   20.929592]  entry_SYSENTER_32+0x53/0x86
[   20.930074] EIP: 0xb77a6b05
[   20.930460] EFLAGS: 00000296 CPU: 0
[   20.930910] EAX: ffffffda EBX: 00000000 ECX: 0000002d EDX: b779d8ac
[   20.931593] ESI: 00000000 EDI: 00000001 EBP: bf83ea78 ESP: bf83e98c
[   20.932274]  DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b
[   92.620508] BUG: spinlock lockup suspected on CPU#0, trinity-main/395
[   92.622020] BUG: unable to handle kernel NULL pointer dereference at 000002b0
[   92.622801] IP: spin_dump+0x75/0xb5
[   92.623363] *pdpt = 0000000000000000 *pde = f000ff53f000ff53 
[   92.623370] 
[   92.624362] Oops: 0000 [#1]
[   92.624843] Modules linked in:
[   92.625348] CPU: 0 PID: 395 Comm: trinity-main Not tainted 4.10.0-rc2-00001-gad21fc4 #1
[   92.626257] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.9.3-20161025_171302-gandalf 04/01/2014
[   92.627526] task: df212380 task.stack: df074000
[   92.628088] EIP: spin_dump+0x75/0xb5
[   92.628607] EFLAGS: 00010206 CPU: 0
[   92.629128] EAX: 000003b8 EBX: 00000028 ECX: fffff031 EDX: 000003b5
[   92.629805] ESI: df7dc050 EDI: 00000001 EBP: df075e18 ESP: df075df4
[   92.630582]  DS: 007b ES: 007b FS: 0000 GS: 00e0 SS: 0068
[   92.631233] CR0: 80050033 CR2: 000002b0 CR3: 1f20b9e0 CR4: 00000630
[   92.631912] DR0: b7254000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[   92.632744] DR6: fffe0ff0 DR7: 00000600
[   92.633217] Call Trace:
[   92.633577]  do_raw_spin_lock+0x157/0x173
[   92.634132]  _raw_spin_lock_bh+0x7d/0x8e
[   92.634725]  ? lock_sock_nested+0x32/0xa8
[   92.635217]  lock_sock_nested+0x32/0xa8
[   92.635709]  ? rcu_read_unlock+0x1f/0x1f
[   92.636316]  lock_sock+0xa/0xc
[   92.636734]  irda_release+0x3e/0x1f8
[   92.637186]  ? __might_sleep+0xb0/0xce
[   92.637720]  sock_release+0x32/0xa9
[   92.638272]  sock_close+0x10/0x14
[   92.638709]  __fput+0x199/0x2b1
[   92.639125]  ____fput+0xd/0xf
[   92.639576]  task_work_run+0x8a/0xb1
[   92.640128]  do_exit+0x5e4/0xddc
[   92.640555]  ? up_read+0x1b/0x2d
[   92.641029]  do_group_exit+0x103/0x103
[   92.641585]  SyS_exit_group+0x16/0x16
[   92.642115]  do_fast_syscall_32+0x11f/0x15b
[   92.642628]  entry_SYSENTER_32+0x53/0x86
[   92.643135] EIP: 0xb77a6b05
[   92.643618] EFLAGS: 00000296 CPU: 0
[   92.644091] EAX: ffffffda EBX: 00000000 ECX: 0000002d EDX: b779d8ac
[   92.644778] ESI: 00000000 EDI: 00000001 EBP: bf83ea78 ESP: bf83e98c
[   92.645610]  DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b
[   92.646218] Code: 24 0c c7 44 24 08 00 00 00 00 89 54 24 04 89 4c 24 10 c7 04 24 93 ac 48 c2 e8 60 b0 09 00 85 db 8b 4e 08 74 0e 8d 83 90 03 00 00 <8b> 93 88 02 00 00 eb 08 83 ca ff b8 52 57 4f c2 89 44 24 0c 8b
[   92.648209] EIP: spin_dump+0x75/0xb5 SS:ESP: 0068:df075df4
[   92.648824] CR2: 00000000000002b0
[   92.649253] ---[ end trace f9b7cb6d4c53cb0b ]---
[   92.649793] Kernel panic - not syncing: Fatal exception in interrupt

                                                         # HH:MM RESULT GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
git bisect start 24bbf5a0db07b308f3e183442c6e9a18b2ff37e2 c470abd4fde40ea6a0846a2beab642a578c0b8cd --
git bisect  bad 297fff9e5ae39fdc244396ab480b0b064db401fa  # 16:26  B     40     6    0  49  Merge 'linux-review/Sebastian-Reichel/dt-bindings-Add-vendor-prefix-for-Motorola/20170305-035036' into devel-spot-201703051016
git bisect  bad 42e9ae034908a4bab0056d8249d5c8a41e11391a  # 16:31  B    115     6    0  73  Merge 'linux-review/fgao-ikuai8-com/netfilter-nat_masquerade-Check-oom-when-invoke-nfct_nat/20170305-070948' into devel-spot-201703051016
git bisect  bad c2850e62b2e2bdf0eabbe41b4123979234094c7c  # 16:31  B    121     5    0  67  Merge 'pinchartl-media/drm/du/vsp-race' into devel-spot-201703051016
git bisect good 941138d45b408fa61d0a15789b7f854126c66dfe  # 16:36  G    751     0    0   0  Merge 'acpi/turbostat' into devel-spot-201703051016
git bisect  bad e8762b16e576e81d32d39d5a559d5cde82ce38c1  # 16:36  B    124    17    0  96  Merge 'pinchartl-media/drm/next/du' into devel-spot-201703051016
git bisect  bad b2064617c74f301dab1448f1f9c8dbb3c8021058  # 16:37  B    132     3    0  57  Merge tag 'driver-core-4.11-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core
git bisect  bad 1e74a2eb1f5cc7f2f2b5aa9c9eeecbcf352220a3  # 16:42  B     74    10    0 108  Merge tag 'gcc-plugins-v4.11-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux
git bisect good fd4a61e08aa79f2b7835b25c6f94f27bd2d65990  # 16:42  G    751     0    0   0  sched/core: Fix build paravirt build on arm and arm64
git bisect good c9341ee0af4df0af8b727873ef851227345defed  # 16:42  G    751     0    0   0  Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/linux-security
git bisect good 5ab356626f3cf97f00280f17a52e4b5b4a13e038  # 16:42  G    751     0    0   0  Merge tag 'pinctrl-v4.11-1' of git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl
git bisect good 974eadf1fc4f9bd0e9da686e7ba6c3e4e708fc45  # 16:42  G    751     0    0   0  [media] lmedm04: make lme2510_powerup a little smaller
git bisect good ff58d005cd10fcd372787cceac547e11cf706ff6  # 16:42  G    751     0    0   0  Merge tag 'media/v4.11-1' of git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media
git bisect good 97a229f90731894f46b85c20bcc1842f4a63cb78  # 16:42  G    751     0    0   1  Merge tag 'dmaengine-4.11-rc1' of git://git.infradead.org/users/vkoul/slave-dma
git bisect good 01f2901a264d954d3985e8bce1bf637ae52d4918  # 16:42  G    751     0    0   0  ahci: qoriq: report error when ecc register address is missing in dts
git bisect good 6d1dd93ea0d0f0fb61b5450a2668896028ce3f75  # 16:42  G    750     0    0   1  Merge tag 'pstore-v4.11-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux
git bisect  bad 7bb033829ef3ecfc491c0ed0197966e8f197fbdc  # 16:42  B    119    12    0 113  Merge tag 'rodata-v4.11-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux
git bisect good 4c5d7bc63775b40631b75f6c59a3a3005455262d  # 16:42  G    751     0    0   0  usercopy: Add tests for all get_user() sizes
git bisect  bad 0f5bf6d0afe4be6e1391908ff2d6dc9730e91550  # 16:42  B    142     5    0 173  arch: Rename CONFIG_DEBUG_RODATA and CONFIG_DEBUG_MODULE_RONX
git bisect  bad ad21fc4faa2a1f919bac1073b885df9310dbc581  # 16:47  B    731    11    0 649  arch: Move CONFIG_DEBUG_RODATA and CONFIG_SET_MODULE_RONX to be common
# first bad commit: [ad21fc4faa2a1f919bac1073b885df9310dbc581] arch: Move CONFIG_DEBUG_RODATA and CONFIG_SET_MODULE_RONX to be common
git bisect good 0c744ea4f77d72b3dcebb7a8f2684633ec79be88  # 18:16  G    901     0    0   3  Linux 4.10-rc2
# extra tests on HEAD of linux-devel/devel-spot-201703051016
git bisect  bad 24bbf5a0db07b308f3e183442c6e9a18b2ff37e2  # 18:17  B     32     4    0  21  0day head guard for 'devel-spot-201703051016'
# extra tests on tree/branch linus/master
git bisect  bad c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d9201  # 18:17  B    342    42    0 372  Linux 4.11-rc1
# extra tests on tree/branch linux-next/master
git bisect  bad 9d51244afbfc61134c05e02f789d3aa2eaca2da0  # 18:17  B    353    31    0 369  Add linux-next specific files for 20170306

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/lkp                          Intel Corporation

--=_58bd374c.J3Hg7F/xfixvxDlduekC4sw75YkQEkERg00qVSlCOnSudHP3
Content-Type: application/gzip
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="dmesg-quantal-lkp-hsw01-20:20170306132653:i386-randconfig-i1-201710:4.10.0-rc2-00001-gad21fc4:1.gz"

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
fvz4398IU2uWoGf614e/0uPe/wCdMkTwWM4BAA==

--=_58bd374c.J3Hg7F/xfixvxDlduekC4sw75YkQEkERg00qVSlCOnSudHP3
Content-Type: application/gzip
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="dmesg-vm-kbuild-yocto-i386-53:20170305111345:i386-randconfig-i1-201710:4.10.0-rc2:1.gz"

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

--=_58bd374c.J3Hg7F/xfixvxDlduekC4sw75YkQEkERg00qVSlCOnSudHP3
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reproduce-quantal-lkp-hsw01-20:20170306132653:i386-randconfig-i1-201710:4.10.0-rc2-00001-gad21fc4:1"

#!/bin/bash

kernel=$1
initrd=quantal-core-i386.cgz

wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/raw/master/initrd/$initrd

kvm=(
	qemu-system-x86_64
	-enable-kvm
	-cpu kvm64
	-kernel $kernel
	-initrd $initrd
	-m 512
	-smp 2
	-device e1000,netdev=net0
	-netdev user,id=net0
	-boot order=nc
	-no-reboot
	-watchdog i6300esb
	-watchdog-action debug
	-rtc base=localtime
	-serial stdio
	-display none
	-monitor null
)

append=(
	root=/dev/ram0
	hung_task_panic=1
	debug
	apic=debug
	sysrq_always_enabled
	rcupdate.rcu_cpu_stall_timeout=100
	net.ifnames=0
	printk.devkmsg=on
	panic=-1
	softlockup_panic=1
	nmi_watchdog=panic
	oops=panic
	load_ramdisk=2
	prompt_ramdisk=0
	drbd.minor_count=8
	systemd.log_level=err
	ignore_loglevel
	earlyprintk=ttyS0,115200
	console=ttyS0,115200
	console=tty0
	vga=normal
	rw
	drbd.minor_count=8
)

"${kvm[@]}" -append "${append[*]}"

--=_58bd374c.J3Hg7F/xfixvxDlduekC4sw75YkQEkERg00qVSlCOnSudHP3
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="config-4.10.0-rc2-00001-gad21fc4"

#
# Automatically generated file; DO NOT EDIT.
# Linux/i386 4.10.0-rc2 Kernel Configuration
#
# CONFIG_64BIT is not set
CONFIG_X86_32=y
CONFIG_X86=y
CONFIG_INSTRUCTION_DECODER=y
CONFIG_OUTPUT_FORMAT="elf32-i386"
CONFIG_ARCH_DEFCONFIG="arch/x86/configs/i386_defconfig"
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_MMU=y
CONFIG_ARCH_MMAP_RND_BITS_MIN=8
CONFIG_ARCH_MMAP_RND_BITS_MAX=16
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=8
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=16
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_GENERIC_ISA_DMA=y
CONFIG_GENERIC_BUG=y
CONFIG_GENERIC_HWEIGHT=y
CONFIG_ARCH_MAY_HAVE_PC_FDC=y
CONFIG_RWSEM_XCHGADD_ALGORITHM=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_ARCH_HAS_CPU_RELAX=y
CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
CONFIG_HAVE_SETUP_PER_CPU_AREA=y
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
CONFIG_ARCH_SUSPEND_POSSIBLE=y
CONFIG_ARCH_WANT_HUGE_PMD_SHARE=y
CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
CONFIG_ARCH_SUPPORTS_OPTIMIZED_INLINING=y
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_FIX_EARLYCON_MEM=y
CONFIG_PGTABLE_LEVELS=3
CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_EXTABLE_SORT=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_BROKEN_ON_SMP=y
CONFIG_INIT_ENV_ARG_LIMIT=32
CONFIG_CROSS_COMPILE=""
# CONFIG_COMPILE_TEST is not set
CONFIG_LOCALVERSION=""
CONFIG_LOCALVERSION_AUTO=y
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_BZIP2=y
CONFIG_HAVE_KERNEL_LZMA=y
CONFIG_HAVE_KERNEL_XZ=y
CONFIG_HAVE_KERNEL_LZO=y
CONFIG_HAVE_KERNEL_LZ4=y
CONFIG_KERNEL_GZIP=y
# CONFIG_KERNEL_BZIP2 is not set
# CONFIG_KERNEL_LZMA is not set
# CONFIG_KERNEL_XZ is not set
# CONFIG_KERNEL_LZO is not set
# CONFIG_KERNEL_LZ4 is not set
CONFIG_DEFAULT_HOSTNAME="(none)"
CONFIG_SWAP=y
CONFIG_SYSVIPC=y
CONFIG_SYSVIPC_SYSCTL=y
# CONFIG_POSIX_MQUEUE is not set
# CONFIG_CROSS_MEMORY_ATTACH is not set
CONFIG_FHANDLE=y
CONFIG_USELIB=y
CONFIG_AUDIT=y
CONFIG_HAVE_ARCH_AUDITSYSCALL=y
CONFIG_AUDITSYSCALL=y
CONFIG_AUDIT_WATCH=y
CONFIG_AUDIT_TREE=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_CHIP=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_GENERIC_MSI_IRQ=y
CONFIG_GENERIC_MSI_IRQ_DOMAIN=y
CONFIG_IRQ_DOMAIN_DEBUG=y
CONFIG_IRQ_FORCED_THREADING=y
CONFIG_SPARSE_IRQ=y
CONFIG_CLOCKSOURCE_WATCHDOG=y
CONFIG_ARCH_CLOCKSOURCE_DATA=y
CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=y
CONFIG_GENERIC_TIME_VSYSCALL=y
CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=y
CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=y
CONFIG_GENERIC_CMOS_UPDATE=y

#
# Timers subsystem
#
CONFIG_HZ_PERIODIC=y
# CONFIG_NO_HZ_IDLE is not set
# CONFIG_NO_HZ is not set
# CONFIG_HIGH_RES_TIMERS is not set

#
# CPU/Task time and stats accounting
#
CONFIG_TICK_CPU_ACCOUNTING=y
CONFIG_IRQ_TIME_ACCOUNTING=y
# CONFIG_BSD_PROCESS_ACCT is not set
# CONFIG_TASKSTATS is not set

#
# RCU Subsystem
#
CONFIG_TINY_RCU=y
# CONFIG_RCU_EXPERT is not set
CONFIG_SRCU=y
CONFIG_TASKS_RCU=y
# CONFIG_RCU_STALL_COMMON is not set
# CONFIG_TREE_RCU_TRACE is not set
# CONFIG_RCU_EXPEDITE_BOOT is not set
CONFIG_BUILD_BIN2C=y
CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
CONFIG_LOG_BUF_SHIFT=17
CONFIG_NMI_LOG_BUF_SHIFT=13
CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y
CONFIG_CGROUPS=y
# CONFIG_MEMCG is not set
# CONFIG_BLK_CGROUP is not set
# CONFIG_CGROUP_SCHED is not set
# CONFIG_CGROUP_PIDS is not set
# CONFIG_CGROUP_FREEZER is not set
# CONFIG_CPUSETS is not set
# CONFIG_CGROUP_DEVICE is not set
# CONFIG_CGROUP_CPUACCT is not set
# CONFIG_CGROUP_PERF is not set
# CONFIG_CGROUP_BPF is not set
# CONFIG_CGROUP_DEBUG is not set
# CONFIG_CHECKPOINT_RESTORE is not set
CONFIG_NAMESPACES=y
# CONFIG_UTS_NS is not set
CONFIG_IPC_NS=y
CONFIG_USER_NS=y
CONFIG_PID_NS=y
CONFIG_NET_NS=y
# CONFIG_SCHED_AUTOGROUP is not set
# CONFIG_SYSFS_DEPRECATED is not set
CONFIG_RELAY=y
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
CONFIG_RD_GZIP=y
CONFIG_RD_BZIP2=y
CONFIG_RD_LZMA=y
CONFIG_RD_XZ=y
# CONFIG_RD_LZO is not set
# CONFIG_RD_LZ4 is not set
CONFIG_INITRAMFS_COMPRESSION=".gz"
# CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
CONFIG_CC_OPTIMIZE_FOR_SIZE=y
CONFIG_SYSCTL=y
CONFIG_ANON_INODES=y
CONFIG_HAVE_UID16=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_HAVE_PCSPKR_PLATFORM=y
CONFIG_BPF=y
# CONFIG_EXPERT is not set
CONFIG_UID16=y
CONFIG_MULTIUSER=y
CONFIG_SGETMASK_SYSCALL=y
CONFIG_SYSFS_SYSCALL=y
# CONFIG_SYSCTL_SYSCALL is not set
CONFIG_POSIX_TIMERS=y
CONFIG_KALLSYMS=y
CONFIG_KALLSYMS_ALL=y
# CONFIG_KALLSYMS_ABSOLUTE_PERCPU is not set
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_PRINTK=y
CONFIG_PRINTK_NMI=y
CONFIG_BUG=y
CONFIG_ELF_CORE=y
CONFIG_PCSPKR_PLATFORM=y
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_BPF_SYSCALL=y
CONFIG_SHMEM=y
CONFIG_AIO=y
CONFIG_ADVISE_SYSCALLS=y
# CONFIG_USERFAULTFD is not set
CONFIG_PCI_QUIRKS=y
CONFIG_MEMBARRIER=y
# CONFIG_EMBEDDED is not set
CONFIG_HAVE_PERF_EVENTS=y

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
CONFIG_VM_EVENT_COUNTERS=y
CONFIG_COMPAT_BRK=y
CONFIG_SLAB=y
# CONFIG_SLUB is not set
# CONFIG_SLAB_FREELIST_RANDOM is not set
# CONFIG_SYSTEM_DATA_VERIFICATION is not set
CONFIG_PROFILING=y
CONFIG_TRACEPOINTS=y
CONFIG_OPROFILE=m
CONFIG_OPROFILE_EVENT_MULTIPLEX=y
CONFIG_HAVE_OPROFILE=y
CONFIG_OPROFILE_NMI_TIMER=y
# CONFIG_KPROBES is not set
CONFIG_JUMP_LABEL=y
# CONFIG_STATIC_KEYS_SELFTEST is not set
# CONFIG_UPROBES is not set
# CONFIG_HAVE_64BIT_ALIGNED_ACCESS is not set
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_HAVE_IOREMAP_PROT=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_OPTPROBES=y
CONFIG_HAVE_KPROBES_ON_FTRACE=y
CONFIG_HAVE_NMI=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_HAVE_DMA_CONTIGUOUS=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_CLK=y
CONFIG_HAVE_DMA_API_DEBUG=y
CONFIG_HAVE_HW_BREAKPOINT=y
CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=y
CONFIG_HAVE_USER_RETURN_NOTIFIER=y
CONFIG_HAVE_PERF_EVENTS_NMI=y
CONFIG_HAVE_PERF_REGS=y
CONFIG_HAVE_PERF_USER_STACK_DUMP=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_HAVE_CMPXCHG_LOCAL=y
CONFIG_HAVE_CMPXCHG_DOUBLE=y
CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
CONFIG_HAVE_GCC_PLUGINS=y
# CONFIG_GCC_PLUGINS is not set
CONFIG_HAVE_CC_STACKPROTECTOR=y
CONFIG_CC_STACKPROTECTOR=y
# CONFIG_CC_STACKPROTECTOR_NONE is not set
CONFIG_CC_STACKPROTECTOR_REGULAR=y
# CONFIG_CC_STACKPROTECTOR_STRONG is not set
CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
CONFIG_HAVE_ARCH_HUGE_VMAP=y
CONFIG_MODULES_USE_ELF_REL=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
CONFIG_HAVE_EXIT_THREAD=y
CONFIG_ARCH_MMAP_RND_BITS=8
CONFIG_HAVE_COPY_THREAD_TLS=y
# CONFIG_HAVE_ARCH_HASH is not set
# CONFIG_ISA_BUS_API is not set
CONFIG_CLONE_BACKWARDS=y
CONFIG_OLD_SIGSUSPEND3=y
CONFIG_OLD_SIGACTION=y
# CONFIG_CPU_NO_EFFICIENT_FFS is not set
# CONFIG_HAVE_ARCH_VMAP_STACK is not set
# CONFIG_ARCH_OPTIONAL_KERNEL_RWX is not set
# CONFIG_ARCH_OPTIONAL_KERNEL_RWX_DEFAULT is not set
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
CONFIG_DEBUG_RODATA=y
CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
CONFIG_DEBUG_SET_MODULE_RONX=y

#
# GCOV-based kernel profiling
#
# CONFIG_GCOV_KERNEL is not set
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
CONFIG_HAVE_GENERIC_DMA_COHERENT=y
CONFIG_SLABINFO=y
CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
CONFIG_MODULES=y
# CONFIG_MODULE_FORCE_LOAD is not set
# CONFIG_MODULE_UNLOAD is not set
# CONFIG_MODVERSIONS is not set
# CONFIG_MODULE_SRCVERSION_ALL is not set
# CONFIG_MODULE_SIG is not set
# CONFIG_MODULE_COMPRESS is not set
CONFIG_MODULES_TREE_LOOKUP=y
CONFIG_BLOCK=y
CONFIG_LBDAF=y
CONFIG_BLK_DEV_BSG=y
CONFIG_BLK_DEV_BSGLIB=y
CONFIG_BLK_DEV_INTEGRITY=y
CONFIG_BLK_DEV_ZONED=y
# CONFIG_BLK_CMDLINE_PARSER is not set
# CONFIG_BLK_WBT is not set

#
# Partition Types
#
# CONFIG_PARTITION_ADVANCED is not set
CONFIG_MSDOS_PARTITION=y
CONFIG_EFI_PARTITION=y
CONFIG_BLK_MQ_PCI=y

#
# IO Schedulers
#
CONFIG_IOSCHED_NOOP=y
CONFIG_IOSCHED_DEADLINE=y
CONFIG_IOSCHED_CFQ=m
# CONFIG_DEFAULT_DEADLINE is not set
CONFIG_DEFAULT_NOOP=y
CONFIG_DEFAULT_IOSCHED="noop"
CONFIG_ASN1=y
CONFIG_UNINLINE_SPIN_UNLOCK=y
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
CONFIG_ARCH_USE_QUEUED_SPINLOCKS=y
CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
# CONFIG_FREEZER is not set

#
# Processor type and features
#
CONFIG_ZONE_DMA=y
# CONFIG_SMP is not set
CONFIG_X86_FEATURE_NAMES=y
CONFIG_X86_FAST_FEATURE_TESTS=y
# CONFIG_X86_MPPARSE is not set
# CONFIG_GOLDFISH is not set
CONFIG_INTEL_RDT_A=y
# CONFIG_X86_EXTENDED_PLATFORM is not set
# CONFIG_X86_INTEL_LPSS is not set
# CONFIG_X86_AMD_PLATFORM_DEVICE is not set
CONFIG_IOSF_MBI=m
CONFIG_IOSF_MBI_DEBUG=y
# CONFIG_X86_32_IRIS is not set
# CONFIG_SCHED_OMIT_FRAME_POINTER is not set
CONFIG_HYPERVISOR_GUEST=y
CONFIG_PARAVIRT=y
# CONFIG_PARAVIRT_DEBUG is not set
# CONFIG_XEN is not set
CONFIG_KVM_GUEST=y
# CONFIG_KVM_DEBUG_FS is not set
# CONFIG_LGUEST_GUEST is not set
# CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
CONFIG_PARAVIRT_CLOCK=y
CONFIG_NO_BOOTMEM=y
# CONFIG_M486 is not set
# CONFIG_M586 is not set
# CONFIG_M586TSC is not set
# CONFIG_M586MMX is not set
# CONFIG_M686 is not set
# CONFIG_MPENTIUMII is not set
# CONFIG_MPENTIUMIII is not set
# CONFIG_MPENTIUMM is not set
# CONFIG_MPENTIUM4 is not set
# CONFIG_MK6 is not set
# CONFIG_MK7 is not set
# CONFIG_MK8 is not set
# CONFIG_MCRUSOE is not set
# CONFIG_MEFFICEON is not set
# CONFIG_MWINCHIPC6 is not set
# CONFIG_MWINCHIP3D is not set
# CONFIG_MELAN is not set
# CONFIG_MGEODEGX1 is not set
# CONFIG_MGEODE_LX is not set
# CONFIG_MCYRIXIII is not set
# CONFIG_MVIAC3_2 is not set
# CONFIG_MVIAC7 is not set
CONFIG_MCORE2=y
# CONFIG_MATOM is not set
CONFIG_X86_GENERIC=y
CONFIG_X86_INTERNODE_CACHE_SHIFT=6
CONFIG_X86_L1_CACHE_SHIFT=6
CONFIG_X86_INTEL_USERCOPY=y
CONFIG_X86_USE_PPRO_CHECKSUM=y
CONFIG_X86_TSC=y
CONFIG_X86_CMPXCHG64=y
CONFIG_X86_CMOV=y
CONFIG_X86_MINIMUM_CPU_FAMILY=5
CONFIG_X86_DEBUGCTLMSR=y
CONFIG_CPU_SUP_INTEL=y
CONFIG_CPU_SUP_AMD=y
CONFIG_CPU_SUP_CENTAUR=y
CONFIG_CPU_SUP_TRANSMETA_32=y
CONFIG_HPET_TIMER=y
CONFIG_DMI=y
CONFIG_SWIOTLB=y
CONFIG_IOMMU_HELPER=y
CONFIG_NR_CPUS=1
# CONFIG_PREEMPT_NONE is not set
CONFIG_PREEMPT_VOLUNTARY=y
# CONFIG_PREEMPT is not set
CONFIG_PREEMPT_COUNT=y
CONFIG_UP_LATE_INIT=y
CONFIG_X86_UP_APIC=y
CONFIG_X86_UP_IOAPIC=y
CONFIG_X86_LOCAL_APIC=y
CONFIG_X86_IO_APIC=y
CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=y
# CONFIG_X86_MCE is not set

#
# Performance monitoring
#
CONFIG_PERF_EVENTS_INTEL_UNCORE=y
# CONFIG_PERF_EVENTS_INTEL_RAPL is not set
CONFIG_PERF_EVENTS_INTEL_CSTATE=m
CONFIG_PERF_EVENTS_AMD_POWER=y
CONFIG_X86_LEGACY_VM86=y
CONFIG_VM86=y
CONFIG_X86_16BIT=y
CONFIG_X86_ESPFIX32=y
# CONFIG_TOSHIBA is not set
# CONFIG_I8K is not set
# CONFIG_X86_REBOOTFIXUPS is not set
# CONFIG_MICROCODE is not set
CONFIG_X86_MSR=m
# CONFIG_X86_CPUID is not set
CONFIG_NOHIGHMEM=y
# CONFIG_HIGHMEM4G is not set
# CONFIG_HIGHMEM64G is not set
CONFIG_PAGE_OFFSET=0xC0000000
CONFIG_X86_PAE=y
CONFIG_ARCH_PHYS_ADDR_T_64BIT=y
CONFIG_NEED_NODE_MEMMAP_SIZE=y
CONFIG_ARCH_FLATMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SELECT_MEMORY_MODEL=y
CONFIG_ILLEGAL_POINTER_VALUE=0
CONFIG_SELECT_MEMORY_MODEL=y
# CONFIG_FLATMEM_MANUAL is not set
CONFIG_SPARSEMEM_MANUAL=y
CONFIG_SPARSEMEM=y
CONFIG_HAVE_MEMORY_PRESENT=y
CONFIG_SPARSEMEM_STATIC=y
CONFIG_HAVE_MEMBLOCK=y
CONFIG_HAVE_MEMBLOCK_NODE_MAP=y
CONFIG_ARCH_DISCARD_MEMBLOCK=y
# CONFIG_HAVE_BOOTMEM_INFO_NODE is not set
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=y
# CONFIG_COMPACTION is not set
CONFIG_PHYS_ADDR_T_64BIT=y
CONFIG_BOUNCE=y
CONFIG_VIRT_TO_BUS=y
# CONFIG_KSM is not set
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
# CONFIG_TRANSPARENT_HUGEPAGE is not set
CONFIG_NEED_PER_CPU_KM=y
CONFIG_CLEANCACHE=y
# CONFIG_FRONTSWAP is not set
# CONFIG_CMA is not set
# CONFIG_ZPOOL is not set
# CONFIG_ZBUD is not set
# CONFIG_ZSMALLOC is not set
CONFIG_GENERIC_EARLY_IOREMAP=y
CONFIG_ARCH_SUPPORTS_DEFERRED_STRUCT_PAGE_INIT=y
CONFIG_IDLE_PAGE_TRACKING=y
CONFIG_FRAME_VECTOR=y
# CONFIG_X86_PMEM_LEGACY is not set
CONFIG_X86_CHECK_BIOS_CORRUPTION=y
CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK=y
CONFIG_X86_RESERVE_LOW=64
CONFIG_MATH_EMULATION=y
CONFIG_MTRR=y
CONFIG_MTRR_SANITIZER=y
CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT=0
CONFIG_MTRR_SANITIZER_SPARE_REG_NR_DEFAULT=1
CONFIG_X86_PAT=y
CONFIG_ARCH_USES_PG_UNCACHED=y
CONFIG_ARCH_RANDOM=y
CONFIG_X86_SMAP=y
CONFIG_X86_INTEL_MPX=y
# CONFIG_EFI is not set
# CONFIG_SECCOMP is not set
# CONFIG_HZ_100 is not set
# CONFIG_HZ_250 is not set
CONFIG_HZ_300=y
# CONFIG_HZ_1000 is not set
CONFIG_HZ=300
# CONFIG_SCHED_HRTICK is not set
# CONFIG_KEXEC is not set
CONFIG_PHYSICAL_START=0x1000000
# CONFIG_RELOCATABLE is not set
CONFIG_PHYSICAL_ALIGN=0x200000
# CONFIG_COMPAT_VDSO is not set
# CONFIG_CMDLINE_BOOL is not set
CONFIG_MODIFY_LDT_SYSCALL=y

#
# Power management and ACPI options
#
# CONFIG_SUSPEND is not set
# CONFIG_HIBERNATION is not set
# CONFIG_PM is not set
CONFIG_ACPI=y
CONFIG_ACPI_LEGACY_TABLES_LOOKUP=y
CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=y
CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=y
CONFIG_ACPI_DEBUGGER=y
CONFIG_ACPI_DEBUGGER_USER=y
# CONFIG_ACPI_PROCFS_POWER is not set
CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=y
# CONFIG_ACPI_EC_DEBUGFS is not set
CONFIG_ACPI_AC=y
CONFIG_ACPI_BATTERY=m
CONFIG_ACPI_BUTTON=m
CONFIG_ACPI_VIDEO=m
# CONFIG_ACPI_FAN is not set
# CONFIG_ACPI_DOCK is not set
CONFIG_ACPI_CPU_FREQ_PSS=y
CONFIG_ACPI_PROCESSOR_CSTATE=y
CONFIG_ACPI_PROCESSOR_IDLE=y
CONFIG_ACPI_PROCESSOR=m
# CONFIG_ACPI_PROCESSOR_AGGREGATOR is not set
CONFIG_ACPI_THERMAL=m
# CONFIG_ACPI_CUSTOM_DSDT is not set
CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=y
CONFIG_ACPI_TABLE_UPGRADE=y
CONFIG_ACPI_DEBUG=y
# CONFIG_ACPI_PCI_SLOT is not set
CONFIG_X86_PM_TIMER=y
CONFIG_ACPI_CONTAINER=y
CONFIG_ACPI_HOTPLUG_IOAPIC=y
CONFIG_ACPI_SBS=m
CONFIG_ACPI_HED=y
CONFIG_ACPI_CUSTOM_METHOD=y
# CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
# CONFIG_ACPI_NFIT is not set
CONFIG_HAVE_ACPI_APEI=y
CONFIG_HAVE_ACPI_APEI_NMI=y
# CONFIG_ACPI_APEI is not set
CONFIG_DPTF_POWER=y
# CONFIG_PMIC_OPREGION is not set
CONFIG_ACPI_CONFIGFS=y
# CONFIG_SFI is not set

#
# CPU Frequency scaling
#
# CONFIG_CPU_FREQ is not set

#
# CPU Idle
#
CONFIG_CPU_IDLE=y
CONFIG_CPU_IDLE_GOV_LADDER=y
CONFIG_CPU_IDLE_GOV_MENU=y
# CONFIG_ARCH_NEEDS_CPU_IDLE_COUPLED is not set
CONFIG_INTEL_IDLE=y

#
# Bus options (PCI etc.)
#
CONFIG_PCI=y
# CONFIG_PCI_GOBIOS is not set
# CONFIG_PCI_GOMMCONFIG is not set
CONFIG_PCI_GODIRECT=y
# CONFIG_PCI_GOANY is not set
CONFIG_PCI_DIRECT=y
CONFIG_PCI_DOMAINS=y
CONFIG_PCIEPORTBUS=y
# CONFIG_HOTPLUG_PCI_PCIE is not set
# CONFIG_PCIEAER is not set
CONFIG_PCIEASPM=y
CONFIG_PCIEASPM_DEBUG=y
# CONFIG_PCIEASPM_DEFAULT is not set
# CONFIG_PCIEASPM_POWERSAVE is not set
CONFIG_PCIEASPM_PERFORMANCE=y
CONFIG_PCIE_DPC=y
# CONFIG_PCIE_PTM is not set
CONFIG_PCI_MSI=y
CONFIG_PCI_MSI_IRQ_DOMAIN=y
# CONFIG_PCI_DEBUG is not set
CONFIG_PCI_REALLOC_ENABLE_AUTO=y
CONFIG_PCI_STUB=m
# CONFIG_HT_IRQ is not set
CONFIG_PCI_ATS=y
# CONFIG_PCI_IOV is not set
CONFIG_PCI_PRI=y
CONFIG_PCI_PASID=y
CONFIG_PCI_LABEL=y
CONFIG_HOTPLUG_PCI=y
CONFIG_HOTPLUG_PCI_ACPI=y
CONFIG_HOTPLUG_PCI_ACPI_IBM=m
# CONFIG_HOTPLUG_PCI_CPCI is not set
CONFIG_HOTPLUG_PCI_SHPC=m

#
# PCI host controller drivers
#
# CONFIG_PCIE_DW_PLAT is not set
CONFIG_ISA_DMA_API=y
# CONFIG_ISA is not set
# CONFIG_SCx200 is not set
# CONFIG_ALIX is not set
CONFIG_NET5501=y
CONFIG_GEOS=y
CONFIG_AMD_NB=y
CONFIG_PCCARD=y
CONFIG_PCMCIA=m
CONFIG_PCMCIA_LOAD_CIS=y
CONFIG_CARDBUS=y

#
# PC-card bridges
#
CONFIG_YENTA=y
CONFIG_YENTA_O2=y
CONFIG_YENTA_RICOH=y
CONFIG_YENTA_TI=y
CONFIG_YENTA_ENE_TUNE=y
CONFIG_YENTA_TOSHIBA=y
# CONFIG_PD6729 is not set
CONFIG_I82092=m
CONFIG_PCCARD_NONSTATIC=y
# CONFIG_RAPIDIO is not set
# CONFIG_X86_SYSFB is not set

#
# Executable file formats / Emulations
#
CONFIG_BINFMT_ELF=y
CONFIG_ELFCORE=y
CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=y
CONFIG_BINFMT_SCRIPT=y
CONFIG_HAVE_AOUT=y
# CONFIG_BINFMT_AOUT is not set
CONFIG_BINFMT_MISC=m
CONFIG_COREDUMP=y
CONFIG_COMPAT_32=y
CONFIG_HAVE_ATOMIC_IOMAP=y
CONFIG_PMC_ATOM=y
CONFIG_NET=y

#
# Networking options
#
CONFIG_PACKET=y
CONFIG_PACKET_DIAG=m
CONFIG_UNIX=y
CONFIG_UNIX_DIAG=m
CONFIG_XFRM=y
CONFIG_XFRM_ALGO=y
CONFIG_XFRM_USER=m
CONFIG_XFRM_SUB_POLICY=y
# CONFIG_XFRM_MIGRATE is not set
CONFIG_XFRM_STATISTICS=y
CONFIG_XFRM_IPCOMP=y
# CONFIG_NET_KEY is not set
CONFIG_INET=y
# CONFIG_IP_MULTICAST is not set
# CONFIG_IP_ADVANCED_ROUTER is not set
CONFIG_IP_PNP=y
CONFIG_IP_PNP_DHCP=y
# CONFIG_IP_PNP_BOOTP is not set
# CONFIG_IP_PNP_RARP is not set
CONFIG_NET_IPIP=y
CONFIG_NET_IPGRE_DEMUX=y
CONFIG_NET_IP_TUNNEL=y
CONFIG_NET_IPGRE=y
# CONFIG_SYN_COOKIES is not set
CONFIG_NET_IPVTI=m
CONFIG_NET_UDP_TUNNEL=y
CONFIG_NET_FOU=y
CONFIG_NET_FOU_IP_TUNNELS=y
CONFIG_INET_AH=m
CONFIG_INET_ESP=y
CONFIG_INET_IPCOMP=y
CONFIG_INET_XFRM_TUNNEL=y
CONFIG_INET_TUNNEL=y
CONFIG_INET_XFRM_MODE_TRANSPORT=y
CONFIG_INET_XFRM_MODE_TUNNEL=y
CONFIG_INET_XFRM_MODE_BEET=y
CONFIG_INET_DIAG=m
CONFIG_INET_TCP_DIAG=m
CONFIG_INET_UDP_DIAG=m
# CONFIG_INET_RAW_DIAG is not set
# CONFIG_INET_DIAG_DESTROY is not set
CONFIG_TCP_CONG_ADVANCED=y
# CONFIG_TCP_CONG_BIC is not set
CONFIG_TCP_CONG_CUBIC=m
# CONFIG_TCP_CONG_WESTWOOD is not set
CONFIG_TCP_CONG_HTCP=m
# CONFIG_TCP_CONG_HSTCP is not set
# CONFIG_TCP_CONG_HYBLA is not set
CONFIG_TCP_CONG_VEGAS=m
# CONFIG_TCP_CONG_NV is not set
CONFIG_TCP_CONG_SCALABLE=m
CONFIG_TCP_CONG_LP=y
CONFIG_TCP_CONG_VENO=y
CONFIG_TCP_CONG_YEAH=m
CONFIG_TCP_CONG_ILLINOIS=y
CONFIG_TCP_CONG_DCTCP=m
CONFIG_TCP_CONG_CDG=y
CONFIG_TCP_CONG_BBR=y
CONFIG_DEFAULT_VENO=y
# CONFIG_DEFAULT_CDG is not set
# CONFIG_DEFAULT_BBR is not set
# CONFIG_DEFAULT_RENO is not set
CONFIG_DEFAULT_TCP_CONG="veno"
# CONFIG_TCP_MD5SIG is not set
# CONFIG_IPV6 is not set
# CONFIG_NETWORK_SECMARK is not set
CONFIG_NET_PTP_CLASSIFY=y
CONFIG_NETWORK_PHY_TIMESTAMPING=y
# CONFIG_NETFILTER is not set
CONFIG_IP_DCCP=m
CONFIG_INET_DCCP_DIAG=m

#
# DCCP CCIDs Configuration
#
CONFIG_IP_DCCP_CCID2_DEBUG=y
CONFIG_IP_DCCP_CCID3=y
# CONFIG_IP_DCCP_CCID3_DEBUG is not set
CONFIG_IP_DCCP_TFRC_LIB=y

#
# DCCP Kernel Hacking
#
# CONFIG_IP_DCCP_DEBUG is not set
CONFIG_IP_SCTP=y
CONFIG_SCTP_DBG_OBJCNT=y
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5 is not set
CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1=y
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE is not set
# CONFIG_SCTP_COOKIE_HMAC_MD5 is not set
CONFIG_SCTP_COOKIE_HMAC_SHA1=y
CONFIG_INET_SCTP_DIAG=m
# CONFIG_RDS is not set
CONFIG_TIPC=m
CONFIG_TIPC_MEDIA_UDP=y
# CONFIG_ATM is not set
CONFIG_L2TP=y
CONFIG_L2TP_DEBUGFS=m
CONFIG_L2TP_V3=y
# CONFIG_L2TP_IP is not set
CONFIG_L2TP_ETH=m
CONFIG_STP=m
CONFIG_GARP=m
CONFIG_MRP=m
# CONFIG_BRIDGE is not set
CONFIG_HAVE_NET_DSA=y
CONFIG_NET_DSA=m
CONFIG_NET_DSA_HWMON=y
CONFIG_NET_DSA_TAG_BRCM=y
CONFIG_VLAN_8021Q=m
CONFIG_VLAN_8021Q_GVRP=y
CONFIG_VLAN_8021Q_MVRP=y
CONFIG_DECNET=m
CONFIG_DECNET_ROUTER=y
CONFIG_LLC=y
CONFIG_LLC2=y
# CONFIG_IPX is not set
CONFIG_ATALK=y
CONFIG_DEV_APPLETALK=m
CONFIG_IPDDP=m
CONFIG_IPDDP_ENCAP=y
# CONFIG_X25 is not set
CONFIG_LAPB=y
CONFIG_PHONET=m
CONFIG_IEEE802154=y
CONFIG_IEEE802154_NL802154_EXPERIMENTAL=y
CONFIG_IEEE802154_SOCKET=y
CONFIG_MAC802154=y
# CONFIG_NET_SCHED is not set
CONFIG_DCB=y
CONFIG_DNS_RESOLVER=y
CONFIG_BATMAN_ADV=m
CONFIG_BATMAN_ADV_BATMAN_V=y
CONFIG_BATMAN_ADV_BLA=y
CONFIG_BATMAN_ADV_DAT=y
CONFIG_BATMAN_ADV_NC=y
CONFIG_BATMAN_ADV_MCAST=y
CONFIG_BATMAN_ADV_DEBUGFS=y
# CONFIG_BATMAN_ADV_DEBUG is not set
# CONFIG_OPENVSWITCH is not set
CONFIG_VSOCKETS=m
CONFIG_VMWARE_VMCI_VSOCKETS=m
CONFIG_VIRTIO_VSOCKETS_COMMON=m
# CONFIG_NETLINK_DIAG is not set
CONFIG_MPLS=y
# CONFIG_NET_MPLS_GSO is not set
CONFIG_MPLS_ROUTING=m
CONFIG_MPLS_IPTUNNEL=m
CONFIG_HSR=m
CONFIG_NET_SWITCHDEV=y
CONFIG_NET_L3_MASTER_DEV=y
CONFIG_NET_NCSI=y
# CONFIG_SOCK_CGROUP_DATA is not set
# CONFIG_CGROUP_NET_PRIO is not set
# CONFIG_CGROUP_NET_CLASSID is not set
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y

#
# Network testing
#
CONFIG_NET_PKTGEN=y
CONFIG_NET_DROP_MONITOR=y
# CONFIG_HAMRADIO is not set
CONFIG_CAN=y
CONFIG_CAN_RAW=y
# CONFIG_CAN_BCM is not set
# CONFIG_CAN_GW is not set

#
# CAN Device Drivers
#
CONFIG_CAN_VCAN=y
CONFIG_CAN_SLCAN=m
# CONFIG_CAN_DEV is not set
# CONFIG_CAN_DEBUG_DEVICES is not set
CONFIG_IRDA=y

#
# IrDA protocols
#
# CONFIG_IRLAN is not set
# CONFIG_IRNET is not set
# CONFIG_IRCOMM is not set
CONFIG_IRDA_ULTRA=y

#
# IrDA options
#
CONFIG_IRDA_CACHE_LAST_LSAP=y
CONFIG_IRDA_FAST_RR=y
CONFIG_IRDA_DEBUG=y

#
# Infrared-port device drivers
#

#
# SIR device drivers
#
# CONFIG_IRTTY_SIR is not set

#
# Dongle support
#
CONFIG_KINGSUN_DONGLE=m
CONFIG_KSDAZZLE_DONGLE=m
CONFIG_KS959_DONGLE=y

#
# FIR device drivers
#
# CONFIG_USB_IRDA is not set
CONFIG_SIGMATEL_FIR=y
# CONFIG_NSC_FIR is not set
CONFIG_WINBOND_FIR=y
# CONFIG_TOSHIBA_FIR is not set
CONFIG_SMC_IRCC_FIR=y
CONFIG_ALI_FIR=y
CONFIG_VLSI_FIR=m
CONFIG_VIA_FIR=y
CONFIG_MCS_FIR=y
CONFIG_BT=m
CONFIG_BT_BREDR=y
CONFIG_BT_RFCOMM=y
# CONFIG_BT_RFCOMM_TTY is not set
CONFIG_BT_BNEP=m
CONFIG_BT_BNEP_MC_FILTER=y
# CONFIG_BT_BNEP_PROTO_FILTER is not set
# CONFIG_BT_HIDP is not set
CONFIG_BT_HS=y
# CONFIG_BT_LE is not set
CONFIG_BT_LEDS=y
# CONFIG_BT_SELFTEST is not set
# CONFIG_BT_DEBUGFS is not set

#
# Bluetooth device drivers
#
CONFIG_BT_INTEL=m
CONFIG_BT_BCM=m
CONFIG_BT_QCA=m
# CONFIG_BT_HCIBTUSB is not set
# CONFIG_BT_HCIBTSDIO is not set
CONFIG_BT_HCIUART=m
CONFIG_BT_HCIUART_H4=y
CONFIG_BT_HCIUART_BCSP=y
CONFIG_BT_HCIUART_ATH3K=y
# CONFIG_BT_HCIUART_LL is not set
# CONFIG_BT_HCIUART_3WIRE is not set
# CONFIG_BT_HCIUART_INTEL is not set
CONFIG_BT_HCIUART_BCM=y
CONFIG_BT_HCIUART_QCA=y
CONFIG_BT_HCIUART_AG6XX=y
# CONFIG_BT_HCIUART_MRVL is not set
CONFIG_BT_HCIBCM203X=m
# CONFIG_BT_HCIBPA10X is not set
# CONFIG_BT_HCIBFUSB is not set
CONFIG_BT_HCIDTL1=m
CONFIG_BT_HCIBT3C=m
CONFIG_BT_HCIBLUECARD=m
CONFIG_BT_HCIBTUART=m
CONFIG_BT_HCIVHCI=m
CONFIG_BT_MRVL=m
CONFIG_BT_MRVL_SDIO=m
CONFIG_AF_RXRPC=y
# CONFIG_AF_RXRPC_INJECT_LOSS is not set
# CONFIG_AF_RXRPC_DEBUG is not set
CONFIG_RXKAD=y
CONFIG_AF_KCM=m
CONFIG_STREAM_PARSER=m
CONFIG_FIB_RULES=y
CONFIG_WIRELESS=y
CONFIG_WIRELESS_EXT=y
CONFIG_WEXT_CORE=y
CONFIG_WEXT_PROC=y
CONFIG_WEXT_SPY=y
CONFIG_WEXT_PRIV=y
CONFIG_CFG80211=m
# CONFIG_NL80211_TESTMODE is not set
# CONFIG_CFG80211_DEVELOPER_WARNINGS is not set
# CONFIG_CFG80211_DEFAULT_PS is not set
# CONFIG_CFG80211_DEBUGFS is not set
# CONFIG_CFG80211_INTERNAL_REGDB is not set
CONFIG_CFG80211_CRDA_SUPPORT=y
CONFIG_CFG80211_WEXT=y
CONFIG_CFG80211_WEXT_EXPORT=y
CONFIG_LIB80211=m
CONFIG_LIB80211_CRYPT_WEP=m
CONFIG_LIB80211_CRYPT_CCMP=m
CONFIG_LIB80211_CRYPT_TKIP=m
CONFIG_LIB80211_DEBUG=y
# CONFIG_MAC80211 is not set
CONFIG_MAC80211_STA_HASH_MAX_SIZE=0
# CONFIG_WIMAX is not set
CONFIG_RFKILL=m
CONFIG_RFKILL_LEDS=y
CONFIG_RFKILL_INPUT=y
# CONFIG_RFKILL_REGULATOR is not set
CONFIG_RFKILL_GPIO=m
# CONFIG_NET_9P is not set
CONFIG_CAIF=m
CONFIG_CAIF_DEBUG=y
CONFIG_CAIF_NETDEV=m
# CONFIG_CAIF_USB is not set
CONFIG_CEPH_LIB=y
# CONFIG_CEPH_LIB_PRETTYDEBUG is not set
CONFIG_CEPH_LIB_USE_DNS_RESOLVER=y
# CONFIG_NFC is not set
CONFIG_LWTUNNEL=y
CONFIG_LWTUNNEL_BPF=y
CONFIG_DST_CACHE=y
# CONFIG_NET_DEVLINK is not set
CONFIG_MAY_USE_DEVLINK=y

#
# Device Drivers
#

#
# Generic Driver Options
#
CONFIG_UEVENT_HELPER=y
CONFIG_UEVENT_HELPER_PATH=""
CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y
CONFIG_STANDALONE=y
CONFIG_PREVENT_FIRMWARE_BUILD=y
CONFIG_FW_LOADER=y
# CONFIG_FIRMWARE_IN_KERNEL is not set
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
CONFIG_WANT_DEV_COREDUMP=y
CONFIG_ALLOW_DEV_COREDUMP=y
CONFIG_DEV_COREDUMP=y
# CONFIG_DEBUG_DRIVER is not set
# CONFIG_DEBUG_DEVRES is not set
CONFIG_DEBUG_TEST_DRIVER_REMOVE=y
# CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
# CONFIG_SYS_HYPERVISOR is not set
# CONFIG_GENERIC_CPU_DEVICES is not set
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_SPI=y
CONFIG_REGMAP_SPMI=m
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_DMA_SHARED_BUFFER=y
CONFIG_DMA_FENCE_TRACE=y

#
# Bus devices
#
CONFIG_CONNECTOR=m
CONFIG_MTD=m
# CONFIG_MTD_TESTS is not set
CONFIG_MTD_REDBOOT_PARTS=m
CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=-1
# CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED is not set
CONFIG_MTD_REDBOOT_PARTS_READONLY=y
CONFIG_MTD_CMDLINE_PARTS=m
CONFIG_MTD_OF_PARTS=m
CONFIG_MTD_AR7_PARTS=m

#
# User Modules And Translation Layers
#
CONFIG_MTD_BLKDEVS=m
# CONFIG_MTD_BLOCK is not set
CONFIG_MTD_BLOCK_RO=m
CONFIG_FTL=m
CONFIG_NFTL=m
CONFIG_NFTL_RW=y
CONFIG_INFTL=m
CONFIG_RFD_FTL=m
CONFIG_SSFDC=m
# CONFIG_SM_FTL is not set
CONFIG_MTD_OOPS=m
CONFIG_MTD_SWAP=m
# CONFIG_MTD_PARTITIONED_MASTER is not set

#
# RAM/ROM/Flash chip drivers
#
# CONFIG_MTD_CFI is not set
CONFIG_MTD_JEDECPROBE=m
CONFIG_MTD_GEN_PROBE=m
CONFIG_MTD_CFI_ADV_OPTIONS=y
# CONFIG_MTD_CFI_NOSWAP is not set
CONFIG_MTD_CFI_BE_BYTE_SWAP=y
# CONFIG_MTD_CFI_LE_BYTE_SWAP is not set
# CONFIG_MTD_CFI_GEOMETRY is not set
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
# CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
# CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
# CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
# CONFIG_MTD_CFI_I4 is not set
# CONFIG_MTD_CFI_I8 is not set
# CONFIG_MTD_OTP is not set
CONFIG_MTD_CFI_INTELEXT=m
CONFIG_MTD_CFI_AMDSTD=m
CONFIG_MTD_CFI_STAA=m
CONFIG_MTD_CFI_UTIL=m
CONFIG_MTD_RAM=m
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_ABSENT is not set

#
# Mapping drivers for chip access
#
# CONFIG_MTD_COMPLEX_MAPPINGS is not set
# CONFIG_MTD_PHYSMAP is not set
CONFIG_MTD_PHYSMAP_OF=m
CONFIG_MTD_PHYSMAP_OF_VERSATILE=y
# CONFIG_MTD_AMD76XROM is not set
CONFIG_MTD_ICHXROM=m
CONFIG_MTD_ESB2ROM=m
CONFIG_MTD_CK804XROM=m
CONFIG_MTD_SCB2_FLASH=m
CONFIG_MTD_NETtel=m
# CONFIG_MTD_L440GX is not set
CONFIG_MTD_INTEL_VR_NOR=m
# CONFIG_MTD_PLATRAM is not set

#
# Self-contained MTD device drivers
#
CONFIG_MTD_PMC551=m
# CONFIG_MTD_PMC551_BUGFIX is not set
# CONFIG_MTD_PMC551_DEBUG is not set
CONFIG_MTD_DATAFLASH=m
# CONFIG_MTD_DATAFLASH_WRITE_VERIFY is not set
# CONFIG_MTD_DATAFLASH_OTP is not set
CONFIG_MTD_M25P80=m
# CONFIG_MTD_SST25L is not set
CONFIG_MTD_SLRAM=m
# CONFIG_MTD_PHRAM is not set
# CONFIG_MTD_MTDRAM is not set
CONFIG_MTD_BLOCK2MTD=m

#
# Disk-On-Chip Device Drivers
#
# CONFIG_MTD_DOCG3 is not set
CONFIG_MTD_NAND_ECC=m
CONFIG_MTD_NAND_ECC_SMC=y
CONFIG_MTD_NAND=m
CONFIG_MTD_NAND_BCH=m
CONFIG_MTD_NAND_ECC_BCH=y
CONFIG_MTD_SM_COMMON=m
CONFIG_MTD_NAND_DENALI=m
CONFIG_MTD_NAND_DENALI_PCI=m
# CONFIG_MTD_NAND_DENALI_DT is not set
CONFIG_MTD_NAND_DENALI_SCRATCH_REG_ADDR=0xFF108018
CONFIG_MTD_NAND_GPIO=m
# CONFIG_MTD_NAND_OMAP_BCH_BUILD is not set
CONFIG_MTD_NAND_IDS=m
CONFIG_MTD_NAND_RICOH=m
CONFIG_MTD_NAND_DISKONCHIP=m
CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADVANCED=y
CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADDRESS=0
# CONFIG_MTD_NAND_DISKONCHIP_PROBE_HIGH is not set
CONFIG_MTD_NAND_DISKONCHIP_BBTWRITE=y
# CONFIG_MTD_NAND_DOCG4 is not set
CONFIG_MTD_NAND_CAFE=m
# CONFIG_MTD_NAND_CS553X is not set
CONFIG_MTD_NAND_NANDSIM=m
CONFIG_MTD_NAND_PLATFORM=m
# CONFIG_MTD_NAND_OXNAS is not set
CONFIG_MTD_NAND_HISI504=m
CONFIG_MTD_NAND_MTK=m
# CONFIG_MTD_ONENAND is not set

#
# LPDDR & LPDDR2 PCM memory drivers
#
CONFIG_MTD_LPDDR=m
CONFIG_MTD_QINFO_PROBE=m
CONFIG_MTD_SPI_NOR=m
CONFIG_MTD_MT81xx_NOR=m
CONFIG_MTD_SPI_NOR_USE_4K_SECTORS=y
CONFIG_MTD_UBI=m
CONFIG_MTD_UBI_WL_THRESHOLD=4096
CONFIG_MTD_UBI_BEB_LIMIT=20
CONFIG_MTD_UBI_FASTMAP=y
# CONFIG_MTD_UBI_GLUEBI is not set
CONFIG_MTD_UBI_BLOCK=y
CONFIG_DTC=y
CONFIG_OF=y
CONFIG_OF_UNITTEST=y
CONFIG_OF_FLATTREE=y
CONFIG_OF_EARLY_FLATTREE=y
CONFIG_OF_DYNAMIC=y
CONFIG_OF_ADDRESS=y
CONFIG_OF_ADDRESS_PCI=y
CONFIG_OF_IRQ=y
CONFIG_OF_NET=y
CONFIG_OF_MDIO=y
CONFIG_OF_PCI=y
CONFIG_OF_PCI_IRQ=y
CONFIG_OF_RESOLVE=y
CONFIG_OF_OVERLAY=y
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
# CONFIG_PARPORT is not set
CONFIG_PNP=y
CONFIG_PNP_DEBUG_MESSAGES=y

#
# Protocols
#
CONFIG_PNPACPI=y
CONFIG_BLK_DEV=y
# CONFIG_BLK_DEV_NULL_BLK is not set
# CONFIG_BLK_DEV_FD is not set
# CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
# CONFIG_BLK_CPQ_CISS_DA is not set
# CONFIG_BLK_DEV_DAC960 is not set
# CONFIG_BLK_DEV_UMEM is not set
# CONFIG_BLK_DEV_COW_COMMON is not set
# CONFIG_BLK_DEV_LOOP is not set
# CONFIG_BLK_DEV_DRBD is not set
# CONFIG_BLK_DEV_NBD is not set
# CONFIG_BLK_DEV_OSD is not set
# CONFIG_BLK_DEV_SX8 is not set
# CONFIG_BLK_DEV_RAM is not set
# CONFIG_CDROM_PKTCDVD is not set
# CONFIG_ATA_OVER_ETH is not set
# CONFIG_BLK_DEV_HD is not set
# CONFIG_BLK_DEV_RBD is not set
# CONFIG_BLK_DEV_RSXX is not set
CONFIG_NVME_CORE=y
CONFIG_BLK_DEV_NVME=m
# CONFIG_BLK_DEV_NVME_SCSI is not set
CONFIG_NVME_FABRICS=y
CONFIG_NVME_FC=y
CONFIG_NVME_TARGET=m
# CONFIG_NVME_TARGET_LOOP is not set
# CONFIG_NVME_TARGET_FC is not set

#
# Misc devices
#
# CONFIG_SENSORS_LIS3LV02D is not set
CONFIG_AD525X_DPOT=y
CONFIG_AD525X_DPOT_I2C=y
CONFIG_AD525X_DPOT_SPI=m
CONFIG_DUMMY_IRQ=y
CONFIG_IBM_ASM=y
# CONFIG_PHANTOM is not set
CONFIG_SGI_IOC4=m
CONFIG_TIFM_CORE=y
CONFIG_TIFM_7XX1=m
CONFIG_ICS932S401=m
# CONFIG_ENCLOSURE_SERVICES is not set
CONFIG_HP_ILO=y
# CONFIG_APDS9802ALS is not set
CONFIG_ISL29003=m
CONFIG_ISL29020=m
# CONFIG_SENSORS_TSL2550 is not set
CONFIG_SENSORS_BH1770=y
CONFIG_SENSORS_APDS990X=m
CONFIG_HMC6352=m
CONFIG_DS1682=y
CONFIG_TI_DAC7512=y
# CONFIG_VMWARE_BALLOON is not set
CONFIG_PCH_PHUB=m
CONFIG_USB_SWITCH_FSA9480=m
CONFIG_LATTICE_ECP3_CONFIG=y
# CONFIG_SRAM is not set
# CONFIG_C2PORT is not set

#
# EEPROM support
#
CONFIG_EEPROM_AT24=y
# CONFIG_EEPROM_AT25 is not set
CONFIG_EEPROM_LEGACY=y
CONFIG_EEPROM_MAX6875=m
# CONFIG_EEPROM_93CX6 is not set
CONFIG_EEPROM_93XX46=y
CONFIG_CB710_CORE=m
CONFIG_CB710_DEBUG=y
CONFIG_CB710_DEBUG_ASSUMPTIONS=y

#
# Texas Instruments shared transport line discipline
#
# CONFIG_TI_ST is not set
# CONFIG_SENSORS_LIS3_I2C is not set

#
# Altera FPGA firmware download module
#
# CONFIG_ALTERA_STAPL is not set
CONFIG_INTEL_MEI=y
CONFIG_INTEL_MEI_ME=y
CONFIG_INTEL_MEI_TXE=y
CONFIG_VMWARE_VMCI=m

#
# Intel MIC Bus Driver
#

#
# SCIF Bus Driver
#

#
# VOP Bus Driver
#

#
# Intel MIC Host Driver
#

#
# Intel MIC Card Driver
#

#
# SCIF Driver
#

#
# Intel MIC Coprocessor State Management (COSM) Drivers
#

#
# VOP Driver
#
CONFIG_ECHO=y
# CONFIG_CXL_BASE is not set
# CONFIG_CXL_AFU_DRIVER_OPS is not set
CONFIG_HAVE_IDE=y
CONFIG_IDE=y

#
# Please see Documentation/ide/ide.txt for help/info on IDE drives
#
CONFIG_IDE_XFER_MODE=y
CONFIG_IDE_TIMINGS=y
CONFIG_IDE_ATAPI=y
# CONFIG_BLK_DEV_IDE_SATA is not set
# CONFIG_IDE_GD is not set
CONFIG_BLK_DEV_IDECS=m
CONFIG_BLK_DEV_DELKIN=m
CONFIG_BLK_DEV_IDECD=y
CONFIG_BLK_DEV_IDECD_VERBOSE_ERRORS=y
CONFIG_BLK_DEV_IDETAPE=m
CONFIG_BLK_DEV_IDEACPI=y
CONFIG_IDE_TASK_IOCTL=y
# CONFIG_IDE_PROC_FS is not set

#
# IDE chipset support/bugfixes
#
CONFIG_IDE_GENERIC=y
CONFIG_BLK_DEV_PLATFORM=m
CONFIG_BLK_DEV_CMD640=y
# CONFIG_BLK_DEV_CMD640_ENHANCED is not set
CONFIG_BLK_DEV_IDEPNP=m
CONFIG_BLK_DEV_IDEDMA_SFF=y

#
# PCI IDE chipsets support
#
CONFIG_BLK_DEV_IDEPCI=y
CONFIG_IDEPCI_PCIBUS_ORDER=y
CONFIG_BLK_DEV_OFFBOARD=y
# CONFIG_BLK_DEV_GENERIC is not set
CONFIG_BLK_DEV_OPTI621=y
CONFIG_BLK_DEV_RZ1000=y
CONFIG_BLK_DEV_IDEDMA_PCI=y
CONFIG_BLK_DEV_AEC62XX=y
CONFIG_BLK_DEV_ALI15X3=y
# CONFIG_BLK_DEV_AMD74XX is not set
CONFIG_BLK_DEV_ATIIXP=y
CONFIG_BLK_DEV_CMD64X=y
# CONFIG_BLK_DEV_TRIFLEX is not set
CONFIG_BLK_DEV_CS5520=m
# CONFIG_BLK_DEV_CS5530 is not set
CONFIG_BLK_DEV_CS5535=y
CONFIG_BLK_DEV_CS5536=m
# CONFIG_BLK_DEV_HPT366 is not set
CONFIG_BLK_DEV_JMICRON=y
CONFIG_BLK_DEV_SC1200=y
CONFIG_BLK_DEV_PIIX=y
CONFIG_BLK_DEV_IT8172=m
CONFIG_BLK_DEV_IT8213=y
# CONFIG_BLK_DEV_IT821X is not set
CONFIG_BLK_DEV_NS87415=y
CONFIG_BLK_DEV_PDC202XX_OLD=m
# CONFIG_BLK_DEV_PDC202XX_NEW is not set
# CONFIG_BLK_DEV_SVWKS is not set
CONFIG_BLK_DEV_SIIMAGE=y
# CONFIG_BLK_DEV_SIS5513 is not set
CONFIG_BLK_DEV_SLC90E66=y
CONFIG_BLK_DEV_TRM290=y
# CONFIG_BLK_DEV_VIA82CXXX is not set
CONFIG_BLK_DEV_TC86C001=m
CONFIG_BLK_DEV_IDEDMA=y

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
# CONFIG_RAID_ATTRS is not set
CONFIG_SCSI=y
CONFIG_SCSI_DMA=y
CONFIG_SCSI_NETLINK=y
CONFIG_SCSI_MQ_DEFAULT=y
CONFIG_SCSI_PROC_FS=y

#
# SCSI support type (disk, tape, CD-ROM)
#
CONFIG_BLK_DEV_SD=m
CONFIG_CHR_DEV_ST=y
CONFIG_CHR_DEV_OSST=m
# CONFIG_BLK_DEV_SR is not set
CONFIG_CHR_DEV_SG=y
CONFIG_CHR_DEV_SCH=m
CONFIG_SCSI_CONSTANTS=y
# CONFIG_SCSI_LOGGING is not set
# CONFIG_SCSI_SCAN_ASYNC is not set

#
# SCSI Transports
#
CONFIG_SCSI_SPI_ATTRS=m
CONFIG_SCSI_FC_ATTRS=m
CONFIG_SCSI_ISCSI_ATTRS=y
CONFIG_SCSI_SAS_ATTRS=y
# CONFIG_SCSI_SAS_LIBSAS is not set
CONFIG_SCSI_SRP_ATTRS=y
# CONFIG_SCSI_LOWLEVEL is not set
# CONFIG_SCSI_LOWLEVEL_PCMCIA is not set
# CONFIG_SCSI_DH is not set
CONFIG_SCSI_OSD_INITIATOR=y
CONFIG_SCSI_OSD_ULD=m
CONFIG_SCSI_OSD_DPRINT_SENSE=1
CONFIG_SCSI_OSD_DEBUG=y
CONFIG_ATA=m
# CONFIG_ATA_NONSTANDARD is not set
CONFIG_ATA_VERBOSE_ERROR=y
CONFIG_ATA_ACPI=y
# CONFIG_SATA_PMP is not set

#
# Controllers with non-SFF native interface
#
# CONFIG_SATA_AHCI is not set
CONFIG_SATA_AHCI_PLATFORM=m
# CONFIG_AHCI_CEVA is not set
CONFIG_AHCI_QORIQ=m
CONFIG_SATA_INIC162X=m
CONFIG_SATA_ACARD_AHCI=m
CONFIG_SATA_SIL24=m
CONFIG_ATA_SFF=y

#
# SFF controllers with custom DMA interface
#
CONFIG_PDC_ADMA=m
CONFIG_SATA_QSTOR=m
# CONFIG_SATA_SX4 is not set
# CONFIG_ATA_BMDMA is not set

#
# PIO-only SFF controllers
#
CONFIG_PATA_CMD640_PCI=m
# CONFIG_PATA_MPIIX is not set
CONFIG_PATA_NS87410=m
CONFIG_PATA_OPTI=m
CONFIG_PATA_PCMCIA=m
CONFIG_PATA_RZ1000=m

#
# Generic fallback / legacy drivers
#
CONFIG_PATA_LEGACY=m
# CONFIG_MD is not set
# CONFIG_TARGET_CORE is not set
# CONFIG_FUSION is not set

#
# IEEE 1394 (FireWire) support
#
# CONFIG_FIREWIRE is not set
CONFIG_FIREWIRE_NOSY=m
CONFIG_MACINTOSH_DRIVERS=y
CONFIG_MAC_EMUMOUSEBTN=m
CONFIG_NETDEVICES=y
CONFIG_MII=y
# CONFIG_NET_CORE is not set
CONFIG_SUNGEM_PHY=m
CONFIG_ARCNET=y
CONFIG_ARCNET_1201=y
CONFIG_ARCNET_1051=y
CONFIG_ARCNET_RAW=y
# CONFIG_ARCNET_CAP is not set
# CONFIG_ARCNET_COM90xx is not set
CONFIG_ARCNET_COM90xxIO=y
CONFIG_ARCNET_RIM_I=y
# CONFIG_ARCNET_COM20020 is not set

#
# CAIF transport drivers
#
# CONFIG_CAIF_TTY is not set
CONFIG_CAIF_SPI_SLAVE=m
# CONFIG_CAIF_SPI_SYNC is not set
CONFIG_CAIF_HSI=m
# CONFIG_CAIF_VIRTIO is not set

#
# Distributed Switch Architecture drivers
#
# CONFIG_NET_DSA_MV88E6060 is not set
CONFIG_NET_DSA_BCM_SF2=m
CONFIG_B53=m
# CONFIG_B53_SPI_DRIVER is not set
CONFIG_B53_MDIO_DRIVER=m
CONFIG_B53_MMAP_DRIVER=m
CONFIG_B53_SRAB_DRIVER=m
# CONFIG_NET_DSA_MV88E6XXX is not set
# CONFIG_NET_DSA_QCA8K is not set
CONFIG_ETHERNET=y
CONFIG_MDIO=y
CONFIG_NET_VENDOR_3COM=y
# CONFIG_PCMCIA_3C574 is not set
CONFIG_PCMCIA_3C589=m
CONFIG_VORTEX=m
CONFIG_TYPHOON=y
CONFIG_NET_VENDOR_ADAPTEC=y
CONFIG_ADAPTEC_STARFIRE=m
# CONFIG_NET_VENDOR_AGERE is not set
# CONFIG_NET_VENDOR_ALACRITECH is not set
# CONFIG_NET_VENDOR_ALTEON is not set
CONFIG_ALTERA_TSE=y
CONFIG_NET_VENDOR_AMAZON=y
CONFIG_ENA_ETHERNET=y
# CONFIG_NET_VENDOR_AMD is not set
CONFIG_NET_VENDOR_ARC=y
CONFIG_NET_VENDOR_ATHEROS=y
# CONFIG_ATL2 is not set
# CONFIG_ATL1 is not set
# CONFIG_ATL1E is not set
CONFIG_ATL1C=m
CONFIG_ALX=m
# CONFIG_NET_VENDOR_AURORA is not set
# CONFIG_NET_CADENCE is not set
CONFIG_NET_VENDOR_BROADCOM=y
CONFIG_B44=m
CONFIG_B44_PCI_AUTOSELECT=y
CONFIG_B44_PCICORE_AUTOSELECT=y
CONFIG_B44_PCI=y
# CONFIG_BCMGENET is not set
CONFIG_BNX2=y
CONFIG_CNIC=y
CONFIG_TIGON3=m
CONFIG_BNX2X=m
CONFIG_SYSTEMPORT=y
# CONFIG_BNXT is not set
CONFIG_NET_VENDOR_BROCADE=y
# CONFIG_BNA is not set
CONFIG_NET_VENDOR_CAVIUM=y
CONFIG_NET_VENDOR_CHELSIO=y
CONFIG_CHELSIO_T1=y
# CONFIG_CHELSIO_T1_1G is not set
CONFIG_CHELSIO_T3=y
CONFIG_CHELSIO_T4=m
CONFIG_CHELSIO_T4_DCB=y
# CONFIG_CHELSIO_T4VF is not set
CONFIG_NET_VENDOR_CISCO=y
CONFIG_ENIC=y
CONFIG_CX_ECAT=y
CONFIG_DNET=y
# CONFIG_NET_VENDOR_DEC is not set
# CONFIG_NET_VENDOR_DLINK is not set
# CONFIG_NET_VENDOR_EMULEX is not set
# CONFIG_NET_VENDOR_EZCHIP is not set
CONFIG_NET_VENDOR_EXAR=y
CONFIG_S2IO=y
# CONFIG_VXGE is not set
CONFIG_NET_VENDOR_FUJITSU=y
CONFIG_PCMCIA_FMVJ18X=m
# CONFIG_NET_VENDOR_HP is not set
CONFIG_NET_VENDOR_INTEL=y
CONFIG_E100=y
CONFIG_E1000=y
CONFIG_E1000E=y
CONFIG_E1000E_HWTS=y
CONFIG_IGB=m
CONFIG_IGB_HWMON=y
CONFIG_IGBVF=m
CONFIG_IXGB=y
CONFIG_IXGBE=m
CONFIG_IXGBE_HWMON=y
CONFIG_IXGBE_DCB=y
CONFIG_IXGBEVF=y
CONFIG_I40E=y
CONFIG_I40E_DCB=y
CONFIG_I40EVF=y
CONFIG_FM10K=y
CONFIG_NET_VENDOR_I825XX=y
CONFIG_JME=y
CONFIG_NET_VENDOR_MARVELL=y
CONFIG_MVMDIO=m
# CONFIG_MVNETA_BM is not set
CONFIG_SKGE=m
CONFIG_SKGE_DEBUG=y
# CONFIG_SKGE_GENESIS is not set
CONFIG_SKY2=m
# CONFIG_SKY2_DEBUG is not set
# CONFIG_NET_VENDOR_MELLANOX is not set
# CONFIG_NET_VENDOR_MICREL is not set
CONFIG_NET_VENDOR_MICROCHIP=y
CONFIG_ENC28J60=y
CONFIG_ENC28J60_WRITEVERIFY=y
# CONFIG_ENCX24J600 is not set
# CONFIG_NET_VENDOR_MYRI is not set
CONFIG_FEALNX=y
CONFIG_NET_VENDOR_NATSEMI=y
CONFIG_NATSEMI=y
# CONFIG_NS83820 is not set
CONFIG_NET_VENDOR_NETRONOME=y
# CONFIG_NFP_NETVF is not set
CONFIG_NET_VENDOR_8390=y
CONFIG_PCMCIA_AXNET=m
CONFIG_NE2K_PCI=y
CONFIG_PCMCIA_PCNET=m
CONFIG_NET_VENDOR_NVIDIA=y
CONFIG_FORCEDETH=m
# CONFIG_NET_VENDOR_OKI is not set
# CONFIG_ETHOC is not set
# CONFIG_NET_PACKET_ENGINE is not set
# CONFIG_NET_VENDOR_QLOGIC is not set
# CONFIG_NET_VENDOR_QUALCOMM is not set
CONFIG_NET_VENDOR_REALTEK=y
# CONFIG_8139CP is not set
CONFIG_8139TOO=m
# CONFIG_8139TOO_PIO is not set
CONFIG_8139TOO_TUNE_TWISTER=y
# CONFIG_8139TOO_8129 is not set
CONFIG_8139_OLD_RX_RESET=y
# CONFIG_R8169 is not set
# CONFIG_NET_VENDOR_RENESAS is not set
CONFIG_NET_VENDOR_RDC=y
CONFIG_R6040=m
# CONFIG_NET_VENDOR_ROCKER is not set
CONFIG_NET_VENDOR_SAMSUNG=y
CONFIG_SXGBE_ETH=m
CONFIG_NET_VENDOR_SEEQ=y
CONFIG_NET_VENDOR_SILAN=y
CONFIG_SC92031=y
# CONFIG_NET_VENDOR_SIS is not set
CONFIG_NET_VENDOR_SOLARFLARE=y
# CONFIG_SFC is not set
# CONFIG_SFC_FALCON is not set
CONFIG_NET_VENDOR_SMSC=y
CONFIG_PCMCIA_SMC91C92=m
CONFIG_EPIC100=m
CONFIG_SMSC911X=y
# CONFIG_SMSC911X_ARCH_HOOKS is not set
CONFIG_SMSC9420=m
# CONFIG_NET_VENDOR_STMICRO is not set
CONFIG_NET_VENDOR_SUN=y
CONFIG_HAPPYMEAL=y
CONFIG_SUNGEM=m
CONFIG_CASSINI=m
CONFIG_NIU=m
CONFIG_NET_VENDOR_SYNOPSYS=y
# CONFIG_SYNOPSYS_DWC_ETH_QOS is not set
CONFIG_NET_VENDOR_TEHUTI=y
CONFIG_TEHUTI=y
# CONFIG_NET_VENDOR_TI is not set
# CONFIG_NET_VENDOR_VIA is not set
# CONFIG_NET_VENDOR_WIZNET is not set
# CONFIG_NET_VENDOR_XIRCOM is not set
CONFIG_FDDI=m
# CONFIG_DEFXX is not set
CONFIG_SKFP=m
CONFIG_HIPPI=y
# CONFIG_ROADRUNNER is not set
CONFIG_NET_SB1000=m
CONFIG_PHYLIB=y
CONFIG_SWPHY=y
# CONFIG_LED_TRIGGER_PHY is not set

#
# MDIO bus device drivers
#
CONFIG_MDIO_BCM_UNIMAC=m
CONFIG_MDIO_BITBANG=m
CONFIG_MDIO_BUS_MUX=m
CONFIG_MDIO_BUS_MUX_GPIO=m
# CONFIG_MDIO_BUS_MUX_MMIOREG is not set
# CONFIG_MDIO_GPIO is not set
# CONFIG_MDIO_HISI_FEMAC is not set

#
# MII PHY device drivers
#
CONFIG_AMD_PHY=m
CONFIG_AQUANTIA_PHY=y
CONFIG_AT803X_PHY=y
CONFIG_BCM7XXX_PHY=y
# CONFIG_BCM87XX_PHY is not set
CONFIG_BCM_NET_PHYLIB=y
CONFIG_BROADCOM_PHY=m
CONFIG_CICADA_PHY=y
CONFIG_DAVICOM_PHY=m
CONFIG_DP83848_PHY=m
CONFIG_DP83867_PHY=m
CONFIG_FIXED_PHY=y
CONFIG_ICPLUS_PHY=y
CONFIG_INTEL_XWAY_PHY=y
CONFIG_LSI_ET1011C_PHY=m
# CONFIG_LXT_PHY is not set
CONFIG_MARVELL_PHY=m
# CONFIG_MESON_GXL_PHY is not set
CONFIG_MICREL_PHY=y
CONFIG_MICROCHIP_PHY=m
# CONFIG_MICROSEMI_PHY is not set
# CONFIG_NATIONAL_PHY is not set
CONFIG_QSEMI_PHY=m
# CONFIG_REALTEK_PHY is not set
CONFIG_SMSC_PHY=m
CONFIG_STE10XP=y
CONFIG_TERANETICS_PHY=y
CONFIG_VITESSE_PHY=y
CONFIG_XILINX_GMII2RGMII=y
CONFIG_MICREL_KS8995MA=y
CONFIG_PPP=m
CONFIG_PPP_BSDCOMP=m
# CONFIG_PPP_DEFLATE is not set
# CONFIG_PPP_FILTER is not set
CONFIG_PPP_MPPE=m
# CONFIG_PPP_MULTILINK is not set
CONFIG_PPPOE=m
CONFIG_PPTP=m
CONFIG_PPPOL2TP=m
# CONFIG_PPP_ASYNC is not set
# CONFIG_PPP_SYNC_TTY is not set
# CONFIG_SLIP is not set
CONFIG_SLHC=m
CONFIG_USB_NET_DRIVERS=m
CONFIG_USB_CATC=m
CONFIG_USB_KAWETH=m
# CONFIG_USB_PEGASUS is not set
CONFIG_USB_RTL8150=m
# CONFIG_USB_RTL8152 is not set
# CONFIG_USB_LAN78XX is not set
CONFIG_USB_USBNET=m
CONFIG_USB_NET_AX8817X=m
# CONFIG_USB_NET_AX88179_178A is not set
CONFIG_USB_NET_CDCETHER=m
CONFIG_USB_NET_CDC_EEM=m
CONFIG_USB_NET_CDC_NCM=m
# CONFIG_USB_NET_HUAWEI_CDC_NCM is not set
# CONFIG_USB_NET_CDC_MBIM is not set
CONFIG_USB_NET_DM9601=m
CONFIG_USB_NET_SR9700=m
# CONFIG_USB_NET_SR9800 is not set
CONFIG_USB_NET_SMSC75XX=m
CONFIG_USB_NET_SMSC95XX=m
# CONFIG_USB_NET_GL620A is not set
CONFIG_USB_NET_NET1080=m
# CONFIG_USB_NET_PLUSB is not set
# CONFIG_USB_NET_MCS7830 is not set
CONFIG_USB_NET_RNDIS_HOST=m
# CONFIG_USB_NET_CDC_SUBSET is not set
# CONFIG_USB_NET_ZAURUS is not set
# CONFIG_USB_NET_CX82310_ETH is not set
# CONFIG_USB_NET_KALMIA is not set
CONFIG_USB_NET_QMI_WWAN=m
# CONFIG_USB_HSO is not set
# CONFIG_USB_NET_INT51X1 is not set
# CONFIG_USB_CDC_PHONET is not set
CONFIG_USB_IPHETH=m
# CONFIG_USB_SIERRA_NET is not set
CONFIG_USB_VL600=m
CONFIG_USB_NET_CH9200=m
CONFIG_WLAN=y
CONFIG_WLAN_VENDOR_ADMTEK=y
# CONFIG_WLAN_VENDOR_ATH is not set
CONFIG_WLAN_VENDOR_ATMEL=y
CONFIG_ATMEL=m
CONFIG_PCI_ATMEL=m
CONFIG_PCMCIA_ATMEL=m
CONFIG_WLAN_VENDOR_BROADCOM=y
CONFIG_BRCMUTIL=m
CONFIG_BRCMFMAC=m
CONFIG_BRCMFMAC_PROTO_BCDC=y
CONFIG_BRCMFMAC_SDIO=y
# CONFIG_BRCMFMAC_USB is not set
# CONFIG_BRCMFMAC_PCIE is not set
CONFIG_BRCM_TRACING=y
# CONFIG_BRCMDBG is not set
# CONFIG_WLAN_VENDOR_CISCO is not set
CONFIG_WLAN_VENDOR_INTEL=y
CONFIG_IPW2100=m
# CONFIG_IPW2100_MONITOR is not set
# CONFIG_IPW2100_DEBUG is not set
CONFIG_IPW2200=m
# CONFIG_IPW2200_MONITOR is not set
# CONFIG_IPW2200_QOS is not set
CONFIG_IPW2200_DEBUG=y
CONFIG_LIBIPW=m
# CONFIG_LIBIPW_DEBUG is not set
CONFIG_WLAN_VENDOR_INTERSIL=y
# CONFIG_HOSTAP is not set
CONFIG_HERMES=m
CONFIG_HERMES_PRISM=y
CONFIG_HERMES_CACHE_FW_ON_INIT=y
CONFIG_PLX_HERMES=m
CONFIG_TMD_HERMES=m
# CONFIG_NORTEL_HERMES is not set
# CONFIG_PCI_HERMES is not set
CONFIG_PCMCIA_HERMES=m
CONFIG_PCMCIA_SPECTRUM=m
CONFIG_ORINOCO_USB=m
CONFIG_PRISM54=y
# CONFIG_WLAN_VENDOR_MARVELL is not set
# CONFIG_WLAN_VENDOR_MEDIATEK is not set
# CONFIG_WLAN_VENDOR_RALINK is not set
# CONFIG_WLAN_VENDOR_REALTEK is not set
# CONFIG_WLAN_VENDOR_RSI is not set
CONFIG_WLAN_VENDOR_ST=y
CONFIG_WLAN_VENDOR_TI=y
CONFIG_WLAN_VENDOR_ZYDAS=y
CONFIG_USB_ZD1201=m
CONFIG_PCMCIA_RAYCS=m
# CONFIG_PCMCIA_WL3501 is not set
CONFIG_USB_NET_RNDIS_WLAN=m

#
# Enable WiMAX (Networking options) to see the WiMAX drivers
#
# CONFIG_WAN is not set
# CONFIG_IEEE802154_DRIVERS is not set
CONFIG_VMXNET3=y
CONFIG_FUJITSU_ES=y
# CONFIG_HYPERV_NET is not set
CONFIG_ISDN=y
CONFIG_ISDN_I4L=y
# CONFIG_ISDN_PPP is not set
# CONFIG_ISDN_AUDIO is not set

#
# ISDN feature submodules
#
CONFIG_ISDN_DRV_LOOP=m
# CONFIG_ISDN_DIVERSION is not set

#
# ISDN4Linux hardware drivers
#

#
# Passive cards
#
# CONFIG_ISDN_DRV_HISAX is not set
# CONFIG_ISDN_CAPI is not set
CONFIG_ISDN_DRV_GIGASET=m
CONFIG_GIGASET_I4L=y
# CONFIG_GIGASET_DUMMYLL is not set
CONFIG_GIGASET_BASE=m
CONFIG_GIGASET_M105=m
CONFIG_GIGASET_M101=m
CONFIG_GIGASET_DEBUG=y
# CONFIG_HYSDN is not set
CONFIG_MISDN=y
# CONFIG_MISDN_DSP is not set
# CONFIG_MISDN_L1OIP is not set

#
# mISDN hardware drivers
#
CONFIG_MISDN_HFCPCI=y
# CONFIG_MISDN_HFCMULTI is not set
# CONFIG_MISDN_HFCUSB is not set
CONFIG_MISDN_AVMFRITZ=y
CONFIG_MISDN_SPEEDFAX=y
# CONFIG_MISDN_INFINEON is not set
CONFIG_MISDN_W6692=y
CONFIG_MISDN_NETJET=y
CONFIG_MISDN_IPAC=y
CONFIG_MISDN_ISAR=y
CONFIG_ISDN_HDLC=y
# CONFIG_NVM is not set

#
# Input device support
#
CONFIG_INPUT=y
CONFIG_INPUT_LEDS=m
CONFIG_INPUT_FF_MEMLESS=y
CONFIG_INPUT_POLLDEV=y
CONFIG_INPUT_SPARSEKMAP=y
CONFIG_INPUT_MATRIXKMAP=m

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=y
CONFIG_INPUT_MOUSEDEV_PSAUX=y
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
CONFIG_INPUT_JOYDEV=y
CONFIG_INPUT_EVDEV=m
CONFIG_INPUT_EVBUG=y

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
# CONFIG_KEYBOARD_ADC is not set
# CONFIG_KEYBOARD_ADP5520 is not set
# CONFIG_KEYBOARD_ADP5588 is not set
# CONFIG_KEYBOARD_ADP5589 is not set
CONFIG_KEYBOARD_ATKBD=y
# CONFIG_KEYBOARD_QT1070 is not set
# CONFIG_KEYBOARD_QT2160 is not set
# CONFIG_KEYBOARD_LKKBD is not set
# CONFIG_KEYBOARD_GPIO is not set
# CONFIG_KEYBOARD_GPIO_POLLED is not set
# CONFIG_KEYBOARD_TCA6416 is not set
# CONFIG_KEYBOARD_TCA8418 is not set
# CONFIG_KEYBOARD_MATRIX is not set
# CONFIG_KEYBOARD_LM8323 is not set
# CONFIG_KEYBOARD_LM8333 is not set
# CONFIG_KEYBOARD_MAX7359 is not set
# CONFIG_KEYBOARD_MCS is not set
# CONFIG_KEYBOARD_MPR121 is not set
# CONFIG_KEYBOARD_NEWTON is not set
# CONFIG_KEYBOARD_OPENCORES is not set
# CONFIG_KEYBOARD_SAMSUNG is not set
# CONFIG_KEYBOARD_STOWAWAY is not set
# CONFIG_KEYBOARD_SUNKBD is not set
# CONFIG_KEYBOARD_STMPE is not set
# CONFIG_KEYBOARD_OMAP4 is not set
# CONFIG_KEYBOARD_XTKBD is not set
# CONFIG_KEYBOARD_CROS_EC is not set
# CONFIG_KEYBOARD_CAP11XX is not set
# CONFIG_KEYBOARD_BCM is not set
# CONFIG_INPUT_MOUSE is not set
# CONFIG_INPUT_JOYSTICK is not set
CONFIG_INPUT_TABLET=y
CONFIG_TABLET_USB_ACECAD=y
CONFIG_TABLET_USB_AIPTEK=y
# CONFIG_TABLET_USB_GTCO is not set
CONFIG_TABLET_USB_HANWANG=y
CONFIG_TABLET_USB_KBTAB=y
CONFIG_TABLET_USB_PEGASUS=y
CONFIG_TABLET_SERIAL_WACOM4=m
CONFIG_INPUT_TOUCHSCREEN=y
CONFIG_TOUCHSCREEN_PROPERTIES=y
CONFIG_TOUCHSCREEN_88PM860X=y
CONFIG_TOUCHSCREEN_ADS7846=m
CONFIG_TOUCHSCREEN_AD7877=y
# CONFIG_TOUCHSCREEN_AD7879 is not set
# CONFIG_TOUCHSCREEN_AR1021_I2C is not set
# CONFIG_TOUCHSCREEN_ATMEL_MXT is not set
# CONFIG_TOUCHSCREEN_AUO_PIXCIR is not set
# CONFIG_TOUCHSCREEN_BU21013 is not set
# CONFIG_TOUCHSCREEN_CHIPONE_ICN8318 is not set
# CONFIG_TOUCHSCREEN_CY8CTMG110 is not set
# CONFIG_TOUCHSCREEN_CYTTSP_CORE is not set
CONFIG_TOUCHSCREEN_CYTTSP4_CORE=y
CONFIG_TOUCHSCREEN_CYTTSP4_I2C=m
# CONFIG_TOUCHSCREEN_CYTTSP4_SPI is not set
CONFIG_TOUCHSCREEN_DA9052=y
CONFIG_TOUCHSCREEN_DYNAPRO=y
CONFIG_TOUCHSCREEN_HAMPSHIRE=m
# CONFIG_TOUCHSCREEN_EETI is not set
# CONFIG_TOUCHSCREEN_EGALAX is not set
CONFIG_TOUCHSCREEN_EGALAX_SERIAL=m
CONFIG_TOUCHSCREEN_FUJITSU=y
CONFIG_TOUCHSCREEN_GOODIX=y
CONFIG_TOUCHSCREEN_ILI210X=y
CONFIG_TOUCHSCREEN_GUNZE=y
# CONFIG_TOUCHSCREEN_EKTF2127 is not set
CONFIG_TOUCHSCREEN_ELAN=m
CONFIG_TOUCHSCREEN_ELO=m
CONFIG_TOUCHSCREEN_WACOM_W8001=y
# CONFIG_TOUCHSCREEN_WACOM_I2C is not set
CONFIG_TOUCHSCREEN_MAX11801=m
CONFIG_TOUCHSCREEN_MCS5000=m
# CONFIG_TOUCHSCREEN_MMS114 is not set
CONFIG_TOUCHSCREEN_MELFAS_MIP4=y
CONFIG_TOUCHSCREEN_MTOUCH=y
CONFIG_TOUCHSCREEN_IMX6UL_TSC=y
CONFIG_TOUCHSCREEN_INEXIO=y
# CONFIG_TOUCHSCREEN_MK712 is not set
# CONFIG_TOUCHSCREEN_PENMOUNT is not set
CONFIG_TOUCHSCREEN_EDT_FT5X06=m
# CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
# CONFIG_TOUCHSCREEN_TOUCHWIN is not set
CONFIG_TOUCHSCREEN_UCB1400=m
# CONFIG_TOUCHSCREEN_PIXCIR is not set
CONFIG_TOUCHSCREEN_WDT87XX_I2C=y
# CONFIG_TOUCHSCREEN_WM97XX is not set
# CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
CONFIG_TOUCHSCREEN_MC13783=y
CONFIG_TOUCHSCREEN_TOUCHIT213=m
# CONFIG_TOUCHSCREEN_TSC_SERIO is not set
CONFIG_TOUCHSCREEN_TSC200X_CORE=y
CONFIG_TOUCHSCREEN_TSC2004=y
CONFIG_TOUCHSCREEN_TSC2005=y
CONFIG_TOUCHSCREEN_TSC2007=y
# CONFIG_TOUCHSCREEN_PCAP is not set
CONFIG_TOUCHSCREEN_RM_TS=y
# CONFIG_TOUCHSCREEN_SILEAD is not set
# CONFIG_TOUCHSCREEN_SIS_I2C is not set
CONFIG_TOUCHSCREEN_ST1232=m
# CONFIG_TOUCHSCREEN_STMPE is not set
# CONFIG_TOUCHSCREEN_SUR40 is not set
# CONFIG_TOUCHSCREEN_SURFACE3_SPI is not set
CONFIG_TOUCHSCREEN_SX8654=m
CONFIG_TOUCHSCREEN_TPS6507X=m
# CONFIG_TOUCHSCREEN_ZFORCE is not set
CONFIG_TOUCHSCREEN_ROHM_BU21023=m
CONFIG_INPUT_MISC=y
CONFIG_INPUT_88PM860X_ONKEY=m
CONFIG_INPUT_88PM80X_ONKEY=m
# CONFIG_INPUT_AD714X is not set
CONFIG_INPUT_ATMEL_CAPTOUCH=m
CONFIG_INPUT_BMA150=y
# CONFIG_INPUT_E3X0_BUTTON is not set
CONFIG_INPUT_PCSPKR=y
CONFIG_INPUT_MAX8997_HAPTIC=y
# CONFIG_INPUT_MC13783_PWRBUTTON is not set
CONFIG_INPUT_MMA8450=y
# CONFIG_INPUT_MPU3050 is not set
CONFIG_INPUT_APANEL=y
CONFIG_INPUT_GP2A=y
CONFIG_INPUT_GPIO_BEEPER=m
CONFIG_INPUT_GPIO_TILT_POLLED=m
CONFIG_INPUT_GPIO_DECODER=m
CONFIG_INPUT_WISTRON_BTNS=y
# CONFIG_INPUT_ATLAS_BTNS is not set
CONFIG_INPUT_ATI_REMOTE2=y
CONFIG_INPUT_KEYSPAN_REMOTE=m
CONFIG_INPUT_KXTJ9=m
CONFIG_INPUT_KXTJ9_POLLED_MODE=y
# CONFIG_INPUT_POWERMATE is not set
CONFIG_INPUT_YEALINK=m
# CONFIG_INPUT_CM109 is not set
# CONFIG_INPUT_REGULATOR_HAPTIC is not set
# CONFIG_INPUT_TPS65218_PWRBUTTON is not set
CONFIG_INPUT_AXP20X_PEK=y
CONFIG_INPUT_TWL6040_VIBRA=y
# CONFIG_INPUT_UINPUT is not set
CONFIG_INPUT_PALMAS_PWRBUTTON=y
CONFIG_INPUT_PCF50633_PMU=m
# CONFIG_INPUT_PCF8574 is not set
CONFIG_INPUT_PWM_BEEPER=y
# CONFIG_INPUT_GPIO_ROTARY_ENCODER is not set
# CONFIG_INPUT_DA9052_ONKEY is not set
# CONFIG_INPUT_DA9063_ONKEY is not set
CONFIG_INPUT_PCAP=y
CONFIG_INPUT_ADXL34X=m
CONFIG_INPUT_ADXL34X_I2C=m
# CONFIG_INPUT_ADXL34X_SPI is not set
# CONFIG_INPUT_IMS_PCU is not set
CONFIG_INPUT_CMA3000=m
CONFIG_INPUT_CMA3000_I2C=m
# CONFIG_INPUT_IDEAPAD_SLIDEBAR is not set
# CONFIG_INPUT_DRV260X_HAPTICS is not set
CONFIG_INPUT_DRV2665_HAPTICS=y
CONFIG_INPUT_DRV2667_HAPTICS=y
CONFIG_RMI4_CORE=y
CONFIG_RMI4_I2C=y
# CONFIG_RMI4_SPI is not set
# CONFIG_RMI4_SMB is not set
CONFIG_RMI4_F03=y
# CONFIG_RMI4_F11 is not set
# CONFIG_RMI4_F12 is not set
CONFIG_RMI4_F30=y
# CONFIG_RMI4_F34 is not set
# CONFIG_RMI4_F54 is not set
CONFIG_RMI4_F55=y

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
CONFIG_SERIO_I8042=y
CONFIG_SERIO_SERPORT=m
# CONFIG_SERIO_CT82C710 is not set
CONFIG_SERIO_PCIPS2=y
CONFIG_SERIO_LIBPS2=y
# CONFIG_SERIO_RAW is not set
CONFIG_SERIO_ALTERA_PS2=y
CONFIG_SERIO_PS2MULT=m
# CONFIG_SERIO_ARC_PS2 is not set
CONFIG_SERIO_APBPS2=m
CONFIG_HYPERV_KEYBOARD=m
CONFIG_USERIO=y
CONFIG_GAMEPORT=y
CONFIG_GAMEPORT_NS558=m
# CONFIG_GAMEPORT_L4 is not set
# CONFIG_GAMEPORT_EMU10K1 is not set
CONFIG_GAMEPORT_FM801=m

#
# Character devices
#
CONFIG_TTY=y
CONFIG_VT=y
CONFIG_CONSOLE_TRANSLATIONS=y
CONFIG_VT_CONSOLE=y
CONFIG_HW_CONSOLE=y
CONFIG_VT_HW_CONSOLE_BINDING=y
CONFIG_UNIX98_PTYS=y
CONFIG_LEGACY_PTYS=y
CONFIG_LEGACY_PTY_COUNT=256
# CONFIG_SERIAL_NONSTANDARD is not set
# CONFIG_NOZOMI is not set
# CONFIG_N_GSM is not set
# CONFIG_TRACE_SINK is not set
CONFIG_DEVMEM=y
# CONFIG_DEVKMEM is not set

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=y
CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=y
CONFIG_SERIAL_8250_PNP=y
CONFIG_SERIAL_8250_FINTEK=y
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_DMA=y
CONFIG_SERIAL_8250_PCI=y
CONFIG_SERIAL_8250_CS=m
CONFIG_SERIAL_8250_NR_UARTS=4
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
CONFIG_SERIAL_8250_EXTENDED=y
CONFIG_SERIAL_8250_MANY_PORTS=y
CONFIG_SERIAL_8250_SHARE_IRQ=y
# CONFIG_SERIAL_8250_DETECT_IRQ is not set
CONFIG_SERIAL_8250_RSA=y
# CONFIG_SERIAL_8250_FSL is not set
# CONFIG_SERIAL_8250_DW is not set
# CONFIG_SERIAL_8250_RT288X is not set
CONFIG_SERIAL_8250_LPSS=y
CONFIG_SERIAL_8250_MID=y
# CONFIG_SERIAL_8250_MOXA is not set
CONFIG_SERIAL_OF_PLATFORM=y

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_MAX3100 is not set
CONFIG_SERIAL_MAX310X=m
CONFIG_SERIAL_UARTLITE=m
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
# CONFIG_SERIAL_JSM is not set
CONFIG_SERIAL_SCCNXP=m
# CONFIG_SERIAL_SC16IS7XX is not set
CONFIG_SERIAL_TIMBERDALE=y
# CONFIG_SERIAL_ALTERA_JTAGUART is not set
CONFIG_SERIAL_ALTERA_UART=m
CONFIG_SERIAL_ALTERA_UART_MAXPORTS=4
CONFIG_SERIAL_ALTERA_UART_BAUDRATE=115200
CONFIG_SERIAL_IFX6X60=y
CONFIG_SERIAL_PCH_UART=m
CONFIG_SERIAL_XILINX_PS_UART=y
CONFIG_SERIAL_XILINX_PS_UART_CONSOLE=y
# CONFIG_SERIAL_ARC is not set
CONFIG_SERIAL_RP2=y
CONFIG_SERIAL_RP2_NR_UARTS=32
CONFIG_SERIAL_FSL_LPUART=m
CONFIG_SERIAL_CONEXANT_DIGICOLOR=m
# CONFIG_SERIAL_MEN_Z135 is not set
CONFIG_HVC_DRIVER=y
# CONFIG_IPMI_HANDLER is not set
# CONFIG_HW_RANDOM is not set
CONFIG_NVRAM=m
CONFIG_R3964=m
CONFIG_APPLICOM=m
CONFIG_SONYPI=y

#
# PCMCIA character devices
#
CONFIG_SYNCLINK_CS=m
CONFIG_CARDMAN_4000=m
# CONFIG_CARDMAN_4040 is not set
CONFIG_SCR24X=m
# CONFIG_IPWIRELESS is not set
CONFIG_MWAVE=y
CONFIG_PC8736x_GPIO=m
CONFIG_NSC_GPIO=y
CONFIG_RAW_DRIVER=m
CONFIG_MAX_RAW_DEVS=256
# CONFIG_HPET is not set
CONFIG_HANGCHECK_TIMER=y
CONFIG_TCG_TPM=m
CONFIG_TCG_TIS_CORE=m
CONFIG_TCG_TIS=m
CONFIG_TCG_TIS_SPI=m
# CONFIG_TCG_TIS_I2C_ATMEL is not set
CONFIG_TCG_TIS_I2C_INFINEON=m
CONFIG_TCG_TIS_I2C_NUVOTON=m
CONFIG_TCG_NSC=m
CONFIG_TCG_ATMEL=m
# CONFIG_TCG_INFINEON is not set
CONFIG_TCG_CRB=m
# CONFIG_TCG_VTPM_PROXY is not set
CONFIG_TCG_TIS_ST33ZP24=m
CONFIG_TCG_TIS_ST33ZP24_I2C=m
CONFIG_TCG_TIS_ST33ZP24_SPI=m
CONFIG_TELCLOCK=y
CONFIG_DEVPORT=y
CONFIG_XILLYBUS=m
# CONFIG_XILLYBUS_PCIE is not set
CONFIG_XILLYBUS_OF=m

#
# I2C support
#
CONFIG_I2C=y
CONFIG_ACPI_I2C_OPREGION=y
CONFIG_I2C_BOARDINFO=y
CONFIG_I2C_COMPAT=y
CONFIG_I2C_CHARDEV=m
CONFIG_I2C_MUX=y

#
# Multiplexer I2C Chip support
#
CONFIG_I2C_ARB_GPIO_CHALLENGE=m
CONFIG_I2C_MUX_GPIO=m
# CONFIG_I2C_MUX_PCA9541 is not set
CONFIG_I2C_MUX_PCA954x=y
CONFIG_I2C_MUX_REG=m
# CONFIG_I2C_MUX_MLXCPLD is not set
CONFIG_I2C_HELPER_AUTO=y
CONFIG_I2C_SMBUS=y
CONFIG_I2C_ALGOBIT=y

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
CONFIG_I2C_ALI1535=m
# CONFIG_I2C_ALI1563 is not set
CONFIG_I2C_ALI15X3=y
CONFIG_I2C_AMD756=m
CONFIG_I2C_AMD756_S4882=m
CONFIG_I2C_AMD8111=m
CONFIG_I2C_I801=m
# CONFIG_I2C_ISCH is not set
CONFIG_I2C_ISMT=y
# CONFIG_I2C_PIIX4 is not set
# CONFIG_I2C_NFORCE2 is not set
CONFIG_I2C_SIS5595=y
CONFIG_I2C_SIS630=m
# CONFIG_I2C_SIS96X is not set
# CONFIG_I2C_VIA is not set
# CONFIG_I2C_VIAPRO is not set

#
# ACPI drivers
#
CONFIG_I2C_SCMI=m

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
# CONFIG_I2C_CBUS_GPIO is not set
CONFIG_I2C_DESIGNWARE_CORE=m
# CONFIG_I2C_DESIGNWARE_PLATFORM is not set
CONFIG_I2C_DESIGNWARE_PCI=m
CONFIG_I2C_EG20T=m
# CONFIG_I2C_EMEV2 is not set
CONFIG_I2C_GPIO=m
CONFIG_I2C_KEMPLD=m
CONFIG_I2C_OCORES=y
# CONFIG_I2C_PCA_PLATFORM is not set
CONFIG_I2C_PXA=y
CONFIG_I2C_PXA_PCI=y
# CONFIG_I2C_RK3X is not set
CONFIG_I2C_SIMTEC=m
CONFIG_I2C_XILINX=y

#
# External I2C/SMBus adapter drivers
#
CONFIG_I2C_DIOLAN_U2C=m
CONFIG_I2C_DLN2=y
CONFIG_I2C_PARPORT_LIGHT=y
CONFIG_I2C_ROBOTFUZZ_OSIF=m
# CONFIG_I2C_TAOS_EVM is not set
CONFIG_I2C_TINY_USB=m
# CONFIG_I2C_VIPERBOARD is not set

#
# Other I2C/SMBus bus drivers
#
CONFIG_I2C_CROS_EC_TUNNEL=m
CONFIG_SCx200_ACB=m
CONFIG_I2C_STUB=m
CONFIG_I2C_SLAVE=y
CONFIG_I2C_SLAVE_EEPROM=m
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
CONFIG_SPI=y
CONFIG_SPI_DEBUG=y
CONFIG_SPI_MASTER=y

#
# SPI Master Controller Drivers
#
# CONFIG_SPI_ALTERA is not set
# CONFIG_SPI_AXI_SPI_ENGINE is not set
CONFIG_SPI_BITBANG=y
CONFIG_SPI_CADENCE=y
CONFIG_SPI_DESIGNWARE=y
# CONFIG_SPI_DW_PCI is not set
CONFIG_SPI_DW_MMIO=y
# CONFIG_SPI_DLN2 is not set
# CONFIG_SPI_GPIO is not set
# CONFIG_SPI_FSL_SPI is not set
CONFIG_SPI_OC_TINY=y
# CONFIG_SPI_PXA2XX is not set
# CONFIG_SPI_PXA2XX_PCI is not set
# CONFIG_SPI_ROCKCHIP is not set
CONFIG_SPI_SC18IS602=y
# CONFIG_SPI_TOPCLIFF_PCH is not set
CONFIG_SPI_XCOMM=y
CONFIG_SPI_XILINX=y
# CONFIG_SPI_ZYNQMP_GQSPI is not set

#
# SPI Protocol Masters
#
CONFIG_SPI_SPIDEV=m
CONFIG_SPI_LOOPBACK_TEST=m
# CONFIG_SPI_TLE62X0 is not set
CONFIG_SPMI=y
# CONFIG_HSI is not set

#
# PPS support
#
CONFIG_PPS=m
# CONFIG_PPS_DEBUG is not set
CONFIG_NTP_PPS=y

#
# PPS clients support
#
CONFIG_PPS_CLIENT_KTIMER=m
CONFIG_PPS_CLIENT_LDISC=m
CONFIG_PPS_CLIENT_GPIO=m

#
# PPS generators support
#

#
# PTP clock support
#
# CONFIG_PTP_1588_CLOCK is not set
# CONFIG_PTP_1588_CLOCK_PCH is not set
CONFIG_GPIOLIB=y
CONFIG_OF_GPIO=y
CONFIG_GPIO_ACPI=y
CONFIG_GPIOLIB_IRQCHIP=y
CONFIG_DEBUG_GPIO=y
CONFIG_GPIO_SYSFS=y
CONFIG_GPIO_GENERIC=y
CONFIG_GPIO_MAX730X=m

#
# Memory mapped GPIO drivers
#
CONFIG_GPIO_74XX_MMIO=y
# CONFIG_GPIO_ALTERA is not set
CONFIG_GPIO_AMDPT=m
CONFIG_GPIO_AXP209=y
CONFIG_GPIO_DWAPB=y
# CONFIG_GPIO_GENERIC_PLATFORM is not set
CONFIG_GPIO_GRGPIO=m
CONFIG_GPIO_ICH=m
CONFIG_GPIO_LYNXPOINT=y
CONFIG_GPIO_MENZ127=m
CONFIG_GPIO_MOCKUP=m
CONFIG_GPIO_SYSCON=y
CONFIG_GPIO_VX855=y
# CONFIG_GPIO_XILINX is not set

#
# Port-mapped I/O GPIO drivers
#
# CONFIG_GPIO_F7188X is not set
CONFIG_GPIO_IT87=m
# CONFIG_GPIO_SCH is not set
# CONFIG_GPIO_SCH311X is not set

#
# I2C GPIO expanders
#
CONFIG_GPIO_ADP5588=y
# CONFIG_GPIO_ADP5588_IRQ is not set
CONFIG_GPIO_ADNP=y
CONFIG_GPIO_MAX7300=m
CONFIG_GPIO_MAX732X=y
CONFIG_GPIO_MAX732X_IRQ=y
CONFIG_GPIO_PCA953X=m
# CONFIG_GPIO_PCF857X is not set
# CONFIG_GPIO_TPIC2810 is not set

#
# MFD GPIO expanders
#
CONFIG_GPIO_ADP5520=m
CONFIG_GPIO_ARIZONA=y
CONFIG_GPIO_DA9052=y
CONFIG_GPIO_DLN2=y
CONFIG_GPIO_KEMPLD=m
CONFIG_GPIO_LP3943=m
CONFIG_GPIO_MAX77620=y
CONFIG_GPIO_PALMAS=y
# CONFIG_GPIO_STMPE is not set
CONFIG_GPIO_TIMBERDALE=y
# CONFIG_GPIO_TPS65218 is not set
CONFIG_GPIO_TPS6586X=y
CONFIG_GPIO_TPS65910=y
CONFIG_GPIO_TPS65912=m
CONFIG_GPIO_TWL6040=y
CONFIG_GPIO_UCB1400=m
# CONFIG_GPIO_WM8350 is not set
# CONFIG_GPIO_WM8994 is not set

#
# PCI GPIO expanders
#
# CONFIG_GPIO_AMD8111 is not set
# CONFIG_GPIO_BT8XX is not set
# CONFIG_GPIO_ML_IOH is not set
CONFIG_GPIO_PCH=y
# CONFIG_GPIO_RDC321X is not set
CONFIG_GPIO_SODAVILLE=y

#
# SPI GPIO expanders
#
CONFIG_GPIO_74X164=y
# CONFIG_GPIO_MAX7301 is not set
# CONFIG_GPIO_MC33880 is not set
CONFIG_GPIO_PISOSR=y

#
# SPI or I2C GPIO expanders
#
CONFIG_GPIO_MCP23S08=y

#
# USB GPIO expanders
#
# CONFIG_GPIO_VIPERBOARD is not set
CONFIG_W1=m
CONFIG_W1_CON=y

#
# 1-wire Bus Masters
#
CONFIG_W1_MASTER_MATROX=m
# CONFIG_W1_MASTER_DS2490 is not set
CONFIG_W1_MASTER_DS2482=m
CONFIG_W1_MASTER_DS1WM=m
CONFIG_W1_MASTER_GPIO=m

#
# 1-wire Slaves
#
CONFIG_W1_SLAVE_THERM=m
CONFIG_W1_SLAVE_SMEM=m
# CONFIG_W1_SLAVE_DS2408 is not set
CONFIG_W1_SLAVE_DS2413=m
CONFIG_W1_SLAVE_DS2406=m
CONFIG_W1_SLAVE_DS2423=m
CONFIG_W1_SLAVE_DS2431=m
CONFIG_W1_SLAVE_DS2433=m
CONFIG_W1_SLAVE_DS2433_CRC=y
# CONFIG_W1_SLAVE_DS2760 is not set
CONFIG_W1_SLAVE_DS2780=m
CONFIG_W1_SLAVE_DS2781=m
CONFIG_W1_SLAVE_DS28E04=m
CONFIG_W1_SLAVE_BQ27000=m
CONFIG_POWER_AVS=y
CONFIG_POWER_RESET=y
# CONFIG_POWER_RESET_GPIO is not set
# CONFIG_POWER_RESET_GPIO_RESTART is not set
CONFIG_POWER_RESET_LTC2952=y
# CONFIG_POWER_RESET_RESTART is not set
# CONFIG_POWER_RESET_SYSCON is not set
# CONFIG_POWER_RESET_SYSCON_POWEROFF is not set
CONFIG_REBOOT_MODE=m
CONFIG_SYSCON_REBOOT_MODE=m
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
CONFIG_PDA_POWER=m
CONFIG_GENERIC_ADC_BATTERY=m
CONFIG_WM8350_POWER=m
CONFIG_TEST_POWER=m
CONFIG_BATTERY_88PM860X=y
# CONFIG_BATTERY_ACT8945A is not set
CONFIG_BATTERY_DS2780=m
CONFIG_BATTERY_DS2781=m
CONFIG_BATTERY_DS2782=m
CONFIG_BATTERY_SBS=m
# CONFIG_BATTERY_BQ27XXX is not set
CONFIG_BATTERY_DA9052=m
CONFIG_BATTERY_DA9150=m
CONFIG_AXP288_CHARGER=m
# CONFIG_AXP288_FUEL_GAUGE is not set
CONFIG_BATTERY_MAX17040=m
CONFIG_BATTERY_MAX17042=m
CONFIG_CHARGER_88PM860X=y
CONFIG_CHARGER_PCF50633=m
CONFIG_CHARGER_ISP1704=y
CONFIG_CHARGER_MAX8903=y
CONFIG_CHARGER_LP8727=y
# CONFIG_CHARGER_GPIO is not set
# CONFIG_CHARGER_MANAGER is not set
CONFIG_CHARGER_MAX14577=m
# CONFIG_CHARGER_MAX8998 is not set
CONFIG_CHARGER_BQ2415X=y
# CONFIG_CHARGER_BQ24190 is not set
CONFIG_CHARGER_BQ24257=m
# CONFIG_CHARGER_BQ24735 is not set
CONFIG_CHARGER_BQ25890=y
# CONFIG_CHARGER_SMB347 is not set
CONFIG_CHARGER_TPS65090=y
CONFIG_BATTERY_GAUGE_LTC2941=m
CONFIG_BATTERY_RT5033=y
CONFIG_CHARGER_RT9455=y
CONFIG_AXP20X_POWER=m
CONFIG_HWMON=y
CONFIG_HWMON_VID=y
# CONFIG_HWMON_DEBUG_CHIP is not set

#
# Native drivers
#
# CONFIG_SENSORS_ABITUGURU is not set
# CONFIG_SENSORS_ABITUGURU3 is not set
CONFIG_SENSORS_AD7314=m
# CONFIG_SENSORS_AD7414 is not set
# CONFIG_SENSORS_AD7418 is not set
CONFIG_SENSORS_ADM1021=m
CONFIG_SENSORS_ADM1025=y
CONFIG_SENSORS_ADM1026=m
CONFIG_SENSORS_ADM1029=y
CONFIG_SENSORS_ADM1031=y
# CONFIG_SENSORS_ADM9240 is not set
CONFIG_SENSORS_ADT7X10=m
CONFIG_SENSORS_ADT7310=m
CONFIG_SENSORS_ADT7410=m
CONFIG_SENSORS_ADT7411=y
# CONFIG_SENSORS_ADT7462 is not set
CONFIG_SENSORS_ADT7470=m
# CONFIG_SENSORS_ADT7475 is not set
CONFIG_SENSORS_ASC7621=y
# CONFIG_SENSORS_K8TEMP is not set
CONFIG_SENSORS_K10TEMP=y
CONFIG_SENSORS_FAM15H_POWER=m
# CONFIG_SENSORS_APPLESMC is not set
CONFIG_SENSORS_ASB100=y
# CONFIG_SENSORS_ATXP1 is not set
# CONFIG_SENSORS_DS620 is not set
# CONFIG_SENSORS_DS1621 is not set
CONFIG_SENSORS_DELL_SMM=y
CONFIG_SENSORS_DA9052_ADC=y
CONFIG_SENSORS_I5K_AMB=m
CONFIG_SENSORS_F71805F=y
CONFIG_SENSORS_F71882FG=m
CONFIG_SENSORS_F75375S=y
# CONFIG_SENSORS_MC13783_ADC is not set
CONFIG_SENSORS_FSCHMD=y
CONFIG_SENSORS_FTSTEUTATES=y
CONFIG_SENSORS_GL518SM=m
CONFIG_SENSORS_GL520SM=y
CONFIG_SENSORS_G760A=m
CONFIG_SENSORS_G762=y
CONFIG_SENSORS_GPIO_FAN=m
CONFIG_SENSORS_HIH6130=m
CONFIG_SENSORS_IIO_HWMON=m
CONFIG_SENSORS_I5500=y
# CONFIG_SENSORS_CORETEMP is not set
CONFIG_SENSORS_IT87=m
# CONFIG_SENSORS_JC42 is not set
# CONFIG_SENSORS_POWR1220 is not set
CONFIG_SENSORS_LINEAGE=y
CONFIG_SENSORS_LTC2945=m
# CONFIG_SENSORS_LTC2990 is not set
CONFIG_SENSORS_LTC4151=y
# CONFIG_SENSORS_LTC4215 is not set
# CONFIG_SENSORS_LTC4222 is not set
CONFIG_SENSORS_LTC4245=m
CONFIG_SENSORS_LTC4260=m
# CONFIG_SENSORS_LTC4261 is not set
# CONFIG_SENSORS_MAX1111 is not set
# CONFIG_SENSORS_MAX16065 is not set
CONFIG_SENSORS_MAX1619=m
CONFIG_SENSORS_MAX1668=m
CONFIG_SENSORS_MAX197=y
CONFIG_SENSORS_MAX31722=m
CONFIG_SENSORS_MAX6639=m
CONFIG_SENSORS_MAX6642=m
# CONFIG_SENSORS_MAX6650 is not set
# CONFIG_SENSORS_MAX6697 is not set
# CONFIG_SENSORS_MAX31790 is not set
CONFIG_SENSORS_MCP3021=y
CONFIG_SENSORS_TC654=y
# CONFIG_SENSORS_MENF21BMC_HWMON is not set
CONFIG_SENSORS_ADCXX=y
CONFIG_SENSORS_LM63=y
CONFIG_SENSORS_LM70=m
# CONFIG_SENSORS_LM73 is not set
CONFIG_SENSORS_LM75=m
CONFIG_SENSORS_LM77=y
CONFIG_SENSORS_LM78=m
CONFIG_SENSORS_LM80=m
# CONFIG_SENSORS_LM83 is not set
CONFIG_SENSORS_LM85=y
# CONFIG_SENSORS_LM87 is not set
CONFIG_SENSORS_LM90=y
# CONFIG_SENSORS_LM92 is not set
# CONFIG_SENSORS_LM93 is not set
CONFIG_SENSORS_LM95234=y
CONFIG_SENSORS_LM95241=m
CONFIG_SENSORS_LM95245=m
CONFIG_SENSORS_PC87360=y
# CONFIG_SENSORS_PC87427 is not set
CONFIG_SENSORS_NTC_THERMISTOR=m
# CONFIG_SENSORS_NCT6683 is not set
# CONFIG_SENSORS_NCT6775 is not set
CONFIG_SENSORS_NCT7802=y
CONFIG_SENSORS_NCT7904=m
# CONFIG_SENSORS_PCF8591 is not set
CONFIG_PMBUS=y
# CONFIG_SENSORS_PMBUS is not set
# CONFIG_SENSORS_ADM1275 is not set
CONFIG_SENSORS_LM25066=m
CONFIG_SENSORS_LTC2978=y
CONFIG_SENSORS_LTC2978_REGULATOR=y
CONFIG_SENSORS_LTC3815=m
CONFIG_SENSORS_MAX16064=m
# CONFIG_SENSORS_MAX20751 is not set
CONFIG_SENSORS_MAX34440=y
# CONFIG_SENSORS_MAX8688 is not set
CONFIG_SENSORS_TPS40422=y
CONFIG_SENSORS_UCD9000=m
# CONFIG_SENSORS_UCD9200 is not set
CONFIG_SENSORS_ZL6100=y
# CONFIG_SENSORS_PWM_FAN is not set
CONFIG_SENSORS_SHT15=m
# CONFIG_SENSORS_SHT21 is not set
CONFIG_SENSORS_SHT3x=y
CONFIG_SENSORS_SHTC1=m
CONFIG_SENSORS_SIS5595=m
# CONFIG_SENSORS_DME1737 is not set
# CONFIG_SENSORS_EMC1403 is not set
CONFIG_SENSORS_EMC2103=m
CONFIG_SENSORS_EMC6W201=y
CONFIG_SENSORS_SMSC47M1=m
# CONFIG_SENSORS_SMSC47M192 is not set
CONFIG_SENSORS_SMSC47B397=y
CONFIG_SENSORS_SCH56XX_COMMON=y
CONFIG_SENSORS_SCH5627=m
CONFIG_SENSORS_SCH5636=y
CONFIG_SENSORS_SMM665=y
# CONFIG_SENSORS_ADC128D818 is not set
CONFIG_SENSORS_ADS1015=m
CONFIG_SENSORS_ADS7828=m
CONFIG_SENSORS_ADS7871=m
CONFIG_SENSORS_AMC6821=y
# CONFIG_SENSORS_INA209 is not set
CONFIG_SENSORS_INA2XX=y
CONFIG_SENSORS_INA3221=y
CONFIG_SENSORS_TC74=m
CONFIG_SENSORS_THMC50=m
CONFIG_SENSORS_TMP102=m
CONFIG_SENSORS_TMP103=y
# CONFIG_SENSORS_TMP108 is not set
CONFIG_SENSORS_TMP401=y
CONFIG_SENSORS_TMP421=m
# CONFIG_SENSORS_VIA_CPUTEMP is not set
CONFIG_SENSORS_VIA686A=y
CONFIG_SENSORS_VT1211=y
# CONFIG_SENSORS_VT8231 is not set
# CONFIG_SENSORS_W83781D is not set
CONFIG_SENSORS_W83791D=y
CONFIG_SENSORS_W83792D=m
CONFIG_SENSORS_W83793=m
# CONFIG_SENSORS_W83795 is not set
# CONFIG_SENSORS_W83L785TS is not set
CONFIG_SENSORS_W83L786NG=m
CONFIG_SENSORS_W83627HF=y
# CONFIG_SENSORS_W83627EHF is not set
CONFIG_SENSORS_WM8350=y

#
# ACPI drivers
#
# CONFIG_SENSORS_ACPI_POWER is not set
CONFIG_SENSORS_ATK0110=m
CONFIG_THERMAL=y
# CONFIG_THERMAL_HWMON is not set
CONFIG_THERMAL_OF=y
# CONFIG_THERMAL_WRITABLE_TRIPS is not set
# CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE is not set
CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE=y
# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
# CONFIG_THERMAL_DEFAULT_GOV_POWER_ALLOCATOR is not set
CONFIG_THERMAL_GOV_FAIR_SHARE=y
# CONFIG_THERMAL_GOV_STEP_WISE is not set
CONFIG_THERMAL_GOV_BANG_BANG=y
CONFIG_THERMAL_GOV_USER_SPACE=y
CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
CONFIG_THERMAL_EMULATION=y
CONFIG_MAX77620_THERMAL=y
CONFIG_QORIQ_THERMAL=m
# CONFIG_INTEL_POWERCLAMP is not set
# CONFIG_INTEL_SOC_DTS_THERMAL is not set

#
# ACPI INT340X thermal drivers
#
# CONFIG_INT340X_THERMAL is not set
CONFIG_INTEL_PCH_THERMAL=m
# CONFIG_QCOM_SPMI_TEMP_ALARM is not set
# CONFIG_GENERIC_ADC_THERMAL is not set
CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
# CONFIG_WATCHDOG_NOWAYOUT is not set
# CONFIG_WATCHDOG_SYSFS is not set

#
# Watchdog Device Drivers
#
# CONFIG_SOFT_WATCHDOG is not set
# CONFIG_DA9052_WATCHDOG is not set
# CONFIG_DA9062_WATCHDOG is not set
# CONFIG_GPIO_WATCHDOG is not set
CONFIG_MENF21BMC_WATCHDOG=m
# CONFIG_WDAT_WDT is not set
CONFIG_WM8350_WATCHDOG=y
# CONFIG_XILINX_WATCHDOG is not set
CONFIG_ZIIRAVE_WATCHDOG=m
CONFIG_CADENCE_WATCHDOG=y
# CONFIG_DW_WATCHDOG is not set
CONFIG_MAX63XX_WATCHDOG=m
# CONFIG_MAX77620_WATCHDOG is not set
CONFIG_ACQUIRE_WDT=m
# CONFIG_ADVANTECH_WDT is not set
CONFIG_ALIM1535_WDT=m
CONFIG_ALIM7101_WDT=m
CONFIG_F71808E_WDT=m
# CONFIG_SP5100_TCO is not set
CONFIG_SBC_FITPC2_WATCHDOG=m
# CONFIG_EUROTECH_WDT is not set
CONFIG_IB700_WDT=m
CONFIG_IBMASR=m
CONFIG_WAFER_WDT=m
CONFIG_I6300ESB_WDT=y
CONFIG_IE6XX_WDT=m
CONFIG_ITCO_WDT=m
CONFIG_ITCO_VENDOR_SUPPORT=y
# CONFIG_IT8712F_WDT is not set
CONFIG_IT87_WDT=m
CONFIG_HP_WATCHDOG=y
CONFIG_KEMPLD_WDT=m
CONFIG_HPWDT_NMI_DECODING=y
# CONFIG_SC1200_WDT is not set
CONFIG_PC87413_WDT=m
# CONFIG_NV_TCO is not set
CONFIG_60XX_WDT=y
# CONFIG_SBC8360_WDT is not set
# CONFIG_SBC7240_WDT is not set
# CONFIG_CPU5_WDT is not set
# CONFIG_SMSC_SCH311X_WDT is not set
# CONFIG_SMSC37B787_WDT is not set
# CONFIG_VIA_WDT is not set
# CONFIG_W83627HF_WDT is not set
# CONFIG_W83877F_WDT is not set
CONFIG_W83977F_WDT=m
CONFIG_MACHZ_WDT=y
CONFIG_SBC_EPX_C3_WATCHDOG=m
CONFIG_INTEL_MEI_WDT=m
CONFIG_NI903X_WDT=m
CONFIG_MEN_A21_WDT=m

#
# PCI-based Watchdog Cards
#
CONFIG_PCIPCWATCHDOG=y
CONFIG_WDTPCI=y

#
# USB-based Watchdog Cards
#
CONFIG_USBPCWATCHDOG=m

#
# Watchdog Pretimeout Governors
#
CONFIG_WATCHDOG_PRETIMEOUT_GOV=y
# CONFIG_WATCHDOG_PRETIMEOUT_DEFAULT_GOV_NOOP is not set
CONFIG_WATCHDOG_PRETIMEOUT_DEFAULT_GOV_PANIC=y
CONFIG_WATCHDOG_PRETIMEOUT_GOV_NOOP=m
CONFIG_WATCHDOG_PRETIMEOUT_GOV_PANIC=y
CONFIG_SSB_POSSIBLE=y

#
# Sonics Silicon Backplane
#
CONFIG_SSB=y
CONFIG_SSB_SPROM=y
CONFIG_SSB_PCIHOST_POSSIBLE=y
CONFIG_SSB_PCIHOST=y
# CONFIG_SSB_B43_PCI_BRIDGE is not set
CONFIG_SSB_SDIOHOST_POSSIBLE=y
CONFIG_SSB_SDIOHOST=y
CONFIG_SSB_DEBUG=y
CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=y
CONFIG_SSB_DRIVER_PCICORE=y
# CONFIG_SSB_DRIVER_GPIO is not set
CONFIG_BCMA_POSSIBLE=y

#
# Broadcom specific AMBA
#
CONFIG_BCMA=m
CONFIG_BCMA_HOST_PCI_POSSIBLE=y
# CONFIG_BCMA_HOST_PCI is not set
CONFIG_BCMA_HOST_SOC=y
CONFIG_BCMA_DRIVER_PCI=y
# CONFIG_BCMA_SFLASH is not set
# CONFIG_BCMA_DRIVER_GMAC_CMN is not set
CONFIG_BCMA_DRIVER_GPIO=y
# CONFIG_BCMA_DEBUG is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
# CONFIG_MFD_CS5535 is not set
CONFIG_MFD_ACT8945A=y
# CONFIG_MFD_AS3711 is not set
# CONFIG_MFD_AS3722 is not set
CONFIG_PMIC_ADP5520=y
CONFIG_MFD_AAT2870_CORE=y
CONFIG_MFD_ATMEL_FLEXCOM=y
CONFIG_MFD_ATMEL_HLCDC=y
# CONFIG_MFD_BCM590XX is not set
CONFIG_MFD_AXP20X=y
CONFIG_MFD_AXP20X_I2C=y
CONFIG_MFD_CROS_EC=m
CONFIG_MFD_CROS_EC_I2C=m
# CONFIG_MFD_CROS_EC_SPI is not set
# CONFIG_PMIC_DA903X is not set
CONFIG_PMIC_DA9052=y
# CONFIG_MFD_DA9052_SPI is not set
CONFIG_MFD_DA9052_I2C=y
# CONFIG_MFD_DA9055 is not set
CONFIG_MFD_DA9062=y
# CONFIG_MFD_DA9063 is not set
CONFIG_MFD_DA9150=y
CONFIG_MFD_DLN2=y
CONFIG_MFD_MC13XXX=y
CONFIG_MFD_MC13XXX_SPI=m
CONFIG_MFD_MC13XXX_I2C=y
CONFIG_MFD_HI6421_PMIC=m
CONFIG_HTC_PASIC3=y
# CONFIG_HTC_I2CPLD is not set
CONFIG_MFD_INTEL_QUARK_I2C_GPIO=m
CONFIG_LPC_ICH=m
CONFIG_LPC_SCH=y
# CONFIG_INTEL_SOC_PMIC is not set
CONFIG_MFD_INTEL_LPSS=y
CONFIG_MFD_INTEL_LPSS_ACPI=y
CONFIG_MFD_INTEL_LPSS_PCI=m
# CONFIG_MFD_JANZ_CMODIO is not set
CONFIG_MFD_KEMPLD=m
CONFIG_MFD_88PM800=m
CONFIG_MFD_88PM805=y
CONFIG_MFD_88PM860X=y
CONFIG_MFD_MAX14577=m
CONFIG_MFD_MAX77620=y
# CONFIG_MFD_MAX77686 is not set
# CONFIG_MFD_MAX77693 is not set
# CONFIG_MFD_MAX77843 is not set
CONFIG_MFD_MAX8907=y
# CONFIG_MFD_MAX8925 is not set
CONFIG_MFD_MAX8997=y
CONFIG_MFD_MAX8998=y
CONFIG_MFD_MT6397=y
CONFIG_MFD_MENF21BMC=m
CONFIG_EZX_PCAP=y
CONFIG_MFD_VIPERBOARD=y
# CONFIG_MFD_RETU is not set
CONFIG_MFD_PCF50633=m
# CONFIG_PCF50633_ADC is not set
# CONFIG_PCF50633_GPIO is not set
CONFIG_UCB1400_CORE=m
CONFIG_MFD_RDC321X=m
CONFIG_MFD_RTSX_PCI=m
CONFIG_MFD_RT5033=y
CONFIG_MFD_RTSX_USB=y
# CONFIG_MFD_RC5T583 is not set
# CONFIG_MFD_RK808 is not set
# CONFIG_MFD_RN5T618 is not set
# CONFIG_MFD_SEC_CORE is not set
CONFIG_MFD_SI476X_CORE=y
CONFIG_MFD_SM501=y
# CONFIG_MFD_SM501_GPIO is not set
CONFIG_MFD_SKY81452=m
# CONFIG_MFD_SMSC is not set
CONFIG_ABX500_CORE=y
CONFIG_AB3100_CORE=y
# CONFIG_AB3100_OTP is not set
CONFIG_MFD_STMPE=y

#
# STMicroelectronics STMPE Interface Drivers
#
CONFIG_STMPE_I2C=y
# CONFIG_STMPE_SPI is not set
CONFIG_MFD_SYSCON=y
# CONFIG_MFD_TI_AM335X_TSCADC is not set
CONFIG_MFD_LP3943=m
# CONFIG_MFD_LP8788 is not set
CONFIG_MFD_PALMAS=y
CONFIG_TPS6105X=y
# CONFIG_TPS65010 is not set
CONFIG_TPS6507X=y
# CONFIG_MFD_TPS65086 is not set
CONFIG_MFD_TPS65090=y
# CONFIG_MFD_TPS65217 is not set
# CONFIG_MFD_TI_LP873X is not set
CONFIG_MFD_TPS65218=y
CONFIG_MFD_TPS6586X=y
CONFIG_MFD_TPS65910=y
CONFIG_MFD_TPS65912=m
CONFIG_MFD_TPS65912_I2C=m
# CONFIG_MFD_TPS65912_SPI is not set
CONFIG_MFD_TPS80031=y
# CONFIG_TWL4030_CORE is not set
CONFIG_TWL6040_CORE=y
CONFIG_MFD_WL1273_CORE=y
CONFIG_MFD_LM3533=y
CONFIG_MFD_TIMBERDALE=y
# CONFIG_MFD_TC3589X is not set
# CONFIG_MFD_TMIO is not set
CONFIG_MFD_VX855=y
CONFIG_MFD_ARIZONA=y
CONFIG_MFD_ARIZONA_I2C=y
CONFIG_MFD_ARIZONA_SPI=m
# CONFIG_MFD_CS47L24 is not set
CONFIG_MFD_WM5102=y
# CONFIG_MFD_WM5110 is not set
# CONFIG_MFD_WM8997 is not set
CONFIG_MFD_WM8998=y
CONFIG_MFD_WM8400=y
# CONFIG_MFD_WM831X_I2C is not set
# CONFIG_MFD_WM831X_SPI is not set
CONFIG_MFD_WM8350=y
CONFIG_MFD_WM8350_I2C=y
CONFIG_MFD_WM8994=m
CONFIG_REGULATOR=y
# CONFIG_REGULATOR_DEBUG is not set
CONFIG_REGULATOR_FIXED_VOLTAGE=y
CONFIG_REGULATOR_VIRTUAL_CONSUMER=y
CONFIG_REGULATOR_USERSPACE_CONSUMER=y
CONFIG_REGULATOR_88PM800=m
# CONFIG_REGULATOR_88PM8607 is not set
# CONFIG_REGULATOR_ACT8865 is not set
CONFIG_REGULATOR_ACT8945A=y
CONFIG_REGULATOR_AD5398=m
CONFIG_REGULATOR_ANATOP=y
CONFIG_REGULATOR_AAT2870=m
CONFIG_REGULATOR_AB3100=y
CONFIG_REGULATOR_AXP20X=y
# CONFIG_REGULATOR_DA9052 is not set
# CONFIG_REGULATOR_DA9062 is not set
CONFIG_REGULATOR_DA9210=m
CONFIG_REGULATOR_DA9211=y
CONFIG_REGULATOR_FAN53555=m
CONFIG_REGULATOR_GPIO=m
# CONFIG_REGULATOR_HI6421 is not set
CONFIG_REGULATOR_ISL9305=y
CONFIG_REGULATOR_ISL6271A=m
CONFIG_REGULATOR_LP3971=y
CONFIG_REGULATOR_LP3972=y
CONFIG_REGULATOR_LP872X=y
CONFIG_REGULATOR_LP8755=m
# CONFIG_REGULATOR_LTC3589 is not set
CONFIG_REGULATOR_LTC3676=y
CONFIG_REGULATOR_MAX14577=m
# CONFIG_REGULATOR_MAX1586 is not set
CONFIG_REGULATOR_MAX77620=y
CONFIG_REGULATOR_MAX8649=y
# CONFIG_REGULATOR_MAX8660 is not set
CONFIG_REGULATOR_MAX8907=m
CONFIG_REGULATOR_MAX8952=m
CONFIG_REGULATOR_MAX8973=y
# CONFIG_REGULATOR_MAX8997 is not set
CONFIG_REGULATOR_MAX8998=y
CONFIG_REGULATOR_MC13XXX_CORE=m
# CONFIG_REGULATOR_MC13783 is not set
CONFIG_REGULATOR_MC13892=m
CONFIG_REGULATOR_MT6311=y
CONFIG_REGULATOR_MT6323=y
CONFIG_REGULATOR_MT6397=m
# CONFIG_REGULATOR_PALMAS is not set
CONFIG_REGULATOR_PCAP=y
CONFIG_REGULATOR_PCF50633=m
CONFIG_REGULATOR_PFUZE100=m
# CONFIG_REGULATOR_PV88060 is not set
CONFIG_REGULATOR_PV88080=y
CONFIG_REGULATOR_PV88090=y
CONFIG_REGULATOR_PWM=m
CONFIG_REGULATOR_QCOM_SPMI=m
CONFIG_REGULATOR_RT5033=y
CONFIG_REGULATOR_SKY81452=m
CONFIG_REGULATOR_TPS51632=y
# CONFIG_REGULATOR_TPS6105X is not set
CONFIG_REGULATOR_TPS62360=m
# CONFIG_REGULATOR_TPS65023 is not set
CONFIG_REGULATOR_TPS6507X=y
# CONFIG_REGULATOR_TPS65090 is not set
CONFIG_REGULATOR_TPS65218=m
# CONFIG_REGULATOR_TPS6524X is not set
# CONFIG_REGULATOR_TPS6586X is not set
CONFIG_REGULATOR_TPS65910=m
CONFIG_REGULATOR_TPS65912=m
CONFIG_REGULATOR_TPS80031=m
CONFIG_REGULATOR_WM8350=m
# CONFIG_REGULATOR_WM8400 is not set
CONFIG_REGULATOR_WM8994=m
CONFIG_MEDIA_SUPPORT=y

#
# Multimedia core support
#
CONFIG_MEDIA_CAMERA_SUPPORT=y
# CONFIG_MEDIA_ANALOG_TV_SUPPORT is not set
CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y
# CONFIG_MEDIA_RADIO_SUPPORT is not set
CONFIG_MEDIA_SDR_SUPPORT=y
# CONFIG_MEDIA_RC_SUPPORT is not set
CONFIG_MEDIA_CEC_SUPPORT=y
CONFIG_MEDIA_CEC_DEBUG=y
CONFIG_MEDIA_CEC_EDID=y
# CONFIG_MEDIA_CONTROLLER is not set
CONFIG_VIDEO_DEV=y
CONFIG_VIDEO_V4L2=y
# CONFIG_VIDEO_ADV_DEBUG is not set
CONFIG_VIDEO_FIXED_MINOR_RANGES=y
# CONFIG_VIDEO_PCI_SKELETON is not set
CONFIG_VIDEO_TUNER=y
CONFIG_VIDEOBUF_GEN=y
CONFIG_VIDEOBUF_DMA_SG=y
CONFIG_VIDEOBUF2_CORE=y
CONFIG_VIDEOBUF2_MEMOPS=y
CONFIG_VIDEOBUF2_DMA_CONTIG=y
CONFIG_VIDEOBUF2_VMALLOC=y
CONFIG_VIDEOBUF2_DMA_SG=y
CONFIG_VIDEOBUF2_DVB=y
CONFIG_DVB_CORE=y
# CONFIG_DVB_NET is not set
CONFIG_TTPCI_EEPROM=y
CONFIG_DVB_MAX_ADAPTERS=16
# CONFIG_DVB_DYNAMIC_MINORS is not set
# CONFIG_DVB_DEMUX_SECTION_LOSS_LOG is not set

#
# Media drivers
#
CONFIG_MEDIA_USB_SUPPORT=y

#
# Webcam devices
#
# CONFIG_USB_VIDEO_CLASS is not set
CONFIG_USB_GSPCA=y
CONFIG_USB_M5602=m
CONFIG_USB_STV06XX=y
# CONFIG_USB_GL860 is not set
CONFIG_USB_GSPCA_BENQ=y
CONFIG_USB_GSPCA_CONEX=m
CONFIG_USB_GSPCA_CPIA1=y
# CONFIG_USB_GSPCA_DTCS033 is not set
# CONFIG_USB_GSPCA_ETOMS is not set
CONFIG_USB_GSPCA_FINEPIX=m
# CONFIG_USB_GSPCA_JEILINJ is not set
CONFIG_USB_GSPCA_JL2005BCD=m
CONFIG_USB_GSPCA_KINECT=m
CONFIG_USB_GSPCA_KONICA=m
CONFIG_USB_GSPCA_MARS=m
# CONFIG_USB_GSPCA_MR97310A is not set
CONFIG_USB_GSPCA_NW80X=y
# CONFIG_USB_GSPCA_OV519 is not set
CONFIG_USB_GSPCA_OV534=y
CONFIG_USB_GSPCA_OV534_9=y
# CONFIG_USB_GSPCA_PAC207 is not set
CONFIG_USB_GSPCA_PAC7302=m
# CONFIG_USB_GSPCA_PAC7311 is not set
# CONFIG_USB_GSPCA_SE401 is not set
CONFIG_USB_GSPCA_SN9C2028=m
# CONFIG_USB_GSPCA_SN9C20X is not set
CONFIG_USB_GSPCA_SONIXB=y
CONFIG_USB_GSPCA_SONIXJ=m
CONFIG_USB_GSPCA_SPCA500=m
# CONFIG_USB_GSPCA_SPCA501 is not set
# CONFIG_USB_GSPCA_SPCA505 is not set
CONFIG_USB_GSPCA_SPCA506=m
# CONFIG_USB_GSPCA_SPCA508 is not set
CONFIG_USB_GSPCA_SPCA561=y
CONFIG_USB_GSPCA_SPCA1528=y
CONFIG_USB_GSPCA_SQ905=m
# CONFIG_USB_GSPCA_SQ905C is not set
CONFIG_USB_GSPCA_SQ930X=y
CONFIG_USB_GSPCA_STK014=y
CONFIG_USB_GSPCA_STK1135=y
CONFIG_USB_GSPCA_STV0680=m
# CONFIG_USB_GSPCA_SUNPLUS is not set
CONFIG_USB_GSPCA_T613=m
CONFIG_USB_GSPCA_TOPRO=m
CONFIG_USB_GSPCA_TOUPTEK=y
CONFIG_USB_GSPCA_TV8532=m
# CONFIG_USB_GSPCA_VC032X is not set
CONFIG_USB_GSPCA_VICAM=m
# CONFIG_USB_GSPCA_XIRLINK_CIT is not set
CONFIG_USB_GSPCA_ZC3XX=y
CONFIG_USB_PWC=m
# CONFIG_USB_PWC_DEBUG is not set
CONFIG_USB_PWC_INPUT_EVDEV=y
CONFIG_VIDEO_CPIA2=m
# CONFIG_USB_ZR364XX is not set
CONFIG_USB_STKWEBCAM=y
# CONFIG_USB_S2255 is not set
# CONFIG_VIDEO_USBTV is not set

#
# Analog/digital TV USB devices
#
# CONFIG_VIDEO_AU0828 is not set

#
# Digital TV USB devices
#
CONFIG_DVB_USB_V2=y
CONFIG_DVB_USB_AF9015=m
CONFIG_DVB_USB_AF9035=m
# CONFIG_DVB_USB_ANYSEE is not set
CONFIG_DVB_USB_AU6610=y
CONFIG_DVB_USB_AZ6007=m
CONFIG_DVB_USB_CE6230=m
CONFIG_DVB_USB_EC168=m
CONFIG_DVB_USB_GL861=m
CONFIG_DVB_USB_MXL111SF=m
CONFIG_DVB_USB_RTL28XXU=y
# CONFIG_DVB_USB_DVBSKY is not set
CONFIG_DVB_TTUSB_BUDGET=m
# CONFIG_DVB_TTUSB_DEC is not set
CONFIG_SMS_USB_DRV=m
# CONFIG_DVB_B2C2_FLEXCOP_USB is not set
CONFIG_DVB_AS102=m

#
# Webcam, TV (analog/digital) USB devices
#
CONFIG_VIDEO_EM28XX=y
# CONFIG_VIDEO_EM28XX_V4L2 is not set
# CONFIG_VIDEO_EM28XX_ALSA is not set
# CONFIG_VIDEO_EM28XX_DVB is not set

#
# Software defined radio USB devices
#
CONFIG_USB_AIRSPY=y
CONFIG_USB_HACKRF=m
# CONFIG_USB_MSI2500 is not set

#
# USB HDMI CEC adapters
#
CONFIG_USB_PULSE8_CEC=m
CONFIG_MEDIA_PCI_SUPPORT=y

#
# Media capture support
#
CONFIG_VIDEO_MEYE=m
CONFIG_VIDEO_SOLO6X10=m
CONFIG_VIDEO_TW5864=y
CONFIG_VIDEO_TW68=y
CONFIG_VIDEO_TW686X=m
# CONFIG_VIDEO_ZORAN is not set

#
# Media capture/analog/hybrid TV support
#
CONFIG_VIDEO_CX25821=y
CONFIG_VIDEO_CX25821_ALSA=m
CONFIG_VIDEO_SAA7134=m
CONFIG_VIDEO_SAA7134_ALSA=m
CONFIG_VIDEO_SAA7134_DVB=m
# CONFIG_VIDEO_SAA7164 is not set

#
# Media digital TV PCI Adapters
#
CONFIG_DVB_AV7110=y
# CONFIG_DVB_AV7110_OSD is not set
# CONFIG_DVB_BUDGET_CORE is not set
# CONFIG_DVB_B2C2_FLEXCOP_PCI is not set
CONFIG_DVB_PLUTO2=m
CONFIG_DVB_PT1=m
CONFIG_DVB_PT3=y
CONFIG_DVB_NGENE=y
CONFIG_DVB_DDBRIDGE=m
CONFIG_DVB_NETUP_UNIDVB=y
CONFIG_V4L_PLATFORM_DRIVERS=y
CONFIG_VIDEO_CAFE_CCIC=y
CONFIG_VIDEO_VIA_CAMERA=m
CONFIG_SOC_CAMERA=m
# CONFIG_SOC_CAMERA_PLATFORM is not set
# CONFIG_V4L_MEM2MEM_DRIVERS is not set
# CONFIG_V4L_TEST_DRIVERS is not set
CONFIG_DVB_PLATFORM_DRIVERS=y

#
# Supported MMC/SDIO adapters
#
# CONFIG_SMS_SDIO_DRV is not set
CONFIG_MEDIA_COMMON_OPTIONS=y

#
# common driver options
#
CONFIG_VIDEO_TVEEPROM=y
CONFIG_CYPRESS_FIRMWARE=m
CONFIG_VIDEO_SAA7146=y
CONFIG_VIDEO_SAA7146_VV=y
CONFIG_SMS_SIANO_MDTV=m

#
# Media ancillary drivers (tuners, sensors, i2c, spi, frontends)
#
CONFIG_MEDIA_SUBDRV_AUTOSELECT=y
CONFIG_MEDIA_ATTACH=y

#
# Audio decoders, processors and mixers
#

#
# RDS decoders
#
CONFIG_VIDEO_SAA6588=m

#
# Video decoders
#

#
# Video and audio decoders
#

#
# Video encoders
#

#
# Camera sensor devices
#
CONFIG_VIDEO_OV7670=y
CONFIG_VIDEO_MT9M111=m

#
# Flash devices
#

#
# Video improvement chips
#

#
# Audio/Video compression chips
#
CONFIG_VIDEO_SAA6752HS=m

#
# Miscellaneous helper chips
#

#
# Sensors used on soc_camera driver
#

#
# soc_camera sensor drivers
#
CONFIG_SOC_CAMERA_IMX074=m
# CONFIG_SOC_CAMERA_MT9M001 is not set
CONFIG_SOC_CAMERA_MT9M111=m
# CONFIG_SOC_CAMERA_MT9T031 is not set
CONFIG_SOC_CAMERA_MT9T112=m
CONFIG_SOC_CAMERA_MT9V022=m
# CONFIG_SOC_CAMERA_OV2640 is not set
CONFIG_SOC_CAMERA_OV5642=m
CONFIG_SOC_CAMERA_OV6650=m
CONFIG_SOC_CAMERA_OV772X=m
CONFIG_SOC_CAMERA_OV9640=m
# CONFIG_SOC_CAMERA_OV9740 is not set
CONFIG_SOC_CAMERA_RJ54N1=m
CONFIG_SOC_CAMERA_TW9910=m
CONFIG_MEDIA_TUNER=y
CONFIG_MEDIA_TUNER_SIMPLE=y
CONFIG_MEDIA_TUNER_TDA8290=y
CONFIG_MEDIA_TUNER_TDA827X=y
CONFIG_MEDIA_TUNER_TDA18271=y
CONFIG_MEDIA_TUNER_TDA9887=y
CONFIG_MEDIA_TUNER_MT20XX=y
CONFIG_MEDIA_TUNER_MT2060=y
CONFIG_MEDIA_TUNER_MT2063=m
CONFIG_MEDIA_TUNER_MT2131=y
CONFIG_MEDIA_TUNER_QT1010=y
CONFIG_MEDIA_TUNER_XC2028=y
CONFIG_MEDIA_TUNER_XC5000=y
CONFIG_MEDIA_TUNER_XC4000=y
CONFIG_MEDIA_TUNER_MXL5005S=y
CONFIG_MEDIA_TUNER_MXL5007T=m
CONFIG_MEDIA_TUNER_MC44S803=y
CONFIG_MEDIA_TUNER_TDA18218=m
CONFIG_MEDIA_TUNER_FC0011=m
CONFIG_MEDIA_TUNER_FC0012=y
CONFIG_MEDIA_TUNER_FC0013=y
CONFIG_MEDIA_TUNER_E4000=y
CONFIG_MEDIA_TUNER_FC2580=y
CONFIG_MEDIA_TUNER_TUA9001=y
CONFIG_MEDIA_TUNER_SI2157=y
CONFIG_MEDIA_TUNER_IT913X=m
CONFIG_MEDIA_TUNER_R820T=y
CONFIG_MEDIA_TUNER_MXL301RF=y
CONFIG_MEDIA_TUNER_QM1D1C0042=y

#
# Multistandard (satellite) frontends
#
CONFIG_DVB_STV090x=y
CONFIG_DVB_STV6110x=y

#
# Multistandard (cable + terrestrial) frontends
#
CONFIG_DVB_DRXK=y
CONFIG_DVB_TDA18271C2DD=y
CONFIG_DVB_MN88472=y
CONFIG_DVB_MN88473=y

#
# DVB-S (satellite) frontends
#
CONFIG_DVB_MT312=m
CONFIG_DVB_ZL10036=m
CONFIG_DVB_ZL10039=m
CONFIG_DVB_STV0299=y
CONFIG_DVB_TDA8083=y
CONFIG_DVB_TDA10086=m
CONFIG_DVB_VES1X93=y
CONFIG_DVB_TDA826X=m

#
# DVB-T (terrestrial) frontends
#
CONFIG_DVB_SP8870=y
CONFIG_DVB_CX22700=m
CONFIG_DVB_L64781=y
CONFIG_DVB_TDA1004X=m
CONFIG_DVB_MT352=m
CONFIG_DVB_ZL10353=y
CONFIG_DVB_TDA10048=m
CONFIG_DVB_AF9013=m
CONFIG_DVB_EC100=m
CONFIG_DVB_CXD2841ER=y
CONFIG_DVB_RTL2830=y
CONFIG_DVB_RTL2832=y
CONFIG_DVB_RTL2832_SDR=y
CONFIG_DVB_SI2168=y
CONFIG_DVB_AS102_FE=m
# CONFIG_DVB_GP8PSK_FE is not set

#
# DVB-C (cable) frontends
#
CONFIG_DVB_VES1820=y
CONFIG_DVB_STV0297=y

#
# ATSC (North American/Korean Terrestrial/Cable DTV) frontends
#
CONFIG_DVB_NXT200X=m
CONFIG_DVB_LGDT330X=y
CONFIG_DVB_LGDT3305=m
CONFIG_DVB_LG2160=m

#
# ISDB-T (terrestrial) frontends
#

#
# ISDB-S (satellite) & ISDB-T (terrestrial) frontends
#
CONFIG_DVB_TC90522=y

#
# Digital terrestrial only tuners/PLL
#
CONFIG_DVB_PLL=m

#
# SEC control devices for DVB-S
#
CONFIG_DVB_LNBH25=y
CONFIG_DVB_LNBP21=y
CONFIG_DVB_ISL6405=m
CONFIG_DVB_ISL6421=m
CONFIG_DVB_AF9033=m
CONFIG_DVB_HORUS3A=y
CONFIG_DVB_ASCOT2E=y
CONFIG_DVB_HELENE=y

#
# Tools to develop new frontends
#
# CONFIG_DVB_DUMMY_FE is not set

#
# Graphics support
#
# CONFIG_AGP is not set
CONFIG_INTEL_GTT=m
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=16
# CONFIG_VGA_SWITCHEROO is not set
CONFIG_DRM=m
CONFIG_DRM_MIPI_DSI=y
CONFIG_DRM_DP_AUX_CHARDEV=y
CONFIG_DRM_KMS_HELPER=m
CONFIG_DRM_KMS_FB_HELPER=y
# CONFIG_DRM_FBDEV_EMULATION is not set
# CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
CONFIG_DRM_TTM=m
CONFIG_DRM_GEM_CMA_HELPER=y
CONFIG_DRM_KMS_CMA_HELPER=y

#
# I2C encoder or helper chips
#
# CONFIG_DRM_I2C_CH7006 is not set
CONFIG_DRM_I2C_SIL164=m
CONFIG_DRM_I2C_NXP_TDA998X=m
# CONFIG_DRM_RADEON is not set
CONFIG_DRM_AMDGPU=m
CONFIG_DRM_AMDGPU_SI=y
CONFIG_DRM_AMDGPU_CIK=y
# CONFIG_DRM_AMDGPU_USERPTR is not set
# CONFIG_DRM_AMDGPU_GART_DEBUGFS is not set

#
# ACP (Audio CoProcessor) Configuration
#
# CONFIG_DRM_AMD_ACP is not set
CONFIG_DRM_NOUVEAU=m
CONFIG_NOUVEAU_DEBUG=5
CONFIG_NOUVEAU_DEBUG_DEFAULT=3
CONFIG_DRM_NOUVEAU_BACKLIGHT=y
CONFIG_DRM_I915=m
# CONFIG_DRM_I915_ALPHA_SUPPORT is not set
# CONFIG_DRM_I915_CAPTURE_ERROR is not set
# CONFIG_DRM_I915_USERPTR is not set
CONFIG_DRM_VGEM=m
CONFIG_DRM_VMWGFX=m
# CONFIG_DRM_VMWGFX_FBCON is not set
# CONFIG_DRM_GMA500 is not set
# CONFIG_DRM_UDL is not set
CONFIG_DRM_AST=m
CONFIG_DRM_MGAG200=m
CONFIG_DRM_CIRRUS_QEMU=m
CONFIG_DRM_QXL=m
CONFIG_DRM_BOCHS=m
CONFIG_DRM_PANEL=y

#
# Display Panels
#
CONFIG_DRM_PANEL_SIMPLE=m
CONFIG_DRM_PANEL_JDI_LT070ME05000=m
CONFIG_DRM_PANEL_SAMSUNG_LD9040=m
# CONFIG_DRM_PANEL_LG_LG4573 is not set
# CONFIG_DRM_PANEL_PANASONIC_VVX10F034N00 is not set
CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0=m
CONFIG_DRM_PANEL_SHARP_LQ101R1SX01=m
CONFIG_DRM_PANEL_SHARP_LS043T1LE01=m
CONFIG_DRM_BRIDGE=y

#
# Display Interface Bridges
#
CONFIG_DRM_ANALOGIX_ANX78XX=m
CONFIG_DRM_DUMB_VGA_DAC=m
CONFIG_DRM_NXP_PTN3460=m
CONFIG_DRM_PARADE_PS8622=m
CONFIG_DRM_SIL_SII8620=m
CONFIG_DRM_SII902X=m
CONFIG_DRM_TOSHIBA_TC358767=m
CONFIG_DRM_TI_TFP410=m
# CONFIG_DRM_I2C_ADV7511 is not set
CONFIG_DRM_ARCPGU=m
CONFIG_DRM_HISI_HIBMC=m
# CONFIG_DRM_MXSFB is not set
CONFIG_DRM_LEGACY=y
# CONFIG_DRM_TDFX is not set
CONFIG_DRM_R128=m
CONFIG_DRM_MGA=m
CONFIG_DRM_VIA=m
CONFIG_DRM_SAVAGE=m

#
# Frame buffer Devices
#
CONFIG_FB=m
CONFIG_FIRMWARE_EDID=y
CONFIG_FB_CMDLINE=y
CONFIG_FB_NOTIFY=y
CONFIG_FB_DDC=m
# CONFIG_FB_BOOT_VESA_SUPPORT is not set
CONFIG_FB_CFB_FILLRECT=m
CONFIG_FB_CFB_COPYAREA=m
CONFIG_FB_CFB_IMAGEBLIT=m
# CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
CONFIG_FB_SYS_FILLRECT=m
CONFIG_FB_SYS_COPYAREA=m
CONFIG_FB_SYS_IMAGEBLIT=m
CONFIG_FB_FOREIGN_ENDIAN=y
# CONFIG_FB_BOTH_ENDIAN is not set
# CONFIG_FB_BIG_ENDIAN is not set
CONFIG_FB_LITTLE_ENDIAN=y
CONFIG_FB_SYS_FOPS=m
CONFIG_FB_DEFERRED_IO=y
CONFIG_FB_SVGALIB=m
# CONFIG_FB_MACMODES is not set
CONFIG_FB_BACKLIGHT=y
CONFIG_FB_MODE_HELPERS=y
CONFIG_FB_TILEBLITTING=y

#
# Frame buffer hardware drivers
#
# CONFIG_FB_CIRRUS is not set
CONFIG_FB_PM2=m
# CONFIG_FB_PM2_FIFO_DISCONNECT is not set
CONFIG_FB_CYBER2000=m
CONFIG_FB_CYBER2000_DDC=y
CONFIG_FB_ARC=m
# CONFIG_FB_VGA16 is not set
CONFIG_FB_UVESA=m
# CONFIG_FB_N411 is not set
# CONFIG_FB_HGA is not set
CONFIG_FB_OPENCORES=m
# CONFIG_FB_S1D13XXX is not set
# CONFIG_FB_NVIDIA is not set
CONFIG_FB_RIVA=m
# CONFIG_FB_RIVA_I2C is not set
# CONFIG_FB_RIVA_DEBUG is not set
CONFIG_FB_RIVA_BACKLIGHT=y
CONFIG_FB_I740=m
# CONFIG_FB_LE80578 is not set
CONFIG_FB_MATROX=m
# CONFIG_FB_MATROX_MILLENIUM is not set
CONFIG_FB_MATROX_MYSTIQUE=y
# CONFIG_FB_MATROX_G is not set
CONFIG_FB_MATROX_I2C=m
CONFIG_FB_RADEON=m
CONFIG_FB_RADEON_I2C=y
CONFIG_FB_RADEON_BACKLIGHT=y
CONFIG_FB_RADEON_DEBUG=y
CONFIG_FB_ATY128=m
CONFIG_FB_ATY128_BACKLIGHT=y
CONFIG_FB_ATY=m
# CONFIG_FB_ATY_CT is not set
CONFIG_FB_ATY_GX=y
CONFIG_FB_ATY_BACKLIGHT=y
CONFIG_FB_S3=m
# CONFIG_FB_S3_DDC is not set
CONFIG_FB_SAVAGE=m
CONFIG_FB_SAVAGE_I2C=y
CONFIG_FB_SAVAGE_ACCEL=y
CONFIG_FB_SIS=m
CONFIG_FB_SIS_300=y
# CONFIG_FB_SIS_315 is not set
CONFIG_FB_VIA=m
# CONFIG_FB_VIA_DIRECT_PROCFS is not set
# CONFIG_FB_VIA_X_COMPATIBILITY is not set
CONFIG_FB_NEOMAGIC=m
CONFIG_FB_KYRO=m
CONFIG_FB_3DFX=m
CONFIG_FB_3DFX_ACCEL=y
CONFIG_FB_3DFX_I2C=y
CONFIG_FB_VOODOO1=m
CONFIG_FB_VT8623=m
# CONFIG_FB_TRIDENT is not set
# CONFIG_FB_ARK is not set
# CONFIG_FB_PM3 is not set
# CONFIG_FB_CARMINE is not set
# CONFIG_FB_GEODE is not set
CONFIG_FB_SM501=m
# CONFIG_FB_SMSCUFX is not set
CONFIG_FB_UDL=m
CONFIG_FB_IBM_GXT4500=m
CONFIG_FB_VIRTUAL=m
CONFIG_FB_METRONOME=m
CONFIG_FB_MB862XX=m
CONFIG_FB_MB862XX_PCI_GDC=y
# CONFIG_FB_MB862XX_I2C is not set
CONFIG_FB_BROADSHEET=m
CONFIG_FB_AUO_K190X=m
CONFIG_FB_AUO_K1900=m
# CONFIG_FB_AUO_K1901 is not set
# CONFIG_FB_HYPERV is not set
CONFIG_FB_SSD1307=m
# CONFIG_FB_SM712 is not set
CONFIG_BACKLIGHT_LCD_SUPPORT=y
CONFIG_LCD_CLASS_DEVICE=y
# CONFIG_LCD_L4F00242T03 is not set
CONFIG_LCD_LMS283GF05=y
CONFIG_LCD_LTV350QV=m
CONFIG_LCD_ILI922X=m
CONFIG_LCD_ILI9320=m
CONFIG_LCD_TDO24M=y
# CONFIG_LCD_VGG2432A4 is not set
CONFIG_LCD_PLATFORM=m
# CONFIG_LCD_S6E63M0 is not set
# CONFIG_LCD_LD9040 is not set
CONFIG_LCD_AMS369FG06=m
CONFIG_LCD_LMS501KF03=m
CONFIG_LCD_HX8357=m
CONFIG_BACKLIGHT_CLASS_DEVICE=m
# CONFIG_BACKLIGHT_GENERIC is not set
CONFIG_BACKLIGHT_LM3533=m
CONFIG_BACKLIGHT_PWM=m
CONFIG_BACKLIGHT_DA9052=m
CONFIG_BACKLIGHT_APPLE=m
# CONFIG_BACKLIGHT_PM8941_WLED is not set
CONFIG_BACKLIGHT_SAHARA=m
CONFIG_BACKLIGHT_ADP5520=m
CONFIG_BACKLIGHT_ADP8860=m
# CONFIG_BACKLIGHT_ADP8870 is not set
CONFIG_BACKLIGHT_88PM860X=m
CONFIG_BACKLIGHT_PCF50633=m
# CONFIG_BACKLIGHT_AAT2870 is not set
# CONFIG_BACKLIGHT_LM3630A is not set
# CONFIG_BACKLIGHT_LM3639 is not set
# CONFIG_BACKLIGHT_LP855X is not set
# CONFIG_BACKLIGHT_SKY81452 is not set
CONFIG_BACKLIGHT_GPIO=m
CONFIG_BACKLIGHT_LV5207LP=m
# CONFIG_BACKLIGHT_BD6107 is not set
CONFIG_VGASTATE=m
CONFIG_VIDEOMODE_HELPERS=y
CONFIG_HDMI=y

#
# Console display driver support
#
CONFIG_VGA_CONSOLE=y
# CONFIG_VGACON_SOFT_SCROLLBACK is not set
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=80
CONFIG_DUMMY_CONSOLE_ROWS=25
CONFIG_FRAMEBUFFER_CONSOLE=m
CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
# CONFIG_FRAMEBUFFER_CONSOLE_ROTATION is not set
CONFIG_LOGO=y
CONFIG_LOGO_LINUX_MONO=y
CONFIG_LOGO_LINUX_VGA16=y
CONFIG_LOGO_LINUX_CLUT224=y
CONFIG_SOUND=y
CONFIG_SOUND_OSS_CORE=y
CONFIG_SOUND_OSS_CORE_PRECLAIM=y
CONFIG_SND=m
CONFIG_SND_TIMER=m
CONFIG_SND_PCM=m
CONFIG_SND_HWDEP=m
CONFIG_SND_RAWMIDI=m
CONFIG_SND_JACK=y
CONFIG_SND_JACK_INPUT_DEV=y
CONFIG_SND_SEQUENCER=m
CONFIG_SND_SEQ_DUMMY=m
CONFIG_SND_OSSEMUL=y
CONFIG_SND_MIXER_OSS=m
CONFIG_SND_PCM_OSS=m
# CONFIG_SND_PCM_OSS_PLUGINS is not set
CONFIG_SND_PCM_TIMER=y
# CONFIG_SND_SEQUENCER_OSS is not set
# CONFIG_SND_DYNAMIC_MINORS is not set
CONFIG_SND_SUPPORT_OLD_API=y
CONFIG_SND_PROC_FS=y
CONFIG_SND_VERBOSE_PROCFS=y
# CONFIG_SND_VERBOSE_PRINTK is not set
# CONFIG_SND_DEBUG is not set
CONFIG_SND_VMASTER=y
CONFIG_SND_DMA_SGBUF=y
CONFIG_SND_RAWMIDI_SEQ=m
CONFIG_SND_OPL3_LIB_SEQ=m
# CONFIG_SND_OPL4_LIB_SEQ is not set
# CONFIG_SND_SBAWE_SEQ is not set
# CONFIG_SND_EMU10K1_SEQ is not set
CONFIG_SND_MPU401_UART=m
CONFIG_SND_OPL3_LIB=m
CONFIG_SND_VX_LIB=m
CONFIG_SND_AC97_CODEC=m
CONFIG_SND_DRIVERS=y
CONFIG_SND_DUMMY=m
# CONFIG_SND_ALOOP is not set
# CONFIG_SND_VIRMIDI is not set
# CONFIG_SND_MTPAV is not set
# CONFIG_SND_SERIAL_U16550 is not set
CONFIG_SND_MPU401=m
CONFIG_SND_AC97_POWER_SAVE=y
CONFIG_SND_AC97_POWER_SAVE_DEFAULT=0
CONFIG_SND_SB_COMMON=m
CONFIG_SND_SB16_DSP=m
CONFIG_SND_PCI=y
CONFIG_SND_AD1889=m
CONFIG_SND_ALS300=m
CONFIG_SND_ALS4000=m
CONFIG_SND_ALI5451=m
# CONFIG_SND_ASIHPI is not set
# CONFIG_SND_ATIIXP is not set
CONFIG_SND_ATIIXP_MODEM=m
# CONFIG_SND_AU8810 is not set
CONFIG_SND_AU8820=m
CONFIG_SND_AU8830=m
# CONFIG_SND_AW2 is not set
CONFIG_SND_AZT3328=m
# CONFIG_SND_BT87X is not set
CONFIG_SND_CA0106=m
CONFIG_SND_CMIPCI=m
CONFIG_SND_OXYGEN_LIB=m
# CONFIG_SND_OXYGEN is not set
CONFIG_SND_CS4281=m
CONFIG_SND_CS46XX=m
# CONFIG_SND_CS46XX_NEW_DSP is not set
CONFIG_SND_CS5530=m
# CONFIG_SND_CS5535AUDIO is not set
CONFIG_SND_CTXFI=m
CONFIG_SND_DARLA20=m
CONFIG_SND_GINA20=m
# CONFIG_SND_LAYLA20 is not set
CONFIG_SND_DARLA24=m
CONFIG_SND_GINA24=m
CONFIG_SND_LAYLA24=m
CONFIG_SND_MONA=m
CONFIG_SND_MIA=m
# CONFIG_SND_ECHO3G is not set
# CONFIG_SND_INDIGO is not set
CONFIG_SND_INDIGOIO=m
CONFIG_SND_INDIGODJ=m
CONFIG_SND_INDIGOIOX=m
CONFIG_SND_INDIGODJX=m
# CONFIG_SND_EMU10K1 is not set
# CONFIG_SND_EMU10K1X is not set
CONFIG_SND_ENS1370=m
CONFIG_SND_ENS1371=m
# CONFIG_SND_ES1938 is not set
# CONFIG_SND_ES1968 is not set
CONFIG_SND_FM801=m
# CONFIG_SND_HDSP is not set
# CONFIG_SND_HDSPM is not set
CONFIG_SND_ICE1712=m
CONFIG_SND_ICE1724=m
CONFIG_SND_INTEL8X0=m
CONFIG_SND_INTEL8X0M=m
# CONFIG_SND_KORG1212 is not set
CONFIG_SND_LOLA=m
CONFIG_SND_LX6464ES=m
# CONFIG_SND_MAESTRO3 is not set
# CONFIG_SND_MIXART is not set
# CONFIG_SND_NM256 is not set
# CONFIG_SND_PCXHR is not set
CONFIG_SND_RIPTIDE=m
CONFIG_SND_RME32=m
# CONFIG_SND_RME96 is not set
# CONFIG_SND_RME9652 is not set
CONFIG_SND_SIS7019=m
CONFIG_SND_SONICVIBES=m
CONFIG_SND_TRIDENT=m
# CONFIG_SND_VIA82XX is not set
CONFIG_SND_VIA82XX_MODEM=m
CONFIG_SND_VIRTUOSO=m
CONFIG_SND_VX222=m
CONFIG_SND_YMFPCI=m

#
# HD-Audio
#
CONFIG_SND_HDA=m
CONFIG_SND_HDA_INTEL=m
CONFIG_SND_HDA_HWDEP=y
CONFIG_SND_HDA_RECONFIG=y
CONFIG_SND_HDA_INPUT_BEEP=y
CONFIG_SND_HDA_INPUT_BEEP_MODE=1
CONFIG_SND_HDA_PATCH_LOADER=y
CONFIG_SND_HDA_CODEC_REALTEK=m
# CONFIG_SND_HDA_CODEC_ANALOG is not set
# CONFIG_SND_HDA_CODEC_SIGMATEL is not set
CONFIG_SND_HDA_CODEC_VIA=m
# CONFIG_SND_HDA_CODEC_HDMI is not set
CONFIG_SND_HDA_CODEC_CIRRUS=m
CONFIG_SND_HDA_CODEC_CONEXANT=m
# CONFIG_SND_HDA_CODEC_CA0110 is not set
# CONFIG_SND_HDA_CODEC_CA0132 is not set
CONFIG_SND_HDA_CODEC_CMEDIA=m
CONFIG_SND_HDA_CODEC_SI3054=m
CONFIG_SND_HDA_GENERIC=m
CONFIG_SND_HDA_CORE=m
CONFIG_SND_HDA_I915=y
CONFIG_SND_HDA_PREALLOC_SIZE=64
CONFIG_SND_SPI=y
CONFIG_SND_USB=y
CONFIG_SND_USB_AUDIO=m
CONFIG_SND_USB_UA101=m
CONFIG_SND_USB_USX2Y=m
# CONFIG_SND_USB_CAIAQ is not set
CONFIG_SND_USB_US122L=m
# CONFIG_SND_USB_6FIRE is not set
# CONFIG_SND_USB_HIFACE is not set
CONFIG_SND_BCD2000=m
CONFIG_SND_USB_LINE6=m
CONFIG_SND_USB_POD=m
CONFIG_SND_USB_PODHD=m
CONFIG_SND_USB_TONEPORT=m
# CONFIG_SND_USB_VARIAX is not set
CONFIG_SND_PCMCIA=y
CONFIG_SND_VXPOCKET=m
# CONFIG_SND_PDAUDIOCF is not set
# CONFIG_SND_SOC is not set
CONFIG_SOUND_PRIME=y
CONFIG_SOUND_OSS=y
CONFIG_SOUND_TRACEINIT=y
# CONFIG_SOUND_DMAP is not set
CONFIG_SOUND_VMIDI=m
CONFIG_SOUND_TRIX=y
# CONFIG_SOUND_MSS is not set
CONFIG_SOUND_MPU401=m
CONFIG_SOUND_PAS=m
# CONFIG_SOUND_PSS is not set
CONFIG_SOUND_SB=m
CONFIG_SOUND_YM3812=y
CONFIG_SOUND_UART6850=m
# CONFIG_SOUND_AEDSP16 is not set
CONFIG_SOUND_KAHLUA=m
CONFIG_AC97_BUS=m

#
# HID support
#
CONFIG_HID=m
# CONFIG_HID_BATTERY_STRENGTH is not set
CONFIG_HIDRAW=y
# CONFIG_UHID is not set
CONFIG_HID_GENERIC=m

#
# Special HID drivers
#
CONFIG_HID_A4TECH=m
CONFIG_HID_ACRUX=m
CONFIG_HID_ACRUX_FF=y
# CONFIG_HID_APPLE is not set
CONFIG_HID_APPLEIR=m
CONFIG_HID_AUREAL=m
# CONFIG_HID_BELKIN is not set
CONFIG_HID_BETOP_FF=m
# CONFIG_HID_CHERRY is not set
CONFIG_HID_CHICONY=m
CONFIG_HID_CORSAIR=m
CONFIG_HID_PRODIKEYS=m
CONFIG_HID_CMEDIA=m
CONFIG_HID_CP2112=m
CONFIG_HID_CYPRESS=m
CONFIG_HID_DRAGONRISE=m
CONFIG_DRAGONRISE_FF=y
# CONFIG_HID_EMS_FF is not set
CONFIG_HID_ELECOM=m
CONFIG_HID_ELO=m
CONFIG_HID_EZKEY=m
# CONFIG_HID_GEMBIRD is not set
CONFIG_HID_GFRM=m
CONFIG_HID_HOLTEK=m
# CONFIG_HOLTEK_FF is not set
# CONFIG_HID_GT683R is not set
# CONFIG_HID_KEYTOUCH is not set
# CONFIG_HID_KYE is not set
CONFIG_HID_UCLOGIC=m
CONFIG_HID_WALTOP=m
CONFIG_HID_GYRATION=m
CONFIG_HID_ICADE=m
# CONFIG_HID_TWINHAN is not set
# CONFIG_HID_KENSINGTON is not set
# CONFIG_HID_LCPOWER is not set
CONFIG_HID_LED=m
CONFIG_HID_LENOVO=m
CONFIG_HID_LOGITECH=m
CONFIG_HID_LOGITECH_DJ=m
CONFIG_HID_LOGITECH_HIDPP=m
# CONFIG_LOGITECH_FF is not set
CONFIG_LOGIRUMBLEPAD2_FF=y
CONFIG_LOGIG940_FF=y
# CONFIG_LOGIWHEELS_FF is not set
CONFIG_HID_MAGICMOUSE=m
CONFIG_HID_MAYFLASH=m
# CONFIG_HID_MICROSOFT is not set
# CONFIG_HID_MONTEREY is not set
CONFIG_HID_MULTITOUCH=m
# CONFIG_HID_NTRIG is not set
# CONFIG_HID_ORTEK is not set
CONFIG_HID_PANTHERLORD=m
CONFIG_PANTHERLORD_FF=y
CONFIG_HID_PENMOUNT=m
CONFIG_HID_PETALYNX=m
# CONFIG_HID_PICOLCD is not set
# CONFIG_HID_PLANTRONICS is not set
# CONFIG_HID_PRIMAX is not set
# CONFIG_HID_ROCCAT is not set
# CONFIG_HID_SAITEK is not set
# CONFIG_HID_SAMSUNG is not set
CONFIG_HID_SONY=m
CONFIG_SONY_FF=y
CONFIG_HID_SPEEDLINK=m
# CONFIG_HID_STEELSERIES is not set
# CONFIG_HID_SUNPLUS is not set
# CONFIG_HID_RMI is not set
CONFIG_HID_GREENASIA=m
CONFIG_GREENASIA_FF=y
# CONFIG_HID_HYPERV_MOUSE is not set
CONFIG_HID_SMARTJOYPLUS=m
CONFIG_SMARTJOYPLUS_FF=y
CONFIG_HID_TIVO=m
CONFIG_HID_TOPSEED=m
CONFIG_HID_THINGM=m
CONFIG_HID_THRUSTMASTER=m
CONFIG_THRUSTMASTER_FF=y
# CONFIG_HID_UDRAW_PS3 is not set
# CONFIG_HID_WACOM is not set
# CONFIG_HID_WIIMOTE is not set
CONFIG_HID_XINMO=m
# CONFIG_HID_ZEROPLUS is not set
CONFIG_HID_ZYDACRON=m
CONFIG_HID_SENSOR_HUB=m
CONFIG_HID_SENSOR_CUSTOM_SENSOR=m
CONFIG_HID_ALPS=m

#
# USB HID support
#
CONFIG_USB_HID=m
# CONFIG_HID_PID is not set
# CONFIG_USB_HIDDEV is not set

#
# I2C HID support
#
# CONFIG_I2C_HID is not set
CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=y
# CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set

#
# Miscellaneous USB options
#
# CONFIG_USB_DEFAULT_PERSIST is not set
CONFIG_USB_DYNAMIC_MINORS=y
# CONFIG_USB_OTG_WHITELIST is not set
# CONFIG_USB_LEDS_TRIGGER_USBPORT is not set
# CONFIG_USB_MON is not set
CONFIG_USB_WUSB=y
CONFIG_USB_WUSB_CBAF=m
CONFIG_USB_WUSB_CBAF_DEBUG=y

#
# USB Host Controller Drivers
#
# CONFIG_USB_C67X00_HCD is not set
CONFIG_USB_XHCI_HCD=m
CONFIG_USB_XHCI_PCI=m
CONFIG_USB_XHCI_PLATFORM=m
CONFIG_USB_EHCI_HCD=m
CONFIG_USB_EHCI_ROOT_HUB_TT=y
CONFIG_USB_EHCI_TT_NEWSCHED=y
CONFIG_USB_EHCI_PCI=m
CONFIG_USB_EHCI_HCD_PLATFORM=m
CONFIG_USB_OXU210HP_HCD=y
CONFIG_USB_ISP116X_HCD=m
CONFIG_USB_ISP1362_HCD=m
CONFIG_USB_FOTG210_HCD=y
# CONFIG_USB_MAX3421_HCD is not set
CONFIG_USB_OHCI_HCD=y
# CONFIG_USB_OHCI_HCD_PCI is not set
# CONFIG_USB_OHCI_HCD_SSB is not set
CONFIG_USB_OHCI_HCD_PLATFORM=y
# CONFIG_USB_UHCI_HCD is not set
# CONFIG_USB_SL811_HCD is not set
CONFIG_USB_R8A66597_HCD=m
# CONFIG_USB_WHCI_HCD is not set
# CONFIG_USB_HWA_HCD is not set
# CONFIG_USB_HCD_BCMA is not set
CONFIG_USB_HCD_SSB=m
CONFIG_USB_HCD_TEST_MODE=y

#
# USB Device Class drivers
#
CONFIG_USB_ACM=m
CONFIG_USB_PRINTER=y
CONFIG_USB_WDM=m
CONFIG_USB_TMC=m

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#

#
# also be needed; see USB_STORAGE Help for more info
#
CONFIG_USB_STORAGE=m
CONFIG_USB_STORAGE_DEBUG=y
CONFIG_USB_STORAGE_REALTEK=m
CONFIG_USB_STORAGE_DATAFAB=m
CONFIG_USB_STORAGE_FREECOM=m
CONFIG_USB_STORAGE_ISD200=m
CONFIG_USB_STORAGE_USBAT=m
CONFIG_USB_STORAGE_SDDR09=m
# CONFIG_USB_STORAGE_SDDR55 is not set
CONFIG_USB_STORAGE_JUMPSHOT=m
# CONFIG_USB_STORAGE_ALAUDA is not set
# CONFIG_USB_STORAGE_ONETOUCH is not set
# CONFIG_USB_STORAGE_KARMA is not set
# CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
# CONFIG_USB_STORAGE_ENE_UB6250 is not set
# CONFIG_USB_UAS is not set

#
# USB Imaging devices
#
CONFIG_USB_MDC800=m
CONFIG_USB_MICROTEK=m
CONFIG_USBIP_CORE=m
# CONFIG_USBIP_VHCI_HCD is not set
CONFIG_USBIP_HOST=m
CONFIG_USBIP_VUDC=m
# CONFIG_USBIP_DEBUG is not set
CONFIG_USB_MUSB_HDRC=y
CONFIG_USB_MUSB_HOST=y
# CONFIG_USB_MUSB_GADGET is not set
# CONFIG_USB_MUSB_DUAL_ROLE is not set

#
# Platform Glue Layer
#

#
# MUSB DMA mode
#
CONFIG_MUSB_PIO_ONLY=y
# CONFIG_USB_DWC3 is not set
CONFIG_USB_DWC2=m
# CONFIG_USB_DWC2_HOST is not set

#
# Gadget/Dual-role mode requires USB Gadget support to be enabled
#
# CONFIG_USB_DWC2_PERIPHERAL is not set
CONFIG_USB_DWC2_DUAL_ROLE=y
CONFIG_USB_DWC2_PCI=m
# CONFIG_USB_DWC2_DEBUG is not set
CONFIG_USB_DWC2_TRACK_MISSED_SOFS=y
CONFIG_USB_CHIPIDEA=m
CONFIG_USB_CHIPIDEA_OF=m
CONFIG_USB_CHIPIDEA_PCI=m
CONFIG_USB_CHIPIDEA_UDC=y
# CONFIG_USB_CHIPIDEA_HOST is not set
# CONFIG_USB_ISP1760 is not set

#
# USB port drivers
#
CONFIG_USB_SERIAL=y
CONFIG_USB_SERIAL_CONSOLE=y
# CONFIG_USB_SERIAL_GENERIC is not set
# CONFIG_USB_SERIAL_SIMPLE is not set
# CONFIG_USB_SERIAL_AIRCABLE is not set
CONFIG_USB_SERIAL_ARK3116=y
CONFIG_USB_SERIAL_BELKIN=m
CONFIG_USB_SERIAL_CH341=m
CONFIG_USB_SERIAL_WHITEHEAT=m
CONFIG_USB_SERIAL_DIGI_ACCELEPORT=m
# CONFIG_USB_SERIAL_CP210X is not set
CONFIG_USB_SERIAL_CYPRESS_M8=y
CONFIG_USB_SERIAL_EMPEG=y
CONFIG_USB_SERIAL_FTDI_SIO=y
# CONFIG_USB_SERIAL_VISOR is not set
# CONFIG_USB_SERIAL_IPAQ is not set
CONFIG_USB_SERIAL_IR=m
CONFIG_USB_SERIAL_EDGEPORT=y
CONFIG_USB_SERIAL_EDGEPORT_TI=y
CONFIG_USB_SERIAL_F81232=m
CONFIG_USB_SERIAL_F8153X=m
CONFIG_USB_SERIAL_GARMIN=y
# CONFIG_USB_SERIAL_IPW is not set
# CONFIG_USB_SERIAL_IUU is not set
CONFIG_USB_SERIAL_KEYSPAN_PDA=y
CONFIG_USB_SERIAL_KEYSPAN=m
CONFIG_USB_SERIAL_KLSI=m
CONFIG_USB_SERIAL_KOBIL_SCT=y
CONFIG_USB_SERIAL_MCT_U232=y
CONFIG_USB_SERIAL_METRO=y
CONFIG_USB_SERIAL_MOS7720=y
# CONFIG_USB_SERIAL_MOS7840 is not set
CONFIG_USB_SERIAL_MXUPORT=m
CONFIG_USB_SERIAL_NAVMAN=m
CONFIG_USB_SERIAL_PL2303=y
# CONFIG_USB_SERIAL_OTI6858 is not set
CONFIG_USB_SERIAL_QCAUX=m
# CONFIG_USB_SERIAL_QUALCOMM is not set
CONFIG_USB_SERIAL_SPCP8X5=y
CONFIG_USB_SERIAL_SAFE=y
CONFIG_USB_SERIAL_SAFE_PADDED=y
CONFIG_USB_SERIAL_SIERRAWIRELESS=y
CONFIG_USB_SERIAL_SYMBOL=y
# CONFIG_USB_SERIAL_TI is not set
# CONFIG_USB_SERIAL_CYBERJACK is not set
CONFIG_USB_SERIAL_XIRCOM=y
CONFIG_USB_SERIAL_WWAN=y
CONFIG_USB_SERIAL_OPTION=y
CONFIG_USB_SERIAL_OMNINET=m
# CONFIG_USB_SERIAL_OPTICON is not set
CONFIG_USB_SERIAL_XSENS_MT=y
CONFIG_USB_SERIAL_WISHBONE=y
# CONFIG_USB_SERIAL_SSU100 is not set
CONFIG_USB_SERIAL_QT2=m
# CONFIG_USB_SERIAL_DEBUG is not set

#
# USB Miscellaneous drivers
#
CONFIG_USB_EMI62=m
CONFIG_USB_EMI26=y
CONFIG_USB_ADUTUX=y
# CONFIG_USB_SEVSEG is not set
# CONFIG_USB_RIO500 is not set
CONFIG_USB_LEGOTOWER=m
CONFIG_USB_LCD=y
CONFIG_USB_CYPRESS_CY7C63=m
CONFIG_USB_CYTHERM=y
CONFIG_USB_IDMOUSE=m
# CONFIG_USB_FTDI_ELAN is not set
# CONFIG_USB_APPLEDISPLAY is not set
CONFIG_USB_SISUSBVGA=y
# CONFIG_USB_SISUSBVGA_CON is not set
CONFIG_USB_LD=m
# CONFIG_USB_TRANCEVIBRATOR is not set
CONFIG_USB_IOWARRIOR=m
# CONFIG_USB_TEST is not set
CONFIG_USB_EHSET_TEST_FIXTURE=y
CONFIG_USB_ISIGHTFW=m
CONFIG_USB_YUREX=m
CONFIG_USB_EZUSB_FX2=y
# CONFIG_USB_HSIC_USB3503 is not set
CONFIG_USB_HSIC_USB4604=y
# CONFIG_USB_LINK_LAYER_TEST is not set
# CONFIG_UCSI is not set

#
# USB Physical Layer drivers
#
CONFIG_USB_PHY=y
CONFIG_NOP_USB_XCEIV=m
CONFIG_USB_GPIO_VBUS=m
CONFIG_USB_ISP1301=y
CONFIG_USB_GADGET=y
# CONFIG_USB_GADGET_DEBUG is not set
# CONFIG_USB_GADGET_DEBUG_FILES is not set
# CONFIG_USB_GADGET_DEBUG_FS is not set
CONFIG_USB_GADGET_VBUS_DRAW=2
CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=2
# CONFIG_U_SERIAL_CONSOLE is not set

#
# USB Peripheral Controller
#
# CONFIG_USB_FOTG210_UDC is not set
CONFIG_USB_GR_UDC=m
CONFIG_USB_R8A66597=m
# CONFIG_USB_PXA27X is not set
# CONFIG_USB_MV_UDC is not set
# CONFIG_USB_MV_U3D is not set
# CONFIG_USB_M66592 is not set
CONFIG_USB_BDC_UDC=m

#
# Platform Support
#
CONFIG_USB_BDC_PCI=m
# CONFIG_USB_AMD5536UDC is not set
CONFIG_USB_NET2272=m
CONFIG_USB_NET2272_DMA=y
CONFIG_USB_NET2280=m
CONFIG_USB_GOKU=m
CONFIG_USB_EG20T=m
# CONFIG_USB_GADGET_XILINX is not set
CONFIG_USB_DUMMY_HCD=m
CONFIG_USB_LIBCOMPOSITE=y
CONFIG_USB_F_ACM=y
CONFIG_USB_F_SS_LB=y
CONFIG_USB_U_SERIAL=y
CONFIG_USB_U_ETHER=y
CONFIG_USB_F_SERIAL=m
CONFIG_USB_F_OBEX=m
CONFIG_USB_F_NCM=y
CONFIG_USB_F_ECM=m
CONFIG_USB_F_PHONET=m
CONFIG_USB_F_SUBSET=m
CONFIG_USB_F_RNDIS=m
CONFIG_USB_F_MASS_STORAGE=m
CONFIG_USB_F_FS=m
CONFIG_USB_F_UAC1=m
CONFIG_USB_F_MIDI=m
CONFIG_USB_F_HID=m
CONFIG_USB_CONFIGFS=y
# CONFIG_USB_CONFIGFS_SERIAL is not set
CONFIG_USB_CONFIGFS_ACM=y
# CONFIG_USB_CONFIGFS_OBEX is not set
CONFIG_USB_CONFIGFS_NCM=y
# CONFIG_USB_CONFIGFS_ECM is not set
# CONFIG_USB_CONFIGFS_ECM_SUBSET is not set
# CONFIG_USB_CONFIGFS_RNDIS is not set
# CONFIG_USB_CONFIGFS_EEM is not set
CONFIG_USB_CONFIGFS_PHONET=y
# CONFIG_USB_CONFIGFS_MASS_STORAGE is not set
CONFIG_USB_CONFIGFS_F_LB_SS=y
# CONFIG_USB_CONFIGFS_F_FS is not set
CONFIG_USB_CONFIGFS_F_UAC1=y
# CONFIG_USB_CONFIGFS_F_UAC2 is not set
# CONFIG_USB_CONFIGFS_F_MIDI is not set
# CONFIG_USB_CONFIGFS_F_HID is not set
# CONFIG_USB_CONFIGFS_F_UVC is not set
# CONFIG_USB_CONFIGFS_F_PRINTER is not set
CONFIG_USB_ZERO=m
# CONFIG_USB_AUDIO is not set
# CONFIG_USB_ETH is not set
CONFIG_USB_G_NCM=m
CONFIG_USB_GADGETFS=m
CONFIG_USB_FUNCTIONFS=m
CONFIG_USB_FUNCTIONFS_ETH=y
CONFIG_USB_FUNCTIONFS_RNDIS=y
CONFIG_USB_FUNCTIONFS_GENERIC=y
CONFIG_USB_MASS_STORAGE=m
CONFIG_USB_G_SERIAL=m
CONFIG_USB_MIDI_GADGET=m
# CONFIG_USB_G_PRINTER is not set
# CONFIG_USB_CDC_COMPOSITE is not set
# CONFIG_USB_G_NOKIA is not set
# CONFIG_USB_G_ACM_MS is not set
CONFIG_USB_G_MULTI=m
CONFIG_USB_G_MULTI_RNDIS=y
CONFIG_USB_G_MULTI_CDC=y
CONFIG_USB_G_HID=m
# CONFIG_USB_G_DBGP is not set
# CONFIG_USB_G_WEBCAM is not set
# CONFIG_USB_LED_TRIG is not set
# CONFIG_USB_ULPI_BUS is not set
CONFIG_UWB=y
CONFIG_UWB_HWA=m
# CONFIG_UWB_WHCI is not set
CONFIG_UWB_I1480U=m
CONFIG_MMC=y
# CONFIG_MMC_DEBUG is not set
CONFIG_PWRSEQ_EMMC=y
CONFIG_PWRSEQ_SIMPLE=m
# CONFIG_MMC_BLOCK is not set
CONFIG_SDIO_UART=y
# CONFIG_MMC_TEST is not set

#
# MMC/SD/SDIO Host Controller Drivers
#
CONFIG_MMC_SDHCI=m
# CONFIG_MMC_SDHCI_PCI is not set
CONFIG_MMC_SDHCI_ACPI=m
CONFIG_MMC_SDHCI_PLTFM=m
CONFIG_MMC_SDHCI_OF_ARASAN=m
CONFIG_MMC_SDHCI_OF_AT91=m
CONFIG_MMC_SDHCI_CADENCE=m
# CONFIG_MMC_SDHCI_F_SDH30 is not set
CONFIG_MMC_WBSD=m
# CONFIG_MMC_TIFM_SD is not set
CONFIG_MMC_SPI=y
CONFIG_MMC_SDRICOH_CS=m
CONFIG_MMC_CB710=m
CONFIG_MMC_VIA_SDMMC=y
# CONFIG_MMC_VUB300 is not set
# CONFIG_MMC_USHC is not set
CONFIG_MMC_USDHI6ROL0=m
CONFIG_MMC_REALTEK_PCI=m
CONFIG_MMC_REALTEK_USB=m
CONFIG_MMC_TOSHIBA_PCI=y
# CONFIG_MMC_MTK is not set
CONFIG_MEMSTICK=y
# CONFIG_MEMSTICK_DEBUG is not set

#
# MemoryStick drivers
#
CONFIG_MEMSTICK_UNSAFE_RESUME=y
# CONFIG_MSPRO_BLOCK is not set
CONFIG_MS_BLOCK=m

#
# MemoryStick Host Controller Drivers
#
CONFIG_MEMSTICK_TIFM_MS=m
CONFIG_MEMSTICK_JMICRON_38X=y
# CONFIG_MEMSTICK_R592 is not set
CONFIG_MEMSTICK_REALTEK_PCI=m
CONFIG_MEMSTICK_REALTEK_USB=y
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
CONFIG_LEDS_CLASS_FLASH=y

#
# LED drivers
#
CONFIG_LEDS_88PM860X=m
# CONFIG_LEDS_BCM6328 is not set
CONFIG_LEDS_BCM6358=m
CONFIG_LEDS_LM3530=y
CONFIG_LEDS_LM3533=m
CONFIG_LEDS_LM3642=m
CONFIG_LEDS_PCA9532=y
CONFIG_LEDS_PCA9532_GPIO=y
# CONFIG_LEDS_GPIO is not set
CONFIG_LEDS_LP3944=y
# CONFIG_LEDS_LP3952 is not set
CONFIG_LEDS_LP55XX_COMMON=y
# CONFIG_LEDS_LP5521 is not set
CONFIG_LEDS_LP5523=y
CONFIG_LEDS_LP5562=y
CONFIG_LEDS_LP8501=m
# CONFIG_LEDS_LP8860 is not set
# CONFIG_LEDS_CLEVO_MAIL is not set
# CONFIG_LEDS_PCA955X is not set
# CONFIG_LEDS_PCA963X is not set
CONFIG_LEDS_WM8350=y
CONFIG_LEDS_DA9052=m
# CONFIG_LEDS_DAC124S085 is not set
# CONFIG_LEDS_PWM is not set
# CONFIG_LEDS_REGULATOR is not set
# CONFIG_LEDS_BD2802 is not set
CONFIG_LEDS_INTEL_SS4200=m
CONFIG_LEDS_LT3593=m
# CONFIG_LEDS_ADP5520 is not set
# CONFIG_LEDS_DELL_NETBOOKS is not set
CONFIG_LEDS_MC13783=m
# CONFIG_LEDS_TCA6507 is not set
CONFIG_LEDS_TLC591XX=y
CONFIG_LEDS_MAX8997=m
CONFIG_LEDS_LM355x=y
# CONFIG_LEDS_OT200 is not set
CONFIG_LEDS_MENF21BMC=m
# CONFIG_LEDS_KTD2692 is not set
# CONFIG_LEDS_IS31FL319X is not set
CONFIG_LEDS_IS31FL32XX=m

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
CONFIG_LEDS_BLINKM=y
CONFIG_LEDS_SYSCON=y
CONFIG_LEDS_USER=y
CONFIG_LEDS_NIC78BX=y

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
# CONFIG_LEDS_TRIGGER_TIMER is not set
CONFIG_LEDS_TRIGGER_ONESHOT=m
# CONFIG_LEDS_TRIGGER_DISK is not set
CONFIG_LEDS_TRIGGER_MTD=y
CONFIG_LEDS_TRIGGER_HEARTBEAT=y
CONFIG_LEDS_TRIGGER_BACKLIGHT=m
CONFIG_LEDS_TRIGGER_CPU=y
# CONFIG_LEDS_TRIGGER_GPIO is not set
CONFIG_LEDS_TRIGGER_DEFAULT_ON=y

#
# iptables trigger is under Netfilter config (LED target)
#
CONFIG_LEDS_TRIGGER_TRANSIENT=y
CONFIG_LEDS_TRIGGER_CAMERA=y
# CONFIG_LEDS_TRIGGER_PANIC is not set
CONFIG_ACCESSIBILITY=y
# CONFIG_A11Y_BRAILLE_CONSOLE is not set
# CONFIG_INFINIBAND is not set
CONFIG_EDAC_ATOMIC_SCRUB=y
CONFIG_EDAC_SUPPORT=y
CONFIG_EDAC=y
CONFIG_EDAC_LEGACY_SYSFS=y
CONFIG_EDAC_DEBUG=y
CONFIG_EDAC_MM_EDAC=m
CONFIG_EDAC_AMD76X=m
CONFIG_EDAC_E7XXX=m
CONFIG_EDAC_E752X=m
CONFIG_EDAC_I82875P=m
# CONFIG_EDAC_I82975X is not set
# CONFIG_EDAC_I3000 is not set
# CONFIG_EDAC_I3200 is not set
CONFIG_EDAC_IE31200=m
# CONFIG_EDAC_X38 is not set
CONFIG_EDAC_I5400=m
CONFIG_EDAC_I82860=m
# CONFIG_EDAC_R82600 is not set
CONFIG_EDAC_I5000=m
CONFIG_EDAC_I5100=m
# CONFIG_EDAC_I7300 is not set
CONFIG_RTC_LIB=y
CONFIG_RTC_MC146818_LIB=y
# CONFIG_RTC_CLASS is not set
CONFIG_DMADEVICES=y
CONFIG_DMADEVICES_DEBUG=y
CONFIG_DMADEVICES_VDEBUG=y

#
# DMA Devices
#
CONFIG_DMA_ENGINE=y
CONFIG_DMA_VIRTUAL_CHANNELS=y
CONFIG_DMA_ACPI=y
CONFIG_DMA_OF=y
CONFIG_FSL_EDMA=m
CONFIG_INTEL_IDMA64=y
CONFIG_PCH_DMA=m
# CONFIG_TIMB_DMA is not set
CONFIG_QCOM_HIDMA_MGMT=m
CONFIG_QCOM_HIDMA=m
CONFIG_DW_DMAC_CORE=y
CONFIG_DW_DMAC=m
# CONFIG_DW_DMAC_PCI is not set
CONFIG_HSU_DMA=y

#
# DMA Clients
#
CONFIG_ASYNC_TX_DMA=y
# CONFIG_DMATEST is not set

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
CONFIG_SW_SYNC=y
# CONFIG_AUXDISPLAY is not set
CONFIG_UIO=y
CONFIG_UIO_CIF=y
CONFIG_UIO_PDRV_GENIRQ=m
CONFIG_UIO_DMEM_GENIRQ=m
CONFIG_UIO_AEC=y
# CONFIG_UIO_SERCOS3 is not set
# CONFIG_UIO_PCI_GENERIC is not set
CONFIG_UIO_NETX=y
# CONFIG_UIO_PRUSS is not set
CONFIG_UIO_MF624=y
CONFIG_UIO_HV_GENERIC=m
# CONFIG_VIRT_DRIVERS is not set

#
# Virtio drivers
#
# CONFIG_VIRTIO_PCI is not set
# CONFIG_VIRTIO_MMIO is not set

#
# Microsoft Hyper-V guest support
#
CONFIG_HYPERV=m
# CONFIG_HYPERV_UTILS is not set
CONFIG_HYPERV_BALLOON=m
CONFIG_STAGING=y
CONFIG_PRISM2_USB=m
# CONFIG_COMEDI is not set
# CONFIG_RTL8192U is not set
CONFIG_RTLLIB=m
# CONFIG_RTLLIB_CRYPTO_CCMP is not set
# CONFIG_RTLLIB_CRYPTO_TKIP is not set
CONFIG_RTLLIB_CRYPTO_WEP=m
CONFIG_RTL8192E=m
# CONFIG_R8712U is not set
CONFIG_R8188EU=m
CONFIG_88EU_AP_MODE=y
CONFIG_RTS5208=m

#
# IIO staging drivers
#

#
# Accelerometers
#
CONFIG_ADIS16201=m
CONFIG_ADIS16203=m
# CONFIG_ADIS16209 is not set
# CONFIG_ADIS16240 is not set

#
# Analog to digital converters
#
# CONFIG_AD7606 is not set
CONFIG_AD7780=m
CONFIG_AD7816=m
CONFIG_AD7192=m
CONFIG_AD7280=m

#
# Analog digital bi-direction converters
#
CONFIG_ADT7316=m
# CONFIG_ADT7316_SPI is not set
CONFIG_ADT7316_I2C=m

#
# Capacitance to digital converters
#
# CONFIG_AD7150 is not set
CONFIG_AD7152=m
CONFIG_AD7746=m

#
# Direct Digital Synthesis
#
# CONFIG_AD9832 is not set
CONFIG_AD9834=m

#
# Digital gyroscope sensors
#
CONFIG_ADIS16060=m

#
# Network Analyzer, Impedance Converters
#
CONFIG_AD5933=m

#
# Light sensors
#
CONFIG_SENSORS_ISL29028=m
CONFIG_TSL2x7x=m

#
# Active energy metering IC
#
CONFIG_ADE7753=m
CONFIG_ADE7754=m
CONFIG_ADE7758=m
CONFIG_ADE7759=m
CONFIG_ADE7854=m
CONFIG_ADE7854_I2C=m
# CONFIG_ADE7854_SPI is not set

#
# Resolver to digital converters
#
CONFIG_AD2S90=m
# CONFIG_AD2S1200 is not set
CONFIG_AD2S1210=m

#
# Triggers - standalone
#
# CONFIG_FB_SM750 is not set
# CONFIG_FB_XGI is not set

#
# Speakup console speech
#
CONFIG_SPEAKUP=y
CONFIG_SPEAKUP_SYNTH_ACNTSA=m
CONFIG_SPEAKUP_SYNTH_APOLLO=y
# CONFIG_SPEAKUP_SYNTH_AUDPTR is not set
CONFIG_SPEAKUP_SYNTH_BNS=m
CONFIG_SPEAKUP_SYNTH_DECTLK=m
CONFIG_SPEAKUP_SYNTH_DECEXT=m
# CONFIG_SPEAKUP_SYNTH_LTLK is not set
CONFIG_SPEAKUP_SYNTH_SOFT=m
# CONFIG_SPEAKUP_SYNTH_SPKOUT is not set
CONFIG_SPEAKUP_SYNTH_TXPRT=m
# CONFIG_SPEAKUP_SYNTH_DUMMY is not set
CONFIG_STAGING_MEDIA=y
# CONFIG_DVB_CXD2099 is not set

#
# Android
#
# CONFIG_STAGING_BOARD is not set
# CONFIG_LTE_GDM724X is not set
CONFIG_MTD_SPINAND_MT29F=m
# CONFIG_MTD_SPINAND_ONDIEECC is not set
CONFIG_LNET=m
CONFIG_LNET_MAX_PAYLOAD=1048576
CONFIG_LNET_SELFTEST=m
CONFIG_LUSTRE_FS=m
CONFIG_LUSTRE_OBD_MAX_IOCTL_BUFFER=8192
CONFIG_LUSTRE_DEBUG_EXPENSIVE_CHECK=y
# CONFIG_DGNC is not set
# CONFIG_GS_FPGABOOT is not set
CONFIG_COMMON_CLK_XLNX_CLKWZRD=m
CONFIG_FB_TFT=m
CONFIG_FB_TFT_AGM1264K_FL=m
CONFIG_FB_TFT_BD663474=m
CONFIG_FB_TFT_HX8340BN=m
# CONFIG_FB_TFT_HX8347D is not set
CONFIG_FB_TFT_HX8353D=m
CONFIG_FB_TFT_HX8357D=m
CONFIG_FB_TFT_ILI9163=m
CONFIG_FB_TFT_ILI9320=m
CONFIG_FB_TFT_ILI9325=m
CONFIG_FB_TFT_ILI9340=m
CONFIG_FB_TFT_ILI9341=m
CONFIG_FB_TFT_ILI9481=m
CONFIG_FB_TFT_ILI9486=m
CONFIG_FB_TFT_PCD8544=m
CONFIG_FB_TFT_RA8875=m
# CONFIG_FB_TFT_S6D02A1 is not set
CONFIG_FB_TFT_S6D1121=m
CONFIG_FB_TFT_SSD1289=m
CONFIG_FB_TFT_SSD1305=m
CONFIG_FB_TFT_SSD1306=m
CONFIG_FB_TFT_SSD1325=m
CONFIG_FB_TFT_SSD1331=m
# CONFIG_FB_TFT_SSD1351 is not set
# CONFIG_FB_TFT_ST7735R is not set
CONFIG_FB_TFT_ST7789V=m
CONFIG_FB_TFT_TINYLCD=m
# CONFIG_FB_TFT_TLS8204 is not set
# CONFIG_FB_TFT_UC1611 is not set
# CONFIG_FB_TFT_UC1701 is not set
# CONFIG_FB_TFT_UPD161704 is not set
CONFIG_FB_TFT_WATTEROTT=m
# CONFIG_FB_FLEX is not set
CONFIG_FB_TFT_FBTFT_DEVICE=m
CONFIG_WILC1000=m
# CONFIG_WILC1000_SDIO is not set
CONFIG_WILC1000_SPI=m
# CONFIG_MOST is not set

#
# Old ISDN4Linux (deprecated)
#
CONFIG_KS7010=y
# CONFIG_GREYBUS is not set
CONFIG_X86_PLATFORM_DEVICES=y
# CONFIG_ACER_WMI is not set
CONFIG_ACERHDF=y
CONFIG_ALIENWARE_WMI=m
# CONFIG_ASUS_LAPTOP is not set
CONFIG_DELL_SMBIOS=m
# CONFIG_DELL_LAPTOP is not set
CONFIG_DELL_WMI=m
# CONFIG_DELL_WMI_AIO is not set
CONFIG_DELL_SMO8800=y
# CONFIG_DELL_RBTN is not set
# CONFIG_FUJITSU_LAPTOP is not set
# CONFIG_FUJITSU_TABLET is not set
# CONFIG_AMILO_RFKILL is not set
# CONFIG_TC1100_WMI is not set
# CONFIG_HP_ACCEL is not set
CONFIG_HP_WIRELESS=y
CONFIG_HP_WMI=m
# CONFIG_MSI_LAPTOP is not set
CONFIG_PANASONIC_LAPTOP=m
# CONFIG_COMPAL_LAPTOP is not set
CONFIG_SONY_LAPTOP=m
CONFIG_SONYPI_COMPAT=y
# CONFIG_IDEAPAD_LAPTOP is not set
CONFIG_SURFACE3_WMI=m
CONFIG_THINKPAD_ACPI=m
# CONFIG_THINKPAD_ACPI_ALSA_SUPPORT is not set
# CONFIG_THINKPAD_ACPI_DEBUGFACILITIES is not set
# CONFIG_THINKPAD_ACPI_DEBUG is not set
CONFIG_THINKPAD_ACPI_UNSAFE_LEDS=y
# CONFIG_THINKPAD_ACPI_VIDEO is not set
# CONFIG_THINKPAD_ACPI_HOTKEY_POLL is not set
CONFIG_SENSORS_HDAPS=y
CONFIG_INTEL_MENLOW=m
# CONFIG_EEEPC_LAPTOP is not set
CONFIG_ASUS_WMI=m
# CONFIG_ASUS_NB_WMI is not set
# CONFIG_EEEPC_WMI is not set
CONFIG_ASUS_WIRELESS=y
CONFIG_ACPI_WMI=m
CONFIG_MSI_WMI=m
CONFIG_TOPSTAR_LAPTOP=m
# CONFIG_ACPI_TOSHIBA is not set
CONFIG_TOSHIBA_BT_RFKILL=m
CONFIG_TOSHIBA_HAPS=y
CONFIG_TOSHIBA_WMI=m
CONFIG_ACPI_CMPC=m
CONFIG_INTEL_HID_EVENT=m
CONFIG_INTEL_VBTN=m
CONFIG_INTEL_IPS=m
# CONFIG_INTEL_PMC_CORE is not set
# CONFIG_IBM_RTL is not set
CONFIG_SAMSUNG_LAPTOP=m
CONFIG_MXM_WMI=m
CONFIG_INTEL_OAKTRAIL=m
# CONFIG_SAMSUNG_Q10 is not set
# CONFIG_APPLE_GMUX is not set
CONFIG_INTEL_RST=m
CONFIG_INTEL_SMARTCONNECT=m
# CONFIG_PVPANIC is not set
CONFIG_INTEL_PMC_IPC=m
CONFIG_SURFACE_PRO3_BUTTON=y
CONFIG_INTEL_PUNIT_IPC=y
# CONFIG_MLX_CPLD_PLATFORM is not set
CONFIG_CHROME_PLATFORMS=y
CONFIG_CHROMEOS_LAPTOP=y
CONFIG_CHROMEOS_PSTORE=y
# CONFIG_CROS_EC_CHARDEV is not set
CONFIG_CROS_EC_LPC=m
CONFIG_CROS_EC_PROTO=y
CONFIG_CROS_KBD_LED_BACKLIGHT=m
CONFIG_CLKDEV_LOOKUP=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y

#
# Common Clock Framework
#
CONFIG_COMMON_CLK_MAX77686=y
CONFIG_COMMON_CLK_SI5351=y
CONFIG_COMMON_CLK_SI514=m
# CONFIG_COMMON_CLK_SI570 is not set
# CONFIG_COMMON_CLK_CDCE706 is not set
# CONFIG_COMMON_CLK_CDCE925 is not set
CONFIG_COMMON_CLK_CS2000_CP=y
CONFIG_CLK_TWL6040=m
# CONFIG_COMMON_CLK_NXP is not set
# CONFIG_COMMON_CLK_PALMAS is not set
CONFIG_COMMON_CLK_PWM=m
# CONFIG_COMMON_CLK_PXA is not set
# CONFIG_COMMON_CLK_PIC32 is not set
# CONFIG_COMMON_CLK_MT2701 is not set
# CONFIG_COMMON_CLK_MT2701_MMSYS is not set
# CONFIG_COMMON_CLK_MT2701_IMGSYS is not set
# CONFIG_COMMON_CLK_MT2701_VDECSYS is not set
# CONFIG_COMMON_CLK_MT2701_HIFSYS is not set
# CONFIG_COMMON_CLK_MT2701_ETHSYS is not set
# CONFIG_COMMON_CLK_MT2701_BDPSYS is not set

#
# Hardware Spinlock drivers
#

#
# Clock Source drivers
#
CONFIG_CLKSRC_I8253=y
CONFIG_CLKEVT_I8253=y
CONFIG_I8253_LOCK=y
CONFIG_CLKBLD_I8253=y
# CONFIG_ATMEL_PIT is not set
# CONFIG_SH_TIMER_CMT is not set
# CONFIG_SH_TIMER_MTU2 is not set
# CONFIG_SH_TIMER_TMU is not set
# CONFIG_EM_TIMER_STI is not set
CONFIG_MAILBOX=y
# CONFIG_PLATFORM_MHU is not set
# CONFIG_PCC is not set
# CONFIG_ALTERA_MBOX is not set
CONFIG_MAILBOX_TEST=m
CONFIG_IOMMU_SUPPORT=y

#
# Generic IOMMU Pagetable Support
#
# CONFIG_INTEL_IOMMU is not set

#
# Remoteproc drivers
#
# CONFIG_REMOTEPROC is not set

#
# Rpmsg drivers
#

#
# SOC (System On Chip) specific Drivers
#

#
# Broadcom SoC drivers
#
# CONFIG_SUNXI_SRAM is not set
CONFIG_SOC_TI=y
CONFIG_PM_DEVFREQ=y

#
# DEVFREQ Governors
#
CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
CONFIG_DEVFREQ_GOV_PERFORMANCE=m
# CONFIG_DEVFREQ_GOV_POWERSAVE is not set
CONFIG_DEVFREQ_GOV_USERSPACE=m
CONFIG_DEVFREQ_GOV_PASSIVE=y

#
# DEVFREQ Drivers
#
CONFIG_PM_DEVFREQ_EVENT=y
CONFIG_EXTCON=m

#
# Extcon Device Drivers
#
CONFIG_EXTCON_ADC_JACK=m
CONFIG_EXTCON_AXP288=m
CONFIG_EXTCON_GPIO=m
# CONFIG_EXTCON_MAX14577 is not set
CONFIG_EXTCON_MAX3355=m
# CONFIG_EXTCON_MAX8997 is not set
# CONFIG_EXTCON_PALMAS is not set
CONFIG_EXTCON_QCOM_SPMI_MISC=m
# CONFIG_EXTCON_RT8973A is not set
# CONFIG_EXTCON_SM5502 is not set
# CONFIG_EXTCON_USB_GPIO is not set
CONFIG_MEMORY=y
CONFIG_IIO=m
CONFIG_IIO_BUFFER=y
CONFIG_IIO_BUFFER_CB=m
CONFIG_IIO_KFIFO_BUF=m
CONFIG_IIO_TRIGGERED_BUFFER=m
CONFIG_IIO_CONFIGFS=m
CONFIG_IIO_TRIGGER=y
CONFIG_IIO_CONSUMERS_PER_TRIGGER=2
CONFIG_IIO_SW_DEVICE=m
# CONFIG_IIO_SW_TRIGGER is not set
CONFIG_IIO_TRIGGERED_EVENT=m

#
# Accelerometers
#
# CONFIG_BMA180 is not set
# CONFIG_BMA220 is not set
# CONFIG_BMC150_ACCEL is not set
CONFIG_DA280=m
# CONFIG_DA311 is not set
CONFIG_DMARD06=m
# CONFIG_DMARD09 is not set
CONFIG_DMARD10=m
CONFIG_HID_SENSOR_ACCEL_3D=m
CONFIG_IIO_ST_ACCEL_3AXIS=m
CONFIG_IIO_ST_ACCEL_I2C_3AXIS=m
CONFIG_IIO_ST_ACCEL_SPI_3AXIS=m
CONFIG_KXSD9=m
CONFIG_KXSD9_SPI=m
CONFIG_KXSD9_I2C=m
CONFIG_KXCJK1013=m
CONFIG_MC3230=m
CONFIG_MMA7455=m
CONFIG_MMA7455_I2C=m
CONFIG_MMA7455_SPI=m
CONFIG_MMA7660=m
CONFIG_MMA8452=m
CONFIG_MMA9551_CORE=m
# CONFIG_MMA9551 is not set
CONFIG_MMA9553=m
CONFIG_MXC4005=m
CONFIG_MXC6255=m
# CONFIG_SCA3000 is not set
CONFIG_STK8312=m
CONFIG_STK8BA50=m

#
# Analog to digital converters
#
CONFIG_AD_SIGMA_DELTA=m
CONFIG_AD7266=m
CONFIG_AD7291=m
CONFIG_AD7298=m
CONFIG_AD7476=m
CONFIG_AD7766=m
CONFIG_AD7791=m
# CONFIG_AD7793 is not set
CONFIG_AD7887=m
CONFIG_AD7923=m
# CONFIG_AD799X is not set
CONFIG_AXP288_ADC=m
# CONFIG_CC10001_ADC is not set
# CONFIG_DA9150_GPADC is not set
CONFIG_ENVELOPE_DETECTOR=m
CONFIG_HI8435=m
CONFIG_LTC2485=m
CONFIG_MAX1027=m
CONFIG_MAX1363=m
CONFIG_MCP320X=m
CONFIG_MCP3422=m
# CONFIG_MEN_Z188_ADC is not set
CONFIG_NAU7802=m
CONFIG_PALMAS_GPADC=m
CONFIG_QCOM_SPMI_IADC=m
CONFIG_QCOM_SPMI_VADC=m
CONFIG_TI_ADC081C=m
CONFIG_TI_ADC0832=m
CONFIG_TI_ADC12138=m
CONFIG_TI_ADC128S052=m
# CONFIG_TI_ADC161S626 is not set
CONFIG_TI_ADS1015=m
CONFIG_TI_ADS8688=m
# CONFIG_VF610_ADC is not set
CONFIG_VIPERBOARD_ADC=m

#
# Amplifiers
#
CONFIG_AD8366=m

#
# Chemical Sensors
#
CONFIG_ATLAS_PH_SENSOR=m
# CONFIG_IAQCORE is not set
CONFIG_VZ89X=m
# CONFIG_IIO_CROS_EC_SENSORS_CORE is not set

#
# Hid Sensor IIO Common
#
CONFIG_HID_SENSOR_IIO_COMMON=m
CONFIG_HID_SENSOR_IIO_TRIGGER=m
CONFIG_IIO_MS_SENSORS_I2C=m

#
# SSP Sensor Common
#
# CONFIG_IIO_SSP_SENSORHUB is not set
CONFIG_IIO_ST_SENSORS_I2C=m
CONFIG_IIO_ST_SENSORS_SPI=m
CONFIG_IIO_ST_SENSORS_CORE=m

#
# Counters
#

#
# Digital to analog converters
#
CONFIG_AD5064=m
CONFIG_AD5360=m
CONFIG_AD5380=m
CONFIG_AD5421=m
CONFIG_AD5446=m
CONFIG_AD5449=m
CONFIG_AD5592R_BASE=m
# CONFIG_AD5592R is not set
CONFIG_AD5593R=m
CONFIG_AD5504=m
CONFIG_AD5624R_SPI=m
CONFIG_AD5686=m
CONFIG_AD5755=m
# CONFIG_AD5761 is not set
# CONFIG_AD5764 is not set
CONFIG_AD5791=m
CONFIG_AD7303=m
CONFIG_AD8801=m
CONFIG_DPOT_DAC=m
CONFIG_M62332=m
CONFIG_MAX517=m
# CONFIG_MAX5821 is not set
CONFIG_MCP4725=m
# CONFIG_MCP4922 is not set
CONFIG_VF610_DAC=m

#
# IIO dummy driver
#
# CONFIG_IIO_SIMPLE_DUMMY is not set

#
# Frequency Synthesizers DDS/PLL
#

#
# Clock Generator/Distribution
#
# CONFIG_AD9523 is not set

#
# Phase-Locked Loop (PLL) frequency synthesizers
#
CONFIG_ADF4350=m

#
# Digital gyroscope sensors
#
CONFIG_ADIS16080=m
CONFIG_ADIS16130=m
CONFIG_ADIS16136=m
# CONFIG_ADIS16260 is not set
# CONFIG_ADXRS450 is not set
CONFIG_BMG160=m
CONFIG_BMG160_I2C=m
CONFIG_BMG160_SPI=m
# CONFIG_HID_SENSOR_GYRO_3D is not set
CONFIG_MPU3050=m
CONFIG_MPU3050_I2C=m
# CONFIG_IIO_ST_GYRO_3AXIS is not set
# CONFIG_ITG3200 is not set

#
# Health Sensors
#

#
# Heart Rate Monitors
#
# CONFIG_AFE4403 is not set
# CONFIG_AFE4404 is not set
CONFIG_MAX30100=m

#
# Humidity sensors
#
CONFIG_AM2315=m
CONFIG_DHT11=m
CONFIG_HDC100X=m
# CONFIG_HTS221 is not set
# CONFIG_HTU21 is not set
CONFIG_SI7005=m
CONFIG_SI7020=m

#
# Inertial measurement units
#
# CONFIG_ADIS16400 is not set
# CONFIG_ADIS16480 is not set
CONFIG_BMI160=m
# CONFIG_BMI160_I2C is not set
CONFIG_BMI160_SPI=m
CONFIG_KMX61=m
CONFIG_INV_MPU6050_IIO=m
# CONFIG_INV_MPU6050_I2C is not set
CONFIG_INV_MPU6050_SPI=m
CONFIG_IIO_ADIS_LIB=m
CONFIG_IIO_ADIS_LIB_BUFFER=y

#
# Light sensors
#
CONFIG_ACPI_ALS=m
CONFIG_ADJD_S311=m
# CONFIG_AL3320A is not set
CONFIG_APDS9300=m
CONFIG_APDS9960=m
CONFIG_BH1750=m
CONFIG_BH1780=m
# CONFIG_CM32181 is not set
CONFIG_CM3232=m
CONFIG_CM3323=m
CONFIG_CM36651=m
# CONFIG_GP2AP020A00F is not set
# CONFIG_SENSORS_ISL29018 is not set
CONFIG_ISL29125=m
# CONFIG_HID_SENSOR_ALS is not set
CONFIG_HID_SENSOR_PROX=m
CONFIG_JSA1212=m
CONFIG_RPR0521=m
CONFIG_SENSORS_LM3533=m
# CONFIG_LTR501 is not set
CONFIG_MAX44000=m
CONFIG_OPT3001=m
CONFIG_PA12203001=m
CONFIG_SI1145=m
CONFIG_STK3310=m
# CONFIG_TCS3414 is not set
CONFIG_TCS3472=m
# CONFIG_SENSORS_TSL2563 is not set
CONFIG_TSL2583=m
# CONFIG_TSL4531 is not set
CONFIG_US5182D=m
# CONFIG_VCNL4000 is not set
CONFIG_VEML6070=m

#
# Magnetometer sensors
#
CONFIG_AK8974=m
CONFIG_AK8975=m
CONFIG_AK09911=m
CONFIG_BMC150_MAGN=m
CONFIG_BMC150_MAGN_I2C=m
CONFIG_BMC150_MAGN_SPI=m
CONFIG_MAG3110=m
CONFIG_HID_SENSOR_MAGNETOMETER_3D=m
# CONFIG_MMC35240 is not set
CONFIG_IIO_ST_MAGN_3AXIS=m
CONFIG_IIO_ST_MAGN_I2C_3AXIS=m
CONFIG_IIO_ST_MAGN_SPI_3AXIS=m
CONFIG_SENSORS_HMC5843=m
CONFIG_SENSORS_HMC5843_I2C=m
CONFIG_SENSORS_HMC5843_SPI=m

#
# Inclinometer sensors
#
CONFIG_HID_SENSOR_INCLINOMETER_3D=m
# CONFIG_HID_SENSOR_DEVICE_ROTATION is not set

#
# Triggers - standalone
#
CONFIG_IIO_INTERRUPT_TRIGGER=m
# CONFIG_IIO_SYSFS_TRIGGER is not set

#
# Digital potentiometers
#
CONFIG_DS1803=m
CONFIG_MAX5487=m
# CONFIG_MCP4131 is not set
CONFIG_MCP4531=m
CONFIG_TPL0102=m

#
# Digital potentiostats
#
CONFIG_LMP91000=m

#
# Pressure sensors
#
# CONFIG_ABP060MG is not set
CONFIG_BMP280=m
CONFIG_BMP280_I2C=m
CONFIG_BMP280_SPI=m
CONFIG_HID_SENSOR_PRESS=m
CONFIG_HP03=m
CONFIG_MPL115=m
# CONFIG_MPL115_I2C is not set
CONFIG_MPL115_SPI=m
CONFIG_MPL3115=m
CONFIG_MS5611=m
CONFIG_MS5611_I2C=m
# CONFIG_MS5611_SPI is not set
CONFIG_MS5637=m
CONFIG_IIO_ST_PRESS=m
CONFIG_IIO_ST_PRESS_I2C=m
CONFIG_IIO_ST_PRESS_SPI=m
CONFIG_T5403=m
CONFIG_HP206C=m
# CONFIG_ZPA2326 is not set

#
# Lightning sensors
#
CONFIG_AS3935=m

#
# Proximity sensors
#
# CONFIG_LIDAR_LITE_V2 is not set
CONFIG_SX9500=m

#
# Temperature sensors
#
CONFIG_MAXIM_THERMOCOUPLE=m
# CONFIG_MLX90614 is not set
CONFIG_TMP006=m
CONFIG_TSYS01=m
CONFIG_TSYS02D=m
CONFIG_NTB=y
CONFIG_NTB_PINGPONG=m
CONFIG_NTB_TOOL=y
CONFIG_NTB_PERF=y
# CONFIG_NTB_TRANSPORT is not set
CONFIG_VME_BUS=y

#
# VME Bridge Drivers
#
CONFIG_VME_CA91CX42=m
CONFIG_VME_TSI148=m
CONFIG_VME_FAKE=m

#
# VME Board Drivers
#
CONFIG_VMIVME_7805=m

#
# VME Device Drivers
#
# CONFIG_VME_USER is not set
CONFIG_VME_PIO2=y
CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
# CONFIG_PWM_ATMEL_HLCDC_PWM is not set
CONFIG_PWM_CROS_EC=m
# CONFIG_PWM_FSL_FTM is not set
CONFIG_PWM_LP3943=m
CONFIG_PWM_LPSS=m
# CONFIG_PWM_LPSS_PCI is not set
CONFIG_PWM_LPSS_PLATFORM=m
# CONFIG_PWM_PCA9685 is not set
CONFIG_PWM_STMPE=y
CONFIG_IRQCHIP=y
CONFIG_ARM_GIC_MAX_NR=1
CONFIG_IPACK_BUS=m
CONFIG_BOARD_TPCI200=m
CONFIG_SERIAL_IPOCTAL=m
CONFIG_RESET_CONTROLLER=y
# CONFIG_RESET_ATH79 is not set
# CONFIG_RESET_BERLIN is not set
# CONFIG_RESET_LPC18XX is not set
# CONFIG_RESET_MESON is not set
# CONFIG_RESET_PISTACHIO is not set
# CONFIG_RESET_SOCFPGA is not set
# CONFIG_RESET_STM32 is not set
# CONFIG_RESET_SUNXI is not set
CONFIG_TI_SYSCON_RESET=m
# CONFIG_RESET_ZYNQ is not set
# CONFIG_RESET_TEGRA_BPMP is not set
# CONFIG_FMC is not set

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
# CONFIG_PHY_PXA_28NM_HSIC is not set
CONFIG_PHY_PXA_28NM_USB2=m
# CONFIG_BCM_KONA_USB2_PHY is not set
# CONFIG_PHY_SAMSUNG_USB2 is not set
# CONFIG_POWERCAP is not set
CONFIG_MCB=m
CONFIG_MCB_PCI=m
# CONFIG_MCB_LPC is not set

#
# Performance monitor support
#
CONFIG_RAS=y
CONFIG_THUNDERBOLT=m

#
# Android
#
# CONFIG_ANDROID is not set
# CONFIG_LIBNVDIMM is not set
CONFIG_NVMEM=y
CONFIG_STM=y
# CONFIG_STM_DUMMY is not set
# CONFIG_STM_SOURCE_CONSOLE is not set
CONFIG_STM_SOURCE_HEARTBEAT=m
# CONFIG_STM_SOURCE_FTRACE is not set
CONFIG_INTEL_TH=m
# CONFIG_INTEL_TH_PCI is not set
# CONFIG_INTEL_TH_GTH is not set
CONFIG_INTEL_TH_STH=m
CONFIG_INTEL_TH_MSU=m
CONFIG_INTEL_TH_PTI=m
CONFIG_INTEL_TH_DEBUG=y

#
# FPGA Configuration Support
#
# CONFIG_FPGA is not set

#
# Firmware Drivers
#
# CONFIG_ARM_SCPI_PROTOCOL is not set
CONFIG_EDD=m
CONFIG_EDD_OFF=y
CONFIG_FIRMWARE_MEMMAP=y
# CONFIG_DELL_RBU is not set
CONFIG_DCDBAS=m
# CONFIG_DMIID is not set
CONFIG_DMI_SYSFS=m
CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=y
CONFIG_ISCSI_IBFT_FIND=y
# CONFIG_FW_CFG_SYSFS is not set
CONFIG_GOOGLE_FIRMWARE=y

#
# Google Firmware Drivers
#
CONFIG_GOOGLE_MEMCONSOLE=y
# CONFIG_EFI_DEV_PATH_PARSER is not set

#
# Tegra firmware driver
#

#
# File systems
#
CONFIG_DCACHE_WORD_ACCESS=y
CONFIG_FS_IOMAP=y
CONFIG_EXT2_FS=y
CONFIG_EXT2_FS_XATTR=y
# CONFIG_EXT2_FS_POSIX_ACL is not set
# CONFIG_EXT2_FS_SECURITY is not set
CONFIG_EXT3_FS=y
# CONFIG_EXT3_FS_POSIX_ACL is not set
# CONFIG_EXT3_FS_SECURITY is not set
CONFIG_EXT4_FS=y
# CONFIG_EXT4_FS_POSIX_ACL is not set
CONFIG_EXT4_FS_SECURITY=y
# CONFIG_EXT4_ENCRYPTION is not set
CONFIG_EXT4_DEBUG=y
CONFIG_JBD2=y
# CONFIG_JBD2_DEBUG is not set
CONFIG_FS_MBCACHE=y
CONFIG_REISERFS_FS=y
# CONFIG_REISERFS_CHECK is not set
CONFIG_REISERFS_PROC_INFO=y
CONFIG_REISERFS_FS_XATTR=y
# CONFIG_REISERFS_FS_POSIX_ACL is not set
CONFIG_REISERFS_FS_SECURITY=y
CONFIG_JFS_FS=y
# CONFIG_JFS_POSIX_ACL is not set
CONFIG_JFS_SECURITY=y
CONFIG_JFS_DEBUG=y
# CONFIG_JFS_STATISTICS is not set
CONFIG_XFS_FS=m
# CONFIG_XFS_QUOTA is not set
CONFIG_XFS_POSIX_ACL=y
# CONFIG_XFS_RT is not set
CONFIG_XFS_DEBUG=y
CONFIG_GFS2_FS=y
CONFIG_OCFS2_FS=m
CONFIG_OCFS2_FS_O2CB=m
# CONFIG_OCFS2_FS_STATS is not set
CONFIG_OCFS2_DEBUG_MASKLOG=y
# CONFIG_OCFS2_DEBUG_FS is not set
CONFIG_BTRFS_FS=y
# CONFIG_BTRFS_FS_POSIX_ACL is not set
# CONFIG_BTRFS_FS_CHECK_INTEGRITY is not set
# CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
# CONFIG_BTRFS_DEBUG is not set
# CONFIG_BTRFS_ASSERT is not set
# CONFIG_NILFS2_FS is not set
CONFIG_F2FS_FS=y
CONFIG_F2FS_STAT_FS=y
CONFIG_F2FS_FS_XATTR=y
# CONFIG_F2FS_FS_POSIX_ACL is not set
# CONFIG_F2FS_FS_SECURITY is not set
# CONFIG_F2FS_CHECK_FS is not set
# CONFIG_F2FS_FS_ENCRYPTION is not set
CONFIG_F2FS_IO_TRACE=y
CONFIG_F2FS_FAULT_INJECTION=y
# CONFIG_FS_DAX is not set
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
CONFIG_EXPORTFS_BLOCK_OPS=y
CONFIG_FILE_LOCKING=y
# CONFIG_MANDATORY_FILE_LOCKING is not set
# CONFIG_FS_ENCRYPTION is not set
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
CONFIG_INOTIFY_USER=y
# CONFIG_FANOTIFY is not set
CONFIG_QUOTA=y
CONFIG_QUOTA_NETLINK_INTERFACE=y
# CONFIG_PRINT_QUOTA_WARNING is not set
CONFIG_QUOTA_DEBUG=y
CONFIG_QUOTA_TREE=m
# CONFIG_QFMT_V1 is not set
# CONFIG_QFMT_V2 is not set
CONFIG_QUOTACTL=y
CONFIG_AUTOFS4_FS=m
CONFIG_FUSE_FS=y
CONFIG_CUSE=m
CONFIG_OVERLAY_FS=y
CONFIG_OVERLAY_FS_REDIRECT_DIR=y

#
# Caches
#
CONFIG_FSCACHE=m
CONFIG_FSCACHE_STATS=y
CONFIG_FSCACHE_HISTOGRAM=y
CONFIG_FSCACHE_DEBUG=y
# CONFIG_FSCACHE_OBJECT_LIST is not set
CONFIG_CACHEFILES=m
# CONFIG_CACHEFILES_DEBUG is not set
CONFIG_CACHEFILES_HISTOGRAM=y

#
# CD-ROM/DVD Filesystems
#
CONFIG_ISO9660_FS=m
CONFIG_JOLIET=y
CONFIG_ZISOFS=y
CONFIG_UDF_FS=m
CONFIG_UDF_NLS=y

#
# DOS/FAT/NT Filesystems
#
CONFIG_FAT_FS=y
# CONFIG_MSDOS_FS is not set
CONFIG_VFAT_FS=y
CONFIG_FAT_DEFAULT_CODEPAGE=437
CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
CONFIG_FAT_DEFAULT_UTF8=y
CONFIG_NTFS_FS=m
CONFIG_NTFS_DEBUG=y
# CONFIG_NTFS_RW is not set

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
CONFIG_PROC_KCORE=y
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
CONFIG_PROC_CHILDREN=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
CONFIG_TMPFS_POSIX_ACL=y
CONFIG_TMPFS_XATTR=y
# CONFIG_HUGETLBFS is not set
# CONFIG_HUGETLB_PAGE is not set
CONFIG_CONFIGFS_FS=y
CONFIG_MISC_FILESYSTEMS=y
CONFIG_ORANGEFS_FS=m
CONFIG_ADFS_FS=y
CONFIG_ADFS_FS_RW=y
# CONFIG_AFFS_FS is not set
CONFIG_ECRYPT_FS=m
# CONFIG_ECRYPT_FS_MESSAGING is not set
CONFIG_HFS_FS=m
# CONFIG_HFSPLUS_FS is not set
CONFIG_BEFS_FS=m
# CONFIG_BEFS_DEBUG is not set
CONFIG_BFS_FS=m
CONFIG_EFS_FS=m
CONFIG_JFFS2_FS=m
CONFIG_JFFS2_FS_DEBUG=0
# CONFIG_JFFS2_FS_WRITEBUFFER is not set
# CONFIG_JFFS2_SUMMARY is not set
CONFIG_JFFS2_FS_XATTR=y
# CONFIG_JFFS2_FS_POSIX_ACL is not set
CONFIG_JFFS2_FS_SECURITY=y
CONFIG_JFFS2_COMPRESSION_OPTIONS=y
# CONFIG_JFFS2_ZLIB is not set
CONFIG_JFFS2_LZO=y
CONFIG_JFFS2_RTIME=y
CONFIG_JFFS2_RUBIN=y
# CONFIG_JFFS2_CMODE_NONE is not set
# CONFIG_JFFS2_CMODE_PRIORITY is not set
CONFIG_JFFS2_CMODE_SIZE=y
# CONFIG_JFFS2_CMODE_FAVOURLZO is not set
CONFIG_UBIFS_FS=m
CONFIG_UBIFS_FS_ADVANCED_COMPR=y
CONFIG_UBIFS_FS_LZO=y
CONFIG_UBIFS_FS_ZLIB=y
# CONFIG_UBIFS_ATIME_SUPPORT is not set
# CONFIG_UBIFS_FS_ENCRYPTION is not set
CONFIG_CRAMFS=y
CONFIG_SQUASHFS=m
# CONFIG_SQUASHFS_FILE_CACHE is not set
CONFIG_SQUASHFS_FILE_DIRECT=y
CONFIG_SQUASHFS_DECOMP_SINGLE=y
# CONFIG_SQUASHFS_DECOMP_MULTI is not set
# CONFIG_SQUASHFS_DECOMP_MULTI_PERCPU is not set
# CONFIG_SQUASHFS_XATTR is not set
CONFIG_SQUASHFS_ZLIB=y
# CONFIG_SQUASHFS_LZ4 is not set
# CONFIG_SQUASHFS_LZO is not set
CONFIG_SQUASHFS_XZ=y
# CONFIG_SQUASHFS_4K_DEVBLK_SIZE is not set
# CONFIG_SQUASHFS_EMBEDDED is not set
CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3
CONFIG_VXFS_FS=y
CONFIG_MINIX_FS=y
# CONFIG_OMFS_FS is not set
# CONFIG_HPFS_FS is not set
CONFIG_QNX4FS_FS=y
CONFIG_QNX6FS_FS=y
# CONFIG_QNX6FS_DEBUG is not set
CONFIG_ROMFS_FS=m
CONFIG_ROMFS_BACKED_BY_BLOCK=y
# CONFIG_ROMFS_BACKED_BY_MTD is not set
# CONFIG_ROMFS_BACKED_BY_BOTH is not set
CONFIG_ROMFS_ON_BLOCK=y
CONFIG_PSTORE=y
# CONFIG_PSTORE_ZLIB_COMPRESS is not set
CONFIG_PSTORE_LZO_COMPRESS=y
# CONFIG_PSTORE_LZ4_COMPRESS is not set
CONFIG_PSTORE_CONSOLE=y
# CONFIG_PSTORE_PMSG is not set
CONFIG_PSTORE_FTRACE=y
# CONFIG_PSTORE_RAM is not set
CONFIG_SYSV_FS=m
# CONFIG_UFS_FS is not set
CONFIG_EXOFS_FS=m
# CONFIG_EXOFS_DEBUG is not set
CONFIG_ORE=m
CONFIG_NETWORK_FILESYSTEMS=y
CONFIG_NFS_FS=m
CONFIG_NFS_V2=m
# CONFIG_NFS_V3 is not set
CONFIG_NFS_V4=m
CONFIG_NFS_SWAP=y
# CONFIG_NFS_V4_1 is not set
CONFIG_NFS_FSCACHE=y
# CONFIG_NFS_USE_LEGACY_DNS is not set
CONFIG_NFS_USE_KERNEL_DNS=y
CONFIG_NFS_DEBUG=y
CONFIG_NFSD=m
# CONFIG_NFSD_V3 is not set
# CONFIG_NFSD_V4 is not set
CONFIG_GRACE_PERIOD=m
CONFIG_LOCKD=m
CONFIG_NFS_COMMON=y
CONFIG_SUNRPC=m
CONFIG_SUNRPC_GSS=m
CONFIG_SUNRPC_SWAP=y
CONFIG_SUNRPC_DEBUG=y
CONFIG_CEPH_FS=y
# CONFIG_CEPH_FS_POSIX_ACL is not set
CONFIG_CIFS=m
# CONFIG_CIFS_STATS is not set
# CONFIG_CIFS_WEAK_PW_HASH is not set
# CONFIG_CIFS_UPCALL is not set
# CONFIG_CIFS_XATTR is not set
CONFIG_CIFS_DEBUG=y
# CONFIG_CIFS_DEBUG2 is not set
# CONFIG_CIFS_DFS_UPCALL is not set
# CONFIG_CIFS_SMB2 is not set
# CONFIG_CIFS_FSCACHE is not set
# CONFIG_NCP_FS is not set
CONFIG_CODA_FS=m
CONFIG_AFS_FS=y
# CONFIG_AFS_DEBUG is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
CONFIG_NLS_CODEPAGE_437=m
# CONFIG_NLS_CODEPAGE_737 is not set
CONFIG_NLS_CODEPAGE_775=y
CONFIG_NLS_CODEPAGE_850=y
CONFIG_NLS_CODEPAGE_852=m
# CONFIG_NLS_CODEPAGE_855 is not set
CONFIG_NLS_CODEPAGE_857=y
# CONFIG_NLS_CODEPAGE_860 is not set
CONFIG_NLS_CODEPAGE_861=y
CONFIG_NLS_CODEPAGE_862=y
CONFIG_NLS_CODEPAGE_863=y
# CONFIG_NLS_CODEPAGE_864 is not set
CONFIG_NLS_CODEPAGE_865=y
# CONFIG_NLS_CODEPAGE_866 is not set
CONFIG_NLS_CODEPAGE_869=m
CONFIG_NLS_CODEPAGE_936=m
CONFIG_NLS_CODEPAGE_950=y
# CONFIG_NLS_CODEPAGE_932 is not set
# CONFIG_NLS_CODEPAGE_949 is not set
CONFIG_NLS_CODEPAGE_874=y
CONFIG_NLS_ISO8859_8=m
# CONFIG_NLS_CODEPAGE_1250 is not set
CONFIG_NLS_CODEPAGE_1251=y
CONFIG_NLS_ASCII=m
CONFIG_NLS_ISO8859_1=y
CONFIG_NLS_ISO8859_2=y
CONFIG_NLS_ISO8859_3=y
CONFIG_NLS_ISO8859_4=y
CONFIG_NLS_ISO8859_5=m
CONFIG_NLS_ISO8859_6=y
CONFIG_NLS_ISO8859_7=y
CONFIG_NLS_ISO8859_9=m
CONFIG_NLS_ISO8859_13=y
CONFIG_NLS_ISO8859_14=y
# CONFIG_NLS_ISO8859_15 is not set
CONFIG_NLS_KOI8_R=y
CONFIG_NLS_KOI8_U=m
CONFIG_NLS_MAC_ROMAN=y
CONFIG_NLS_MAC_CELTIC=m
# CONFIG_NLS_MAC_CENTEURO is not set
# CONFIG_NLS_MAC_CROATIAN is not set
CONFIG_NLS_MAC_CYRILLIC=y
# CONFIG_NLS_MAC_GAELIC is not set
CONFIG_NLS_MAC_GREEK=m
# CONFIG_NLS_MAC_ICELAND is not set
CONFIG_NLS_MAC_INUIT=m
# CONFIG_NLS_MAC_ROMANIAN is not set
CONFIG_NLS_MAC_TURKISH=m
CONFIG_NLS_UTF8=m
# CONFIG_DLM is not set

#
# Kernel hacking
#
CONFIG_TRACE_IRQFLAGS_SUPPORT=y

#
# printk and dmesg options
#
CONFIG_PRINTK_TIME=y
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
CONFIG_BOOT_PRINTK_DELAY=y
CONFIG_DYNAMIC_DEBUG=y

#
# Compile-time checks and compiler options
#
# CONFIG_DEBUG_INFO is not set
CONFIG_ENABLE_WARN_DEPRECATED=y
CONFIG_ENABLE_MUST_CHECK=y
CONFIG_FRAME_WARN=1024
CONFIG_STRIP_ASM_SYMS=y
# CONFIG_READABLE_ASM is not set
CONFIG_UNUSED_SYMBOLS=y
CONFIG_PAGE_OWNER=y
CONFIG_DEBUG_FS=y
CONFIG_HEADERS_CHECK=y
CONFIG_DEBUG_SECTION_MISMATCH=y
# CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
CONFIG_ARCH_WANT_FRAME_POINTERS=y
CONFIG_FRAME_POINTER=y
# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
CONFIG_MAGIC_SYSRQ=y
CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
CONFIG_DEBUG_KERNEL=y

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
CONFIG_DEBUG_PAGEALLOC=y
# CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT is not set
CONFIG_PAGE_POISONING=y
# CONFIG_PAGE_POISONING_NO_SANITY is not set
# CONFIG_PAGE_POISONING_ZERO is not set
CONFIG_DEBUG_PAGE_REF=y
CONFIG_DEBUG_OBJECTS=y
CONFIG_DEBUG_OBJECTS_SELFTEST=y
# CONFIG_DEBUG_OBJECTS_FREE is not set
# CONFIG_DEBUG_OBJECTS_TIMERS is not set
# CONFIG_DEBUG_OBJECTS_WORK is not set
# CONFIG_DEBUG_OBJECTS_RCU_HEAD is not set
CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER=y
CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=1
# CONFIG_DEBUG_SLAB is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=y
# CONFIG_DEBUG_KMEMLEAK is not set
# CONFIG_DEBUG_STACK_USAGE is not set
# CONFIG_DEBUG_VM is not set
# CONFIG_DEBUG_VIRTUAL is not set
CONFIG_DEBUG_MEMORY_INIT=y
CONFIG_HAVE_DEBUG_STACKOVERFLOW=y
# CONFIG_DEBUG_STACKOVERFLOW is not set
CONFIG_HAVE_ARCH_KMEMCHECK=y
# CONFIG_DEBUG_SHIRQ is not set

#
# Debug Lockups and Hangs
#
# CONFIG_LOCKUP_DETECTOR is not set
# CONFIG_DETECT_HUNG_TASK is not set
CONFIG_WQ_WATCHDOG=y
CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_ON_OOPS_VALUE=1
CONFIG_PANIC_TIMEOUT=0
CONFIG_SCHED_DEBUG=y
CONFIG_SCHED_INFO=y
CONFIG_SCHEDSTATS=y
# CONFIG_SCHED_STACK_END_CHECK is not set
CONFIG_DEBUG_TIMEKEEPING=y
# CONFIG_TIMER_STATS is not set

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
# CONFIG_DEBUG_RT_MUTEXES is not set
CONFIG_DEBUG_SPINLOCK=y
CONFIG_DEBUG_MUTEXES=y
CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y
CONFIG_DEBUG_LOCK_ALLOC=y
# CONFIG_PROVE_LOCKING is not set
CONFIG_LOCKDEP=y
CONFIG_LOCK_STAT=y
CONFIG_DEBUG_LOCKDEP=y
CONFIG_DEBUG_ATOMIC_SLEEP=y
CONFIG_DEBUG_LOCKING_API_SELFTESTS=y
CONFIG_LOCK_TORTURE_TEST=m
CONFIG_TRACE_IRQFLAGS=y
CONFIG_STACKTRACE=y
# CONFIG_DEBUG_KOBJECT is not set
CONFIG_DEBUG_BUGVERBOSE=y
CONFIG_DEBUG_LIST=y
# CONFIG_DEBUG_PI_LIST is not set
CONFIG_DEBUG_SG=y
# CONFIG_DEBUG_NOTIFIERS is not set
CONFIG_DEBUG_CREDENTIALS=y

#
# RCU Debugging
#
# CONFIG_PROVE_RCU is not set
CONFIG_SPARSE_RCU_POINTER=y
CONFIG_TORTURE_TEST=y
# CONFIG_RCU_PERF_TEST is not set
CONFIG_RCU_TORTURE_TEST=y
CONFIG_RCU_TORTURE_TEST_SLOW_PREINIT=y
CONFIG_RCU_TORTURE_TEST_SLOW_PREINIT_DELAY=3
CONFIG_RCU_TORTURE_TEST_SLOW_INIT=y
CONFIG_RCU_TORTURE_TEST_SLOW_INIT_DELAY=3
# CONFIG_RCU_TORTURE_TEST_SLOW_CLEANUP is not set
# CONFIG_RCU_TRACE is not set
CONFIG_RCU_EQS_DEBUG=y
# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
CONFIG_NOTIFIER_ERROR_INJECTION=y
# CONFIG_OF_RECONFIG_NOTIFIER_ERROR_INJECT is not set
CONFIG_NETDEV_NOTIFIER_ERROR_INJECT=y
CONFIG_FAULT_INJECTION=y
# CONFIG_FAILSLAB is not set
# CONFIG_FAIL_PAGE_ALLOC is not set
# CONFIG_FAIL_MAKE_REQUEST is not set
CONFIG_FAIL_IO_TIMEOUT=y
CONFIG_FAIL_FUTEX=y
# CONFIG_FAULT_INJECTION_DEBUG_FS is not set
CONFIG_LATENCYTOP=y
CONFIG_USER_STACKTRACE_SUPPORT=y
CONFIG_NOP_TRACER=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_TRACER_MAX_TRACE=y
CONFIG_TRACE_CLOCK=y
CONFIG_RING_BUFFER=y
CONFIG_EVENT_TRACING=y
CONFIG_CONTEXT_SWITCH_TRACER=y
CONFIG_RING_BUFFER_ALLOW_SWAP=y
CONFIG_TRACING=y
CONFIG_GENERIC_TRACER=y
CONFIG_TRACING_SUPPORT=y
CONFIG_FTRACE=y
CONFIG_FUNCTION_TRACER=y
CONFIG_IRQSOFF_TRACER=y
CONFIG_SCHED_TRACER=y
# CONFIG_HWLAT_TRACER is not set
# CONFIG_FTRACE_SYSCALLS is not set
CONFIG_TRACER_SNAPSHOT=y
CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP=y
CONFIG_TRACE_BRANCH_PROFILING=y
# CONFIG_BRANCH_PROFILE_NONE is not set
# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
CONFIG_PROFILE_ALL_BRANCHES=y
# CONFIG_BRANCH_TRACER is not set
CONFIG_STACK_TRACER=y
CONFIG_BLK_DEV_IO_TRACE=y
# CONFIG_UPROBE_EVENT is not set
# CONFIG_PROBE_EVENTS is not set
# CONFIG_DYNAMIC_FTRACE is not set
# CONFIG_FUNCTION_PROFILER is not set
# CONFIG_FTRACE_STARTUP_TEST is not set
CONFIG_MMIOTRACE=y
# CONFIG_HIST_TRIGGERS is not set
CONFIG_MMIOTRACE_TEST=m
CONFIG_TRACEPOINT_BENCHMARK=y
CONFIG_RING_BUFFER_BENCHMARK=m
# CONFIG_RING_BUFFER_STARTUP_TEST is not set
CONFIG_TRACE_ENUM_MAP_FILE=y
CONFIG_TRACING_EVENTS_GPIO=y

#
# Runtime Testing
#
CONFIG_LKDTM=y
CONFIG_TEST_LIST_SORT=y
# CONFIG_BACKTRACE_SELF_TEST is not set
CONFIG_RBTREE_TEST=y
CONFIG_INTERVAL_TREE_TEST=m
# CONFIG_PERCPU_TEST is not set
# CONFIG_ATOMIC64_SELFTEST is not set
CONFIG_TEST_HEXDUMP=m
CONFIG_TEST_STRING_HELPERS=m
# CONFIG_TEST_KSTRTOX is not set
# CONFIG_TEST_PRINTF is not set
CONFIG_TEST_BITMAP=m
CONFIG_TEST_UUID=m
# CONFIG_TEST_RHASHTABLE is not set
CONFIG_TEST_HASH=y
CONFIG_PROVIDE_OHCI1394_DMA_INIT=y
# CONFIG_DMA_API_DEBUG is not set
# CONFIG_TEST_LKM is not set
CONFIG_TEST_USER_COPY=m
# CONFIG_TEST_BPF is not set
# CONFIG_TEST_FIRMWARE is not set
CONFIG_TEST_UDELAY=m
CONFIG_MEMTEST=y
CONFIG_TEST_STATIC_KEYS=m
# CONFIG_BUG_ON_DATA_CORRUPTION is not set
# CONFIG_SAMPLES is not set
CONFIG_HAVE_ARCH_KGDB=y
# CONFIG_KGDB is not set
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
# CONFIG_ARCH_WANTS_UBSAN_NO_NULL is not set
# CONFIG_UBSAN is not set
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y
CONFIG_STRICT_DEVMEM=y
CONFIG_IO_STRICT_DEVMEM=y
CONFIG_X86_VERBOSE_BOOTUP=y
CONFIG_EARLY_PRINTK=y
# CONFIG_EARLY_PRINTK_DBGP is not set
CONFIG_X86_PTDUMP_CORE=y
# CONFIG_X86_PTDUMP is not set
# CONFIG_DEBUG_RODATA_TEST is not set
CONFIG_DEBUG_WX=y
# CONFIG_DEBUG_NX_TEST is not set
CONFIG_DOUBLEFAULT=y
CONFIG_DEBUG_TLBFLUSH=y
# CONFIG_IOMMU_STRESS is not set
CONFIG_HAVE_MMIOTRACE_SUPPORT=y
CONFIG_IO_DELAY_TYPE_0X80=0
CONFIG_IO_DELAY_TYPE_0XED=1
CONFIG_IO_DELAY_TYPE_UDELAY=2
CONFIG_IO_DELAY_TYPE_NONE=3
# CONFIG_IO_DELAY_0X80 is not set
# CONFIG_IO_DELAY_0XED is not set
CONFIG_IO_DELAY_UDELAY=y
# CONFIG_IO_DELAY_NONE is not set
CONFIG_DEFAULT_IO_DELAY_TYPE=2
# CONFIG_DEBUG_BOOT_PARAMS is not set
# CONFIG_CPA_DEBUG is not set
CONFIG_OPTIMIZE_INLINING=y
CONFIG_DEBUG_ENTRY=y
# CONFIG_DEBUG_NMI_SELFTEST is not set
# CONFIG_X86_DEBUG_FPU is not set
CONFIG_PUNIT_ATOM_DEBUG=m

#
# Security options
#
CONFIG_KEYS=y
# CONFIG_PERSISTENT_KEYRINGS is not set
# CONFIG_BIG_KEYS is not set
CONFIG_TRUSTED_KEYS=m
CONFIG_ENCRYPTED_KEYS=m
CONFIG_KEY_DH_OPERATIONS=y
CONFIG_SECURITY_DMESG_RESTRICT=y
# CONFIG_SECURITY is not set
CONFIG_SECURITYFS=y
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
CONFIG_HAVE_ARCH_HARDENED_USERCOPY=y
CONFIG_HARDENED_USERCOPY=y
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_DEFAULT_SECURITY=""
CONFIG_XOR_BLOCKS=y
CONFIG_ASYNC_CORE=m
CONFIG_ASYNC_XOR=m
CONFIG_ASYNC_PQ=m
CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_BLKCIPHER=y
CONFIG_CRYPTO_BLKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_AKCIPHER=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=m
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=m
CONFIG_CRYPTO_ECDH=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
# CONFIG_CRYPTO_USER is not set
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_GF128MUL=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_WORKQUEUE=y
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_MCRYPTD=m
CONFIG_CRYPTO_AUTHENC=y
CONFIG_CRYPTO_TEST=m
CONFIG_CRYPTO_ABLK_HELPER=y
CONFIG_CRYPTO_SIMD=y
CONFIG_CRYPTO_GLUE_HELPER_X86=y

#
# Authenticated Encryption with Associated Data
#
CONFIG_CRYPTO_CCM=y
# CONFIG_CRYPTO_GCM is not set
CONFIG_CRYPTO_CHACHA20POLY1305=y
CONFIG_CRYPTO_SEQIV=y
CONFIG_CRYPTO_ECHAINIV=y

#
# Block modes
#
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CTR=y
# CONFIG_CRYPTO_CTS is not set
CONFIG_CRYPTO_ECB=y
CONFIG_CRYPTO_LRW=y
CONFIG_CRYPTO_PCBC=y
CONFIG_CRYPTO_XTS=y
CONFIG_CRYPTO_KEYWRAP=y

#
# Hash modes
#
CONFIG_CRYPTO_CMAC=m
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_XCBC=m
# CONFIG_CRYPTO_VMAC is not set

#
# Digest
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32C_INTEL=m
CONFIG_CRYPTO_CRC32=y
CONFIG_CRYPTO_CRC32_PCLMUL=y
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_POLY1305=y
CONFIG_CRYPTO_MD4=m
CONFIG_CRYPTO_MD5=y
CONFIG_CRYPTO_MICHAEL_MIC=m
# CONFIG_CRYPTO_RMD128 is not set
# CONFIG_CRYPTO_RMD160 is not set
CONFIG_CRYPTO_RMD256=y
CONFIG_CRYPTO_RMD320=m
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
# CONFIG_CRYPTO_SHA3 is not set
# CONFIG_CRYPTO_TGR192 is not set
CONFIG_CRYPTO_WP512=m

#
# Ciphers
#
CONFIG_CRYPTO_AES=y
CONFIG_CRYPTO_AES_586=y
CONFIG_CRYPTO_AES_NI_INTEL=y
CONFIG_CRYPTO_ANUBIS=y
CONFIG_CRYPTO_ARC4=m
# CONFIG_CRYPTO_BLOWFISH is not set
# CONFIG_CRYPTO_CAMELLIA is not set
CONFIG_CRYPTO_CAST_COMMON=y
CONFIG_CRYPTO_CAST5=y
# CONFIG_CRYPTO_CAST6 is not set
CONFIG_CRYPTO_DES=y
CONFIG_CRYPTO_FCRYPT=y
CONFIG_CRYPTO_KHAZAD=m
CONFIG_CRYPTO_SALSA20=m
# CONFIG_CRYPTO_SALSA20_586 is not set
CONFIG_CRYPTO_CHACHA20=y
# CONFIG_CRYPTO_SEED is not set
CONFIG_CRYPTO_SERPENT=y
CONFIG_CRYPTO_SERPENT_SSE2_586=y
CONFIG_CRYPTO_TEA=y
CONFIG_CRYPTO_TWOFISH=m
CONFIG_CRYPTO_TWOFISH_COMMON=y
CONFIG_CRYPTO_TWOFISH_586=y

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
CONFIG_CRYPTO_LZO=m
CONFIG_CRYPTO_842=m
CONFIG_CRYPTO_LZ4=y
CONFIG_CRYPTO_LZ4HC=m

#
# Random Number Generation
#
# CONFIG_CRYPTO_ANSI_CPRNG is not set
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
CONFIG_CRYPTO_DRBG_HASH=y
# CONFIG_CRYPTO_DRBG_CTR is not set
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
CONFIG_CRYPTO_USER_API=y
CONFIG_CRYPTO_USER_API_HASH=y
CONFIG_CRYPTO_USER_API_SKCIPHER=m
CONFIG_CRYPTO_USER_API_RNG=m
# CONFIG_CRYPTO_USER_API_AEAD is not set
CONFIG_CRYPTO_HASH_INFO=y
# CONFIG_CRYPTO_HW is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
CONFIG_X509_CERTIFICATE_PARSER=y
CONFIG_PKCS7_MESSAGE_PARSER=y

#
# Certificates for signature checking
#
CONFIG_SYSTEM_TRUSTED_KEYRING=y
CONFIG_SYSTEM_TRUSTED_KEYS=""
# CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
CONFIG_SECONDARY_TRUSTED_KEYRING=y
CONFIG_HAVE_KVM=y
CONFIG_VIRTUALIZATION=y
CONFIG_VHOST_NET=m
CONFIG_VHOST_VSOCK=m
CONFIG_VHOST=m
CONFIG_VHOST_CROSS_ENDIAN_LEGACY=y
CONFIG_LGUEST=y
CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_RAID6_PQ=y
CONFIG_BITREVERSE=y
# CONFIG_HAVE_ARCH_BITREVERSE is not set
CONFIG_RATIONAL=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_GENERIC_FIND_FIRST_BIT=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_GENERIC_IOMAP=y
CONFIG_GENERIC_IO=y
CONFIG_ARCH_HAS_FAST_MULTIPLIER=y
CONFIG_CRC_CCITT=y
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=y
CONFIG_CRC_ITU_T=y
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
# CONFIG_CRC32_SLICEBY8 is not set
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
CONFIG_CRC32_BIT=y
CONFIG_CRC7=y
CONFIG_LIBCRC32C=y
CONFIG_CRC8=y
CONFIG_AUDIT_GENERIC=y
# CONFIG_AUDIT_ARCH_COMPAT_GENERIC is not set
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_842_COMPRESS=m
CONFIG_842_DECOMPRESS=m
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_COMPRESS=y
CONFIG_LZ4HC_COMPRESS=m
CONFIG_LZ4_DECOMPRESS=y
CONFIG_XZ_DEC=y
CONFIG_XZ_DEC_X86=y
CONFIG_XZ_DEC_POWERPC=y
CONFIG_XZ_DEC_IA64=y
CONFIG_XZ_DEC_ARM=y
CONFIG_XZ_DEC_ARMTHUMB=y
CONFIG_XZ_DEC_SPARC=y
CONFIG_XZ_DEC_BCJ=y
CONFIG_XZ_DEC_TEST=y
CONFIG_DECOMPRESS_GZIP=y
CONFIG_DECOMPRESS_BZIP2=y
CONFIG_DECOMPRESS_LZMA=y
CONFIG_DECOMPRESS_XZ=y
CONFIG_REED_SOLOMON=m
CONFIG_REED_SOLOMON_DEC16=y
CONFIG_BCH=m
CONFIG_INTERVAL_TREE=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_CHECK_SIGNATURE=y
CONFIG_DQL=y
CONFIG_GLOB=y
CONFIG_GLOB_SELFTEST=y
CONFIG_NLATTR=y
CONFIG_CLZ_TAB=y
CONFIG_CORDIC=y
CONFIG_DDR=y
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=y
CONFIG_LIBFDT=y
CONFIG_OID_REGISTRY=y
CONFIG_FONT_SUPPORT=m
CONFIG_FONTS=y
CONFIG_FONT_8x8=y
CONFIG_FONT_8x16=y
# CONFIG_FONT_6x11 is not set
# CONFIG_FONT_7x14 is not set
# CONFIG_FONT_PEARL_8x8 is not set
# CONFIG_FONT_ACORN_8x8 is not set
CONFIG_FONT_MINI_4x6=y
CONFIG_FONT_6x10=y
CONFIG_FONT_SUN8x16=y
# CONFIG_FONT_SUN12x22 is not set
# CONFIG_FONT_10x18 is not set
# CONFIG_SG_SPLIT is not set
CONFIG_SG_POOL=y
CONFIG_ARCH_HAS_SG_CHAIN=y
CONFIG_ARCH_HAS_MMIO_FLUSH=y
CONFIG_STACKDEPOT=y
CONFIG_SBITMAP=y

--=_58bd374c.J3Hg7F/xfixvxDlduekC4sw75YkQEkERg00qVSlCOnSudHP3--
