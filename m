Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id B26604829
	for <parisc-linux@parisc-linux.org>; Wed, 14 Aug 2002 17:42:37 -0600 (MDT)
Subject: Re: [parisc-linux] make menuconfig error in 2.4.19-pa3
From: Ryan Bradetich <rbradetich@uswest.net>
To: Robert Stanford <rob@rotapile.com>
Cc: mec@shout.net, Parisc <parisc-linux@parisc-linux.org>
In-Reply-To: <1029325986.7632.58.camel@rotapile>
References: <1029325986.7632.58.camel@rotapile>
Content-Type: text/plain
Date: 14 Aug 2002 17:42:36 -0600
Message-Id: <1029368556.635.88.camel@beavis>
Mime-Version: 1.0
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

Robert,

I fixed this error yesterday.  Try to cvs update again
and recompile.

sorry for the error.

thanks,

- Ryan

On Wed, 2002-08-14 at 05:53, Robert Stanford wrote:
> Working from the top down in menuconfig the error happened while trying
> to enter character devices (more at the end)
> 
> Using,
> crosscompiler xc-20020118.tar.gz
> 
> on debian sid x86
> 
> ---
> 
> Kernel Version 2.4.19-pa3
> 
> ---
> 
> Menuconfig has encountered a possible error in one of the kernel's
> configuration files and is unable to continue.  Here is the error
> report:
> 
>  Q> scripts/Menuconfig: MCmenu30: command not found
> 
> Please report this to the maintainer <mec@shout.net>.  You may also
> send a problem report to <linux-kernel@vger.kernel.org>.
> 
> Please indicate the kernel version you are trying to configure and
> which menu you were trying to enter when this error occurred.
> 
> make: *** [menuconfig] Error 1
> 
> ---
> 
> .config file 
> 
> 
> CONFIG_RWSEM_GENERIC_SPINLOCK=y
> CONFIG_EXPERIMENTAL=y
> CONFIG_MODULES=y
> CONFIG_KMOD=y
> CONFIG_PA8X00=y
> CONFIG_PA20=y
> CONFIG_PARISC64=y
> CONFIG_SMP=y
> CONFIG_CHASSIS_LCD_LED=y
> CONFIG_KWDB=y
> CONFIG_IOMMU_CCIO=y
> CONFIG_GSC=y
> CONFIG_GSC_LASI=y
> CONFIG_GSC_WAX=y
> CONFIG_EISA=y
> CONFIG_ISA=y
> CONFIG_PCI=y
> CONFIG_GSC_DINO=y
> CONFIG_PCI_LBA=y
> CONFIG_IOSAPIC=y
> CONFIG_IOMMU_SBA=y
> CONFIG_SUPERIO=y
> CONFIG_PCI_NAMES=y
> CONFIG_HOTPLUG=y
> CONFIG_NET=y
> CONFIG_SYSVIPC=y
> CONFIG_SYSCTL=y
> CONFIG_KCORE_ELF=y
> CONFIG_BINFMT_ELF=y
> CONFIG_BINFMT_SOM=y
> CONFIG_PARPORT=y
> CONFIG_PARPORT_PC=y
> CONFIG_PARPORT_PC_CML1=y
> CONFIG_PARPORT_GSC=y
> CONFIG_BLK_DEV_LOOP=y
> CONFIG_BLK_DEV_RAM=y
> CONFIG_BLK_DEV_RAM_SIZE=4096
> CONFIG_BLK_DEV_INITRD=y
> CONFIG_MD=y
> CONFIG_BLK_DEV_MD=y
> CONFIG_MD_LINEAR=y
> CONFIG_MD_RAID0=y
> CONFIG_MD_RAID1=y
> CONFIG_MD_RAID5=y
> CONFIG_PACKET=y
> CONFIG_PACKET_MMAP=y
> CONFIG_NETLINK_DEV=y
> CONFIG_FILTER=y
> CONFIG_UNIX=y
> CONFIG_INET=y
> CONFIG_IP_MULTICAST=y
> CONFIG_IP_PNP=y
> CONFIG_IP_PNP_DHCP=y
> CONFIG_SCSI=y
> CONFIG_BLK_DEV_SD=y
> CONFIG_SD_EXTRA_DEVS=40
> CONFIG_CHR_DEV_ST=y
> CONFIG_BLK_DEV_SR=y
> CONFIG_SR_EXTRA_DEVS=2
> CONFIG_CHR_DEV_SG=y
> CONFIG_SCSI_LASI700=y
> CONFIG_53C700_MEM_MAPPED=y
> CONFIG_53C700_LE_ON_BE=y
> CONFIG_53C700_USE_CONSISTENT=y
> CONFIG_SCSI_ZALON=y
> CONFIG_ASK_ZALON=y
> CONFIG_SCSI_SYM53C8XX=y
> CONFIG_ASK_SYM53C8XX=y
> CONFIG_SCSI_NCR53C8XX_DEFAULT_TAGS=8
> CONFIG_SCSI_NCR53C8XX_MAX_TAGS=32
> CONFIG_SCSI_NCR53C8XX_SYNC=20
> CONFIG_NETDEVICES=y
> CONFIG_NET_ETHERNET=y
> CONFIG_LASI_82596=y
> CONFIG_NET_PCI=y
> CONFIG_TULIP=y
> CONFIG_VT=y
> CONFIG_VT_CONSOLE=y
> CONFIG_GSC_PS2=y
> CONFIG_SERIAL=y
> CONFIG_SERIAL_CONSOLE=y
> CONFIG_SERIAL_GSC=y
> CONFIG_EXT3_FS=y
> CONFIG_JBD=y
> CONFIG_RAMFS=y
> CONFIG_ISO9660_FS=y
> CONFIG_JOLIET=y
> CONFIG_PROC_FS=y
> CONFIG_DEVPTS_FS=y
> CONFIG_EXT2_FS=y
> CONFIG_NFS_FS=y
> CONFIG_NFS_V3=y
> CONFIG_ROOT_NFS=y
> CONFIG_NFSD=y
> CONFIG_NFSD_V3=y
> CONFIG_SUNRPC=y
> CONFIG_LOCKD=y
> CONFIG_LOCKD_V4=y
> CONFIG_MSDOS_PARTITION=y
> CONFIG_NLS=y
> CONFIG_NLS_DEFAULT="iso8859-1"
> CONFIG_FB=y
> CONFIG_DUMMY_CONSOLE=y
> CONFIG_FB_STI=y
> CONFIG_FBCON_CFB8=y
> CONFIG_FBCON_CFB32=y
> CONFIG_FBCON_STI=y
> CONFIG_FONT_8x8=y
> CONFIG_FONT_8x16=y
> CONFIG_STI_CONSOLE=y
> CONFIG_DUMMY_CONSOLE=y
> CONFIG_DUMMY_CONSOLE=y
> CONFIG_FBCON=y
> CONFIG_FBCON_FONT=y
> CONFIG_FONT_8x8=y
> CONFIG_FONT_8x16=y
> CONFIG_FONT_6x11=y
> CONFIG_FONT_SUN12x22=y
> CONFIG_SOUND=y
> CONFIG_SOUND_HARMONY=y
> CONFIG_MAGIC_SYSRQ=y
> 
> ---
> ---
> 
> And when running xconfig and trying to save the config I get
> 
> ---
> 
> Stack Trace for Error
> 
> zcan't read "CONFIG_MTD": no such variable
>     while executing
> "list $CONFIG_MTD"
>     (procedure "writeconfig" line 1992)
>     invoked from within
> "writeconfig .config include/linux/autoconf.h"
>     invoked from within
> ".f0.right.save invoke"
>     ("uplevel" body line 1)
>     invoked from within
> "uplevel #0 [list $w invoke]"
>     (procedure "tkButtonUp" line 7)
>     invoked from within
> "tkButtonUp .f0.right.save
> "
>     (command bound to event)
> 
> ---
> ---
> 
> When runing make config I get
> 
> ---
> 
>   Stallion multiport serial support (CONFIG_STALDRV) [N/y/?] 
>   PDC software console support (CONFIG_PDC_CONSOLE) [Y/n/?] 
> scripts/Configure: drivers/char/Config.in: line 121: syntax error near
> unexpected token `fi'
> scripts/Configure: drivers/char/Config.in: line 121: `fi'
> *
> HIL support
> *
> *
> * Input support needed for HIL support
> *
> *
> * Multimedia devices
> *
> Video For Linux (CONFIG_VIDEO_DEV) [N/y/m/?] 
> 
> and it continues ok and seems to save a complete .config
> 
> ---
> ---
> 
> make palo
> gives 
> 
> ---
> 
> make[1]: Leaving directory `/usr/src/source/linux/arch/parisc/tools'
> make CFLAGS="-D__KERNEL__ -I/usr/src/source/linux/include -Wall
> -Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
> -fomit-frame-pointer -D__linux__ -pipe -fno-strength-reduce
> -mno-space-regs -mfast-indirect-calls -mdisable-fpregs
> -ffunction-sections -march=2.0 -mschedule=8000 " -C  arch/parisc/kernel
> make[1]: Entering directory `/usr/src/source/linux/arch/parisc/kernel'
> hppa64-linux-gcc -D__KERNEL__ -I/usr/src/source/linux/include -Wall
> -Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
> -fomit-frame-pointer -D__linux__ -pipe -fno-strength-reduce
> -mno-space-regs -mfast-indirect-calls -mdisable-fpregs
> -ffunction-sections -march=2.0 -mschedule=8000   -nostdinc -I
> /opt/palinux/lib/gcc-lib/hppa64-linux/3.0.3/include
> -DKBUILD_BASENAME=cache  -c -o cache.o cache.c
> hppa64-linux-gcc -D__ASSEMBLY__ -traditional -D__KERNEL__
> -I/usr/src/source/linux/include  -c -o pacache.o pacache.S
> hppa64-linux-gcc -D__KERNEL__ -I/usr/src/source/linux/include -Wall
> -Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
> -fomit-frame-pointer -D__linux__ -pipe -fno-strength-reduce
> -mno-space-regs -mfast-indirect-calls -mdisable-fpregs
> -ffunction-sections -march=2.0 -mschedule=8000   -nostdinc -I
> /opt/palinux/lib/gcc-lib/hppa64-linux/3.0.3/include
> -DKBUILD_BASENAME=setup  -c -o setup.o setup.c
> hppa64-linux-gcc -D__KERNEL__ -I/usr/src/source/linux/include -Wall
> -Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
> -fomit-frame-pointer -D__linux__ -pipe -fno-strength-reduce
> -mno-space-regs -mfast-indirect-calls -mdisable-fpregs
> -ffunction-sections -march=2.0 -mschedule=8000   -nostdinc -I
> /opt/palinux/lib/gcc-lib/hppa64-linux/3.0.3/include
> -DKBUILD_BASENAME=traps  -c -o traps.o traps.c
> traps.c:41:55: kdb/break.h: No such file or directory
> traps.c:42:47: kdb/kgdb_types.h: No such file or directory
> traps.c:43:60: kdb/save_state.h: No such file or directory
> traps.c:44:76: kdb/kgdb_machine.h: No such file or directory
> traps.c:45:53: kdb/trap.h: No such file or directory
> traps.c: In function `handle_break':
> traps.c:264: storage size of `ssp' isn't known
> traps.c:289: `KGDB_BREAK_INSN' undeclared (first use in this function)
> traps.c:289: (Each undeclared identifier is reported only once
> traps.c:289: for each function it appears in.)
> traps.c:291: warning: implicit declaration of function `pt_regs_to_ssp'
> traps.c:292: warning: implicit declaration of function `kgdb_trap'
> traps.c:292: `I_BRK_INST' undeclared (first use in this function)
> traps.c:293: warning: implicit declaration of function `ssp_to_pt_regs'
> traps.c:296: `KGDB_INIT_BREAK_INSN' undeclared (first use in this
> function)
> traps.c:264: warning: unused variable `ssp'
> traps.c: In function `handle_interruption':
> traps.c:474: storage size of `ssp' isn't known
> traps.c:614: `I_TAKEN_BR' undeclared (first use in this function)
> traps.c:474: warning: unused variable `ssp'
> make[1]: *** [traps.o] Error 1
> make[1]: Leaving directory `/usr/src/source/linux/arch/parisc/kernel'
> make: *** [_dir_arch/parisc/kernel] Error 2
> rotapile:/usr/src/source/linux# make palo
> 
> ---
> 
> Robert Stanford
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
