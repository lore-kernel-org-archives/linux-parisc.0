Return-Path: <xam@cs.ucc.ie>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 88DA4484B
	for <parisc-linux@lists.parisc-linux.org>;
	Mon,  8 Dec 2003 01:20:40 -0700 (MST)
Received: from sal.ucc.ie (sal.ucc.ie [143.239.201.201])
	by csmail.ucc.ie (8.12.10/8.12.10) with ESMTP id hB88Kdkf018576
	for <parisc-linux@lists.parisc-linux.org>; Mon, 8 Dec 2003 08:20:39 GMT
Date: Mon, 8 Dec 2003 08:20:38 +0000 (GMT)
From: "M. Grabert" <xam@cs.ucc.ie>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.58.0312080747340.7829@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] test11-pa2 & serial console on C3k success,
	siimage problems
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi PA,

First of all thanks for all the people involved in getting
2.6 working on PA-RISC, especially those who fixed the
serial console issue!


It seems to work for me (after initial testing), however I ran into
some other problems, for which I would be very grateful if they
can be resolved aswell:

As I needed some additional hard disk space I bought a 120GB hard disk.
Since I'm not a particular rich person, I could only afford a IDE version,
not a SCSI hard drive.
As mentioned in previous posts I'm using the internal NS87415 IDE
controller of the C3000 to drive the Seagate IDE hard disk (ST3120022A).

It works, but is limited to non-dma transfers and therefore it is not
very performant (about 3.3MB/s reading, writing even slower).
I've been also told I'm quite brave for using the internal IDE controller,
since it was never been used/tested for this purpose before.

Therefore I did the most reasonable thing and got a IDE PCI controller.
Unfortunately the only (new) ones on the market you can get are based
on the Promise chipset or the SiliconImage chipset. I got one with the
SiliconImage chipset, since they also support ATAPI commands, whereas
the Promise doesn't.


It seems there is a bug in either the kernel or (more likely) in the
SiliconImage driver, both with the 2.4.23-pa3 and the 2.6.0-test11-pa2
kernels.

The 2.4.23-pa3 kernel allows me to boot with the siimage driver compiled
in (I disabled the support for the NS8741 in the kernel). However the kernel
complains about 'lost interrupts' on boot and won't allow me to use
the hard disk (read errors, see
http://www.cs.ucc.ie/~xam/siimage/readerrors-2.4.23-pa3.txt )
I the 2.4 kernel was compiled with DMA support, but I also tried to
boot with 'ide=nodma', with exactly the same results.

The 2.6.0-test11-pa2 kernel is configured similar, but generates a
'you system ate a SPARC' kernel ooops:

==== <snip> ====

Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2
ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
SiI680: IDE controller at PCI slot 0000:01:06.0
SiI680: chipset revision 2
SiI680: BASE CLOCK == 133
SiI680: 100% native mode on irq 128
    ide0: MMIO-DMA at 0xf4800000-0xf4800007 -- Error, MMIO ports already in use.
    ide1: MMIO-DMA at 0xf4800008-0xf480000f -- Error, MMIO ports already in use.
hda: TS130220A2, ATA DISK drive
      _______________________________
     < Your System ate a SPARC! Gah! >
      -------------------------------
             \   ^__^
              \  (xx)\_______
                 (__)\       )\/\
                  U  ||----w |
                     ||     ||
swapper (pid 1): Breakpoint (code 0)
     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111 Not tainted

r00-03  00000000 1032f010 10208f34 103fc2e0
r04-07  103fc230 00000001 00000001 0000000f
r08-11  103454f8 000f41fa 372d3980 103ee404
r12-15  3ccbf700 10344810 103ee010 f0400004
r16-19  f00008c4 f000017c f0000174 00000000
r20-23  fed32840 fed32800 00000000 0000000a
r24-27  0000ffa0 000000ff 103fc2e0 10326010
r28-31  00000000 00061a80 4ff98340 10208f34
sr0-3   00000000 00000000 00000000 00000000
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 00000000 00000004
 IIR: 00000000    ISR: 00000000  IOR: 00000000
 CPU:        0   CR30: 4ff98000 CR31: 1037c000
 ORIG_R28: 55555555
 IAOQ[0]: 0x0
 IAOQ[1]: 0x4
 RP(r2): probe_hwif+0x218/0x44c

Kernel panic: Attempted to kill init!

=== </snip> ===


The full bootlogs/config/System.map can be found here:
   http://www.cs.ucc.ie/~xam/siimage/

I also placed the bootlog/config/System.map for my current (working)
config - ie. using the internal NS87415 IDE controller - here:
   http://www.cs.ucc.ie/~xam/siimage/working-with-NS87415/


Any help would to make the SiliconImage card working would be appreciated!
I think many people also want to 'upgrade' their system by putting in
an additional hard disk at one stage in the future, and will hit the
similar problem that there is currently no working IDE PCI card for Linux/PA


Thanks alot in advance,
  Max
