Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viemta04.chello.at (viemta04.chello.at [195.34.133.54])
	by dsl2.external.hp.com (Postfix) with ESMTP id BBADE482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  9 Apr 2001 14:38:35 -0600 (MDT)
Received: from dot.at ([62.178.92.247]) by viemta04.chello.at
          (InterMail vK.4.03.02.00 201-232-124 license 6aea1bd1f01aef5a9a73363c16ebee43)
          with ESMTP id <20010409203833.XKBQ23009.viemta04@dot.at>
          for <parisc-linux@lists.parisc-linux.org>;
          Mon, 9 Apr 2001 22:38:33 +0200
Sender: chris@dsl2.external.hp.com
Message-ID: <3AD21DC8.3FFE4F3E@dot.at>
Date: Mon, 09 Apr 2001 22:38:32 +0200
From: Christoph Plattner <christoph.plattner@dot.at>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Problems with `init' on 720 !
List-ID: <linux-parisc.vger.kernel.org>

After many experiments, I can boot the box (9000/720) with many tools,
bash, etc, (see other mails with
	[parisc-linux] Many experiments with 720, but `init' fails
) but I have troubles with init.

Error log:

VFS: Mounted root (nfs filesystem) readonly.
break 0,0: pid=9 command='init'
init[9]: Breakpoint 0

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111
r0-3     00000000 102de010 00000000 00000000
r4-7     00000000 00000000 00000000 00000000
r8-11    00000000 00000000 00000000 00000000
r12-15   00000000 00000000 00000040 1012544c
r16-19   13f085c0 13f08000 c804c804 00000001
r20-23   102efcc0 102efcc0 10022800 102efcc0
r24-27   0000002e 00001000 00000000 1024c010
r28-31   00000000 00000000 13f089c0 101312a0
sr0-3    00000000 00000000 00000000 00000001
sr4-7    00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 00000000 00000004
 IIR: 00000000    ISR: 00000000  IOR: 00000000
ORIG_R28: 00000000

With friendly regards
	Christoph P.



-- 
-------------------------------------------------------------------------
private:	christoph.plattner@dot.at
company:	christoph.plattner@alcatel.at
