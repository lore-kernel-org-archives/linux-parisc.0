Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from it.swin.edu.au (venus.it.swin.edu.au [136.186.5.30])
	by dsl2.external.hp.com (Postfix) with ESMTP id 056EB483B
	for <parisc-linux@lists.parisc-linux.org>; Mon,  7 Jul 2003 05:09:39 -0600 (MDT)
Date: Mon, 7 Jul 2003 21:09:36 +1000 (EST)
From: John Newbigin <jnewbigin@venus.it.swin.edu.au>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.44.0307072019390.6545-100000@venus.it.swin.edu.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] STI frame buffer on 715/50
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

I am trying to get my 715/50 up and running again but I am having trouble 
with the sti framebuffer.  12 months ago I started to look at this (see
http://lists.parisc-linux.org/hypermail/parisc-linux/8761.html )

I have followed the instructions from that page and have built a kernel 
which is working (2.4.21-pa1).  When I do not build the sti framebuffer, 
the sti console works fine.  When I do build the "Generic STI frame 
buffer device support", everything works except for the image on the 
monitor.  Very early in the kernel boot (before I can read the output) the 
screen goes black.  The serial console works, network, ssh, everything 
works.  If I press the TOC I can see the image that should have been visible
so I am sure that most of it is working.

I tried all the kernel config options, none of which helped.  There are no 
errors from the STI driver.  I am sure there is something simple required 
but I don't know where to look next.

The the relevant dmesg output is below.  Any help would be much 
appreciated.

John.

STI GSC/PCI graphics driver version 0.9
Trying STI ROM at f4000000, hpa at f4000000
STI byte mode ROM at f4000000, hpa at f4000000
selected 8x16 fb-font VGA8x16
STI id 27f12392-40a00499, conforms to spec rev. 8.02
 supports 0 monitors
 font start 00003fd4
 region list 00003fbc
 init_graph 000000c0
 bus support 00
 ext bus support 00
 alternate code type 0
region #0: phys f4000000, virt f4000000, len=252kB, btlb=0, sysonly=0, 
cache=0, last=0
region #1: phys f5000000, virt f5000000, len=16384kB, btlb=1, sysonly=0, 
cache=0, last=0
region #2: phys f4100000, virt f4100000, len=2560kB, btlb=0, sysonly=0, 
cache=0, last=0
region #3: phys f403f000, virt f403f000, len=4kB, btlb=0, sysonly=0, 
cache=0, last=0
region #4: phys f4380000, virt f4380000, len=4kB, btlb=0, sysonly=1, 
cache=0, last=1
3 text planes
1280 x 1024 screen resolution
   0 x    0 offscreen
2048 x 1024 layout
regions at f4000000 f5000000 f4100000 f403f000
regions at f4380000 00000000 00000000 00000000
reent_lvl 0
save_addr 00367c00
monitor 0
in friendly mode: 0
power consumption 0 watts
freq ref 0
sti_mem_addr 00368260 (size=256 bytes)
8 bits per pixel
8 used bits
8 planes
attributes 00000036
STI device: HPA1991AGrayscale
Console: switching to colour frame buffer device 160x64
fb0: stifb 1280x1024-8 frame buffer device, id: 27f12392, mmio: 0xf4100000
