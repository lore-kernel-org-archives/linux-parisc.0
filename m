Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id E611D482B
	for <parisc-linux@lists.parisc-linux.org>; Wed,  7 Nov 2001 07:02:19 -0700 (MST)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #3)
	id 161THO-0006nv-00
	for parisc-linux@lists.parisc-linux.org; Wed, 07 Nov 2001 16:02:10 +0200
Received: from fullung by dogbert.localdomain with local (Exim 3.32 #1 (Debian))
	id 161X0g-0000B3-00
	for <parisc-linux@lists.parisc-linux.org>; Wed, 07 Nov 2001 20:01:10 +0200
Date: Wed, 7 Nov 2001 20:01:10 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 720/50 update
Message-ID: <20011107200110.C616@dogbert.localdomain>
References: <fullung@ilink.nis.za> <20011107023007.A12882@dogbert.localdomain> <200111070700.AAA08983@puffin.external.hp.com> <20011107163116.A8527@dogbert.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011107163116.A8527@dogbert.localdomain>
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

Hello,

I rebuilt apt this afternoon (took a good 2 hours :-)), and now it
segfaults on startup. The following pops into /var/log/syslog:

Nov  7 16:00:08 bob kernel: do_page_fault() pid=7111 command='apt-get' type=15 address=0xffffffec
Nov  7 16:00:08 bob kernel: vm_start = 0xbff00000, vm_end = 0xbff02000
Nov  7 16:00:08 bob kernel: 
Nov  7 16:00:08 bob kernel:      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
Nov  7 16:00:08 bob kernel: PSW: 00000000000001000000000100001111
Nov  7 16:00:08 bob kernel: r0-3^I 00000000 00031854 4006189b bff00ad0
Nov  7 16:00:08 bob kernel: r4-7^I bff00ac0 401211b8 0004bb6b bff00ab0
Nov  7 16:00:08 bob kernel: r8-11^I 0004bb00 bff009b0 00000000 bff00aa0
Nov  7 16:00:08 bob kernel: r12-15^I 00000000 00049100 000c94d0 00000000
Nov  7 16:00:08 bob kernel: r16-19^I 00000000 000255c8 00014000 401211b8
Nov  7 16:00:08 bob kernel: r20-23^I 00000000 0002cdd4 0002cdd4 0004b7f0
Nov  7 16:00:08 bob kernel: r24-27^I bff00ae0 00000029 bff00ac0 000429c0
Nov  7 16:00:08 bob kernel: r28-31^I bff00ab0 0000003c bff00c00 40009ae7
Nov  7 16:00:08 bob kernel: sr0-3^I 00000000 00000024 00000000 00000024
Nov  7 16:00:08 bob kernel: sr4-7^I 00000024 00000024 00000024 00000024
Nov  7 16:00:08 bob kernel: 
Nov  7 16:00:08 bob kernel: IASQ: 00000024 00000024 IAOQ: 400618af 400618b3
Nov  7 16:00:08 bob kernel:  IIR: 4a963fd9    ISR: 00000024  IOR: ffffffec
Nov  7 16:00:08 bob kernel:  CPU:        0   CR30: 10fc0000 CR31: 10330000
Nov  7 16:00:08 bob kernel:  ORIG_R28: 403d5a84

ORIG_R28 looks more or less like the value in traps.c, IIRC. Package
versions:

gcc            3.0.2-10
gcc-3.0        3.0.2-3
g++            3.0.2-10
g++-3.0        3.0.2-3
gcc-3.0-base   3.0.2-3
libstdc++3     3.0.2-3
libc6          2.2.4-5.1
debconf        1.0.17
debhelper      3.0.48
binutils       2.11.92.0.10-2

Another weird one is when I click on any button in xman (and some other
apps in xbase-clients; displaying on my i386 machine), it simply dies
with:

Error: Unresolved inheritance operation

Not quite sure if this is because I'm missing some package, or because
of something more serious.

Regards,

Albert
