Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from gronico.org (gronico.net1.nerim.net [62.212.114.8])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1FE2C4841
	for <parisc-linux@lists.parisc-linux.org>; Fri,  7 Nov 2003 03:03:34 -0700 (MST)
Received: from -allhosts (athena [10.2.0.200])
	by gronico.org (Postfix) with ESMTP id F1056455D1
	for <parisc-linux@lists.parisc-linux.org>; Fri,  7 Nov 2003 11:03:37 +0100 (CET)
From: Nicolas JULIEN <gronico@gronico.org>
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain
Message-Id: <1068198742.3302.17.camel@athena>
Mime-Version: 1.0
Date: Fri, 07 Nov 2003 10:52:23 +0100
Subject: [parisc-linux] pppd on 2.4.22-pa13
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

Hi,

I was having some problems with pppd:

Nov  6 10:13:03 tomawak kernel: sys32_ioctl: Unknown cmd fd(7)
cmd(40047437) arg(00081cf0)

and I was unable to launch an adsl session.

I've found a solution and I've patched my kernel with:

*** arch/parisc/kernel/ioctl32.c.old    Thu Nov  6 10:18:21 2003
--- arch/parisc/kernel/ioctl32.c        Thu Nov  6 10:18:52 2003
***************
*** 3176,3181 ****
--- 3176,3182 ----
  COMPATIBLE_IOCTL(PPPIOCCONNECT)
  COMPATIBLE_IOCTL(PPPIOCDISCONN)
  COMPATIBLE_IOCTL(PPPIOCATTCHAN)
+ COMPATIBLE_IOCTL(PPPIOCGCHAN)
  /* PPPOX */
  COMPATIBLE_IOCTL(PPPOEIOCSFWD);
  COMPATIBLE_IOCTL(PPPOEIOCDFWD);

Maybe it will be usefull to apply this to sources?

Best regards,

Nicolas JULIEN.
