From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [git] parisc: Changes to ref refs/heads/tracehook
Date: Sun, 5 Jul 2009 20:01:29 GMT
Message-ID: <200907052001.n65K1Tuw024136@hera.kernel.org>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Rebased ref, commits from common ancestor:
commit 8e4a718ff38d8539938ec3421935904c27e00c39
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat Jul 4 10:58:48 2009 -0700

    Linux 2.6.31-rc2

commit f50bf2b2f5e83b794e0bdb2f3f589f55ef0d52d0
Author: Paul Mundt <lethal@linux-sh.org>
Date:   Fri Jul 3 15:45:56 2009 +0900

    video: sm501fb: Early initialization of mm_lock mutex.
    
    Commit 537a1bf059fa312355696fa6db80726e655e7f17 (fbdev: add mutex for
    fb_mmap locking) introduces a ->mm_lock mutex for protecting smem
    assignments. Unfortunately in the case of sm501fb these happen quite
    early in the initialization code, well before the mutex_init() that takes
    place in register_framebuffer(), leading to:
    
       Badness at kernel/mutex.c:207
    
       Pid : 1, Comm:          swapper
       CPU : 0                 Not tainted  (2.6.31-rc1-00284-g529ba0d-dirty #2273)
    
       PC is at __mutex_lock_slowpath+0x72/0x1bc
       PR is at __mutex_lock_slowpath+0x66/0x1bc
       ...
    
    matroxfb appears to have the same issue and has solved it with an early
    mutex_init(), so we do the same for sm501fb.
    
    Signed-off-by: Paul Mundt <lethal@linux-sh.org>
    Cc: Krzysztof Helt <krzysztof.h1@wp.pl>
    Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>

commit de481ba925e880764e38b8756c93c05006892507
Merge: dd0888c264c0d5feb5d86eb69c1fdbcdb42566af 64daa4435a40aa1b7d0ece598ae783b89dda13ee
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat Jul 4 10:35:12 2009 -0700

    Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/kyle/parisc-2.6
    
    * 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/kyle/parisc-2.6: (27 commits)
      parisc: use generic atomic64 on 32-bit
      parisc: superio: fix build breakage
      parisc: Fix PCI resource allocation on non-PAT SBA machines
      parisc: perf: wire up sys_perf_counter_open
      parisc: add task_pt_regs macro
      parisc: wire sys_perf_counter_open to sys_ni_syscall
      parisc: inventory.c, fix bloated stack frame
      parisc: processor.c, fix bloated stack frame
      parisc: fix compile warning in mm/init.c
      parisc: remove dead code from sys_parisc32.c
      parisc: wire up rt_tgsigqueueinfo
      parisc: ensure broadcast tlb purge runs single threaded
      parisc: fix "delay!" timer handling
      parisc: fix mismatched parenthesis in memcpy.c
      parisc: Fix gcc 4.4 warning in lba_pci.c
      parisc: add parameter to read_cr16()
      parisc: decode_exc.c should include kernel.h
      parisc: remove obsolete hw_interrupt_type
      parisc: fix irq compile bugs in arch/parisc/kernel/irq.c
      parisc: advertise PCI devs after "assign_resources"
      ...
    
    Manually fixed up trivial conflicts in tools/perf/perf.h due to addition
    of SH vs HPPA perf-counter support.

commit dd0888c264c0d5feb5d86eb69c1fdbcdb42566af
Merge: 14c1b7c212de7c7c9231d5a676eb96f28c088338 1c90ea2c7eb3b24a07a2f82164323588fb029bc1
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat Jul 4 10:31:26 2009 -0700

    Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/sameo/mfd-2.6
    
    * 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/sameo/mfd-2.6:
      mfd: fix pcap adc locking
      mfd: sm501, fix lock imbalance

commit 14c1b7c212de7c7c9231d5a676eb96f28c088338
Merge: 4806626782b4408e468ef686229556899be345c8 033a666ccb842ab4134fcd0c861d5ba9f5d6bf3a
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat Jul 4 10:11:38 2009 -0700

    Merge branch 'for-2.6.31' of git://linux-nfs.org/~bfields/linux
    
    * 'for-2.6.31' of git://linux-nfs.org/~bfields/linux:
      NFSD: Don't hold unrefcounted creds over call to nfsd_setuser()

commit 4806626782b4408e468ef686229556899be345c8
Merge: f1a745710f001e8c2eec6d525396083e1f4c389a baf922780251d12bc1c24c83df60c4c278abb745
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat Jul 4 09:47:01 2009 -0700

    Merge branch 'upstream' of git://ftp.linux-mips.org/pub/scm/upstream-linus
    
    * 'upstream' of git://ftp.linux-mips.org/pub/scm/upstream-linus:
      MIPS: Fix CONFIG_FLATMEM version of pfn_valid()
      MIPS: Reorganize Cavium OCTEON PCI support.
      Update Yoichi Yuasa's e-mail address
      MIPS: Allow suspend and hibernation again on uniprocessor kernels.
      MIPS: 64-bit: Fix o32 core dump
      MIPS: BC47xx: Fix SSB irq setup
      MIPS: CMP: Update sync-r4k for current kernel
      MIPS: CMP: Move gcmp_probe to before the SMP ops
      MIPS: CMP: activate CMP support
      MIPS: CMP: Extend IPI handling to CPU number
      MIPS: CMP: Extend the GIC IPI interrupts beyond 32
      MIPS: Define __arch_swab64 for all mips r2 cpus
      MIPS: Update VR41xx GPIO driver to use gpiolib
      MIPS: Hookup new syscalls sys_rt_tgsigqueueinfo and sys_perf_counter_open.
      MIPS: Malta: Remove unnecessary function prototypes
      MIPS: MT: Remove unnecessary semicolons
      MIPS: Add support for Texas Instruments AR7 System-on-a-Chip

commit f1a745710f001e8c2eec6d525396083e1f4c389a
Merge: 29f31773e07772e73e3177a4af147244cd080554 7ce1695c40e765e99cd790f55fc68037bc05d080
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat Jul 4 09:46:13 2009 -0700

    Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound-2.6
    
    * 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound-2.6:
      sound: do not set DEVNAME for OSS devices
      ALSA: hda - Add sanity check in PCM open callback
      ALSA: hda - Call snd_pcm_lib_hw_rates() again after codec open callback
      ALSA: hda - Avoid invalid formats and rates with shared SPDIF
      ALSA: hda - Improve ASUS eeePC 1000 mixer
      ALSA: hda - Add GPIO1 control at muting with HP laptops
      ALSA: usx2y - reparent sound device
      ALSA: snd_usb_caiaq: reparent sound device
      sound: virtuoso: fix Xonar D1/DX silence after resume
      ASoC: Only disable pxa2xx-i2s clocks if we enabled them
      ALSA: hda - Add quirk for HP 6930p
      ALSA: hda - Add missing static to patch_ca0110()
      ASoC: OMAP: fix OMAP1510 broken PCM pointer callback
      ASoC: remove BROKEN from Efika and pcm030 fabric drivers
      ASoC: Fix typo in MPC5200 PSC AC97 driver Kconfig

commit 29f31773e07772e73e3177a4af147244cd080554
Merge: 59107c6525c0d325649eae807905d34772d5a664 112942353992d95099fb5b71c679ff1046fccfcf
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat Jul 4 09:46:01 2009 -0700

    Merge git://git.kernel.org/pub/scm/linux/kernel/git/sam/kbuild-fixes
    
    * git://git.kernel.org/pub/scm/linux/kernel/git/sam/kbuild-fixes:
      kbuild: finally remove the obsolete variable $TOPDIR
      gitignore: ignore scripts/ihex2fw
      Kbuild: Disable the -Wformat-security gcc flag
      gitignore: ignore gcov output files
      kbuild: deb-pkg ship changelog
      Add new __init_task_data macro to be used in arch init_task.c files.
      asm-generic/vmlinux.lds.h: shuffle INIT_TASK* macro names in vmlinux.lds.h
      Add new macros for page-aligned data and bss sections.
      asm-generic/vmlinux.lds.h: Fix up RW_DATA_SECTION definition.

commit 59107c6525c0d325649eae807905d34772d5a664
Merge: 746a99a5af60ee676afa2ba469ccd1373493c7e7 ab0fd1debe730ec9998678a0c53caefbd121ed10
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat Jul 4 09:45:31 2009 -0700

    Merge branch 'for-linus' of git://git.kernel.dk/linux-2.6-block
    
    * 'for-linus' of git://git.kernel.dk/linux-2.6-block:
      block: don't merge requests of different failfast settings
      cciss: Ignore stale commands after reboot

commit 7ce1695c40e765e99cd790f55fc68037bc05d080
Merge: 854ace9c40d2b121191e1644aa4b0b68c4a226d3 954a973cab37ad5df3f87f08964166abd956cc17
Author: Takashi Iwai <tiwai@suse.de>
Date:   Fri Jul 3 23:50:47 2009 +0200

    Merge branch 'fix/soundcore' into for-linus
    
    * fix/soundcore:
      sound: do not set DEVNAME for OSS devices

commit 854ace9c40d2b121191e1644aa4b0b68c4a226d3
Merge: dbe45d0ce394732cc06187e929697fc0fb16aa53 c470331e69bd54d11a9ea3c27a0e4ad783d02d6b
Author: Takashi Iwai <tiwai@suse.de>
Date:   Fri Jul 3 23:50:45 2009 +0200

    Merge branch 'fix/hda' into for-linus
    
    * fix/hda:
      ALSA: hda - Add sanity check in PCM open callback
      ALSA: hda - Call snd_pcm_lib_hw_rates() again after codec open callback
      ALSA: hda - Avoid invalid formats and rates with shared SPDIF
      ALSA: hda - Improve ASUS eeePC 1000 mixer
      ALSA: hda - Add GPIO1 control at muting with HP laptops

commit 954a973cab37ad5df3f87f08964166abd956cc17
Author: Kay Sievers <kay.sievers@suse.de>
Date:   Fri Jul 3 20:56:05 2009 +0200

    sound: do not set DEVNAME for OSS devices
    
    Signed-off-by: Kay Sievers <kay.sievers@vrfy.org>
    Signed-off-by: Takashi Iwai <tiwai@suse.de>

commit c470331e69bd54d11a9ea3c27a0e4ad783d02d6b
Author: Takashi Iwai <tiwai@suse.de>
Date:   Fri Jul 3 23:10:23 2009 +0200

    ALSA: hda - Add sanity check in PCM open callback
    
    Add some sanity checks of struct snd_pcm_hardware fields in the PCM
    open callback of hda driver.  This makes a bit easier to debug any PCM
    setup errors in the codec side.
    
    Signed-off-by: Takashi Iwai <tiwai@suse.de>

commit 70d321e6380f128096429d6e5b678f94ab0cef5d
Author: Takashi Iwai <tiwai@suse.de>
Date:   Fri Jul 3 23:06:45 2009 +0200

    ALSA: hda - Call snd_pcm_lib_hw_rates() again after codec open callback
    
    The PCM rates bit field may have been changed by the codec open callback.
    In that case, we need to reset rate_min and rate_max.  So, simply call
    snd_pcm_lib_hw_rates() again after the codec open callback.
    
    Signed-off-by: Takashi Iwai <tiwai@suse.de>

commit 022b466fc353d3dc7a152451144be656248666ce
Author: Takashi Iwai <tiwai@suse.de>
Date:   Fri Jul 3 23:03:30 2009 +0200

    ALSA: hda - Avoid invalid formats and rates with shared SPDIF
    
    Check whether formats and rates don't result in zero due to the
    restriction of SPDIF sharing.  If any of them can be zero, disable
    the SPDIF sharing mode instead.  Otherwise it will lead to a PCM
    configuration error.
    
    Signed-off-by: Takashi Iwai <tiwai@suse.de>

commit ab0fd1debe730ec9998678a0c53caefbd121ed10
Author: Tejun Heo <tj@kernel.org>
Date:   Fri Jul 3 12:56:18 2009 +0200

    block: don't merge requests of different failfast settings
    
    Block layer used to merge requests and bios with different failfast
    settings.  This caused regular IOs to fail prematurely when they were
    merged into failfast requests for readahead.
    
    Niel Lambrechts could trigger the problem semi-reliably on ext4 when
    resuming from STR.  ext4 uses readahead when reading inodes and
    combined with the deterministic extra SATA PHY exception cycle during
    resume on the specific configuration, non-readahead inode read would
    fail causing ext4 errors.  Please read the following thread for
    details.
    
      http://lkml.org/lkml/2009/5/23/21
    
    This patch makes block layer reject merging if the failfast settings
    don't match.  This is correct but likely to lower IO performance by
    preventing regular IOs from mingling into surrounding readahead
    requests.  Changes to allow such mixed merges and handle errors
    correctly will be added later.
    
    Signed-off-by: Tejun Heo <tj@kernel.org>
    Reported-by: Niel Lambrechts <niel.lambrechts@gmail.com>
    Cc: Theodore Tso <tytso@mit.edu>
    Signed-off-by: Jens Axboe <axboe@carl.(none)>

commit b59e64d0ddb756af57ea032383bfd393a286a8e8
Author: Hannes Reinecke <hare@suse.de>
Date:   Thu Jul 2 22:02:06 2009 +0200

    cciss: Ignore stale commands after reboot
    
    When doing an unexpected shutdown like kexec the cciss
    firmware might still have some commands in flight, which
    it is trying to complete.
    The driver is doing it's best on resetting the HBA,
    but sadly there's a firmware issue causing the firmware
    _not_ to abort or drop old commands.
    So the firmware will send us commands which we haven't
    accounted for, causing the driver to panic.
    
    With this patch we're just ignoring these commands as
    there is nothing we could be doing with them anyway.
    
    Signed-off-by: Hannes Reinecke <hare@suse.de>
    Acked-by: Mike Miller <mike.miller@hp.com>
    Signed-off-by: Jens Axboe <axboe@carl.(none)>

commit baf922780251d12bc1c24c83df60c4c278abb745
Author: Ralf Baechle <ralf@linux-mips.org>
Date:   Fri Jul 3 07:11:15 2009 +0100

    MIPS: Fix CONFIG_FLATMEM version of pfn_valid()
    
    For systems which do not define PHYS_OFFSET as 0 pfn_valid() may falsely
    have returned 0 on most configurations.  Bug introduced by commit
    752fbeb2e3555c0d236e992f1195fd7ce30e728d (linux-mips.org) rsp.
    6f284a2ce7b8bc49cb8455b1763357897a899abb (kernel.org) titled "[MIPS]
    FLATMEM: introduce PHYS_OFFSET."
    
    Signed-off-by: Ralf Baechle <ralf@linux-mips.org>

commit 01a6221a6a51ec47b9ae3ed42c396f98dd488c7e
Author: David Daney <ddaney@caviumnetworks.com>
Date:   Mon Jun 29 17:18:51 2009 -0700

    MIPS: Reorganize Cavium OCTEON PCI support.
    
    Move the cavium PCI files to the arch/mips/pci directory.  Also cleanup
    comment formatting and code layout.  Code from pci-common.c, was moved
    into other files.
    
    Signed-off-by: David Daney <ddaney@caviumnetworks.com>
    Signed-off-by: Ralf Baechle <ralf@linux-mips.org>

commit ada8e9514b5880f81cdbbd212d121380ceef7acc
Author: Yoichi Yuasa <yuasa@linux-mips.org>
Date:   Fri Jul 3 00:39:38 2009 +0900

    Update Yoichi Yuasa's e-mail address
    
    Signed-off-by: Yoichi Yuasa <yuasa@linux-mips.org>
    Signed-off-by: Ralf Baechle <ralf@linux-mips.org>

commit 3f5b3e17f791ba27f91fc4fdc514e7704d4d6273
Author: Ralf Baechle <ralf@linux-mips.org>
Date:   Thu Jul 2 11:48:07 2009 +0100

    MIPS: Allow suspend and hibernation again on uniprocessor kernels.
    
    Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
    Acked-by: Pavel Machek <pavel@ucw.cz>

commit cad9bc69048b073023366ebb0878c1dd64a2c4d9
Author: Yong Zhang <yong.zhang@windriver.com>
Date:   Wed Jul 1 09:35:39 2009 +0800

    MIPS: 64-bit: Fix o32 core dump
    
    If an o32 process generates a core dump on a 64 bit kernel, the core file
    will not be correctly recognized. This is because ELF_CORE_COPY_REGS and
    ELF_CORE_COPY_TASK_REGS are not correctly defined for o32 and will use
    the default register set which would be CONFIG_64BIT in asm/elf.h.
    
    So we'll switch to use the right register defines in this situation by
    checking for WANT_COMPAT_REG_H and use the right defines of
    ELF_CORE_COPY_REGS and ELF_CORE_COPY_TASK_REGS.
    
    [Ralf: made ELF_CORE_COPY_TASK_REGS() bullet-proof against funny arguments.]
    
    Signed-off-by: Yong Zhang <yong.zhang@windriver.com>
    Signed-off-by: Ralf Baechle <ralf@linux-mips.org>

commit ea4bbfd0048c53c24f72ef668b39f1247bc243c0
Author: matthieu castet <castet.matthieu@free.fr>
Date:   Tue Jun 30 23:04:55 2009 +0200

    MIPS: BC47xx: Fix SSB irq setup
    
    The current ssb irq setup in ssb_mipscore_init has the problem that it
    configures some device on some irq without checking that the irq is not
    taken by an other device.
    
    For example in my case PCI host is on irq 0 and IPSEC on irq 3.
    The current code:
      - store in dev->irq that IPSEC irq is 3 + 2
      - do a set_irq 0->3 on PCI host
    
    But now IPSEC irq is not routed anymore to the mips code and dev->irq is
    wrong.  This causes a problem described in [1].
    
    This patch tries to solve the problem by making set_irq configure the
    device we want to take the irq on the shared irq0. The previous example
    becomes:
      - store in dev->irq that IPSEC irq is 3 + 2
      - do a set_irq 0->3 on PCI host:
      - irq 3 is already taken by IPSEC. do a set_irq 3->0 on IPSEC
    
    I also added some code to print the irq configuration after irq setup to
    allow easier debugging. And I add extra checking in ssb_mips_irq to report
    device without irq or device with not routed irq.
    
    [1] http://www.danm.de/files/src/bcm5365p/REPORTED_DEVICES
    
    Signed-off-by: Matthieu CASTET <castet.matthieu@free.fr>
    Acked-by : Michael Buesch <mb@bu3sch.de>
    Tested-by: Florian Fainelli <florian@openwrt.org>
    Signed-off-by: Ralf Baechle <ralf@linux-mips.org>

commit eb9b5141a9815ef898ef6b6441f733e81c272600
Author: Tim Anderson <tanderson@mvista.com>
Date:   Wed Jun 17 16:40:34 2009 -0700

    MIPS: CMP: Update sync-r4k for current kernel
    
    This revises the sync-4k so it will boot and operate since the removal of
    expirelo from the timer code.
    
    Signed-off-by: Tim Anderson <tanderson@mvista.com>
    Signed-off-by: Ralf Baechle <ralf@linux-mips.org>

commit 47b178bb69ea4d0043f2df509c714bc5b287f375
Author: Tim Anderson <tanderson@mvista.com>
Date:   Wed Jun 17 16:25:18 2009 -0700

    MIPS: CMP: Move gcmp_probe to before the SMP ops
    
    This is to move the gcmp_probe call to before the use of and selection of
    the smp_ops functions. This allows malta with 1004K to work.
    
    Signed-off-by: Tim Anderson <tanderson@mvista.com>
    Signed-off-by: Ralf Baechle <ralf@linux-mips.org>

commit 0365070f05f12f1648b4adf22cfb52ec7a8a371c
Author: Tim Anderson <tanderson@mvista.com>
Date:   Wed Jun 17 16:22:53 2009 -0700

    MIPS: CMP: activate CMP support
    
    Most of the CMP support was added before, this mostly correct compile
    problems but adds a platform specific translation for the interrupt number
    based on cpu number.
    
    Signed-off-by: Tim Anderson <tanderson@mvista.com>
    Signed-off-by: Ralf Baechle <ralf@linux-mips.org>

commit a214cef9a5d06894785dca1f967c9c324cc84c17
Author: Tim Anderson <tanderson@mvista.com>
Date:   Wed Jun 17 16:22:25 2009 -0700

    MIPS: CMP: Extend IPI handling to CPU number
    
    This takes the current IPI interrupt assignment from the fix number of 4
    to the number of CPUs defined in the system.
    
    Signed-off-by: Tim Anderson <tanderson@mvista.com>
    Signed-off-by: Ralf Baechle <ralf@linux-mips.org>

commit 9306c8def6abc2dbde4ac75eb6c631606b8fc1dd
Author: Tim Anderson <tanderson@mvista.com>
Date:   Wed Jun 17 16:21:19 2009 -0700

    MIPS: CMP: Extend the GIC IPI interrupts beyond 32
    
    This patch extends the GIC interrupt handling beyond the current 32 bit
    range as well as extending the number of interrupts based on the number
    of CPUs.
    
    Signed-off-by: Tim Anderson <tanderson@mvista.com>
    Signed-off-by: Ralf Baechle <ralf@linux-mips.org>

commit b53d4d1f8d522342e66f79b8b49a19835071fed4
Author: David Daney <ddaney@caviumnetworks.com>
Date:   Mon Jun 29 09:54:15 2009 -0700

    MIPS: Define __arch_swab64 for all mips r2 cpus
    
    Some CPUs implement mipsr2, but because they are a super-set of mips64r2 do
    not define CONFIG_CPU_MIPS64_R2.  Cavium OCTEON falls into this category.
    We would still like to use the optimized implementation, so since we have
    already checked for CONFIG_CPU_MIPSR2, checking for CONFIG_64BIT instead of
    CONFIG_CPU_MIPS64_R2 is sufficient.
    
    Signed-off-by: David Daney <ddaney@caviumnetworks.com>
    Signed-off-by: Ralf Baechle <ralf@linux-mips.org>

commit 27fdd325dace4a1ebfa10e93ba6f3d25f25df674
Author: Yoichi Yuasa <yyuasa@linux.com>
Date:   Mon Jun 29 11:11:05 2009 +0900

    MIPS: Update VR41xx GPIO driver to use gpiolib
    
    Signed-off-by: Yoichi Yuasa <yyuasa@linux.com>
    Signed-off-by: Ralf Baechle <ralf@linux-mips.org>

commit 69f16c9a8630edc64cb1d6f1bfca4ee7bc16279f
Author: David Daney <ddaney@caviumnetworks.com>
Date:   Fri Jun 26 09:53:57 2009 -0700

    MIPS: Hookup new syscalls sys_rt_tgsigqueueinfo and sys_perf_counter_open.
    
    [Ralf: I fixed up the numbering in the comment in scall64-n32.S.]
    
    Signed-off-by: David Daney <ddaney@caviumnetworks.com>
    Signed-off-by: Ralf Baechle <ralf@linux-mips.org>

commit d7e014db374d987c6bcff0b9abab2c6796f8e793
Author: Dmitri Vorobiev <dmitri.vorobiev@movial.com>
Date:   Fri Jun 26 19:59:25 2009 +0300

    MIPS: Malta: Remove unnecessary function prototypes
    
    Signed-off-by: Dmitri Vorobiev <dmitri.vorobiev@movial.com>
    Signed-off-by: Ralf Baechle <ralf@linux-mips.org>

commit 52a7a27cd8f6c57817da99fef019e37b9c303c4e
Author: Joe Perches <joe@perches.com>
Date:   Sun Jun 28 09:26:09 2009 -0700

    MIPS: MT: Remove unnecessary semicolons
    
    Signed-off-by: Joe Perches <joe@perches.com>
    Signed-off-by: Ralf Baechle <ralf@linux-mips.org>

commit 7ca5dc145bc7daddd8aed8bbda46b74af9cebefc
Author: Florian Fainelli <florian@openwrt.org>
Date:   Wed Jun 24 11:12:57 2009 +0200

    MIPS: Add support for Texas Instruments AR7 System-on-a-Chip
    
    This patch adds support for the Texas Instruments AR7 System-on-a-Chip.
    It supports the TNETD7100, 7200 and 7300 versions of the SoC.
    
    Signed-off-by: Matteo Croce <matteo@openwrt.org>
    Signed-off-by: Felix Fietkau <nbd@openwrt.org>
    Signed-off-by: Eugene Konev <ejka@openwrt.org>
    Signed-off-by: Nicolas Thill <nico@openwrt.org>
    Signed-off-by: Florian Fainelli <florian@openwrt.org>
    Signed-off-by: Ralf Baechle <ralf@linux-mips.org>

commit 033a666ccb842ab4134fcd0c861d5ba9f5d6bf3a
Author: David Howells <dhowells@redhat.com>
Date:   Thu Jul 2 14:35:32 2009 +0100

    NFSD: Don't hold unrefcounted creds over call to nfsd_setuser()
    
    nfsd_open() gets an unrefcounted pointer to the current process's effective
    credentials at the top of the function, then calls nfsd_setuser() via
    fh_verify() - which may replace and destroy the current process's effective
    credentials - and then passes the unrefcounted pointer to dentry_open() - but
    the credentials may have been destroyed by this point.
    
    Instead, the value from current_cred() should be passed directly to
    dentry_open() as one of its arguments, rather than being cached in a variable.
    
    Possibly fh_verify() should return the creds to use.
    
    This is a regression introduced by
    745ca2475a6ac596e3d8d37c2759c0fbe2586227 "CRED: Pass credentials through
    dentry_open()".
    
    Signed-off-by: David Howells <dhowells@redhat.com>
    Tested-and-Verified-By: Steve Dickson <steved@redhat.com>
    Cc: stable@kernel.org
    Signed-off-by: J. Bruce Fields <bfields@citi.umich.edu>

commit aa202455eec51699e44f658530728162cefa1307
Author: Takashi Iwai <tiwai@suse.de>
Date:   Fri Jul 3 15:00:54 2009 +0200

    ALSA: hda - Improve ASUS eeePC 1000 mixer
    
    The mixer elements created for ASUS eeePC 1000 with ALC269 aren't
    standard but strange words like "LineOut".  Rename the element names
    to follow the standard one like "Headphone" and "Speaker".
    Also, split the volumes to each so that the virtual master can control
    them.
    
    The alc269_fujitsu_mixer is removed because it's now identical with
    the new eeepc mixer.
    
    Signed-off-by: Takashi Iwai <tiwai@suse.de>

commit 099db17e66294b02814dee01c81d9abbbeece93e
Author: Takashi Iwai <tiwai@suse.de>
Date:   Thu Jul 2 16:10:23 2009 +0200

    ALSA: hda - Add GPIO1 control at muting with HP laptops
    
    HP laptops with AD1984A codecs (at least mobile models) need to set
    GPIO1 appropriately to indicate the mute state.  The BIOS checks this
    bit to judge whether the mute on or off is sent via F8 key.
    Without changing this bit, the BIOS can be confused and may toggle
    the mute wrongly.
    
    Reference: Novell bnc#515266
    	https://bugzilla.novell.com/show_bug.cgi?id=515266
    
    Signed-off-by: Takashi Iwai <tiwai@suse.de>

commit 1c90ea2c7eb3b24a07a2f82164323588fb029bc1
Author: Daniel Ribeiro <drwyrm@gmail.com>
Date:   Tue Jun 23 12:30:58 2009 -0300

    mfd: fix pcap adc locking
    
    Release the lock on error.
    
    Signed-off-by: Daniel Ribeiro <drwyrm@gmail.com>
    Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>

commit 992bb253cd6f08129edcb42b90e6c388ebf605f8
Author: Jiri Slaby <jirislaby@gmail.com>
Date:   Mon Jun 22 00:00:02 2009 +0200

    mfd: sm501, fix lock imbalance
    
    Add omitted unlock in sm501_unit_power.
    
    Signed-off-by: Jiri Slaby <jirislaby@gmail.com>
    Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>

commit 64daa4435a40aa1b7d0ece598ae783b89dda13ee
Author: Kyle McMartin <kyle@mcmartin.ca>
Date:   Thu Jul 2 13:10:29 2009 -0400

    parisc: use generic atomic64 on 32-bit
    
    Somewhat redundant since our atomic_t uses hashed-locks on 32-bit
    anyway... Maybe we can clean those up to be generic too someday.
    
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 0c5cb79198d80eaea273f3e91cb418d559f13462
Author: Alexander Beregalov <a.beregalov@gmail.com>
Date:   Thu Apr 16 14:45:59 2009 +0000

    parisc: superio: fix build breakage
    
    Usage of parport_pc_probe_port was changed in 28783eb52
    (parport: Fix various uses of parport_pc).
    
    It introduced this build error:
    drivers/parisc/superio.c: In function 'superio_parport_init':
    drivers/parisc/superio.c:437: error: too few arguments to function
    				'parport_pc_probe_port'
    
    Fix it.
    
    Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit ca0844e347cf0fc9719c825ea1959501117b7f89
Author: Matthew Wilcox <matthew@wil.cx>
Date:   Fri Jun 26 17:44:18 2009 +0000

    parisc: Fix PCI resource allocation on non-PAT SBA machines
    
    We weren't marking the resources as memory resources, so they weren't
    being found by pci_claim_resource().
    
    Signed-off-by: Matthew Wilcox <willy@linux.intel.com>
    Reviewed-by: Grant Grundler <grundler@parisc-linux.org>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 2d4618dce6a318ff4ec78dfe492cc3793015d540
Author: Kyle McMartin <kyle@mcmartin.ca>
Date:   Tue Jun 23 21:38:49 2009 -0400

    parisc: perf: wire up sys_perf_counter_open
    
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit abf1e11a0dcf5514139cb76ed8eb050107653abd
Author: Kyle McMartin <kyle@mcmartin.ca>
Date:   Tue Jun 23 21:32:18 2009 -0400

    parisc: add task_pt_regs macro
    
    needed for perf_counters.
    
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 538e23615fe78b6da151ef136e3f7c6ad1fda2c1
Author: Kyle McMartin <kyle@mcmartin.ca>
Date:   Tue Jun 23 20:22:06 2009 -0400

    parisc: wire sys_perf_counter_open to sys_ni_syscall
    
    Reserve a syscall slot for sys_perf_counter_open.
    
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 0d56d1aa0e756f077b700420c54e1a52140e73b4
Author: Kyle McMartin <kyle@mcmartin.ca>
Date:   Tue Jun 23 13:11:22 2009 -0400

    parisc: inventory.c, fix bloated stack frame
    
    The pa_pdc_cell struct can be kmalloc'd, so do that
    instead.
    
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 64a0cdb026666cd9911fa045b863fb1f0f255dd8
Author: Kyle McMartin <kyle@mcmartin.ca>
Date:   Tue Jun 23 13:10:03 2009 -0400

    parisc: processor.c, fix bloated stack frame
    
    The pa_pdc_cell struct can be kmalloc'd, so do that instead.
    
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 20dbc9f724e02c26e30d89cf50e7ce259ab46da4
Author: Kyle McMartin <kyle@mcmartin.ca>
Date:   Tue Jun 23 11:51:43 2009 -0400

    parisc: fix compile warning in mm/init.c
    
    arch/parisc/mm/init.c: In function 'free_initmem':
    381: warning: passing argument 1 of 'memset' makes pointer from integer without a cast
    
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit c3301ab4fb64cf84321d35a8e94f68c94c816dc1
Author: Christoph Hellwig <hch@lst.de>
Date:   Tue Jun 23 11:47:07 2009 -0400

    parisc: remove dead code from sys_parisc32.c
    
    Unless I'm totally missing something get_fd_set32/set_fd_set32 are
    completely unused.
    
    Signed-off-by: Christoph Hellwig <hch@lst.de>
    Acked-by: Grant Grundler <grundler@parisc-linux.org>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 4435607e986c792a8753f8850b570fdd80b21b10
Author: Kyle McMartin <kyle@mcmartin.ca>
Date:   Tue Jun 23 11:40:37 2009 -0400

    parisc: wire up rt_tgsigqueueinfo
    
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit e82a3b75127188f20c7780bec580e148beb29da7
Author: Helge Deller <deller@gmx.de>
Date:   Tue Jun 16 20:51:48 2009 +0000

    parisc: ensure broadcast tlb purge runs single threaded
    
    The TLB flushing functions on hppa, which causes PxTLB broadcasts on the system
    bus, needs to be protected by irq-safe spinlocks to avoid irq handlers to deadlock
    the kernel. The deadlocks only happened during I/O intensive loads and triggered
    pretty seldom, which is why this bug went so long unnoticed.
    
    Signed-off-by: Helge Deller <deller@gmx.de>
    [edited to use spin_lock_irqsave on UP as well since we'd been locking there
     all this time anyway, --kyle]
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 84be31be3727d11b2a91781306b642e801c5a379
Author: Grant Grundler <grundler@parisc-linux.org>
Date:   Mon Jun 1 00:20:23 2009 +0000

    parisc: fix "delay!" timer handling
    
    Rewrote timer_interrupt() to properly handle the "delayed!" case.
    
    If we used floating point math to compute the number of ticks that had
    elapsed since the last timer interrupt, it could take up to 12K cycles
    (emperical!) to handle the interrupt. Existing code assumed it would
    never take more than 8k cycles. We end up programming Interval Timer
    to a value less than "current" cycle counter.  Thus have to wait until
    Interval Timer "wrapped" and would then get the "delayed!" printk that
    I moved below.
    
    Since we don't really know what the upper limit is, I prefer to read
    CR16 again after we've programmed it to make sure we won't have to
    wait for CR16 to wrap.
    
    Further, the printk was between reading CR16 (cycle couner) and writing CR16
    (the interval timer). This would cause us to continue to set the interval
    timer to a value that was "behind" the cycle counter. Rinse and repeat.
    So no printk's between reading CR16 and setting next interval timer.
    
    Tested on A500 (550 Mhz PA8600).
    
    Signed-off-by: Grant Grundler <grundler@parisc-linux.org>
    Tested-by: Kyle McMartin <kyle@mcmartin.ca>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>
    
    ----
    Kyle, Helge, and other parisc's,
    Please test on 32-bit before committing.
    I think I have it right but recognize I might not.
    
    TODO: I wanted to use "do_div()" in order to get both remainder
    and value back with one division op. That should help with the
    latency alot but can be applied seperately from this patch.
    
    thanks,
    grant

commit 87451d850c895470a122308086069b7c326c914b
Author: Randolph Chung <randolph@tausq.org>
Date:   Tue Jun 23 14:53:26 2009 +0000

    parisc: fix mismatched parenthesis in memcpy.c
    
    >>>> I think this is what was intended? Note that this patch may affect
    >>>> profiling.
    >>> it really should be
    >>>
    >>> -    if (likely(t1 & (sizeof(unsigned int)-1)) == 0) {
    >>> +    if (likely((t1 & (sizeof(unsigned int)-1)) == 0)) {
    >>>
    >>> randolph
    
    Reported-by: Roel Kluin <roel.kluin@gmail.com>
    Signed-off-by: Randolph Chung <tausq@parisc-linux.org>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit e957f608f321a97a60d065bccd01949590eef52e
Author: Grant Grundler <grundler@parisc-linux.org>
Date:   Tue Jun 23 11:03:11 2009 -0400

    parisc: Fix gcc 4.4 warning in lba_pci.c
    
    gcc 4.4 warns about:
    drivers/parisc/lba_pci.c: In function 'lba_pat_resources':
    drivers/parisc/lba_pci.c:1099: warning: the frame size of 8280 bytes is larger than 4096 bytes
    
    The problem is we declare two large structures on the stack. They don't need
    to be on the stack since they are only used during LBA initialization (which
    is serialized). Moving to be "static".
    
    Signed-off-by: Grant Grundler <grundler@parisc-linux.org>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit ebc30a0f67a4d6a9470556f4311478b3b04c2b1f
Author: Coly Li <coly.li@suse.de>
Date:   Thu Apr 30 22:43:46 2009 +0000

    parisc: add parameter to read_cr16()
    
    This patch modifies parameter of au1x_counter1_read() from 'void' to 'struct
    clocksource *cs', which fixes compile warning for incompatible parameter type.
    
    Signed-off-by: Coly Li <coly.li@suse.de>
    Signed-off-by: Helge Deller <deller@gmx.de>
    Cc: Ingo Molnar <mingo@elte.hu>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit e9b2601073aa57ffde7259afbe86f405060058e3
Author: Alexander Beregalov <a.beregalov@gmail.com>
Date:   Mon Apr 6 09:29:58 2009 +0000

    parisc: decode_exc.c should include kernel.h
    
    Fix this build error:
    arch/parisc/math-emu/decode_exc.c:351: undefined reference to `printk'
    
    Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit dfe07565021959f0f646e9e775810c1bfbe0f6d6
Author: Thomas Gleixner <tglx@linutronix.de>
Date:   Wed Jun 10 19:56:04 2009 +0000

    parisc: remove obsolete hw_interrupt_type
    
    The defines and typedefs (hw_interrupt_type, no_irq_type, irq_desc_t) have
    been kept around for migration reasons.  After more than two years it's
    time to remove them finally.
    
    This patch cleans up one of the remaining users.  When all such patches
    hit mainline we can remove the defines and typedefs finally.
    
    Impact: cleanup
    
    Convert the last remaining users to struct irq_chip and remove the
    define.
    
    Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
    Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 47b4150baa003fb83b93365f3eadd4c373e4fa6c
Author: Helge Deller <deller@gmx.de>
Date:   Sat Jun 6 21:54:28 2009 +0000

    parisc: fix irq compile bugs in arch/parisc/kernel/irq.c
    
    Fix miscompilation in arch/parisc/kernel/irq.c:
    123: warning: passing arg 1 of `cpumask_setall' from incompatible pointer type
    141: warning: passing arg 1 of `cpumask_copy' from incompatible pointer type
    300: warning: passing arg 1 of `cpumask_copy' from incompatible pointer type
    357: warning: passing arg 2 of `cpumask_copy' from incompatible pointer type
    
    Signed-off-by: Helge Deller <deller@gmx.de>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit fed99b1e86f5ff4f1b41e37264bb869da67d3174
Author: Grant Grundler <grundler@parisc-linux.org>
Date:   Mon Apr 20 04:28:22 2009 +0000

    parisc: advertise PCI devs after "assign_resources"
    
    Alex Chiang asked me why PARISC was calling pci_bus_add_devices()
    and pci_bus_assign_resources() in the opposite order from everyone else.
    No reason and I couldn't see any data dependency.
    Patch below applies cleanly to 2.6.30-rc2.
    
    Later, I suspected the code worked only because no drivers would be
    loaded/ready until much later in the system initialization sequence.
    
    Tested "LBA" code on J6000 (32-bit) and A500 (64-bit SMP) with 2.6.30-rc2.
    Not tested with any Dino controllers.
    Not tested with PCI-PCI Bridge (TBD).
    
    Reported-by: Alex Chiang <achiang@hp.com>
    Signed-off-by: Grant Grundler <grundler@parisc-linux.org>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 7d17e2763129ea307702fcdc91f6e9d114b65c2d
Author: Helge Deller <deller@gmx.de>
Date:   Thu Apr 30 21:39:45 2009 +0000

    parisc: fix ldcw inline assembler
    
    There are two reasons to expose the memory *a in the asm:
    
    1) To prevent the compiler from discarding a preceeding write to *a, and
    2) to prevent it from caching *a in a register over the asm.
    
    The change has had a few days testing with a SMP build of 2.6.22.19
    running on a rp3440.
    
    This patch is about the correctness of the __ldcw() macro itself.
    The use of the macro should be confined to small inline functions
    to try to limit the effect of clobbering memory on GCC's optimization
    of loads and stores.
    
    Signed-off-by: Dave Anglin <dave.anglin@nrc-cnrc.gc.ca>
    Signed-off-by: Helge Deller <deller@gmx.de>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 4fb11781a044552dded5342e1a78cf92a74683db
Author: Kyle McMartin <kyle@mcmartin.ca>
Date:   Sun Apr 5 02:53:47 2009 +0000

    parisc: kill WARN in free_initmem when DEBUG_KERNEL
    
    Doing an IPI with local interrupts off triggers a warning. We
    don't need to be quite so ridiculously paranoid. Also, clean up
    a bit of the code a little.
    
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 692c14a5931341a37e4fbfca5fa96751187a108f
Author: Bastian Blank <waldi@debian.org>
Date:   Sat Apr 4 20:54:26 2009 +0000

    parisc: Remove casts from atomic macros
    
    The atomic operations on parisc are defined as macros. The macros
    includes casts which disallows the use of some syntax elements and
    produces error like this:
    
    net/phonet/pep.c: In function 'pipe_rcv_status':
    net/phonet/pep.c:262: error: lvalue required as left operand of assignment
    
    The patch removes this superfluous casts.
    
    Signed-off-by: Bastian Blank <waldi@debian.org>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 071327ec9005e9a826d088d37021ed2c88e683f7
Author: Alexander Beregalov <a.beregalov@gmail.com>
Date:   Fri Apr 3 01:49:22 2009 +0000

    parisc: remove CVS keywords
    
    Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
    Acked-by: Matthew Wilcox <willy@linux.intel.com>
    Acked-by: Grant Grundler <grundler@parisc-linux.org>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 8d2d00ddeff2c2d1164d96e2d1b53e45ceb528c8
Author: Alexander Beregalov <a.beregalov@gmail.com>
Date:   Fri Apr 3 12:08:54 2009 +0000

    parisc: ccio-dma: fix build failure without procfs
    
    Fix this build error when CONFIG_PROC_FS is not set:
    drivers/parisc/ccio-dma.c:1574: error: 'ccio_proc_info_fops' undeclared
    
    Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 17085a934592585bd878884dee04b850a367be10
Author: Alexander Beregalov <a.beregalov@gmail.com>
Date:   Fri Apr 3 13:33:32 2009 +0000

    parisc: stifb: should depend on STI_CONSOLE
    
    Fix this build error when CONFIG_STI_CONSOLE is not set
    drivers/video/stifb.c:1337: undefined reference to `sti_get_rom'
    
    Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 90eab5e09de20e8d991bbb11f6edfb573f906352
Author: Kyle McMartin <kyle@mcmartin.ca>
Date:   Mon Apr 27 08:29:12 2009 -0400

    parisc: wire up preadv/pwritev syscalls
    
    Generic compat handlers look appropriate, so use those.
    
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 746a99a5af60ee676afa2ba469ccd1373493c7e7
Merge: 5291a12f0503e31e0b8e90ee8e4997d59c1c3aad bdae997f44535ac4ebe1e055ffe59eeee946f453
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu Jul 2 16:54:07 2009 -0700

    Merge branch 'for-linus' of git://git.infradead.org/users/eparis/notify
    
    * 'for-linus' of git://git.infradead.org/users/eparis/notify:
      fs/notify/inotify: decrement user inotify count on close

commit 5291a12f0503e31e0b8e90ee8e4997d59c1c3aad
Merge: c7cba0623fc17fe766063d492810632366790763 68f5a38c3ea4ae9cc7a40f86ff6d6d031583d93a
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu Jul 2 16:52:38 2009 -0700

    Merge git://git.kernel.org/pub/scm/linux/kernel/git/mason/btrfs-unstable
    
    * git://git.kernel.org/pub/scm/linux/kernel/git/mason/btrfs-unstable:
      Btrfs: fix error message formatting
      Btrfs: fix use after free in btrfs_start_workers fail path
      Btrfs: honor nodatacow/sum mount options for new files
      Btrfs: update backrefs while dropping snapshot
      Btrfs: account for space we may use in fallocate
      Btrfs: fix the file clone ioctl for preallocated extents
      Btrfs: don't log the inode in file_write while growing the file

commit c7cba0623fc17fe766063d492810632366790763
Merge: 405d7ca51597645f3be850574d6c10f01be11e8d a222ad1a4b2e3ca177a538482c99c519c1ce94d1
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu Jul 2 16:52:25 2009 -0700

    Merge git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi-rc-fixes-2.6
    
    * git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi-rc-fixes-2.6:
      [SCSI] cxgb3i: fix connection error when vlan is enabled
      [SCSI] FC transport: Locking fix for common-code FC pass-through patch
      [SCSI] zalon: fix oops on attach failure
      [SCSI] fnic: use DMA_BIT_MASK(nn) instead of deprecated DMA_nnBIT_MASK
      [SCSI] fnic: remove redundant BUG_ONs and fix checks on unsigned
      [SCSI] ibmvscsi: Fix module load hang

commit 405d7ca51597645f3be850574d6c10f01be11e8d
Merge: 7c5371c403abb29f01bc6cff6c5096abdf2dc524 6a43e574c5af7d9bd084992b1c9c3cdbc3b6c0e9
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu Jul 2 16:51:09 2009 -0700

    Merge git://git.infradead.org/iommu-2.6
    
    * git://git.infradead.org/iommu-2.6: (38 commits)
      intel-iommu: Don't keep freeing page zero in dma_pte_free_pagetable()
      intel-iommu: Introduce first_pte_in_page() to simplify PTE-setting loops
      intel-iommu: Use cmpxchg64_local() for setting PTEs
      intel-iommu: Warn about unmatched unmap requests
      intel-iommu: Kill superfluous mapping_lock
      intel-iommu: Ensure that PTE writes are 64-bit atomic, even on i386
      intel-iommu: Make iommu=pt work on i386 too
      intel-iommu: Performance improvement for dma_pte_free_pagetable()
      intel-iommu: Don't free too much in dma_pte_free_pagetable()
      intel-iommu: dump mappings but don't die on pte already set
      intel-iommu: Combine domain_pfn_mapping() and domain_sg_mapping()
      intel-iommu: Introduce domain_sg_mapping() to speed up intel_map_sg()
      intel-iommu: Simplify __intel_alloc_iova()
      intel-iommu: Performance improvement for domain_pfn_mapping()
      intel-iommu: Performance improvement for dma_pte_clear_range()
      intel-iommu: Clean up iommu_domain_identity_map()
      intel-iommu: Remove last use of PHYSICAL_PAGE_MASK, for reserving PCI BARs
      intel-iommu: Make iommu_flush_iotlb_psi() take pfn as argument
      intel-iommu: Change aligned_size() to aligned_nrpages()
      intel-iommu: Clean up intel_map_sg(), remove domain_page_mapping()
      ...

commit 68f5a38c3ea4ae9cc7a40f86ff6d6d031583d93a
Author: Hu Tao <cnhutao@gmail.com>
Date:   Thu Jul 2 13:55:45 2009 -0400

    Btrfs: fix error message formatting
    
    Make an error msg look nicer by inserting a space between number and word.
    
    Signed-off-by: Hu Tao <hu.taoo@gmail.com>
    Signed-off-by: Jiri Kosina <jkosina@suse.cz>
    Signed-off-by: Chris Mason <chris.mason@oracle.com>

commit 9b627e9bf49ebfeb060dfae0435bdba06cf27cb8
Author: Jiri Slaby <jirislaby@gmail.com>
Date:   Thu Jul 2 13:50:58 2009 -0400

    Btrfs: fix use after free in btrfs_start_workers fail path
    
    worker memory is already freed on one fail path in btrfs_start_workers,
    but is still dereferenced. Switch the dereference and kfree.
    
    Signed-off-by: Jiri Slaby <jirislaby@gmail.com>
    Signed-off-by: Chris Mason <chris.mason@oracle.com>

commit 9427216476d4fa75103f39d4b228c47d56ba20da
Author: Chris Mason <chris.mason@oracle.com>
Date:   Thu Jul 2 12:26:06 2009 -0400

    Btrfs: honor nodatacow/sum mount options for new files
    
    The btrfs attr patches unconditionally inherited the inode flags field
    without honoring nodatacow and nodatasum.  This fix makes sure
    we properly record the nodatacow/sum mount options in new inodes.
    
    Signed-off-by: Chris Mason <chris.mason@oracle.com>

commit 2c47e605a91dde6b0514f689645e7ab336c8592a
Author: Yan Zheng <zheng.yan@oracle.com>
Date:   Sat Jun 27 21:07:35 2009 -0400

    Btrfs: update backrefs while dropping snapshot
    
    The new backref format has restriction on type of backref item.  If a tree
    block isn't referenced by its owner tree, full backrefs must be used for the
    pointers in it. When a tree block loses its owner tree's reference, backrefs
    for the pointers in it should be updated to full backrefs. Current
    btrfs_drop_snapshot misses the code that updates backrefs, so it's unsafe for
    general use.
    
    This patch adds backrefs update code to btrfs_drop_snapshot.  It isn't a
    problem in the restricted form btrfs_drop_snapshot is used today, but for
    general snapshot deletion this update is required.
    
    Signed-off-by: Yan Zheng <zheng.yan@oracle.com>
    Signed-off-by: Chris Mason <chris.mason@oracle.com>

commit a970b0a16cc416a509d5ae8b1d70978664e6f4fe
Author: Josef Bacik <jbacik@redhat.com>
Date:   Sat Jun 27 21:07:34 2009 -0400

    Btrfs: account for space we may use in fallocate
    
    Using Eric Sandeen's xfstest for fallocate, you can easily trigger a ENOSPC
    panic on btrfs.  This is because we do not account for data we may use when
    doing the fallocate.  This patch fixes the problem by properly reserving space,
    and then just freeing it when we are done.  The reservation stuff was made with
    delalloc in mind, so its a little crude for this case, but it keeps the box
    from panicing.
    
    Signed-off-by: Josef Bacik <jbacik@redhat.com>
    Signed-off-by: Chris Mason <chris.mason@oracle.com>

commit c8a894d77de4a1e0a544577fd4eabc9aacd453a8
Author: Chris Mason <chris.mason@oracle.com>
Date:   Sat Jun 27 21:07:03 2009 -0400

    Btrfs: fix the file clone ioctl for preallocated extents

commit f597bb19ccd034cbcf05e1194238e2c8d9505a8a
Author: Chris Mason <chris.mason@oracle.com>
Date:   Sat Jun 27 21:06:22 2009 -0400

    Btrfs: don't log the inode in file_write while growing the file

commit dbe45d0ce394732cc06187e929697fc0fb16aa53
Merge: 4413c8d2be530d7310feaceaae28350b316b2068 826390796d09444b93e1f957582f8970ddfd9b3d
Author: Takashi Iwai <tiwai@suse.de>
Date:   Thu Jul 2 17:48:34 2009 +0200

    Merge branch 'fix/oxygen' into for-linus
    
    * fix/oxygen:
      sound: virtuoso: fix Xonar D1/DX silence after resume

commit 4413c8d2be530d7310feaceaae28350b316b2068
Merge: cfbc78003e2b12e60a1d594ce192c30aea44eb2a ff84847171508a3c76eb7e483204d1be7738729b
Author: Takashi Iwai <tiwai@suse.de>
Date:   Thu Jul 2 17:48:33 2009 +0200

    Merge branch 'fix/hda' into for-linus
    
    * fix/hda:
      ALSA: hda - Add quirk for HP 6930p
      ALSA: hda - Add missing static to patch_ca0110()

commit cfbc78003e2b12e60a1d594ce192c30aea44eb2a
Merge: dc8a4f3fc3c32954c9fd46cb027b959380be2d65 3f5d3465be8f6e04f43d9b6d543fe28d4be07d78
Author: Takashi Iwai <tiwai@suse.de>
Date:   Thu Jul 2 17:48:32 2009 +0200

    Merge branch 'fix/caiaq' into for-linus
    
    * fix/caiaq:
      ALSA: usx2y - reparent sound device
      ALSA: snd_usb_caiaq: reparent sound device

commit dc8a4f3fc3c32954c9fd46cb027b959380be2d65
Merge: 9ea5ca75a2aebb7172094a7d77acf6ff7600cc56 da9ff1f796e81976935407251815838bef9868d4
Author: Takashi Iwai <tiwai@suse.de>
Date:   Thu Jul 2 17:48:31 2009 +0200

    Merge branch 'fix/asoc' into for-linus
    
    * fix/asoc:
      ASoC: Only disable pxa2xx-i2s clocks if we enabled them
      ASoC: OMAP: fix OMAP1510 broken PCM pointer callback
      ASoC: remove BROKEN from Efika and pcm030 fabric drivers
      ASoC: Fix typo in MPC5200 PSC AC97 driver Kconfig

commit bdae997f44535ac4ebe1e055ffe59eeee946f453
Author: Keith Packard <keithp@keithp.com>
Date:   Wed Jul 1 21:56:38 2009 -0700

    fs/notify/inotify: decrement user inotify count on close
    
    The per-user inotify_devs value is incremented each time a new file is
    allocated, but never decremented. This led to inotify_init failing after a
    limited number of calls.
    
    Signed-off-by: Keith Packard <keithp@keithp.com>
    Signed-off-by: Eric Paris <eparis@redhat.com>

commit 6a43e574c5af7d9bd084992b1c9c3cdbc3b6c0e9
Author: David Woodhouse <David.Woodhouse@intel.com>
Date:   Thu Jul 2 12:02:34 2009 +0100

    intel-iommu: Don't keep freeing page zero in dma_pte_free_pagetable()
    
    Check dma_pte_present() and only free the page if there _is_ one.
    Kind of surprising that there was no warning about this.
    
    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

commit 75e6bf9638992dfc0fec9c3ca10444c8e0d6a638
Author: David Woodhouse <David.Woodhouse@intel.com>
Date:   Thu Jul 2 11:21:16 2009 +0100

    intel-iommu: Introduce first_pte_in_page() to simplify PTE-setting loops
    
    On Wed, 2009-07-01 at 16:59 -0700, Linus Torvalds wrote:
    > I also _really_ hate how you do
    >
    >         (unsigned long)pte >> VTD_PAGE_SHIFT ==
    >         (unsigned long)first_pte >> VTD_PAGE_SHIFT
    
    Kill this, in favour of just looking to see if the incremented pte
    pointer has 'wrapped' onto the next page. Which means we have to check
    it _after_ incrementing it, not before.
    
    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

commit 3f5d3465be8f6e04f43d9b6d543fe28d4be07d78
Author: Takashi Iwai <tiwai@suse.de>
Date:   Thu Jul 2 11:51:44 2009 +0200

    ALSA: usx2y - reparent sound device
    
    Fix the parent device to be the USB interface, not the USB device.
    A similiar commit like 563c2bf59d392357bcc1d99642933cc88c687964.
    
    Signed-off-by: Takashi Iwai <tiwai@suse.de>

commit 563c2bf59d392357bcc1d99642933cc88c687964
Author: Daniel Mack <daniel@caiaq.de>
Date:   Thu Jul 2 10:46:35 2009 +0200

    ALSA: snd_usb_caiaq: reparent sound device
    
    The sound device instance needs to be a child of the USB interface, not
    the USB device. Newer udev versions pay attention to that.
    
    Signed-off-by: Daniel Mack <daniel@caiaq.de>
    Reported-by: Lennart Poettering <lennart@poettering.net>
    Signed-off-by: Takashi Iwai <tiwai@suse.de>

commit 826390796d09444b93e1f957582f8970ddfd9b3d
Author: Clemens Ladisch <clemens@ladisch.de>
Date:   Thu Jul 2 08:31:30 2009 +0200

    sound: virtuoso: fix Xonar D1/DX silence after resume
    
    When resuming, we better take the DACs out of the reset state before
    trying to use them.
    
    Reference: kernel bug #13599
    	http://bugzilla.kernel.org/show_bug.cgi?id=13599
    
    Signed-off-by: Clemens Ladisch <clemens@ladisch.de>
    Cc: <stable@kernel.org>
    Signed-off-by: Takashi Iwai <tiwai@suse.de>

commit 7766a3fb905f0b078b05f5d6a6be8df4c64b9f51
Author: David Woodhouse <David.Woodhouse@intel.com>
Date:   Wed Jul 1 20:27:03 2009 +0100

    intel-iommu: Use cmpxchg64_local() for setting PTEs
    
    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

commit 85b98276f2ffa66b25ae6328b00bfadfd74b74e7
Author: David Woodhouse <David.Woodhouse@intel.com>
Date:   Wed Jul 1 19:27:53 2009 +0100

    intel-iommu: Warn about unmatched unmap requests
    
    This would have found the bug in i386 pci_unmap_addr() a long time ago.
    We shouldn't just silently return without doing anything.
    
    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

commit 206a73c102fc480ba072a9388bc2142c303113aa
Author: David Woodhouse <David.Woodhouse@intel.com>
Date:   Wed Jul 1 19:30:28 2009 +0100

    intel-iommu: Kill superfluous mapping_lock
    
    Since we're using cmpxchg64() anyway (because that's the only way to do
    an atomic 64-bit store on i386), we might as well ditch the extra
    locking and just use cmpxchg64() to ensure that we don't add the page
    twice.
    
    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

commit c85994e4771025ef2a66533eb1a4c6c2217b9cda
Author: David Woodhouse <David.Woodhouse@intel.com>
Date:   Wed Jul 1 19:21:24 2009 +0100

    intel-iommu: Ensure that PTE writes are 64-bit atomic, even on i386
    
    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

commit 3238c0c4d68d9a9022b411a11a4b933fbdb53a14
Author: David Woodhouse <David.Woodhouse@intel.com>
Date:   Wed Jul 1 18:56:16 2009 +0100

    intel-iommu: Make iommu=pt work on i386 too
    
    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

commit da9ff1f796e81976935407251815838bef9868d4
Author: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date:   Wed Jul 1 18:23:26 2009 +0100

    ASoC: Only disable pxa2xx-i2s clocks if we enabled them
    
    The clock API can't cope with unbalanced enables and disables and
    we only enable in hw_params() but try to disable in shutdown.
    
    Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>

commit ff84847171508a3c76eb7e483204d1be7738729b
Author: Takashi Iwai <tiwai@suse.de>
Date:   Wed Jul 1 18:08:01 2009 +0200

    ALSA: hda - Add quirk for HP 6930p
    
    Added a quirk model=laptop for HP 6930p (103c:30dc) with AD1984A codec.
    
    Signed-off-by: Takashi Iwai <tiwai@suse.de>

commit 1e1689536f346a431b748dc8ad9ac0828d2c065d
Author: Takashi Iwai <tiwai@suse.de>
Date:   Wed Jul 1 08:34:32 2009 +0200

    ALSA: hda - Add missing static to patch_ca0110()
    
    Signed-off-by: Takashi Iwai <tiwai@suse.de>

commit 1bdd7419910c1506151e7b9e2d60c6980e015f76
Author: Janusz Krzysztofik <jkrzyszt@tis.icnet.pl>
Date:   Sun Jun 28 00:21:05 2009 +0200

    ASoC: OMAP: fix OMAP1510 broken PCM pointer callback
    
    This patch tries to work around the problem of broken OMAP1510 PCM playback
    pointer calculation by replacing DMA function call that incorrectly tries to
    read the value form DMA hardware with a value computed locally from an
    already maintained variable omap_runtime_data.period_index.
    
    Tested on OMAP5910 based Amstrad Delta (E3) using work in progress ASoC
    driver.
    
    Based on linux-2.6-asoc.git v2.6.31-rc1.
    
    Signed-off-by: Janusz Krzysztofik <jkrzyszt@tis.icnet.pl>
    Acked-by: Jarkko Nikula <jhnikula@gmail.com>
    Acked-by: Peter Ujfalusi <peter.ujfalusi@nokia.com>
    Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>

commit 40d9ec14e7e1f62d2379ecc1b5ee00ddfc2a5d0c
Author: Grant Likely <grant.likely@secretlab.ca>
Date:   Sun Jun 28 01:42:06 2009 -0600

    ASoC: remove BROKEN from Efika and pcm030 fabric drivers
    
    The needed spin_event_timeout() macro is now merged in from the
    powerpc tree, so these drivers are no longer broken.  This reverts
    commit 0c0e09e21a9e7bc6ca54e06ef3d497255ca26383 (ASoC: Mark MPC5200
    AC97 as BROKEN until PowerPC merge issues are resolved)
    
    Tested against 2.6.31-rc1.
    
    Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
    Acked-by: Jon Smirl <jonsmirl@gmail.com>
    Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>

commit 6a84c234da06a4ac0c1b4c819b83cf264674c2d8
Author: Grant Likely <grant.likely@secretlab.ca>
Date:   Sun Jun 28 01:41:52 2009 -0600

    ASoC: Fix typo in MPC5200 PSC AC97 driver Kconfig
    
    ALSA SoC drivers should be specify SND_SOC_AC97_BUS instead, not AC97_BUS.
    Without SND_SOC_AC97_BUS defined, an AC97 device will not get correctly
    registered on the AC97 bus, which prevents thinks like the WM9712
    touchscreen driver from getting probed.
    
    Tested against 2.6.31-rc1.
    
    Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
    Acked-by: Jon Smirl <jonsmirl@gmail.com>
    Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>

commit f3a0a52fff4dbfdea2dccc908d00c038481d888e
Author: David Woodhouse <David.Woodhouse@intel.com>
Date:   Tue Jun 30 03:40:07 2009 +0100

    intel-iommu: Performance improvement for dma_pte_free_pagetable()
    
    As with other functions, batch the CPU data cache flushes and don't keep
    recalculating PTE addresses.
    
    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

commit 3d7b0e4154b4963d6bd39991ec8eaa09caeb3994
Author: David Woodhouse <David.Woodhouse@intel.com>
Date:   Tue Jun 30 03:38:09 2009 +0100

    intel-iommu: Don't free too much in dma_pte_free_pagetable()
    
    The loop condition was wrong -- we should free a PMD only if its
    _entire_ range is within the range we're intending to clear. The
    early-termination condition was right, but not the loop.
    
    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

commit 1bf20f0dc5629032ddd07617139d9fbca66c1642
Author: David Woodhouse <David.Woodhouse@intel.com>
Date:   Mon Jun 29 22:06:43 2009 +0100

    intel-iommu: dump mappings but don't die on pte already set
    
    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

commit 9051aa0268dc1c3e42cd79a802b0af1f2bfcadae
Author: David Woodhouse <David.Woodhouse@intel.com>
Date:   Mon Jun 29 12:30:54 2009 +0100

    intel-iommu: Combine domain_pfn_mapping() and domain_sg_mapping()
    
    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

commit e1605495c716ef4eebdb7606bcd1b593f28e2837
Author: David Woodhouse <David.Woodhouse@intel.com>
Date:   Mon Jun 29 11:17:38 2009 +0100

    intel-iommu: Introduce domain_sg_mapping() to speed up intel_map_sg()
    
    Instead of calling domain_pfn_mapping() repeatedly with single or
    small numbers of pages, just pass the sglist in. It can optimise the
    number of cache flushes like domain_pfn_mapping() does, and gives a huge
    speedup for large scatterlists.
    
    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

commit 875764de6f0ddb23d270c29357d5a339232a0488
Author: David Woodhouse <David.Woodhouse@intel.com>
Date:   Sun Jun 28 21:20:51 2009 +0100

    intel-iommu: Simplify __intel_alloc_iova()
    
    There's no need for the separate iommu_alloc_iova() function, and
    certainly not for it to be global. Remove the underscores while we're at
    it.
    
    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

commit 6f6a00e40aa3fdd3b29c30e3ef1fc9690506bc03
Author: David Woodhouse <David.Woodhouse@intel.com>
Date:   Sun Jun 28 20:38:49 2009 +0100

    intel-iommu: Performance improvement for domain_pfn_mapping()
    
    As with dma_pte_clear_range(), don't keep flushing a single PTE at a
    time. And also micro-optimise the setting of PTE values rather than
    using the helper functions to do all the masking.
    
    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

commit 310a5ab93cb4ce29367238f682affd9ac352f4d0
Author: David Woodhouse <David.Woodhouse@intel.com>
Date:   Sun Jun 28 18:52:20 2009 +0100

    intel-iommu: Performance improvement for dma_pte_clear_range()
    
    It's a bit silly to repeatedly call domain_flush_cache() for each PTE
    individually, as we clear it. Instead, batch them up and flush a whole
    range at a time. We might as well refrain from recalculating the PTE
    address from scratch each time round the loop too.
    
    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

commit c5395d5c4a82159889cb650de93b591ea51d8c56
Author: David Woodhouse <David.Woodhouse@intel.com>
Date:   Sun Jun 28 16:35:56 2009 +0100

    intel-iommu: Clean up iommu_domain_identity_map()
    
    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

commit 1a4a45516d7a57de0691352d899d7008f2e090d1
Author: David Woodhouse <David.Woodhouse@intel.com>
Date:   Sun Jun 28 16:00:42 2009 +0100

    intel-iommu: Remove last use of PHYSICAL_PAGE_MASK, for reserving PCI BARs
    
    This is fairly broken anyway -- it doesn't take hotplug into account.
    We should probably be checking page_is_ram() instead.
    
    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

commit 03d6a2461ab1704c171ce21081c5022378ef7a91
Author: David Woodhouse <David.Woodhouse@intel.com>
Date:   Sun Jun 28 15:33:46 2009 +0100

    intel-iommu: Make iommu_flush_iotlb_psi() take pfn as argument
    
    Most of its callers are having to shift for themselves anyway, so we might
    as well do it in iommu_flush_iotlb_psi().
    
    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

commit 88cb6a7424d9465faf6caaaadff5af0766c93991
Author: David Woodhouse <David.Woodhouse@intel.com>
Date:   Sun Jun 28 15:03:06 2009 +0100

    intel-iommu: Change aligned_size() to aligned_nrpages()
    
    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

commit b536d24d212c994a7d98469ea3a8891573d45fd4
Author: David Woodhouse <David.Woodhouse@intel.com>
Date:   Sun Jun 28 14:49:31 2009 +0100

    intel-iommu: Clean up intel_map_sg(), remove domain_page_mapping()
    
    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

commit ad05122162b67f64d5a1c6d35e001f7a88619b88
Author: David Woodhouse <David.Woodhouse@intel.com>
Date:   Sun Jun 28 14:22:28 2009 +0100

    intel-iommu: Use domain_pfn_mapping() in intel_iommu_map_range()
    
    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

commit 0ab36de274ab094c3992b50c9c48c5c89072ec94
Author: David Woodhouse <David.Woodhouse@intel.com>
Date:   Sun Jun 28 14:01:43 2009 +0100

    intel-iommu: Use domain_pfn_mapping() in __intel_map_single()
    
    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

commit 61df744314079e8cb8cdec75f517cf0e704e41ef
Author: David Woodhouse <David.Woodhouse@intel.com>
Date:   Sun Jun 28 11:55:58 2009 +0100

    intel-iommu: Introduce domain_pfn_mapping()
    
    ... and use it in the trivial cases; the other callers want individual
    (and bisectable) attention, since I screwed them up the first time...
    
    Make the BUG_ON() happen on too-large virtual address rather than
    physical address, too. That's the one we care about.
    
    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

commit 1c5a46ed49e37f56f8aa9000bb1c2ac59670c372
Author: David Woodhouse <David.Woodhouse@intel.com>
Date:   Sun Jun 28 10:53:37 2009 +0100

    intel-iommu: Clean up address handling in domain_page_mapping()
    
    No more masking and alignment; just use pfns.
    
    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

commit b026fd28ea23af24a3eea6e5be3f3d0193a8e87d
Author: David Woodhouse <David.Woodhouse@intel.com>
Date:   Sun Jun 28 10:37:25 2009 +0100

    intel-iommu: Change addr_to_dma_pte() to pfn_to_dma_pte()
    
    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

commit 163cc52ccd2cc5c5ae4e1c886f6fde8547feed2a
Author: David Woodhouse <David.Woodhouse@intel.com>
Date:   Sun Jun 28 00:51:17 2009 +0100

    intel-iommu: Clean up intel_iommu_unmap_range()
    
    Use unaligned address for domain->max_addr. That algorithm isn't ideal
    anyway -- we should probably just look at the last iova in the tree.
    
    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

commit d794dc9b302c2781c571c10dedb8094e223d31b8
Author: David Woodhouse <David.Woodhouse@intel.com>
Date:   Sun Jun 28 00:27:49 2009 +0100

    intel-iommu: Make dma_pte_free_pagetable() take pfns as argument
    
    With some cleanup of intel_unmap_page(), intel_unmap_sg() and
    vm_domain_exit() to no longer play with 64-bit addresses.
    
    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

commit 6660c63a79a639b86e3a709e25a8c4fc3ab24770
Author: David Woodhouse <David.Woodhouse@intel.com>
Date:   Sat Jun 27 22:41:00 2009 +0100

    intel-iommu: Make dma_pte_free_pagetable() use pfns
    
    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

commit 595badf5d65d50300319e6178e6df005ea501f70
Author: David Woodhouse <David.Woodhouse@intel.com>
Date:   Sat Jun 27 22:09:11 2009 +0100

    intel-iommu: Make dma_pte_clear_range() take pfns as argument
    
    Noting that this is now an _inclusive_ range.
    
    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

commit 04b18e65dd5a3e544f07f4bcfa8fb52704a1833b
Author: David Woodhouse <David.Woodhouse@intel.com>
Date:   Sat Jun 27 19:15:01 2009 +0100

    intel-iommu: Make dma_pte_clear_range() use pfns
    
    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

commit 66eae8469e4e4ba6f4ca7ef82103c78f6d645583
Author: David Woodhouse <David.Woodhouse@intel.com>
Date:   Sat Jun 27 19:00:32 2009 +0100

    intel-iommu: Don't just mask out too-big physical addresses; BUG() instead
    
    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

commit a75f7cf94f01717c5103138319b96752ee2a2be9
Author: David Woodhouse <David.Woodhouse@intel.com>
Date:   Sat Jun 27 17:44:39 2009 +0100

    intel-iommu: Make dma_pte_clear_one() take pfn not address
    
    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

commit 90dcfb5eb2fd427b16135a14f176a6902750b6b4
Author: David Woodhouse <David.Woodhouse@intel.com>
Date:   Sat Jun 27 17:14:59 2009 +0100

    intel-iommu: Change dma_addr_level_pte() to dma_pfn_level_pte()
    
    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

commit 77dfa56c94d2855a25ff552b74980a5538e129f8
Author: David Woodhouse <David.Woodhouse@intel.com>
Date:   Sat Jun 27 16:40:08 2009 +0100

    intel-iommu: Change address_level_offset() to pfn_level_offset()
    
    We're shifting the inputs for now, but that'll change...
    
    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

commit dd4e831960e4f0214480fa96a53ca9bb7dd04927
Author: David Woodhouse <David.Woodhouse@intel.com>
Date:   Sat Jun 27 16:21:20 2009 +0100

    intel-iommu: Change dma_set_pte_addr() to dma_set_pte_pfn()
    
    Add some helpers for converting between VT-d and normal system pfns,
    since system pages can be larger than VT-d pages.
    
    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

commit c7ab48d2acaf959e4d59c3f55d12fdb7ca9afd7c
Author: David Woodhouse <David.Woodhouse@intel.com>
Date:   Fri Jun 26 19:10:36 2009 +0100

    intel-iommu: Clean up identity mapping code, remove CONFIG_DMAR_GFX_WA
    
    There's no need for the GFX workaround now we have 'iommu=pt' for the
    cases where people really care about performance. There's no need to
    have a special case for just one type of device.
    
    This also speeds up the iommu=pt path and reduces memory usage by
    setting up the si_domain _once_ and then using it for all devices,
    rather than giving each device its own private page tables.
    
    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

commit b213203e475212a69ad6fedfb73464087e317148
Author: David Woodhouse <David.Woodhouse@intel.com>
Date:   Fri Jun 26 18:50:28 2009 +0100

    intel-iommu: Create new iommu_domain_identity_map() function
    
    We'll want to do this to a _domain_ (the si_domain) rather than a PCI device.
    
    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

commit bf92df30df909710c498d05620e2df1be1ef779b
Author: Yu Zhao <yu.zhao@intel.com>
Date:   Mon Jun 29 11:31:45 2009 +0800

    intel-iommu: Only avoid flushing device IOTLB for domain ID 0 in caching mode
    
    In caching mode, domain ID 0 is reserved for non-present to present
    mapping flush. Device IOTLB doesn't need to be flushed in this case.
    
    Previously we were avoiding the flush for domain zero, even if the IOMMU
    wasn't in caching mode and domain zero wasn't special.
    
    Signed-off-by: Yu Zhao <yu.zhao@intel.com>
    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

commit a222ad1a4b2e3ca177a538482c99c519c1ce94d1
Author: Karen Xie <kxie@chelsio.com>
Date:   Fri Jun 26 15:17:29 2009 -0700

    [SCSI] cxgb3i: fix connection error when vlan is enabled
    
    There is a bug when VLAN is configured on the cxgb3 interface, the iscsi
    conn. would be denied with message "cxgb3i: NOT going through cxgbi device."
    
    This patch adds code to get the real egress net_device when vlan is configured.
    
    Signed-off-by: Karen Xie <kxie@chelsio.com>
    Reviewed-by: Mike Christie <michaelc@cs.wisc.edu>
    Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>

commit 112942353992d95099fb5b71c679ff1046fccfcf
Author: Amerigo Wang <amwang@redhat.com>
Date:   Fri Jun 19 03:40:26 2009 -0400

    kbuild: finally remove the obsolete variable $TOPDIR
    
    TOPDIR is obsolete, it can be finally removed now.
    
    Signed-off-by: WANG Cong <amwang@redhat.com>
    Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

commit c512d2544c688ff1fab18a530860a9c7440a71b7
Author: Jaswinder Singh Rajput <jaswinder@kernel.org>
Date:   Sat Jun 20 18:25:25 2009 +0530

    gitignore: ignore scripts/ihex2fw
    
    scripts/ihex2fw is a generated binary and should be ignored
    
    Signed-off-by: Jaswinder Singh Rajput <jaswinderrajput@gmail.com>
    Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

commit a8735821d198675dd326cc5847e79df79c735119
Author: Floris Kraak <randakar@gmail.com>
Date:   Mon Jun 15 08:54:02 2009 +0300

    Kbuild: Disable the -Wformat-security gcc flag
    
    Some distributions have enabled the gcc flag -Wformat-security by default.
    This results in a number of warnings about format arguments to functions,
    sometimes in cases where fixing the warning is not likely to actually fix a
    bug.  Instead of hand patching a dozens of places (possibly more) that produce
    warnings that get ignored anyway we just turn off the flag in the Makefile.
    
    Signed-off-by: Floris Kraak <randakar@gmail.com>
    Signed-off-by: Pekka Enberg <penberg@cs.helsinki.fi>
    Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

commit 7a6b1f1c0c492a6bb6f778dff0f9f5facb90d1a1
Author: Amerigo Wang <xiyou.wangcong@gmail.com>
Date:   Mon Jun 22 17:18:32 2009 +0800

    gitignore: ignore gcov output files
    
    Ignore *.gcno files which are generated by gcov.
    
    Signed-off-by: WANG Cong <xiyou.wangcong@gmail.com>
    Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

commit 1ab18486e4e8bf9554d8439207b97422d7466d77
Author: maximilian attems <max@stro.at>
Date:   Fri Jun 26 20:04:36 2009 +0200

    kbuild: deb-pkg ship changelog
    
    In the series for 2.6.31 it was noticed to ship the copyright,
    but the generated changelog got lost somehow.
    
    As bonus the generated linux-image deb packages are Lenny lintian clean.
    
    Cc: Frans Pop <elendil@planet.nl>
    Cc: Andres Salomon <dilinger@debian.org>
    Signed-off-by: maximilian attems <max@stro.at>
    Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

commit 857eceebd2803c9a3459f784acf45e5266921e4d
Author: Tim Abbott <tabbott@ksplice.com>
Date:   Tue Jun 23 19:59:36 2009 -0400

    Add new __init_task_data macro to be used in arch init_task.c files.
    
    This patch is preparation for replacing most ".data.init_task" in the
    kernel with macros, so that the section name can later be changed
    without having to touch a lot of the kernel.
    
    The long-term goal here is to be able to change the kernel's magic
    section names to those that are compatible with -ffunction-sections
    -fdata-sections.  This requires renaming all magic sections with names
    of the form ".data.foo".
    
    Signed-off-by: Tim Abbott <tabbott@ksplice.com>
    Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

commit 39a449d96ac3db9b6d498b6ffbf4c763746d5e8b
Author: Tim Abbott <tabbott@ksplice.com>
Date:   Tue Jun 23 18:53:15 2009 -0400

    asm-generic/vmlinux.lds.h: shuffle INIT_TASK* macro names in vmlinux.lds.h
    
    We recently added a INIT_TASK(align) in include/asm-generic/vmlinux.lds.h,
    but there is already a macro INIT_TASK in include/linux/init_task.h, which
    is quite confusing.  We should switch the macro in the linker script to
    INIT_TASK_DATA. (Sorry that I missed this in reviewing the patch).  Since
    the macros are new, there is only one user of the INIT_TASK in
    vmlinux.lds.h, arch/mn10300/kernel/vmlinux.lds.S.
    
    However, we are currently using INIT_TASK_DATA for laying down an entire
    .data.init_task section.  So rename that to INIT_TASK_DATA_SECTION.
    
    I would be worried about changing the meaning of INIT_TASK_DATA, but the
    old INIT_TASK_DATA implementation had no users, and in fact if anyone had
    tried to use it, it would have failed to compile because it didn't pass
    the alignment to the old INIT_TASK.
    
    Signed-off-by: Tim Abbott <tabbott@ksplice.com>
    Cc: David Howells <dhowells@redhat.com>
    Cc: Jesper Nilsson <Jesper.Nilsson@axis.com
    Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

commit d2af12aeadaedf657c9fb9c3df984d2c5ab25f4c
Author: Tim Abbott <tabbott@ksplice.com>
Date:   Tue Jun 23 19:59:35 2009 -0400

    Add new macros for page-aligned data and bss sections.
    
    This patch is preparation for replacing most uses of
    ".bss.page_aligned" and ".data.page_aligned" in the kernel with
    macros, so that the section name can later be changed without having
    to touch a lot of the kernel.
    
    The long-term goal here is to be able to change the kernel's magic
    section names to those that are compatible with -ffunction-sections
    -fdata-sections.  This requires renaming all magic sections with names
    of the form ".data.foo".
    
    Signed-off-by: Tim Abbott <tabbott@ksplice.com>
    Acked-by: David Howells <dhowells@redhat.com>
    Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

commit 73f1d9391a6aa72efdcea2f302ee7bfcd313c631
Author: Paul Mundt <lethal@linux-sh.org>
Date:   Wed Jun 24 01:04:36 2009 +0900

    asm-generic/vmlinux.lds.h: Fix up RW_DATA_SECTION definition.
    
    RW_DATA_SECTION is defined to take 4 different alignment parameters,
    while NOSAVE_DATA currently uses a fixed PAGE_SIZE alignment as noted
    in the comments.
    
    There are presently no in-tree users of this at present, and I just
    stumbled across this while implementing the simplified script on a new
    architecture port, which subsequently resulted in a syntax error.
    
    Signed-off-by: Paul Mundt <lethal@linux-sh.org>
    Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

commit 39562e783928e3ea9ee2cbce99a756ab48d3c06a
Author: Christof Schmitt <christof.schmitt@de.ibm.com>
Date:   Fri Jun 26 16:30:43 2009 +0200

    [SCSI] FC transport: Locking fix for common-code FC pass-through patch
    
    Fix this:
    ------------[ cut here ]------------
    Badness at block/blk-core.c:244
    CPU: 0 Tainted: G        W  2.6.31-rc1-00004-gd3a263a #3
    Process zfcp_wq (pid: 901, task: 000000002fb7a038, ksp: 000000002f02bc78)
    Krnl PSW : 0704300180000000 00000000002141ba (blk_remove_plug+0xb2/0xb8)
               R:0 T:1 IO:1 EX:1 Key:0 M:1 W:0 P:0 AS:0 CC:3 PM:0 EA:3
    Krnl GPRS: 0000000000000001 0000000000000001 0000000022811440 0000000022811798
               000000000027ff4e 0000000000000000 0000000000000000 000000002f00f000
               070000000006a0f4 000000002af70000 000000002af2a800 00000000228d1c00
               0000000022811440 000000000050c708 000000002f02bca8 000000002f02bc80
    Krnl Code: 00000000002141b0: b9140022		lgfr	%r2,%r2
               00000000002141b4: 07fe		bcr	15,%r14
               00000000002141b6: a7f40001		brc	15,2141b8
              >00000000002141ba: a7f4ffbe		brc	15,214136
               00000000002141be: 0707		bcr	0,%r7
               00000000002141c0: ebaff0680024	stmg %r10,%r15,104(%r15)
               00000000002141c6: c0d00017c2a9	larl	%r13,50c718
               00000000002141cc: a7f13fc0		tmll	%r15,16320
    Call Trace:
    ([<000000000050e7d8>] C.272.16122+0x88/0x110)
     [<00000000002141ec>] __blk_run_queue+0x2c/0x154
     [<000000000028013a>] fc_remote_port_add+0x85e/0x95c
     [<000000000037596e>] zfcp_scsi_rport_work+0xe6/0x148
     [<000000000006908c>] worker_thread+0x25c/0x318
     [<000000000006f10c>] kthread+0x94/0x9c
     [<000000000001c2b2>] kernel_thread_starter+0x6/0xc
     [<000000000001c2ac>] kernel_thread_starter+0x0/0xc
    INFO: lockdep is turned off.
    Last Breaking-Event-Address:
     [<00000000002141b6>] blk_remove_plug+0xae/0xb8
    
    The FC pass-through support triggers the WARN_ON(!irqs_disabled()) in
    blk_plug_device. Since blk_plug_device requires being called with
    disabled interrupts, use spin_lock_irqsave in fc_bsg_goose_queue to
    disable the interrupts before calling into the block layer.
    
    Signed-off-by: Christof Schmitt <christof.schmitt@de.ibm.com>
    Acked-by: James Smart <james.smart@emulex.com>
    Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>

commit d3a263a8168f78874254ea9da9595cfb0f3e96d7
Author: James Bottomley <James.Bottomley@HansenPartnership.com>
Date:   Wed Jun 24 19:55:22 2009 +0000

    [SCSI] zalon: fix oops on attach failure
    
    I recently discovered on my zalon that if the attachment fails because
    of a bus misconfiguration (I scrapped my HVD array, so the card is now
    unterminated) then the system oopses.  The reason is that if
    ncr_attach() returns NULL (signalling failure) that NULL is passed by
    the goto failed straight into ncr_detach() which oopses.
    
    The fix is just to return -ENODEV in this case.
    
    Cc: Stable Tree <stable@kernel.org>
    Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>

commit e3f47cc74bddea8121560026185ede4770170043
Author: Abhijeet Joglekar <abjoglek@cisco.com>
Date:   Wed Jun 24 07:42:25 2009 -0700

    [SCSI] fnic: use DMA_BIT_MASK(nn) instead of deprecated DMA_nnBIT_MASK
    
    Robert Love reported warning while building fnic_main.c:
    drivers/scsi/fnic/fnic_main.c:478: warning: `DMA_nnBIT_MASK' is deprecated.
    
    Replaced use of DMA_nnBIT_MASK by DMA_BIT_MASK(nn)
    
    Signed-off-by: Abhijeet Joglekar <abjoglek@cisco.com>
    Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>

commit 87a2d34b0372dcf6bc4caf4d97a7889f5e62a1af
Author: Roel Kluin <roel.kluin@gmail.com>
Date:   Tue Jun 23 01:06:40 2009 +0200

    [SCSI] fnic: remove redundant BUG_ONs and fix checks on unsigned
    
    The shost sg tablesize is set to FNIC_MAX_SG_DESC_CNT and fnic uses
    scsi_dma_map, so both BUG_ONs can be removed.
    
    scsi_dma_map may return -ENOMEM, sg_count should be int to catch that.
    
    Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
    Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>

commit e08afeb7e69f45e4ab9fbb8530fe433484b96606
Author: Brian King <brking@linux.vnet.ibm.com>
Date:   Tue Jun 23 17:14:01 2009 -0500

    [SCSI] ibmvscsi: Fix module load hang
    
    Fixes a regression seen in the ibmvscsi driver when using the VSCSI
    server in SLES 9 and SLES 10. The VSCSI server in these releases
    has a bug in it in which it does not send responses to unknown MADs.
    Check the OS Type field in the adapter info response and do not send
    these unsupported commands when talking to an older server.
    
    Signed-off-by: Brian King <brking@linux.vnet.ibm.com>
    Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>

