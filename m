Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA31735
	for <parisc-linux@puffin.external.hp.com>; Wed, 17 Jan 2001 16:57:20 -0700
Sender: plattner@dns2.dot.at
Message-ID: <3A662FF7.9DF101AC@dot.at>
Date: Thu, 18 Jan 2001 00:51:19 +0100
From: Christoph Plattner <christoph.plattner@dot.at>
MIME-Version: 1.0
To: Grant Grundler <grundler@cup.hp.com>
CC: parisc-linux@thepuffingroup.com, grundler@milano.cup.hp.com
Subject: Re: [parisc-linux] Apollo 700 serie 9000/720 already problems !
References: <200101170505.VAA12466@milano.cup.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Hello again !

I have the exactly same problem with the 0.5 image (cd), as I tried
to use this as root file system vie NFS. I got the same error message.
And to boot the CD, the system crashes inside the kernel stuff, 
perhaps in connection with the parallel port.

The SCSI problem is no problem at this point. I want to have
one time a bash, I never got it, although I am experiented in setting
Linux and UNIX boxes, have experiences in the Netboot/Etherboot stuff
and I also installed Linux on a SUN, etc....

Here I seem to have a special problem. Is my machine unable to 
run any code of this.
The other HP is a E55 (9000/856) server, but the multi-port serial
and the SCSI is not supported in the Linux (yet, or forever). So I
cannot boot this machine, as the first serial line of this multi-port
board is the serial console (and the only console of this machine).
So the last kernel message I see is:
	Switching from PDC console

I hope anybody can help here

	Christoph



Grant Grundler wrote:
> 
> Christoph Plattner wrote:
> > The SCSI probing has a problem with the device ID0, a floppy on a
> > SCSI adapter. Ok, forget it.
> 
> Don't forget. That should respond like a standard SCSI device.
> Is the device known to work and the SCSI bus configuration ok?
> 
> > Warning: unable to open an initial console.
> 
> This is typically a problem with "console" parameter passed to Palo.
> (boot loader).  Check the mail archive for comments about CONFIG_STI_CONSOLE
> (and CONFIG_SERIAL_CONSOLE) and "console" parameter in
> the palo Makefile.
> 
> > Can you give me a short explanation of this dump.
> > On the HP I don't know the registers (on intel I do !).
> > Which describes the instrunction pointer to have a look
> > in the System.map. Is this IIR ?
> 
> IOAQ. GR02 is the return ptr.
> See devresources.hp.com or www.parisc-linux.org for PA 1.1 Arch docs.
> 
> > The init I tried (the last attempt) was a fresh build `init'
> > from the init-2.77 package with the cross compiler by setting
> > the CC= varibale. The build could be done and a check with the
> > command `file' described the correct image.
> 
> You might try downloading and pulling the init from palinux-v0.5.iso.
> 
> > What is this for a problem ???
> >
> > I will add the complete boot log below.
> >
> > Trying scsi.4.0
> > Boot path initialized.
> > Attempting to load IPL.
> >
> >
> > Hard booted.
> > palo ipl root@didymos.pladom1.at Sun Jan 14 12:44:07 CET 2001
> > 0/vmlinux 2106807 bytes @ 0x6800
> > 0/palo-cmdline '0/vmlinux HOME=/ TERM=linux root=/dev/nfs
> > nfsroot=196.1.1.20:/tf
> > tpboot/apollo/root console=ttyS0'
> > Kernel: partition 0 file /vmlinux
> > ELF32 executable
> >
> > Entry 00100150 first 00000000 n 3
> > Segment 0 load 00000000 size 288 mediaptr 0x1000
> > Segment 1 load 00100000 size 1409924 mediaptr 0x2000
> > Segment 2 load 0025a000 size 294912 mediaptr 0x15b000
> > branching to kernel entry point 0x00100150
> > PDC Console Initialized
> > The 32-bit Kernel has started...
> > Enabled FP coprocessor
> > Free memory starts at: 0xc02cb000
> > start_parisc(0x504d70,0x504d70,0x0,0x0)
> > PALO command line: 'HOME=/ TERM=linux root=/dev/nfs
> > nfsroot=196.1.1.20:/tftpboot
> > /apollo/root console=ttyS0'
> > PALO initrd 0-0
> > model   00002000 00000481 00000000 00000000 0234072e 000011f4 00000004
> > 0000000d
> > 00000000
> > vers    00000003
> > CPUID   vers 0 rev 0
> > model   9000/720
> > led_init: CPU_HVERSION 200
> > Searching for devices in PDC firmware... processor hpa 0xfffbe000
> >  an older box...
> > Found devices:
> > 1. Coral SGC Graphics (10) at 0xf8000000, versions 0x4, 0x0, 0x77, 0x0,
> > 0x0
> > 2. Cobra Core BA (11) at 0xf082f000, versions 0x4, 0x0, 0x70, 0x0, 0x0
> > 3. Cobra Core SCSI (10) at 0xf0825000, versions 0x4, 0x0, 0x71, 0x0, 0x0
> > 4. Cobra Core LAN (802.3) (10) at 0xf0826000, versions 0x4, 0x0, 0x72,
> > 0x0, 0x0
> > 5. Cobra Core HIL (10) at 0xf0821000, versions 0x4, 0x0, 0x73, 0x0, 0x0
> > 6. Cobra Core RS-232 (10) at 0xf0823000, versions 0x4, 0x0, 0x75, 0x0,
> > 0x0
> > 7. Cobra Core RS-232 (10) at 0xf0822000, versions 0x4, 0x0, 0x75, 0x0,
> > 0x0
> > 8. Cobra Core Centronics (10) at 0xf0824000, versions 0x4, 0x0, 0x74,
> > 0x0, 0x0
> > 9. Cobra (720) (0) at 0xfffbe000, versions 0x200, 0x0, 0x4, 0x0, 0x81
> > 10. Cobra (1) at 0xfffbf000, versions 0x13, 0x0, 0x9, 0x0, 0x0
> > That's a total of 10 devices.
> > CPU(s): 1 x PA7000 (PCX-S) at 50.000000 MHz
> > Linux version 2.4.0-test10 (root@didymos.pladom1.at) (gcc version 2.96
> > 20000925
> > (experimental)) #2 Sun Jan 14 13:11:36 CET 2001
> > free_bootmem(0x2cb800, 0x3d34800)
> > initrd: 00000000-00000000
> > pagetable_init
> > On node 0 totalpages: 16384
> > zone(0): 8192 pages.
> > zone(1): 8192 pages.
> > zone(2): 0 pages.
> > Kernel command line: HOME=/ TERM=linux root=/dev/nfs
> > nfsroot=196.1.1.20:/tftpboot/apollo/root console=ttyS0
> > trap_init
> > Error reading tod clock
> > Calibrating delay loop... 49.77 BogoMIPS
> > Memory: 61512k available
> > Dentry-cache hash table entries: 8192 (order: 4, 65536 bytes)
> > Buffer-cache hash table entries: 4096 (order: 2, 16384 bytes)
> > Page-cache hash table entries: 16384 (order: 4, 65536 bytes)
> > Inode-cache hash table entries: 4096 (order: 3, 32768 bytes)
> > POSIX conformance testing by UNIFIX
> > ASP version 1 at 0xf0800000 found.
> > LED (ASP-style) display at 00000000 registered
> > Found i82596 at 0xf0826000, IRQ 87
> > early initialization of device eth0 is deferred
> > Linux NET4.0 for Linux 2.4
> > Based upon Swansea University Computer Society NET3.039
> > Starting kswapd v1.8
> > pty: 256 Unix98 ptys configured
> > RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
> > loop: enabling 8 loop devices
> > 82596.c: MAC of HP700 LAN blindely read from the prom!
> > eth0: Couldn't get consistent shared memory
> > eth0: 82596 at 0xf0826000, 08 00 09 24 64 06 IRQ 87.
> > 82596.c $Revision: 1.14 $
> > Serial driver version 5.02 (2000-08-09) with MANY_PORTS SHARE_IRQ
> > SERIAL_PCI ena
> > bled
> > ttyS00 at iomem 0xf0823800 (irq = 90) is a 16550A
> > ttyS01 at iomem 0xf0822800 (irq = 89) is a 16550A
> > Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
> > SCSI subsystem driver Revision: 1.00
> > sim700: Couldn't get consistent shared memory
> > sim700: Configuring 53c700 (SCSI-ID 7) at f0825100, IRQ 86
> > scsi0: Revision 0x0
> > Post test1, istat 05, sstat0 00, dstat 84
> > sim700: WARNING IRQ probe failed, (returned 0)
> > scsi0: WARNING: target data areas are not dma coherent!
> > scsi0: test 1 completed ok.
> > scsi0 : LASI/Simple 53c7xx
> > scsi0: Unable to abort command for target 0
> > scsi0: Unable to send Bus Device Reset for target 0
> > scsi0: Unable to do SCSI bus reset
> > scsi0: >>>>>>>>>>>> Host reset <<<<<<<<<<<<
> > scsi0: istat = 0c, sstat0 = 00, sstat1 = 00, dstat = 00
> > scsi0: dsp = 03f98058 (script[0x0016]), dsps = 03f98cee, target = 0
> > scsi0: Failing command for ID0
> > scsi0: Unable to abort command for target 0
> > scsi0: Unable to abort command for target 1
> > scsi0: Unable to send Bus Device Reset for target 1
> > scsi0: Unable to do SCSI bus reset
> > scsi0: >>>>>>>>>>>> Host reset <<<<<<<<<<<<
> > scsi0: istat = 0c, sstat0 = 00, sstat1 = 00, dstat = 00
> > scsi0: dsp = 03f98058 (script[0x0016]), dsps = 03f98cee, target = 0
> > scsi0: Failing command for ID0
> >   Vendor: SEAGATE   Model: ST1480   SUN0424  Rev: 7516
> >   Type:   Direct-Access                      ANSI SCSI revision: 02
> >   Vendor: QUANTUM   Model: PD425S            Rev: 535A
> >   Type:   Direct-Access                      ANSI SCSI revision: 02
> > Detected scsi disk sda at scsi0, channel 0, id 4, lun 0
> > Detected scsi disk sdb at scsi0, channel 0, id 6, lun 0
> > SCSI device sda: 843284 512-byte hdwr sectors (432 MB)
> > Partition check:
> >  sda: unknown partition table
> > SCSI device sdb: 833150 512-byte hdwr sectors (427 MB)
> >  sdb: unknown partition table
> > NET4: Linux TCP/IP 1.0 for NET4.0
> > IP Protocols: ICMP, UDP, TCP
> > IP: routing cache hash table of 512 buckets, 4Kbytes
> > TCP: Hash tables configured (established 4096 bind 4096)
> > eth0: link ok.
> > Sending BOOTP requests.... OK
> > IP-Config: Got BOOTP answer from 196.1.1.20, my address is 196.1.1.110
> > NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
> > kmem_create: Forcing size word alignment - nfs_fh
> > Looking up port of RPC 100003/2 on 196.1.1.20
> > Looking up port of RPC 100005/2 on 196.1.1.20
> > VFS: Mounted root (nfs filesystem) readonly.
> > Warning: unable to open an initial console.
> >
> > handle_interruption() pid=1 command='init'
> >
> >      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> > PSW: 00000000000001001000000100001011
> > r0-3     00000000 40019b48 40002dfb 40001504
> > r4-7     40019b48 40000384 4000ec30 400198f4
> > r8-11    bb000148 40002d4c 400002f4 00000000
> > r12-15   00000081 00000080 bb0002f0 bb000048
> > r16-19   00000000 c02a0640 00000000 40019b48
> > r20-23   00000041 40000000 40000000 00000000
> > r24-27   40000000 00000001 bb000148 c011a800
> > r28-31   00000021 bb000148 bb0003c0 40002daf
> > sr0-3    00000000 00000000 00000000 0000ffff
> > sr4-7    00000001 00000001 00000001 00000001
> >
> > IASQ: 00000001 00000001 IAOQ: 40003393 40003397
> >  IIR: 0ce61280    ISR: 00000001  IOR: 400198f4
> > ORIG_R28: 00000000
> >
> > handle_interruption() pid=1 command='init'
> >
> >      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> > PSW: 00000000000001001000000100001011
> > r0-3     00000000 40019b48 40002dfb 40001504
> > r4-7     40019b48 40000384 4000ec30 400198f4
> > r8-11    bb000148 40002d4c 400002f4 00000000
> > r12-15   00000081 00000080 bb0002f0 bb000048
> > r16-19   00000000 c02a0640 00000000 40019b48
> > r20-23   00000041 40000000 40000000 00000000
> > r24-27   40000000 00000001 bb000148 c011a800
> > r28-31   00000021 bb000148 bb0003c0 40002daf
> > sr0-3    00000000 00000000 00000000 0000ffff
> > sr4-7    00000001 00000001 00000001 00000001
> >
> > IASQ: 00000001 00000001 IAOQ: 40003393 40003397
> >  IIR: 0ce61280    ISR: 00000001  IOR: 400198f4
> > ORIG_R28: 00000000
> >
> > :
> > :
> > : ... and so on ...
> >
> >
> >
> > -------------------------------------------------------------------------
> > private:        christoph.plattner@dot.at
> > company:        christoph.plattner@alcatel.at
> >
> > ---------------------------------------------------------------------------
> > To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> > `unsubscribe' as the subject.
> >
> 
> Grant Grundler
> Unix Systems Enablement Lab
> +1.408.447.7253
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.

-- 
-------------------------------------------------------------------------
private:	christoph.plattner@dot.at
company:	christoph.plattner@alcatel.at
