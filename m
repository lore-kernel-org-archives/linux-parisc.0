From: "B. Douglas Hilton" <bdhilton@charter.net>
Subject: [parisc-linux] C200 Voodoo2 Progress Report
Date: Thu, 05 Sep 2002 17:49:55 -0400
Message-ID: <3D77D183.2080905__38689.1229231425$1416621689$gmane$org@charter.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
To: palinux <parisc-linux@lists.parisc-linux.org>,
	debian-hppa@lists.debian.org
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

I have gotten my C200 back online and started some preliminary
work with the Voodoo2 PCI card. I currently have it plugged into
one of the 5V/32bit slots which may or may not be optimal.

Anyways,

1. Linux Kernel 2.4.19-pa2 sstfb Voodoo1/2 framebuffer

  Well, the kernel compiled with the sstfb without
  any errors. When I booted I got a black and white
  checkerboard pattern on the Voodoo2 monitor. I had
  disabled the stifb console, thinking that the kernel
  might pick the sstfb for a console, but it didn't.
  Just blankness for a while, then a checkerboard
  pattern.

  I think this is encouraging and I think it is working.
  I'm currently recompiling and will post some more news
  later as I experiment some more with it. Next I will
  try and put a console on the sstfb or even try running
  X on it.


2. glide3-alpha-0.cvs.20010711

  This is the Debian source for Glide3 on the Alpha arch,
  which is also big-endian. Initial compilation failed in
  multiple places about missing sys/io.h which I have
  located a file of that name in /usr/include/asm. I'll
  see if I can figure out how best to correct this and try
  again.


Cheers!
- Doug
