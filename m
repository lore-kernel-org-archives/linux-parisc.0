From: Kyle McMartin <kyle@mcmartin.ca>
Subject: [parisc-linux] Fwd: Bug#296274: kernel-image-2.6.8-2-32: forward
	bug - segmentation fault : kernel cause ?
Date: Mon, 21 Feb 2005 13:57:27 -0500
Message-ID: <20050221185727.GA4631@roadwarrior.mcmartin.ca>
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

----- Forwarded message from Roel Teuwen <Roel.Teuwen@gmail.com> -----

From: Roel Teuwen <Roel.Teuwen@gmail.com>
Subject: Bug#296274: kernel-image-2.6.8-2-32: forward bug - segmentation fault : kernel cause ?
Message-Id: <200502211334.OAA15895@ruby.bro.cpqcorp.net>
To: Debian Bug Tracking System <submit@bugs.debian.org>
Date: Mon, 21 Feb 2005 14:34:24 +0100
X-Mailer: reportbug 3.8

Package: kernel-image-2.6.8-2-32
Version: 2.6.8-6
Severity: grave
Justification: renders package unusable


After filing bugreport #294167 (apt-listbugs: segmentation fault on
hppa), it was closed by the developer, stating the cause is the kernel
because of kernel messages in dmesg.

It was my understanding that these messages were informational and
indicative of a programming flaw in the application, but complying with
the request anyway.

Thanks for looking into this and providing information to the
apt-listbugs maintainer if needed.

Best regards,

Roel

dmesg kernel messages were :

do_page_fault() pid=1556 command='apt-listbugs' type=7
address=0x4027d3af
vm_start = 0x4022a000, vm_end = 0x40312000

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
     PSW: 00000000000001001111111100001111 Not tainted
     r00-03  00000000 fffff000 4027d3a3 4033b458
     r04-07  40325e58 4033b538 40321d8c 410b6590
     r08-11  40338e24 00989680 00000001 0015430c
     r12-15  00154308 00000000 403246da 00000611
     r16-19  407e9bf0 00000000 00000000 40325e58
     r20-23  00000000 00000000 410b6000 00000001
     r24-27  00000001 410b6590 00000000 00020b9c
     r28-31  00000000 00000168 410b6600 407d7edb
     sr0-3   00000000 00000000 00000000 00000028
     sr4-7   00000028 00000028 00000028 00000028

     IASQ: 00000028 00000028 IAOQ: 4027d3af 4027d3b3
     IIR: 0cca1280    ISR: 00000028  IOR: 40321d8c
     CPU:        0   CR30: 144ec000 CR31: 103d0000
     ORIG_R28: 00000000
     IAOQ[0]: 0x4027d3af
     IAOQ[1]: 0x4027d3b3
     RP(r2): 0x4027d3a3

apt-listbugs (pid 1556): Protection id trap (code 27)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
     PSW: 00000000000001001111111100001111 Not tainted
     r00-03  00000000 1043c010 10113c00 160a16c4
     r04-07  410b6600 1645f320 410b6624 1645f51c
     r08-11  00000000 00000000 160a16c4 0000000b
     r12-15  00154308 00000000 403246da 00000611
     r16-19  1645f320 00000000 00000000 0000000b
     r20-23  00000001 00030001 410b6624 144ec088
     r24-27  144ec088 144ec088 410b6624 10347010
     r28-31  0000000b 00000000 144ec340 101f764c
     sr0-3   00000000 00000000 00000000 00000028
     sr4-7   00000000 00000000 00000000 00000000

     IASQ: 00000000 00000000 IAOQ: 101364d4 101364d8
     IIR: 0f53d280    ISR: 00000028  IOR: 410b6624
     CPU:        0   CR30: 144ec000 CR31: 103d0000
     ORIG_R28: 103d0000
     IAOQ[0]: copy_siginfo_to_user+0x468/0x490
     IAOQ[1]: copy_siginfo_to_user+0x46c/0x490
     RP(r2): setup_rt_frame+0x98/0x42c

-- System Information:
Debian Release: 3.1
  APT prefers unstable
  APT policy: (500, 'unstable')
Architecture: hppa (parisc)
Kernel: Linux 2.6.8-2-32
Locale: LANG=C, LC_CTYPE=C (charmap=ANSI_X3.4-1968)

Versions of packages kernel-image-2.6.8-2-32 depends on:
ii  coreutils [fileutils]         5.2.1-2    The GNU core utilities
ii  initrd-tools                  0.1.77     tools to create initrd image for p
ii  module-init-tools             3.2-pre1-2 tools for managing Linux kernel mo
ii  palo                          1.6        Linux boot loader for parisc/hppa

-- no debconf information

----- End forwarded message -----
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
