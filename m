From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] Vis-EG card problems on c3k with 2.6.10-pa10?
Date: Wed, 12 Jan 2005 00:11:46 -0500
Message-ID: <20050112051146.GC1281@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
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


pa,

Running 2.6.10-pa10, 

STI GSC/PCI core graphics driver Version 0.9a
STI PCI graphic ROM found at f6000000 (64 kB), fb at fa000000 (32 MB)
    id 2d08c0a7-9a02587, conforms to spec rev. 8.0a
    graphics card name: PCI_GRAFFITIDX1280
Console: switching to colour frame buffer device 160x64
fb0: stifb 1280x1024-8 frame buffer device, PCI_GRAFFITIDX1280, 
id: 2d08c0a7, mmio : 0xfa100000

I can get something on the screen, but Tux is corrupted beyond
recognition and gdm is squished to the right.

Anyone running a new kernel and a PCI Vis-EG card and has a success
check?

processor       : 0
cpu family      : PA-RISC 2.0
cpu             : PA8500 (PCX-W)
cpu MHz         : 400.000000
model           : 9000/785/C3000
model name      : AllegroHigh W
hversion        : 0x00005bb0
sversion        : 0x00000481
I-cache         : 512 KB
D-cache         : 1024 KB (WB, 0-way associative)
ITLB entries    : 160
DTLB entries    : 160 - shared with ITLB
bogomips        : 794.62
software id     : 2011698862

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
