From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] k-2.6.8-rc2-pa0 failled to boot in multi-user on
	N4k
Date: Mon, 26 Jul 2004 18:42:45 +0200
Message-ID: <40FB87C4000034E9@ocpmta3.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-1"
Cc: List Parisc <parisc-linux@parisc-linux.org>
To: "Grant Grundler" <grundler@parisc-linux.org>
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

Hello Grant,

>
> On Sat, Jul 24, 2004 at 09:52:50PM +0000, Joel Soete wrote:
> > I  test with 2.6.8-rc2-pa0 using the n4000_defconfig (with or without=

DISCONTIGMEM),
> > I can start it in single user mode but as soon as I 'init 2' the syst=
em
> > do an hpmc after starting some services?
>
> Can you look in /etc/rc2.d/ and start each service by hand until you
> find the one that HPMCs the box?

Umm i can try tommorrow.
I just didn't do it till now because the only thing that is reproducible
is the panic during the init 2, otc it doesn't seems to always hpmc a the=

same plae.
To be more detailed in what i did during previous test:
 t1: the system start and hpmc when gpm start
 t2: rs to restart in s-u and put an exit 0 early in /etc/init.d/gpm and
ctrl-d to launch init 2 -> system hpmc during autofs
 t3: same as t2 but with exit 0 into /etc/init.d/autofs -> system hpmc du=
ring
gpm start
 t4: same as t3 but with exit 0 into /etc/init.d/gpm -> system hpmc (sorr=
y
here I don't remember when)

My bad, I didn't think that it could be a previous started service that
could cause the hpmc :(

>
> > System Responder Address     =3D 0xfffffffffed25000
> > System Requestor Address     =3D 0x000000fffed24000
>
> Requestor is likely a CPU. What is Responder? another CPU?
> console output will tell us and sorry if you already sent it.
>
It possible that I forget it (sorry), here there is:
Booting...
Boot IO Dependent Code (IODC) revision 1


HARD Booted.
palo ipl 1.5 root@c3k Fri May 14 16:17:38 MDT 2004
Skipping extended partition 7 - beyond reach of IPL

Partition Start(MB) End(MB) Id Type
1               1      61   f0 Palo
2              62     306   82 swap
3             307     367   83 ext2
5             368    1953   83 ext2
6            1954    2197   83 ext2

PALO(F0) partition contains:

Information: No console specified on kernel command line. This is normal.=

PALO will choose the console currently used by firmware (serial).Current
command line:
3/vmlinux-2.4.26-64 root=3D/dev/sda5 HOME=3D/ console=3DttyS0 TERM=3Dvt10=
2
 0: 3/vmlinux-2.4.26-64
 1: root=3D/dev/sda5
 2: HOME=3D/
 3: console=3DttyS0
 4: TERM=3Dvt102

<#>    edit the numbered field
'b'    boot with this command line
'r'    restore command line
'l'    list dir
? 0
3/vmlinux-2.4.26-64                     6.8-pa0         rc2-pa0
Current command line:
3/vmlinux-2.6.8-rc2-pa0 root=3D/dev/sda5 HOME=3D/ console=3DttyS0 TERM=3D=
vt102
 0: 3/vmlinux-2.6.8-rc2-pa0
 1: root=3D/dev/sda5
 2: HOME=3D/
 3: console=3DttyS0
 4: TERM=3Dvt102

<#>    edit the numbered field
'b'    boot with this command line
'r'    restore command line
'l'    list dir
? 0   b

Command line for kernel: 'root=3D/dev/sda5 HOME=3D/ console=3DttyS0 TERM=3D=
vt102
palo_kernel=3D3/vmlinux-2.6.8-rc2-pa0'
Selected kernel: /vmlinux-2.6.8-rc2-pa0 from partition 3
ELF64 executable
Entry 00100000 first 00100000 n 3
Segment 0 load 00100000 size 4374912 mediaptr 0x1000
Segment 1 load 00530000 size 346616 mediaptr 0x42e000
Segment 2 load 00588000 size 258181 mediaptr 0x483000
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.6.8-rc2-pa0 (root@patst006) (gcc version 3.0.4) #2 Fri Ju=
l
23 09:11:45 CEST 2004
FP[0] enabled: Rev 1 Model 16
The 64-bit Kernel has started...
Determining PDC firmware type: 64 bit PAT.
model 00005d30 00000491 00000000 00000002 27988e5d 100000f1 00000008 0000=
00b2
000000b2
vers  00000301
CPUID vers 18 rev 11 (0x0000024b)
capabilities 0x1
model 9000/800/N4000-55
This Machine has more memory ranges than we support!
Some memory will not be used!
Total Memory: 2048 Mb
On node 0 totalpages: 524288
  DMA zone: 524288 pages, LIFO batch:16
  Normal zone: 0 pages, LIFO batch:1
  HighMem zone: 0 pages, LIFO batch:1
Built 1 zonelists
Kernel command line: root=3D/dev/sda5 HOME=3D/ console=3DttyS0 TERM=3Dvt1=
02 palo_kernel=3D3/vmlinux-2.6.8-rc2-pa0
PID hash table entries: 16 (order 4: 256 bytes)
Console: colour dummy device 160x64
Dentry cache hash table entries: 524288 (order: 10, 4194304 bytes)
Inode-cache hash table entries: 262144 (order: 9, 2097152 bytes)
Memory: 2097152k available
Calibrating delay loop... 1093.63 BogoMIPS
Mount-cache hash table entries: 256 (order: 0, 4096 bytes)
NET: Registered protocol family 16
Searching for devices...
Found devices:
1. Memory at 0xfffffffffedc0000 [192] { 1, 0x0, 0x090, 0x00009 }
2. IKE I/O BC Merced Port at 0xfffffffffed00000 [0] { 7, 0x0, 0x803, 0x00=
00c
}
3. Elroy PCI Bridge at 0xffffffffbffe0000 [0/0] { 13, 0x0, 0x782, 0x0000a=

}
4. Elroy PCI Bridge at 0xffffffffbffe2000 [0/1] { 13, 0x0, 0x782, 0x0000a=

}
5. Elroy PCI Bridge at 0xffffffffbffe4000 [0/2] { 13, 0x0, 0x782, 0x0000a=

}
6. Elroy PCI Bridge at 0xffffffffbffe8000 [0/4] { 13, 0x0, 0x782, 0x0000a=

}
7. Elroy PCI Bridge at 0xffffffffbffea000 [0/5] { 13, 0x0, 0x782, 0x0000a=

}
8. Elroy PCI Bridge at 0xffffffffbfff0000 [0/8] { 13, 0x0, 0x782, 0x0000a=

}
9. Elroy PCI Bridge at 0xffffffffbfff4000 [0/10] { 13, 0x0, 0x782, 0x0000=
a
}
10. Elroy PCI Bridge at 0xffffffffbfff8000 [0/12] { 13, 0x0, 0x782, 0x000=
0a
}
11. IKE I/O BC Merced Port at 0xfffffffffed40000 [1] { 7, 0x0, 0x803, 0x0=
000c
}
12. Elroy PCI Bridge at 0xfffffffffece0000 [1/0] { 13, 0x0, 0x782, 0x0000=
a
}
13. Elroy PCI Bridge at 0xfffffffffece4000 [1/2] { 13, 0x0, 0x782, 0x0000=
a
}
14. Elroy PCI Bridge at 0xfffffffffece8000 [1/4] { 13, 0x0, 0x782, 0x0000=
a
}
15. Elroy PCI Bridge at 0xfffffffffecf0000 [1/8] { 13, 0x0, 0x782, 0x0000=
a
}
16. Elroy PCI Bridge at 0xfffffffffecf4000 [1/10] { 13, 0x0, 0x782, 0x000=
0a
}
17. Elroy PCI Bridge at 0xfffffffffecf8000 [1/12] { 13, 0x0, 0x782, 0x000=
0a
}
18. DEW BC Runway Port at 0xfffffffffed24000 [36] { 7, 0x0, 0x584, 0x0000=
c
}
19. Prelude W+ 540 at 0xfffffffffed25000 [37] { 0, 0x0, 0x5d3, 0x00000 }
20. DEW BC Runway Port at 0xfffffffffed2c000 [44] { 7, 0x0, 0x584, 0x0000=
c
}
21. Prelude W+ 540 at 0xfffffffffed2d000 [45] { 0, 0x0, 0x5d3, 0x00000 }
CONFIG_SMP=3Dn  ignoring additional CPUs
CPU: probe of parisc45 failed with error 1
CPU(s): 1 x PA8600 (PCX-W+) at 550.000000 MHz
SBA found Ike rev 2 at 0xfffffffffed00000
SBA found Ike rev 2 at 0xfffffffffed40000
lba version TR4.0 (0x5) found at 0xffffffffbffe0000
iosapic: no IRTE for 0000:00:04.0 (IRQ not connected?)
lba version TR4.0 (0x5) found at 0xffffffffbffe2000
lba version TR4.0 (0x5) found at 0xffffffffbffe4000
lba version TR4.0 (0x5) found at 0xffffffffbffe8000
lba version TR4.0 (0x5) found at 0xffffffffbffea000
lba version TR4.0 (0x5) found at 0xffffffffbfff0000
lba version TR4.0 (0x5) found at 0xffffffffbfff4000
lba version TR4.0 (0x5) found at 0xffffffffbfff8000
lba version TR4.0 (0x5) found at 0xfffffffffece0000
lba version TR4.0 (0x5) found at 0xfffffffffece4000
lba version TR4.0 (0x5) found at 0xfffffffffece8000
lba version TR4.0 (0x5) found at 0xfffffffffecf0000
lba version TR4.0 (0x5) found at 0xfffffffffecf4000
lba version TR4.0 (0x5) found at 0xfffffffffecf8000
SCSI subsystem initialized
unwind_init: start =3D 0x103fbbc0, end =3D 0x1041e250, entries =3D 8809
Performance monitoring counters enabled for Prelude W+ 540
Initializing Cryptographic API
Soft power switch support not available.
Generic RTC Driver v1.07
Serial: 8250/16550 driver $Revision: 1.90 $ 17 ports, IRQ sharing enabled=

ttyS0 at MMIO 0xffffffff80000000 (irq =3D 132) is a 16550A
ttyS1 at MMIO 0xffffffff80000008 (irq =3D 132) is a 16450
ttyS2 at MMIO 0xffffffff80000010 (irq =3D 132) is a 16550A
ttyS3 at MMIO 0xffffffff80000038 (irq =3D 132) is a 16550A
RAMDISK driver initialized: 16 RAM disks of 6144K size 1024 blocksize
loop: loaded (max 8 devices)
Linux Tulip driver version 1.1.13 (May 11, 2002)
tulip0: no phy info, aborting mtable build
tulip0:  MII transceiver #1 config 1000 status 782d advertising 01e1.
eth0: Digital DS21143 Tulip rev 65 at 0xffffffff80003000, 00:30:6E:1C:B2:=
0B,
IRQ 128.
tulip1:  EEPROM default media type Autosense.
tulip1:  Index #0 - Media MII (#11) described by a 21142 MII PHY (3) bloc=
k.
tulip1: ***WARNING***: No MII transceiver found!
eth1: Digital DS21143 Tulip rev 65 at 0xffffffff8a000000, 00:30:6E:21:14:=
B4,
IRQ 384.
sym0: <895> rev 0x1 at pci 0000:00:01.0 irq 129
sym0: No NVRAM, ID 7, Fast-40, SE, parity checking
sym0: SCSI BUS has been reset.
sym0: SCSI BUS mode change from SE to SE.
sym0: SCSI BUS has been reset.
scsi0 : sym-2.1.18j
Using anticipatory io scheduler
  Vendor: SEAGATE   Model: ST39103LW         Rev: HP04
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym0:8:0: tagged command queuing enabled, command queue depth 16.
scsi(0:0:8:0): Beginning Domain Validation
sym0:8: wide asynchronous.
sym0:8: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 15)
scsi(0:0:8:0): Domain Validation skipping write tests
scsi(0:0:8:0): Ending Domain Validation
sym1: <875> rev 0x37 at pci 0000:00:02.0 irq 130
sym1: No NVRAM, ID 7, Fast-20, SE, parity checking
sym1: SCSI BUS has been reset.
scsi1 : sym-2.1.18j
sym2: <875> rev 0x37 at pci 0000:00:02.1 irq 131
sym2: No NVRAM, ID 7, Fast-20, SE, parity checking
sym2: SCSI BUS has been reset.
scsi2 : sym-2.1.18j
st: Version 20040403, fixed bufsize 32768, s/g segs 256
SCSI device sda: 17783112 512-byte hdwr sectors (9105 MB)
SCSI device sda: drive cache: write back
 sda: sda1 sda2 sda3 sda4 < sda5 sda6 sda7 sda8 sda9 sda10 sda11 sda12 >
Attached scsi disk sda at scsi0, channel 0, id 8, lun 0
Attached scsi generic sg0 at scsi0, channel 0, id 8, lun 0,  type 0
md: linear personality registered as nr 1
md: raid0 personality registered as nr 2
md: raid1 personality registered as nr 3
md: md driver 0.90.0 MAX_MD_DEVS=3D256, MD_SB_DISKS=3D27
NET: Registered protocol family 2
IP: routing cache hash table of 16384 buckets, 128Kbytes
TCP: Hash tables configured (established 524288 bind 65536)
NET: Registered protocol family 1
NET: Registered protocol family 17
md: Autodetecting RAID arrays.
md: autorun ...
md: ... autorun DONE.
kjournald starting.  Commit interval 5 seconds
EXT3-fs: mounted filesystem with ordered data mode.
VFS: Mounted root (ext3 filesystem) readonly.
Freeing unused kernel memory: 256k freed
INIT: version 2.85 booting
Usage: vt-is-UTF8 [option]
valid options are:
	-q  --quiet    don't print result
	-h --help      display this help text and exit
	-V --version   display version information and exit
Activating swap.
Adding 250872k swap on /dev/sda2.  Priority:-1 extents:1
Checking root file system...
fsck 1.35 (28-Feb-2004)
/dev/sda5: clean, 58224/203008 files, 274675/406012 blocks
EXT3 FS on sda5, internal journal
System time was Fri Jul 23 08:18:46 UTC 2004.
Setting the System Clock using the Hardware Clock as reference...
System Clock set. System local time is now Fri Jul 23 08:18:48 UTC 2004.
Not running depmod because /lib/modules/2.6.8-rc2-pa0/ is not writeable.
Loading modules...
All modules loaded.
FATAL: Could not load /lib/modules/2.6.8-rc2-pa0/modules.dep: No such fil=
e
or directory
Checking all file systems...
fsck 1.35 (28-Feb-2004)
/dev/sda3: clean, 40/15616 files, 46384/62464 blocks
/dev/sda6: clean, 5954/62496 files, 180281/249840 blocks
/dev/sda7: clean, 15/31232 files, 8069/124912 blocks
/dev/sda8: clean, 176/31232 files, 24441/124912 blocks
/dev/sda9: clean, 93347/250368 files, 398546/499964 blocks
/dev/sda10: clean, 2374/250368 files, 313754/499964 blocks
/dev/sda11: clean, 81794/250368 files, 318045/499964 blocks
Loading the saved-state of the serial devices from /etc/serial.conf
Setting kernel variables ...
... done.
Mounting local filesystems...
kjournald starting.  Commit interval 5 seconds
EXT3 FS on sda3, internal journal
EXT3-fs: mounted filesystem with ordered data mode.
kjournald starting.  Commit interval 5 seconds
EXT3 FS on sda6, internal journal
EXT3-fs: mounted filesystem with ordered data mode.
kjournald starting.  Commit interval 5 seconds
EXT3 FS on sda7, internal journal
EXT3-fs: mounted filesystem with ordered data mode.
kjournald starting.  Commit interval 5 seconds
EXT3 FS on sda8, internal journal
EXT3-fs: mounted filesystem with ordered data mode.
kjournald starting.  Commit interval 5 seconds
EXT3 FS on sda9, internal journal
EXT3-fs: mounted filesystem with ordered data mode.
kjournald starting.  Commit interval 5 seconds
EXT3 FS on sda10, internal journal
EXT3-fs: mounted filesystem with ordered data mode.
kjournald starting.  Commit interval 5 seconds
EXT3 FS on sda11, internal journal
EXT3-fs: mounted filesystem with ordered data mode.
/dev/sda3 on /boot type ext3 (rw)
/dev/sda6 on /var type ext3 (rw)
/dev/sda7 on /tmp type ext3 (rw)
/dev/sda8 on /home type ext3 (rw)
tmpfs on /var/Tmp type tmpfs (rw)
/dev/sda9 on /usr/src type ext3 (rw)
/dev/sda10 on /Sources type ext3 (rw)
/dev/sda11 on /Develop type ext3 (rw)
Cleaning /tmp /var/run /var/lock.
Discovering hardware: sym53c8xx
FATAL: Could not load /lib/modules/2.6.8-rc2-pa0/modules.dep: No such fil=
e
or directory
Skipping sym53c8xx; assuming it is compiled into the kernel.
Running 0dns-down to make sure resolv.conf is ok...done.
Cleaning: /etc/network/ifstate.
Setting up IP spoofing protection: rp_filter.
Configuring network interfaces...done.
Starting portmap daemon: portmap.

Setting the System Clock using the Hardware Clock as reference...
System Clock set. Local time: Fri Jul 23 10:18:54 CEST 2004

Initializing random number generator...done.
Recovering nvi editor sessions... done.
Setting up X server socket directory /tmp/.X11-unix...done.
Setting up ICE socket directory /tmp/.ICE-unix...done.
INIT: Entering runlevel: 2
Starting system log daemon: syslogdmodprobe: FATAL: Could not load /lib/m=
odules/2.6.8-rc2-pa0/modules.dep:
No such file or directory

.
Starting kernel log daemon: klogd.
Starting portmap daemon: portmap.
Starting GKrellM monitoring daemon: gkrellmd.
Starting internet superserver: inetd.
Starting printer spooler: lpd .
Not starting NFS kernel daemon: No exports.

************* SYSTEM ALERT **************
SYSTEM NAME: ap8002
DATE: 07/23/2004 TIME: 08:19:01
ALERT LEVEL: 7 =3D reserved

REASON FOR ALERT
SOURCE: 0 =3D unknown, no source stated
SOURCE DETAIL: 0 =3D unknown, no source stated   SOURCE ID: FF
PROBLEM DETAIL: 0 =3D no problem detail

LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
       FLASH    OFF           OFF       ON         ON
LED State: Running non-OS code. (i.e. Boot or Diagnostics)

0x0000107000FF6292 000000FF FF800000 - type  0 =3D Data Field Unused
0x5800187000FF6292 00006806 17081301 - type 11 =3D Timestamp 07/23/2004 0=
8:19:01
A: ack read of this entry - X: Disable all future alert messages
Anything else skip redisplay the log entry
->Choice:x
*****************************************

CAUTION: System Alerts have been disabled. This will re-enable with
a re-boot or power-on of the system. To re-enable system alerts now, you
may use the AC (Alert Display Configuration) command.

************* SYSTEM ALERT **************
Alert messages are now disabled. Enter Commands Interface AC command to
enable them again
*****************************************
=3D=3D=3D=3D=3D=3D=3D=3D=3D><=3D=3D=3D=3D=3D=3D=3D=3D=3D

So if I well understand the responder is the CPU and requestor is:
18. DEW BC Runway Port at 0xfffffffffed24000 [36] { 7, 0x0, 0x584, 0x0000=
c
}
?

> > I doubt that help but the IAOQ
> > IAOQ =3D 0x00000000101064b8 for CPU[1]
> > pointing to
> > Func: L4^B1, Off: 0xb8, Addr: 0x101064b8
> >
> >     101064b0:	2f 10 12 2f 	fstd,ma fr15,8(,r24)
> >     101064b4:	2f 10 12 30 	fstd,ma fr16,8(,r24)
> >     101064b8:	2f 10 12 31 	fstd,ma fr17,8(,r24)
> >     101064bc:	2f 10 12 32 	fstd,ma fr18,8(,r24)
>
> Context switch code or setting up initial state.
umm as already in 'init 2' so I presume much more Contest switch?

> > while iirc gr[2] is the rp and point to Func: do_no_page, Off: 0x274,=

Addr:
> > 0x10182f04
> >
> > GR[02] =3D=3D rp =3D 0000000010182f04
> >
> > Func: do_no_page, Off: 0x274, Addr: 0x10182f04
> >
> >     10182f00:	08 da 0a 3a 	add,l r26,r6,r26
> >     10182f04:	08 0a 02 5b 	copy r10,dp
> >     10182f08:	34 19 00 80 	ldi 40,r25
> >     10182f0c:	2b 6b 00 00 	addil 16000,dp,%r1
> >
> > What did I missed (is there some relationship between?) ?
>
> I don't know.
Was it the right gr to observe
(I am a still a bit confused because there are also gr31 for long branch
but I don't yet understand when it is still relevant ?)

> > And a bit different then <http://lists.parisc-linux.org/pipermail/par=
isc-linux/2004-July/024163.html>
> > where the panic seems to occurs earlier?
>
> It might be. But it's certainly not the identical problem since N-class=

> does not have SuckyIO and it's USB problems.

Agree (one common thing was running a UP kernel on a SMP capable system)


That said, I also grab the precompile one:
http://cvs.parisc-linux.org/download/linux-2.6/autobuild/n4000_defconfig/=
palinux-n4000-defconfig-2.6.8-rc2-pa1_0-2_all.deb
that doesn't help (btw this hpmc just after the print 'INIT 2' :( )

Also,  the last kernel runing fine on this system (even with DISCONTIGMEM=
)
was a 2.6.7-pa7 + the Randolph patch called 'try 2' with a config file ne=
ar
the a500_defconfig file (n4000_defconfig wasn't yet available)
On the other hand b2k running fine with c3000_defconfig + 64bit.

So I trust that could be a pb of config file; I so get back the 2.6.7-pa7=

the operational one but doesn't still help but there are still some diff:=

# diff -Nau config-2.6.7+rc-operational config-2.6.8-rc2-pa1-NotYetWorkin=
g
| grep "[+-]CONFIG"
+CONFIG_PREVENT_FIRMWARE_BUILD=3Dy
+CONFIG_UDF_NLS=3Dy
+CONFIG_FAT_DEFAULT_CODEPAGE=3D437
+CONFIG_FAT_DEFAULT_IOCHARSET=3D"iso8859-1"
+CONFIG_CRC_CCITT=3Dm

still have to test the two first y (not in b2k config?)

I will come back to you asap with more results.

Thanks again for your attention,
    Joel


-------------------------------------------------------------------------=
--
Tiscali ADSL LIGHT, 19,95 EUR/mois pendant 6 mois, c'est le moment de fai=
re
le pas!
http://reg.tiscali.be/default.asp?lg=3Dfr




_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
