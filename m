Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel1.hp.com (palrel1.hp.com [156.153.255.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id CF9E3482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  1 Jun 2001 15:47:50 -0600 (MDT)
Received: from xparelay2.corp.hp.com (xparelay2.corp.hp.com [15.58.137.112])
	by palrel1.hp.com (Postfix) with ESMTP id 2608719D9
	for <parisc-linux@lists.parisc-linux.org>; Fri,  1 Jun 2001 14:47:50 -0700 (PDT)
Received: from xatlbh2.atl.hp.com (xatlbh2.atl.hp.com [15.45.89.187])
	by xparelay2.corp.hp.com (Postfix) with ESMTP id F10A01F54F
	for <parisc-linux@lists.parisc-linux.org>; Fri,  1 Jun 2001 14:46:17 -0700 (PDT)
Message-ID: <3B180D83.F5479D0B@hp.com>
Date: Fri, 01 Jun 2001 17:47:47 -0400
From: Chuck Slivkoff <charles_slivkoff@hp.com>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Upgrade path from 0.6 to 0.9?
List-ID: <linux-parisc.vger.kernel.org>

I'll be burning a ISO image over the weekend, but I was curious. Is
there the equivalent of "apt-get dist-update" or a simple way to do this
w/ out a complete reload?

On a somewhat related note, the 712 I've been playing on has the 0.6
bits loaded & I've been doing some apt-get's, but right now I can't get
anywhere. I've tried "apt-get -f install" to try to "clean things up",
but keep getting this:

 ============================================================

dpenguin:~# apt-get -f install
Reading Package Lists... Done
Building Dependency Tree... Done
The following extra packages will be installed:
  libc6 
1 packages upgraded, 0 newly installed, 0 to remove and 51  not
upgraded.
1 packages not fully installed or removed.
Need to get 0B/4106kB of archives. After unpacking 254kB will be used.
Do you want to continue? [Y/n] 
debconf: skipping preconfiguration (apt-utils is not installed)
(Reading database ... 16349 files and directories currently installed.)
Preparing to replace libc6 2.2.1-1 (using
.../libc6_2.2.3-2.0.0.2_hppa.deb) ...
Unpacking replacement libc6 ...
dpkg: error processing
/var/cache/apt/archives/libc6_2.2.3-2.0.0.2_hppa.deb (--unpack):
 dpkg: warning - old post-removal script killed by signal (Segmentation
fault)

dpkg: error while cleaning up:
 dpkg: warning - pre-installation script killed by signal (Segmentation
fault)

Errors were encountered while processing:
 /var/cache/apt/archives/libc6_2.2.3-2.0.0.2_hppa.deb
E: Sub-process /usr/bin/dpkg returned an error code (1)

 ============================================================

And in dmesg:

 ============================================================

do_page_fault() pid=244 command='libc6.postrm' type=15
address=0x000003a4

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111
r0-3     00000000 00098058 00047573 000a40d0
r4-7     000003a4 000003a4 bff0021b 0000000c
r8-11    0000003d bff002d8 00000028 00000001
r12-15   00000081 00000029 00098058 00098058
r16-19   00000000 bff01708 0004fe90 00000000
r20-23   000a48d1 00000000 ffffc8bf 000a0858
r24-27   ffffffff 000a40d0 000003a4 00098058
r28-31   000a48d0 00000000 bff007c0 401cc057
sr0-3    0000002c 0000002c 00000000 0000002c
sr4-7    0000002c 0000002c 0000002c 0000002c

IASQ: 0000002c 0000002c IAOQ: 0004751b 0004751f
 IIR: 0f401014    ISR: 0000002c  IOR: 000003a4
ORIG_R28: 40235ef4

do_page_fault() pid=245 command='libc6.preinst' type=15
address=0x000003a4

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111
r0-3     00000000 00098058 00047573 000a40d0
r4-7     000003a4 000003a4 bff00224 0000000c
r8-11    0000003d bff002d8 00000028 00000001
r12-15   00000081 00000029 00098058 00098058
r16-19   00000000 bff01708 0004fe90 00000000
r20-23   000a48d1 00000000 ffffc8bf 000a0858
r24-27   ffffffff 000a40d0 000003a4 00098058
r28-31   000a48d0 00000000 bff007c0 401cc057
sr0-3    0000002f 0000002f 00000000 0000002f
sr4-7    0000002f 0000002f 0000002f 0000002f

IASQ: 0000002f 0000002f IAOQ: 0004751b 0004751f
 IIR: 0f401014    ISR: 0000002f  IOR: 000003a4
ORIG_R28: 40235ef4

 ============================================================

I'm thinking I need to update the kernel, but I'd like to not have to
reload this from scratch.  I can pull the kernel from the 0.9 ISO, but
PALO didn't seem to be too intuitive.

Any suggestions?

-chuck
