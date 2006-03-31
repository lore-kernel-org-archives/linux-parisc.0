From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] Strange newest LAB msg?
Date: Fri, 31 Mar 2006 16:26:38 +0100
Message-ID: <IX008E$FF5F5C221189CADA64719030F0E34D37@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
To: "Parisc List" <parisc-linux@lists.parisc-linux.org>
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

Hello all,

Just noticed on n4k with recent kernel:
[snip]
Mar 31 11:45:39 patst006 kernel: Linux version 2.6.16-pa8-n4kmp
(root@patst006) (gcc version 4.0.3 (Debian 4.0.3-1)) #212 SMP Tue Ma
r 28 12:30:16 CEST 2006
[snip]
Mar 31 11:45:39 patst006 kernel: CPU(s): 2 x PA8600 (PCX-W+) at 550.00000=
0 MHz
Mar 31 11:45:39 patst006 kernel: Whole cache flush 199180 cycles, flushin=
g
5369080 bytes 1536791 cycles
Mar 31 11:45:39 patst006 kernel: Setting cache flush threshold to a9e80 (=
2
CPUs online)
Mar 31 11:45:39 patst006 kernel: SBA found Ike rev 2 at 0xfffffffffed0000=
0
Mar 31 11:45:39 patst006 kernel: SBA found Ike rev 2 at 0xfffffffffed4000=
0
Mar 31 11:45:39 patst006 kernel: LBA version TR4.0 (0x5) found at
0xffffffffbffe0000
Mar 31 11:45:39 patst006 kernel: iosapic: no IRTE for 0000:00:04.0 (IRQ n=
ot
connected?)
Mar 31 11:45:39 patst006 kernel: LBA version TR4.0 (0x5) found at
0xffffffffbffe2000
Mar 31 11:45:39 patst006 kernel: LBA version TR4.0 (0x5) found at
0xffffffffbffe4000
Mar 31 11:45:39 patst006 kernel: NOTICE: PCI bus reset still asserted! (c=
learing)
Mar 31 11:45:39 patst006 kernel: NOTICE: Enabling PCI Arbitration
Mar 31 11:45:39 patst006 kernel: LBA version TR4.0 (0x5) found at
0xffffffffbffe8000
Mar 31 11:45:39 patst006 kernel: allocation failed: out of vmalloc space =
- use
vmalloc=3D<size> to increase size.
Mar 31 11:45:39 patst006 kernel: LBA version TR4.0 (0x5) found at
0xffffffffbffea000
Mar 31 11:45:39 patst006 kernel: allocation failed: out of vmalloc space =
- use
vmalloc=3D<size> to increase size.
Mar 31 11:45:39 patst006 kernel: LBA version TR4.0 (0x5) found at
0xffffffffbfff0000
Mar 31 11:45:39 patst006 kernel: NOTICE: PCI bus reset still asserted! (c=
learing)
Mar 31 11:45:39 patst006 kernel: NOTICE: Enabling PCI Arbitration
Mar 31 11:45:39 patst006 kernel: allocation failed: out of vmalloc space =
- use
vmalloc=3D<size> to increase size.
Mar 31 11:45:39 patst006 kernel: LBA version TR4.0 (0x5) found at
0xffffffffbfff4000
Mar 31 11:45:39 patst006 kernel: NOTICE: PCI bus reset still asserted! (c=
learing)
Mar 31 11:45:39 patst006 kernel: NOTICE: Enabling PCI Arbitration
Mar 31 11:45:39 patst006 kernel: allocation failed: out of vmalloc space =
- use
vmalloc=3D<size> to increase size.
Mar 31 11:45:39 patst006 kernel: LBA version TR4.0 (0x5) found at
0xffffffffbfff8000
Mar 31 11:45:39 patst006 kernel: NOTICE: PCI bus reset still asserted! (c=
learing)
Mar 31 11:45:39 patst006 kernel: NOTICE: Enabling PCI Arbitration
Mar 31 11:45:39 patst006 kernel: allocation failed: out of vmalloc space =
- use
vmalloc=3D<size> to increase size.
Mar 31 11:45:39 patst006 kernel: LBA version TR4.0 (0x5) found at
0xfffffffffece0000
Mar 31 11:45:39 patst006 kernel: NOTICE: PCI bus reset still asserted! (c=
learing)
Mar 31 11:45:39 patst006 kernel: NOTICE: Enabling PCI Arbitration
Mar 31 11:45:39 patst006 kernel: allocation failed: out of vmalloc space =
- use
vmalloc=3D<size> to increase size.
Mar 31 11:45:39 patst006 kernel: LBA version TR4.0 (0x5) found at
0xfffffffffece4000
Mar 31 11:45:39 patst006 kernel: NOTICE: PCI bus reset still asserted! (c=
learing)
Mar 31 11:45:39 patst006 kernel: NOTICE: Enabling PCI Arbitration
Mar 31 11:45:39 patst006 kernel: allocation failed: out of vmalloc space =
- use
vmalloc=3D<size> to increase size.
Mar 31 11:45:39 patst006 kernel: LBA version TR4.0 (0x5) found at
0xfffffffffece8000
Mar 31 11:45:39 patst006 kernel: NOTICE: PCI bus reset still asserted! (c=
learing)
Mar 31 11:45:39 patst006 kernel: NOTICE: Enabling PCI Arbitration
Mar 31 11:45:39 patst006 kernel: allocation failed: out of vmalloc space =
- use
vmalloc=3D<size> to increase size.
Mar 31 11:45:39 patst006 kernel: LBA version TR4.0 (0x5) found at
0xfffffffffecf0000
Mar 31 11:45:39 patst006 kernel: NOTICE: PCI bus reset still asserted! (c=
learing)
Mar 31 11:45:39 patst006 kernel: NOTICE: Enabling PCI Arbitration
Mar 31 11:45:39 patst006 kernel: allocation failed: out of vmalloc space =
- use
vmalloc=3D<size> to increase size.
Mar 31 11:45:39 patst006 kernel: LBA version TR4.0 (0x5) found at
0xfffffffffecf4000
Mar 31 11:45:39 patst006 kernel: allocation failed: out of vmalloc space =
- use
vmalloc=3D<size> to increase size.
Mar 31 11:45:39 patst006 kernel: LBA version TR4.0 (0x5) found at
0xfffffffffecf8000
Mar 31 11:45:39 patst006 kernel: SCSI subsystem initialized
Mar 31 11:45:39 patst006 kernel: unwind_init: start =3D 0x10451cc0, end =3D=

0x10472e10, entries =3D 8469
Mar 31 11:45:39 patst006 kernel: Performance monitoring counters enabled =
for
Unknown machine
Mar 31 11:45:39 patst006 kernel: Initializing Cryptographic API
Mar 31 11:45:39 patst006 kernel: io scheduler noop registered
Mar 31 11:45:39 patst006 kernel: io scheduler anticipatory registered (de=
fault)
[...]

(with a previous kernel
Feb 13 13:47:20 patst006 kernel: Linux version 2.6.16-rc3-pa0-n4kmp
(root@patst006) (gcc version 4.0.3 20060128 (prerelease) (Debian
 4.0.2-8)) #14 SMP Mon Feb 13 13:05:14 CET 2006
Feb 13 13:47:20 patst006 kernel: CPU(s): 2 x PA8600 (PCX-W+) at 550.00000=
0 MHz
Feb 13 13:47:20 patst006 kernel: Whole cache flush 217577 cycles, flushin=
g
5352456 bytes 1498027 cycles
Feb 13 13:47:20 patst006 kernel: Setting cache flush threshold to bdcc0 (=
2
CPUs online)
Feb 13 13:47:20 patst006 kernel: SBA found Ike rev 2 at 0xfffffffffed0000=
0
Feb 13 13:47:20 patst006 kernel: SBA found Ike rev 2 at 0xfffffffffed4000=
0
Feb 13 13:47:20 patst006 kernel: LBA version TR4.0 (0x5) found at
0xffffffffbffe0000
Feb 13 13:47:20 patst006 kernel: iosapic: no IRTE for 0000:00:04.0 (IRQ n=
ot
connected?)
Feb 13 13:47:20 patst006 kernel: LBA version TR4.0 (0x5) found at
0xffffffffbffe2000
Feb 13 13:47:20 patst006 kernel: LBA version TR4.0 (0x5) found at
0xffffffffbffe4000
Feb 13 13:47:20 patst006 kernel: NOTICE: PCI bus reset still asserted! (c=
learing)
Feb 13 13:47:20 patst006 kernel: NOTICE: Enabling PCI Arbitration
Feb 13 13:47:20 patst006 kernel: LBA version TR4.0 (0x5) found at
0xffffffffbffe8000
Feb 13 13:47:20 patst006 kernel: LBA version TR4.0 (0x5) found at
0xffffffffbffea000
Feb 13 13:47:20 patst006 kernel: LBA version TR4.0 (0x5) found at
0xffffffffbfff0000
Feb 13 13:47:20 patst006 kernel: NOTICE: PCI bus reset still asserted! (c=
learing)
Feb 13 13:47:20 patst006 kernel: NOTICE: Enabling PCI Arbitration
Feb 13 13:47:20 patst006 kernel: LBA version TR4.0 (0x5) found at
0xffffffffbfff4000
Feb 13 13:47:20 patst006 kernel: NOTICE: PCI bus reset still asserted! (c=
learing)
Feb 13 13:47:20 patst006 kernel: NOTICE: Enabling PCI Arbitration
Feb 13 13:47:20 patst006 kernel: LBA version TR4.0 (0x5) found at
0xffffffffbfff8000
Feb 13 13:47:20 patst006 kernel: NOTICE: PCI bus reset still asserted! (c=
learing)
Feb 13 13:47:20 patst006 kernel: NOTICE: Enabling PCI Arbitration
Feb 13 13:47:20 patst006 kernel: LBA version TR4.0 (0x5) found at
0xfffffffffece0000
Feb 13 13:47:20 patst006 kernel: NOTICE: PCI bus reset still asserted! (c=
learing)
Feb 13 13:47:20 patst006 kernel: NOTICE: Enabling PCI Arbitration
Feb 13 13:47:20 patst006 kernel: LBA version TR4.0 (0x5) found at
0xfffffffffece4000
Feb 13 13:47:20 patst006 kernel: NOTICE: PCI bus reset still asserted! (c=
learing)
Feb 13 13:47:20 patst006 kernel: NOTICE: Enabling PCI Arbitration
Feb 13 13:47:20 patst006 kernel: LBA version TR4.0 (0x5) found at
0xfffffffffece8000
Feb 13 13:47:20 patst006 kernel: NOTICE: PCI bus reset still asserted! (c=
learing)
Feb 13 13:47:20 patst006 kernel: NOTICE: Enabling PCI Arbitration
Feb 13 13:47:20 patst006 kernel: LBA version TR4.0 (0x5) found at
0xfffffffffecf0000
Feb 13 13:47:20 patst006 kernel: NOTICE: PCI bus reset still asserted! (c=
learing)
Feb 13 13:47:20 patst006 kernel: NOTICE: Enabling PCI Arbitration
Feb 13 13:47:20 patst006 kernel: LBA version TR4.0 (0x5) found at
0xfffffffffecf4000
Feb 13 13:47:20 patst006 kernel: LBA version TR4.0 (0x5) found at
0xfffffffffecf8000
Feb 13 13:47:20 patst006 kernel: SCSI subsystem initialized
Feb 13 13:47:20 patst006 kernel: unwind_init: start =3D 0x10452ce0, end =3D=

0x10473d50, entries =3D 8455
Feb 13 13:47:20 patst006 kernel: Performance monitoring counters enabled =
for
Unknown machine
Feb 13 13:47:20 patst006 kernel: Initializing Cryptographic API
[snip]
)

Joel=0A=0A---------------------------------------------------------------=
=0AA free anti-spam and anti-virus filter on all Scarlet mailboxes=0AMore=
 info on http://www.scarlet.be/

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
