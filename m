Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA00694
	for <parisc-linux@puffin.external.hp.com>; Sun, 27 Aug 2000 18:51:38 -0600
Date: Sun, 27 Aug 2000 19:54:07 -0500
From: Bob Pflederer <krp@rsn.hp.com>
To: Erik Paulson <epaulson@upl.cs.wisc.edu>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] FW Scsi support?
Message-ID: <20000827195407.K998@localhost.localdomain>
References: <20000827165229.A18560@data.upl.cs.wisc.edu>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="HcAYCG3uE/tztfnV"
In-Reply-To: <20000827165229.A18560@data.upl.cs.wisc.edu>; from epaulson@upl.cs.wisc.edu on Sun, Aug 27, 2000 at 04:52:29PM -0500
List-ID: <linux-parisc.vger.kernel.org>


--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

There have been some fixes to the kernel since the CDROM image was made
to get the U2 IO controller working correctly.  Also, I still need to apply 
the attached patch to get my C180 working.  The C160 should be the same as
C180 except for the frequency.  The C100 uses a PA7200 CPU instead of
PA8000 CPU and will not work with my entry.S changes, but may work if you
remove that portion of the patch.

My CDROM is not fastwide SCSI, but the kernel does detect the fastwide SCSI
harddrive.  I boot by LAN, but am able to mount CDROMs.

-Bob Pflederer

On Sun, Aug 27, 2000 at 04:52:29PM -0500, Erik Paulson wrote:
> Hi
> 	I'm trying to get my C100 and C160 to boot with the CD image. Everything
> seems fine, except they don't see the SCSI disk I've got - only the CDROM.
> 
> My guess is that they're angry about it being on the FWSCSI, (my CDROM is
> on SESCSI)
> 
> Is Fastwide SCSI supported? If not, what needs to be done? I didn't see how
> to turn it on with 'make config'. Are there docs availble for this hardware?
> 
> Thanks!
> 
> -Erik
> 

--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="c180.patch"

Index: arch/parisc/kernel/ccio-dma.c
===================================================================
RCS file: /home/cvs/parisc/linux-2.3/arch/parisc/kernel/ccio-dma.c,v
retrieving revision 1.3
diff -u -p -r1.3 ccio-dma.c
--- ccio-dma.c	2000/08/24 05:06:38	1.3
+++ ccio-dma.c	2000/08/28 00:35:36
@@ -53,8 +53,8 @@
 */
 #define MODULE_NAME "ccio"
 
-/*
 #define DEBUG_CCIO_INIT
+/*
 #define DEBUG_CCIO_RUN
 #define DEBUG_CCIO_RES
 */
@@ -785,6 +785,15 @@ STATIC void ccio_unmap_sg(struct pci_dev
 	return;
 }
 
+void
+ccio_dma_sync_single(struct pci_dev *dev, dma_addr_t iova, size_t size, int direction)
+{
+}
+
+void
+ccio_dma_sync_sg(struct pci_dev *dev, struct scatterlist *sg, int nelems, int direction)
+{
+}
 
 STATIC struct pci_dma_ops ccio_ops = {
 	ccio_dma_supported,
@@ -794,8 +803,8 @@ STATIC struct pci_dma_ops ccio_ops = {
 	ccio_unmap_single,
 	ccio_map_sg,
 	ccio_unmap_sg,
-	NULL,                   /* dma_sync_single : NOP for U2/Uturn */
-	NULL,                   /* dma_sync_sg     : ditto */
+	ccio_dma_sync_single,                   /* dma_sync_single : NOP for U2/Uturn */
+	ccio_dma_sync_sg,                   /* dma_sync_sg     : ditto */
 };
 
 
Index: arch/parisc/kernel/entry.S
===================================================================
RCS file: /home/cvs/parisc/linux-2.3/arch/parisc/kernel/entry.S,v
retrieving revision 1.25
diff -u -p -r1.25 entry.S
--- entry.S	2000/08/24 23:05:17	1.25
+++ entry.S	2000/08/28 00:35:45
@@ -637,6 +637,8 @@ dtlb_miss:
 	depi		1,12,1,prot
 	extru,=         pte,_PAGE_USER_BIT,1,r0
 	depi		7,11,3,prot /* Set for user space (1 rsvd for read) */
+	extru,= 	pte,_PAGE_GATEWAY_BIT,1,r0
+	depi		0,11,2,prot	/* If Gateway, Set PL2 to 0 */
 
 	/* Get rid of prot bits and convert to page addr for idtlba */
 
@@ -646,9 +648,18 @@ dtlb_miss:
 	mfsp		%sr1,t0  /* Save sr1 so we can use it in tlb inserts */
 	mtsp		spc,%sr1
 
+/*
 	idtlba		pte,(%sr1,va)
 	idtlbp		prot,(%sr1,va)
 
+        depd    pte,31,32,pte
+        depdi   0,45,14,pte
+	idtlbt		pte,prot
+*/
+	.word		0xf2310c00
+	.word		0xf6200652
+	.word		0x06301800
+
 	mtsp		t0, %sr1     /* Restore sr1 */
 
 	rfir
@@ -694,6 +705,8 @@ itlb_miss_common:
 	copy            spc,prot        /* init prot with faulting space */
 	dep		pte,8,7,prot
 
+	extru,=		pte,_PAGE_NO_CACHE_BIT,1,r0
+	depi		1,12,1,prot
 	extru,=         pte,_PAGE_USER_BIT,1,r0
 	depi		7,11,3,prot /* Set for user space (1 rsvd for read) */
 	extru,= 	pte,_PAGE_GATEWAY_BIT,1,r0
@@ -706,10 +719,19 @@ itlb_miss_common:
 
 	mfsp		%sr1,t0  /* Save sr1 so we can use it in tlb inserts */
 	mtsp		spc,%sr1
-
+/*
 	iitlba		pte,(%sr1,va)
 	iitlbp		prot,(%sr1,va)
+        depd    pte,31,32,pte
+        depdi   0,45,14,pte
+	iitlbt		pte,prot
+*/
+
+	.word		0xf2310c00
+	.word		0xf6200652
+	.word		0x06300800
 
+
 	mtsp		t0, %sr1     /* Restore sr1 */
 
 	rfir
@@ -755,6 +777,8 @@ dbit_trap:
 	depi		1,12,1,prot
 	extru,=         pte,_PAGE_USER_BIT,1,r0
 	depi		7,11,3,prot /* Set for user space (1 rsvd for read) */
+	extru,= 	pte,_PAGE_GATEWAY_BIT,1,r0
+	depi		0,11,2,prot	/* If Gateway, Set PL2 to 0 */
 
 	/* Get rid of prot bits and convert to page addr for idtlba */
 
@@ -763,9 +787,17 @@ dbit_trap:
 
 	mfsp		%sr1,t0  /* Save sr1 so we can use it in tlb inserts */
 	mtsp		spc,%sr1
-
+/*
 	idtlba		pte,(%sr1,va)
 	idtlbp		prot,(%sr1,va)
+
+        depd    pte,31,32,pte
+        depdi   0,45,14,pte
+	idtlbt		pte,prot
+*/
+	.word		0xf2310c00
+	.word		0xf6200652
+	.word		0x06301800
 
 	mtsp		t0, %sr1     /* Restore sr1 */
 

--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="c180.log"
Content-Transfer-Encoding: quoted-printable


=0DMain Menu: Enter command >=20
=0DMain Menu: Enter command > bo lan
=0DInteract with IPL (Y, N, Q)?> y
=0D=0D
Booting... =0D
Network Station Address 0060b0-1839c0=0D
System IP Address 192.168.0.250=0D
Server IP Address 192.168.0.1=0D
=0D
Boot IO Dependent Code (IODC) revision 2=0D
=0D
=0D
HARD Booted.=0D
palo ipl krp@localhost.localdomain Sun Aug 27 19:34:20 CDT 2000=0D
0/vmlinux 2087866 bytes @ 0x6800=0D
0/palo-cmdline '0/vmlinux HOME=3D/ TERM=3DLINUX root=3D/dev/nfs nfsroot=3D1=
92.168.0.7 '=0D
0/vmlinux HOME=3D/ TERM=3DLINUX root=3D/dev/nfs nfsroot=3D192.168.0.7 =0D
Kernel: partition 0 file /vmlinux=0D
ELF32 executable
=0D
Entry 00100000 first 00100000 n 4=0D
Segment 0 load 00100000 size 1510260 mediaptr 0x1000=0D
Segment 1 load 00272000 size 115444 mediaptr 0x172000=0D
Segment 2 load 00290000 size 115080 mediaptr 0x18f000=0D
Segment 3 load 002b0000 size 8192 mediaptr 0x1ac000=0D
branching to kernel entry point 0x00100000=0D
pdc_cons registered !=0D
The Kernel has started...=0D
Free memory starts at: 0xc02e1000=0D
PALO command line: 'HOME=3D/ TERM=3DLINUX root=3D/dev/nfs nfsroot=3D192.168=
.0.7 '=0D
PALO initrd 0-0=0D
FP CCR was 0x0, will be set to 0xc0=0D
model   000059c0 00000481 00000000 00000002 77422781 100000f0 00000008 0000=
00b2 000000b2=0D
vers    00000205=0D
cpuid   000001c9=0D
CPUID vers 14 rev 9=0D
CPU might be a PA8000 (PCX-U)=0D
CPU(s): 1 x PA8000 (PCX-U) at 180.000000 MHz=0D
Searching for devices in PDC firmware... a newer box...=0D
Found devices:=0D
1. Unknown device (4) at 0xf200c000, versions 0x3b, 0x0, 0x89, 0x0, 0x80=0D
2. Raven U/L2 Core BA (11) at 0xffd00000, versions 0x3b, 0x0, 0x81, 0x0, 0x=
0=0D
3. Raven U/L2 Core RS-232 (10) at 0xffd05000, versions 0x3b, 0x0, 0x8c, 0x0=
, 0x0=0D
4. Raven U/L2 Core SCSI (10) at 0xffd06000, versions 0x3b, 0x0, 0x82, 0x0, =
0x0=0D
5. Raven U/L2 Core Lan (802.3) (10) at 0xffd07000, versions 0x3b, 0x0, 0x8a=
, 0x0, 0x0=0D
6. UL 350 Core Centronics (10) at 0xffd02000, versions 0x2e, 0x0, 0x74, 0x0=
, 0x0=0D
7. Raven U/L2 Core Audio (10) at 0xffd04000, versions 0x3b, 0x4, 0x7b, 0x0,=
 0x0=0D
8. Raven U/L2 Core PC Keyboard (10) at 0xffd08000, versions 0x3b, 0x0, 0x84=
, 0x0, 0x0=0D
9. Raven U/L2 Core PC Keyboard (10) at 0xffd08100, versions 0x3b, 0x0, 0x84=
, 0x0, 0x0=0D
10. Raven Backplane Wax BA (11) at 0xffe00000, versions 0x17, 0x0, 0x8e, 0x=
0, 0x0=0D
11. Raven Backplane Wax EISA BA (11) at 0xfc000000, versions 0x17, 0x0, 0x9=
0, 0x0, 0x0=0D
12. Raven Backplane Wax HIL (10) at 0xffe01000, versions 0x17, 0x0, 0x73, 0=
x0, 0x0=0D
13. Raven Backplane RS-232 (10) at 0xffe02000, versions 0x17, 0x0, 0x8c, 0x=
0, 0x0=0D
14. Gecko GSC Core Graphics (10) at 0xfa000000, versions 0x16, 0x0, 0x85, 0=
x0, 0x0=0D
15. U2-IOA BC GSC+ Port (7) at 0xf203f000, versions 0x501, 0x1, 0xc, 0x3, 0=
x0=0D
16. U2-IOA BC GSC+ Port (7) at 0xf103f000, versions 0x501, 0x1, 0xc, 0x3, 0=
x0=0D
17. Dino PCI Bridge (13) at 0xf2000000, versions 0x680, 0x1, 0xa, 0x0, 0x0=
=0D
That's a total of 17 devices.=0D
Linux version 2.4.0-test6 (krp@localhost.localdomain) (gcc version 2.96 200=
00707 (experimental)) #34 Sun Aug 27 19:33:37 CDT 2000=0D
initrd: 00000000-00000000=0D
pagetable_init=0D
On node 0 totalpages: 32768=0D
zone(0): 16384 pages.=0D
zone(1): 16384 pages.=0D
zone(2): 0 pages.=0D
Kernel command line: HOME=3D/ TERM=3DLINUX root=3D/dev/nfs nfsroot=3D192.16=
8.0.7 =0D
trap_init=0D
Calibrating delay loop... 286.72 BogoMIPS=0D
Memory: 125676k available=0D
Dentry-cache hash table entries: 16384 (order: 5, 131072 bytes)=0D
Buffer-cache hash table entries: 8192 (order: 3, 32768 bytes)=0D
Page-cache hash table entries: 32768 (order: 5, 131072 bytes)=0D
Inode-cache hash table entries: 8192 (order: 4, 65536 bytes)=0D
POSIX conformance testing by UNIFIX=0D
Lasi version 0 at 0xffd00000 found.=0D
Wax at 0xffe00000 found.=0D
Wax: HIL Keyboard-NMI registered.=0D
parport0: PC-style at 0xffd02800, irq 536 [PCSPP,TRISTATE]=0D
Found i82596 at 0xffd07000, IRQ 535=0D
early initialization of device eth0 is deferred=0D
Initializing lasi keyboard port at 0xffd08000...=0D
Initializing lasi mouse port at 0xffd08100...=0D
Found HIL at 0xffe01000, IRQ 798=0D
No handler for interrupt 259 !=0D
HIL: timed out, assuming no keyboard present.=0D
Warning : device (10, 0x17, 0x0, 0x73, 0x0) NOT claimed by HIL 712, 715 or =
similiar=0D
Dino version 2.1 (bridge mode) found at 0xf2000000=0D
=0D
=0D
The GSCtoPCI (Dino hrev 1) bus converter found may exhibit=0D
data corruption.  See Service Note Numbers: A4190A-01, A4191A-01.=0D
Systems shipped after Aug 20, 1997 will not exhibit this problem.=0D
Models affected: C180, C160, C160L, B160L, and B132L workstations.=0D
=0D
dino_bridge_init: IO_ADDR_EN hasn't been configured.=0D
kernel BUG at dino.c:646!=0D
ccio found U2 GSC+ BC at 0xf203f000=0D
ccio_alloc_pdir hpa 0xfff88000 mem 128MB IOV 8MB (23 bits)=0D
    PDIR size 0x4000 base c7f90000 chainid_shift 0xf=0D
ccio_resmap_init() res_size 0x100=0D
ccio found U2 GSC+ BC at 0xf103f000=0D
ccio: already initialized one device=0D
Linux NET4.0 for Linux 2.4=0D
Based upon Swansea University Computer Society NET3.039=0D
NET4: Linux TCP/IP 1.0 for NET4.0=0D
IP Protocols: ICMP, UDP, TCP=0D
IP: routing cache hash table of 1024 buckets, 8Kbytes=0D
TCP: Hash tables configured (established 8192 bind 8192)=0D
Starting kswapd v1.7=0D
pty: 256 Unix98 ptys configured=0D
lp0: using parport0 (interrupt-driven).=0D
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize=0D
sim700: Configuring 53c710 (SCSI-ID 7) at ffd06100, IRQ 534=0D
scsi0: Revision 0x2=0D
Post test1, istat 01, sstat0 00, dstat 84=0D
sim700: WARNING IRQ probe failed, (returned 0)=0D
scsi0: Good, target data areas are dma coherent=0D
scsi0: test 1 completed ok.=0D
scsi0: sim700_intr_handle() called with no interrupt=0D
zalon_scsi_callback: Zalon vers field is 0x1, IRQ 260=0D
ncr53c8xx: 53c720 detected=0D
ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential=0D
ncr53c720-0: restart (scsi reset).=0D
scsi0 : LASI/Simple 53c7xx=0D
scsi1 : ncr53c8xx - version 3.3b=0D
scsi : 2 hosts.=0D
  Vendor: TOSHIBA   Model: CD-ROM XM-5401TA  Rev: 1036=0D
  Type:   CD-ROM                             ANSI SCSI revision: 02=0D
Detected scsi CD-ROM sr0 at scsi0, channel 0, id 2, lun 0=0D
  Vendor: SEAGATE   Model: ST34371W          Rev: HP03=0D
  Type:   Direct-Access                      ANSI SCSI revision: 02=0D
Detected scsi disk sda at scsi1, channel 0, id 6, lun 0=0D
ncr53c720-0-<6,0>: tagged command queue depth set to 8=0D
scsi : detected 1 SCSI cdrom 1 SCSI disk total.=0D
Uniform CD-ROM driver Revision: 3.11=0D
ncr53c720-0-<6,0>: wide msgout: 1-2-3-1.=0D
ncr53c720-0-<6,0>: wide msgin: 1-2-3-1.=0D
ncr53c720-0-<6,0>: wide: wide=3D1 chg=3D0.=0D
ncr53c720-0-<6,0>: sync_msgout: 1-3-1-19-8.=0D
ncr53c720-0-<6,0>: sync msgin: 1-3-1-19-8.=0D
ncr53c720-0-<6,0>: sync: per=3D25 scntl3=3D0x10 ofs=3D8 fak=3D0 chg=3D0.=0D
ncr53c720-0-<6,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)=0D
SCSI device sda: hdwr sector=3D 512 bytes. Sectors=3D 8388314 [4095 MB] [4.=
1 GB]=0D
Partition check:=0D
 sda: unknown partition table=0D
eth0: 82596 at 0xffd07000, 00 60 B0 18 39 C0 IRQ 535.=0D
82596.c $Revision: 1.12 $=0D
Serial driver version 5.01 (2000-05-29) with MANY_PORTS SHARE_IRQ SERIAL_PC=
I enabled=0D
Found serial #0 at 0xffd05000, IRQ 538=0D
ttyS00 at iomem 0xffd05800 (irq =3D 538) is a 16550A=0D
Found serial #1 at 0xffe02000, IRQ 793=0D
ttyS01 at iomem 0xffe02800 (irq =3D 793) is a 16550A=0D
eth0: link ok.=0D
Sending BOOTP requests.... OK=0D
IP-Config: Got BOOTP answer from 192.168.0.1, my address is 192.168.0.250=0D
Switching from PDC console=0D
kmem_create: Forcing size word alignment - nfs_fh
=0DLooking up port of RPC 100003/2 on 192.168.0.7
=0DLooking up port of RPC 100005/2 on 192.168.0.7
=0DVFS: Mounted root (nfs filesystem) readonly.
=0Dexecve /sbin/init c0272008 c0272030
=0DFri Aug  4 01:33:00 /home/bame/xc/hppa 2000=0D
dd: /dev/zero: Bad address=0D
0+0 records in=0D
0+0 records out=0D
mke2fs 1.19-WIP, 7-Jul-2000 for EXT2 FS 0.5b, 95/08/09=0D
ext2fs_check_if_mount: No such file or directory while determining whether =
/dev/ram is mounted.=0D=0D
Filesystem label=3D=0D
OS type: Linux=0D
Block size=3D1024 (log=3D0)=0D
Fragment size=3D1024 (log=3D0)=0D
1024 inodes, 4096 blocks=0D
0 blocks (0.00%) reserved for the super user=0D
First data block=3D1=0D
1 block group=0D
8192 blocks per group, 8192 fragments per group=0D
1024 inodes per group=0D
=0D
Writing inode tables: 0/1=08=08=08done                            =0D
Writing superblocks and filesystem accounting information: done=0D
=0D
		Welcome to PA/Linux release 0.1=0D
	    (release 0.1 means don't expect much from it!)=0D
=0D
In addition to the bootable image, this CD contains cross compilers,=0D
source code, and documentation.  You can initialize a bootable PA-RISC=0D
hard disk from this CD too.  Read /README to find out more.=0D
=0D
Since progress never stops, by the time you boot this it'll be out of=0D
date, so check out http://www.thepuffingroup.com/parisc/ for the latest.=0D
=0D
Login as a superuser     login: root password: root=0D
   or as a normal user   login: demo password: demo=0D
=0D
=0D
=0D
h47clk1p login: Login timed out after 60 seconds=0D

--HcAYCG3uE/tztfnV--
