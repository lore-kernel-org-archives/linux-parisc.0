Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 77CD44829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 11 Apr 2003 03:41:59 -0600 (MDT)
Date: Fri, 11 Apr 2003 11:41:50 +0200
Message-ID: <3E8AE87E00005968@ocpmta2.freegates.net>
In-Reply-To: <3E8AE87E0000567E@ocpmta2.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] parisc-linux.org kernel
To: "Grant Grundler" <grundler@parisc-linux.org>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

>
>>
>>Please post the diffstat results to the mailing list.
>>
>>You can ignore complete driver "updates" I've committed.
>>Some newer drivers work better for parisc, some don't. qlogic driver
>>doesn't crash but it doesn't work right either. tg3 v1.5 is an example
>>where it works better than the existing version.
>>
>>In general, breaking up the 3.5MB diff into smaller chunks makes it
>>easier for Marcelo to handle.
>>
>Here is the rough diffstat (still have to reverse ql driver patches, I will
>try to find time this week-end :) )
>
Forget, it is a bit quiet calm and revert following patches:
patching file drivers/scsi/Config.in
patching file drivers/scsi/Makefile
Hunk #2 succeeded at 75 with fuzz 1 (offset 3 lines).
patching file drivers/scsi/qla2xxx/Config.in
patching file drivers/scsi/qla2xxx/Makefile
patching file drivers/scsi/qla2xxx/README.qla2x00
patching file drivers/scsi/qla2xxx/SUPPORTED_KERNEL_VERSION.txt
patching file drivers/scsi/qla2xxx/exioct.h
patching file drivers/scsi/qla2xxx/exioctln.h
patching file drivers/scsi/qla2xxx/inioct.h
patching file drivers/scsi/qla2xxx/listops.h
patching file drivers/scsi/qla2xxx/ql2100_fw.h
patching file drivers/scsi/qla2xxx/ql2200_fw.h
patching file drivers/scsi/qla2xxx/ql2200ip_fw.h
patching file drivers/scsi/qla2xxx/ql2300_fw.h
patching file drivers/scsi/qla2xxx/ql2300ip_fw.h
patching file drivers/scsi/qla2xxx/qla2100.c
patching file drivers/scsi/qla2xxx/qla2200.c
patching file drivers/scsi/qla2xxx/qla2300.c
patching file drivers/scsi/qla2xxx/qla2x00.c
patching file drivers/scsi/qla2xxx/qla2x00.h
patching file drivers/scsi/qla2xxx/qla2x00_ioctl.c
patching file drivers/scsi/qla2xxx/qla_cfg.c
patching file drivers/scsi/qla2xxx/qla_cfg.h
patching file drivers/scsi/qla2xxx/qla_cfgln.c
patching file drivers/scsi/qla2xxx/qla_debug.h
patching file drivers/scsi/qla2xxx/qla_fo.c
patching file drivers/scsi/qla2xxx/qla_fo.cfg
patching file drivers/scsi/qla2xxx/qla_fo.h
patching file drivers/scsi/qla2xxx/qla_gbl.h
patching file drivers/scsi/qla2xxx/qla_inioct.c
patching file drivers/scsi/qla2xxx/qla_ip.c
patching file drivers/scsi/qla2xxx/qla_ip.h
patching file drivers/scsi/qla2xxx/qla_mbx.c
patching file drivers/scsi/qla2xxx/qla_mbx.h
patching file drivers/scsi/qla2xxx/qla_settings.h
patching file drivers/scsi/qla2xxx/qla_vendor.c
patching file drivers/scsi/qla2xxx/qla_version.h
patching file drivers/scsi/qla2xxx/qlfo.h
patching file drivers/scsi/qla2xxx/qlfolimits.h
patching file drivers/scsi/qla2xxx/qlfoln.h
patching file drivers/scsi/qla2xxx/release.txt
patching file drivers/scsi/qla2xxx/revision.notes

And so obtain the following diffstat:
 Documentation/Configure.help             |   90 +
 Makefile                                 |   16 
 arch/m68k/config.in                      |    5 
 arch/m68k/kernel/m68k_ksyms.c            |    5 
 arch/m68k/kernel/setup.c                 |    3 
 arch/m68k/q40/config.c                   |   41 
 arch/parisc/config.in                    |    6 
 arch/parisc/debian-configs/32            |  989 +++++++++++++++++++++
 arch/parisc/debian-configs/32-smp        |  988 +++++++++++++++++++++
 arch/parisc/debian-configs/32-udeb       |  915 +++++++++++++++++++
 arch/parisc/debian-configs/64            |  977 +++++++++++++++++++++
 arch/parisc/debian-configs/64-smp        |  976 +++++++++++++++++++++
 arch/parisc/debian-configs/64-udeb       |  865 ++++++++++++++++++
 arch/parisc/defpalo.conf                 |   21 
 arch/parisc/kernel/cache.c               |   80 +
 arch/parisc/kernel/ccio-dma.c            |   17 
 arch/parisc/kernel/ccio-rm-dma.c         |    2 
 arch/parisc/kernel/drivers.c             |   51 -
 arch/parisc/kernel/entry.S               |    4 
 arch/parisc/kernel/hardware.c            |   10 
 arch/parisc/kernel/head.S                |    2 
 arch/parisc/kernel/ioctl32.c             |    5 
 arch/parisc/kernel/irq.c                 |    4 
 arch/parisc/kernel/lasimap.map           |  322 ------
 arch/parisc/kernel/parisc_ksyms.c        |   11 
 arch/parisc/kernel/pci-dma.c             |    8 
 arch/parisc/kernel/perf.c                |   10 
 arch/parisc/kernel/processor.c           |    2 
 arch/parisc/kernel/sba_iommu.c           |    2 
 arch/parisc/kernel/smp.c                 |   13 
 arch/parisc/kernel/traps.c               |    8 
 arch/parisc/kernel/unaligned.c           |  394 +++++---
 arch/parisc/math-emu/dfadd.c             |    2 
 arch/parisc/math-emu/dfcmp.c             |    2 
 arch/parisc/math-emu/dfdiv.c             |    2 
 arch/parisc/math-emu/dfmpy.c             |    2 
 arch/parisc/math-emu/dfrem.c             |    2 
 arch/parisc/math-emu/dfsqrt.c            |    2 
 arch/parisc/math-emu/dfsub.c             |    2 
 arch/parisc/math-emu/driver.c            |   17 
 arch/parisc/math-emu/fcnvff.c            |    2 
 arch/parisc/math-emu/fcnvfu.c            |    2 
 arch/parisc/math-emu/fcnvfut.c           |    2 
 arch/parisc/math-emu/fcnvfx.c            |    2 
 arch/parisc/math-emu/fcnvfxt.c           |    2 
 arch/parisc/math-emu/fcnvuf.c            |    2 
 arch/parisc/math-emu/fcnvxf.c            |    2 
 arch/parisc/math-emu/float.h             |    2 
 arch/parisc/math-emu/fmpyfadd.c          |    2 
 arch/parisc/math-emu/fpu.h               |    2 
 arch/parisc/math-emu/fpudispatch.c       |   19 
 arch/parisc/math-emu/sfadd.c             |    2 
 arch/parisc/math-emu/sfcmp.c             |    2 
 arch/parisc/math-emu/sfdiv.c             |    2 
 arch/parisc/math-emu/sfmpy.c             |    2 
 arch/parisc/math-emu/sfrem.c             |    2 
 arch/parisc/math-emu/sfsqrt.c            |    2 
 arch/parisc/math-emu/sfsub.c             |    2 
 drivers/char/Config.in                   |    3 
 drivers/char/Makefile                    |    2 
 drivers/char/pty.c                       |    4 
 drivers/char/serial.c                    |  115 ++
 drivers/gsc/dino.c                       |    9 
 drivers/ide/pci/ns87415.c                |    8 
 drivers/ide/setup-pci.c                  |    2 
 drivers/net/acenic.c                     |    5 
 drivers/net/lasi_82596.c                 |    2 
 drivers/net/pcnet32.c                    |   26 
 drivers/net/tulip/eeprom.c               |    3 
 drivers/net/tulip/media.c                |   29 
 drivers/net/wireless/airo.c              |    7 
 drivers/pci/quirks.c                     |    3 
 drivers/pci/setup-bus.c                  |   37 
 drivers/scsi/Config.in                   |   53 -
 drivers/scsi/Makefile                    |    1 
 drivers/scsi/cpqfcTScontrol.c            |   45 
 drivers/scsi/cpqfcTSi2c.c                |    3 
 drivers/scsi/cpqfcTSinit.c               |   12 
 drivers/scsi/cpqfcTSstructs.h            |    4 
 drivers/scsi/cpqfcTSworker.c             |    2 
 drivers/scsi/ncr53c8xx.c                 |  341 ++++++-
 drivers/scsi/sym53c8xx.c                 |   44 
 drivers/scsi/sym53c8xx_2/sym_glue.c      |   14 
 drivers/scsi/sym53c8xx_2/sym_hipd.c      |   35 
 drivers/scsi/sym53c8xx_defs.h            |   83 +
 drivers/sound/ad1889.c                   |    2 
 drivers/video/Config.in                  |   14 
 drivers/video/dummycon.c                 |   10 
 drivers/video/sstfb.c                    |  114 +-
 fs/Makefile                              |    1 
 fs/binfmt_elf.c                          |  288 +++---
 fs/exec.c                                |   97 +-
 fs/open.c                                |   22 
 fs/read_write.c                          |   40 
 include/asm-generic/xor.h                |  378 ++++++++
 include/asm-m68k/machdep.h               |    4 
 include/asm-m68k/rtc.h                   |   50 -
 include/asm-parisc/checksum.h            |   26 
 include/asm-parisc/delay.h               |    1 
 include/asm-parisc/hdreg.h               |    4 
 include/asm-parisc/ide.h                 |   25 
 include/asm-parisc/ide.h-t0              |  110 ++
 include/asm-parisc/ide.h-tst             |   91 +
 include/asm-parisc/ide.h.save            |  196 ++++
 include/asm-parisc/io.h                  |   16 
 include/asm-parisc/linux_logo.h          | 1433 ++++++++++++++++++++++++++++++-
 include/asm-parisc/pgalloc.h             |    3 
 include/asm-parisc/spinlock_t.h          |   38 
 include/asm-parisc/system.h              |    4 
 include/asm-parisc/system.h.save         |  145 +++
 include/asm-parisc/system_irqsave.h      |   15 
 include/asm-parisc/system_irqsave.h.Orig |   17 
 include/asm-parisc/system_irqsave.h.save |   17 
 include/linux/binfmts.h                  |    2 
 include/linux/fs_struct.h                |    3 
 include/linux/init.h                     |   17 
 include/linux/ioport.h                   |    1 
 include/linux/major.h                    |    1 
 include/linux/mm.h                       |   31 
 include/linux/pci.h                      |    2 
 include/linux/rtc.h                      |   28 
 include/linux/sched.h                    |    2 
 include/linux/smp.h                      |    5 
 include/linux/sysctl.h                   |    2 
 include/linux/tcp_diag.h                 |    3 
 include/linux/tty.h                      |    2 
 init/main.c                              |    9 
 kernel/exit.c                            |    9 
 kernel/module.c                          |    1 
 kernel/printk.c                          |   11 
 kernel/signal.c                          |   10 
 kernel/sys.c                             |   11 
 kernel/sysctl.c                          |   11 
 kernel/timer.c                           |    2 
 mm/mmap.c                                |   99 +-
 mm/vmscan.c                              |    1 
 net/ipv4/ip_fragment.c                   |    2 
 net/ipv4/ip_input.c                      |    1 
 net/ipv4/proc.c                          |    1 
 net/ipv4/udp.c                           |    5 
 net/sunrpc/clnt.c                        |    2 
 141 files changed, 10130 insertions(+), 1123 deletions(-)

corresponding to a patch of about 450k ;)

J

---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be
