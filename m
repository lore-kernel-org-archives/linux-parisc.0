From: Alexander Bartolich <alexander.bartolich@gmx.at>
Subject: C240 and Linux 2.6.x
Date: Fri, 31 Dec 2004 00:14:20 +0100
Message-ID: <20041230231420.GA15674__9570.98305593735$1416624523$gmane$org@nilpferd.asyl>
Mime-Version: 1.0
Content-Type: multipart/signed;
  micalg=pgp-sha1;
  protocol="application/pgp-signature";
  boundary="zYM0uCDKw75PZbzx"
To: debian-hppa@lists.debian.org,
 parisc-linux@parisc-linux.org
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
Resent-Message-ID: <LDXah.A.SHE.5wI1BB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-hppa/>


--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I have a C240 satisfyingly running Debian Testing and kernels
from 2.4.17 to 2.4.27-pa4, both stock and custom compiled.

However, no variation of 2.6.x ever booted. Since the last message
I see is that infamous =BByou may need to switch your console=AB I
eventually organized a serial cable, a second machine running
minicom and got the same result:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Attempting to boot Primary Path...

BOOTABLE DEVICE FOUND:
   Path Number        Device Path              Device Type and Utilities
   -----------        -----------------        -------------------------
   P0                 FWSCSI.0.0               IBM     DNES-309170W
                                               IPL

Booting...
Boot IO Dependent Code (IODC) revision 1


HARD Booted.
palo ipl 1.5 root@c3k Fri May 14 16:17:38 MDT 2004
Skipping extended partition 6 - beyond reach of IPL

Partition Start(MB) End(MB) Id Type
1               1      15   f0 Palo
2              16     503   83 ext2
3             504     980   82 swap
5             981    2887   83 ext2

PALO(F0) partition contains:
    0/vmlinux32 4078989 bytes @ 0x44000

Information: No console specified on kernel command line. This is normal.
PALO will choose the console currently used by firmware (serial).
Command line for kernel: 'root=3D/dev/sda2 HOME=3D/ max_loop=3D64 console=
=3DttyS0 TERM=3D'
Selected kernel: /boot/vmlinux from partition 2
Selected ramdisk: /boot/initrd.img-2.6.8-1-32 from partition 2
ELF32 executable
Entry 00100000 first 00100000 n 2
Segment 0 load 00100000 size 2265344 mediaptr 0x1000
Segment 1 load 0032c000 size 458886 mediaptr 0x22b000
Loading ramdisk 3133440 bytes @ 3fcf1000...
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Above kernel is the stock Debian kernel-image-2.6.8-1-32.
I also experimented with a few custom compiled ones (no initrd,
NIC driver statically), same result.

Where is this FAQ item mentioned above?
And how is this ment, anyway?
Just switching consoles within HP's =BBBIOS=AB,
or passing some arguments via /etc/palo.conf,
or compiling the kernel with different settings?

I'd really like to help more, but without any diagnostics of 2.6.x ...
Well, here is the start of dmesg when booting with a custom compiled
kernel:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Linux version 2.4.27-pa4 (root@lnzx02) (gcc version 3.3.4 (Debian 1:3.3.4-1=
3)) #1 Wed Dec 22 10:21:43 CET 2004
FP[0] enabled: Rev 0 Model 14
The 32-bit Kernel has started...
Determining PDC firmware type: System Map.
model 00005990 00000481 00000000 00000002 782320ae 100000f0 00000008 000000=
b2 000000b2
vers  00000501
CPUID vers 14 rev 23 (0x000001d7)
capabilities 0x2
model 9000/782/C240+
Total Memory: 1536 Mb
pagetable_init
On node 0 totalpages: 393216
zone(0): 393216 pages.
zone(1): 0 pages.
zone(2): 0 pages.
LED display at f0190001 registered
Kernel command line: root=3D/dev/sda2 HOME=3D/ max_loop=3D64 console=3Dtty0=
 sti=3D10/0/4/0 sti_font=3DVGA8x16 TERM=3Dlinux palo_kernel=3D2/boot/vmlinu=
x-2.4.27-pa4
Console: colour dummy device 160x64
Calibrating delay loop... 470.22 BogoMIPS
Memory: 1551652k available
Dentry cache hash table entries: 262144 (order: 9, 2097152 bytes)
Inode cache hash table entries: 131072 (order: 8, 1048576 bytes)
Mount cache hash table entries: 512 (order: 0, 4096 bytes)
Buffer cache hash table entries: 131072 (order: 7, 524288 bytes)
Page-cache hash table entries: 524288 (order: 9, 2097152 bytes)
Searching for devices...
Found devices:
1. U2-IOA BC Runway Port (12) at 0xfff88000 [8], versions 0x580, 0xf, 0xb
2. Dino PCI Bridge (13) at 0xf2000000 [8/0], versions 0x680, 0x3, 0xa,  add=
itional addresses: 0xf2800000
3. Raven U/L2 Dino RS-232 (10) at 0xf2003000 [8/0/63], versions 0x6, 0x0, 0=
x8c
4. Raven U/L2 Dino PS/2 Port (10) at 0xf2001000 [8/1], versions 0x6, 0x0, 0=
x96
5. Raven+ w SE FWSCSI Core BA (11) at 0xffd00000 [8/16], versions 0x56, 0x0=
, 0x81,  additional addresses: 0xffd0c000 0xffc00000
6. Raven+ w SE FWSCSI Core Centronics (10) at 0xffd02000 [8/16/0], versions=
 0x56, 0x0, 0x74,  additional addresses: 0xffd01000 0xffd03000
7. Raven+ w SE FWSCSI Core Audio (10) at 0xffd04000 [8/16/1], versions 0x56=
, 0x4, 0x7b
8. Raven+ w SE FWSCSI Core RS-232 (10) at 0xffd05000 [8/16/4], versions 0x5=
6, 0x0, 0x8c
9. Raven+ w SE FWSCSI Core SCSI (10) at 0xffd06000 [8/16/5], versions 0x56,=
 0x0, 0x82
10. Raven+ w SE FWSCSI Core PS/2 Port (10) at 0xffd08000 [8/16/7], versions=
 0x56, 0x0, 0x84
11. Raven+ w SE FWSCSI Core PS/2 Port (10) at 0xffd08100 [8/16/8], versions=
 0x56, 0x0, 0x84
12. U2-IOA BC GSC+ Port (7) at 0xf203f000 [8/63], versions 0x501, 0x1, 0xc
13. U2-IOA BC Runway Port (12) at 0xfff8a000 [10], versions 0x580, 0xf, 0xb
14. Cujo PCI Bridge (13) at 0xf1000000 [10/0], versions 0x682, 0x1, 0xa,  a=
dditional addresses: 0xf1800000 0xf6000000
15. Dino RS-232 (10) at 0xf1003000 [10/3], versions 0x7, 0x0, 0x8c
16. U2-IOA BC GSC+ Port (7) at 0xf103f000 [10/63], versions 0x501, 0x1, 0xc
17. Raven U 240 (9000/780/C240) (0) at 0xfffa0000 [32], versions 0x599, 0x0=
, 0x4
18. Memory (1) at 0xfffb1000 [49], versions 0x6f, 0x0, 0x9
CPU(s): 1 x PA8200 (PCX-U+) at 236.000000 MHz
Found U2 at 0xfff88000
Found U2 at 0xfff8a000
Lasi version 0 at 0xffd00000 found.
Dino version 3.1 found at 0xf2000000
Cujo version 2.0 found at 0xf1000000
Enabling Cujo 2.0 bug workaround
Don't recognise Cujo at address 0xf1000000, not enabling workaround
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Soft power switch enabled, polling @ 0xf0140000.
Starting kswapd
Journalled Block Device driver loaded
STI GSC/PCI graphics driver version 0.9
STI PCI graphic ROM found at f1e00000 (2048 kB), fb at f6000000 (32 MB)
STI word mode ROM at f1e00044, hpa at f6000000
STI id 2fc1066b-9a02587, conforms to spec rev. 8.09
STI device: HPA4554A
stifb: Unsupported gfx card id 0x2fc1066b
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

--zYM0uCDKw75PZbzx
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iQCVAwUBQdSLzIatRCO2qiMiAQLVhAP/YK6p7fGq+w8zIjLhkA7nFNX4MxIvu2jX
mFAX0mNQ8/Pw4V99tIN35PBMebY9iJRk51CMEZILZvFPQJFjkhSlEHZCZ6TFTNAF
KDofZPGF1chrgp4FWHYHFjEAwyvZWIw0wowHWf6shzHfSjn0/drKlIkM5i4i1knt
AGMJ8hqCWKE=
=mITh
-----END PGP SIGNATURE-----

--zYM0uCDKw75PZbzx--


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
