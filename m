Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id AC21C6629
	for <parisc-linux@parisc-linux.org>; Tue,  6 Mar 2001 02:37:18 -0700 (MST)
Received: from carmen.fc.hp.com (carmen.fc.hp.com [15.1.51.72])
	by atlrel2.hp.com (Postfix) with ESMTP id 3CBF0D8F
	for <parisc-linux@parisc-linux.org>; Tue,  6 Mar 2001 04:37:18 -0500 (EST)
Received: from carmen.fc.hp.com (localhost [127.0.0.1])
	by carmen.fc.hp.com (Postfix) with ESMTP id 7816D38BD7
	for <parisc-linux@parisc-linux.org>; Tue,  6 Mar 2001 02:39:51 -0700 (MST)
To: parisc-linux@parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 06 Mar 2001 02:39:51 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010306093951.7816D38BD7@carmen.fc.hp.com>
Subject: [parisc-linux] libpng test program causes page fault
List-ID: <linux-parisc.vger.kernel.org>

When building the libpng debian package,

apt-get source libpng
cd libpng-1.0.8
dpkg-buildpackage

it builds a 'pngtest' program and attempts to run it resulting in this page 
fault,

------------------------------------------------------------------------------
do_page_fault() pid=29568 command='pngtest' type=6 address=0x0a000003
vm_start = 0x00005000, vm_end = 0x00007000

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001101111111100001111
r0-3     00000000 40016f9c 40057ec7 faf003c0
r4-7     4001a380 000a6bf0 000a6c10 00000002
r8-11    faf001d4 faf001cc 00000001 4001baf0
r12-15   4001bad0 00000000 000a6c70 00000000
r16-19   00000000 00005000 00000000 4001a380
r20-23   0a000000 000048c8 0a000000 00000000
r24-27   faf001d4 faf001cc 00000001 00076808
r28-31   4001b1f2 00000037 faf00440 40057ec7
sr0-3    00004387 00004387 00000000 00004387
sr4-7    00004387 00004387 00004387 00004387

IASQ: 00004387 00004387 IAOQ: 0a000003 0a000007
 IIR: 43ffff80    ISR: 102400c9  IOR: 93700428
ORIG_R28: faf00001
------------------------------------------------------------------------------

The pngtest program is attached.

Thanks,


-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
