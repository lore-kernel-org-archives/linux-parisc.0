Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel1.hp.com (palrel1.hp.com [156.153.255.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id B9AA4482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  5 Jun 2001 11:56:40 -0600 (MDT)
Received: from xparelay1.corp.hp.com (xparelay1.corp.hp.com [15.58.136.173])
	by palrel1.hp.com (Postfix) with ESMTP id E494A14BC
	for <parisc-linux@lists.parisc-linux.org>; Tue,  5 Jun 2001 10:56:39 -0700 (PDT)
Received: from xatlbh2.atl.hp.com (xatlbh2.atl.hp.com [15.45.89.187])
	by xparelay1.corp.hp.com (Postfix) with ESMTP id D39DB1F509
	for <parisc-linux@lists.parisc-linux.org>; Tue,  5 Jun 2001 10:55:41 -0700 (PDT)
Message-ID: <3B1D1D56.14424ACA@hp.com>
Date: Tue, 05 Jun 2001 13:56:38 -0400
From: Chuck Slivkoff <charles_slivkoff@hp.com>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
References: <3B180D83.F5479D0B@hp.com>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Forcing PA-Linux to swap / do_page_fault()
List-ID: <linux-parisc.vger.kernel.org>

Greetings all,

I've noticed a problem that I believe is might be related to the kernel
not being able to use swap space.  I've never seen swap utilization > 0
and suspect that something might be seriously wrong. Here's an example
of the kernel error:


do_page_fault() pid=8730 command='Xvfb' type=6 address=0x00000003

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111
r0-3     00000000 0049a1f8 00000000 00000013
r4-7     723cff78 00000000 00000000 00000000
r8-11    00000500 00000400 00000000 00000020
r12-15   00000000 00000000 00000000 00000400
r16-19   00000500 0058fd70 00000000 000057e4
r20-23   00000000 00000014 00000040 004c61f8
r24-27   faf00d58 faf00cd8 0000000e 004471f8
r28-31   0002bf20 00000000 faf00e48 00054f83
sr0-3    00000000 00000100 00000000 00000100
sr4-7    00000100 00000100 00000100 00000100

IASQ: 00000100 00000100 IAOQ: 00000003 00000007
 IIR: e85e02a1    ISR: 00000100  IOR: 005dc000
 ORIG_R28: 00000003


My system is a 712/60 with 128MB RAM.

Does anyone have a good example of test to force the system to use swap?

-chuck
