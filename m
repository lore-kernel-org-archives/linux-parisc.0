Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from crypto.hack.co.za (h-69-3-43-158.PHLAPAFG.covad.net [69.3.43.158])
	by dsl2.external.hp.com (Postfix) with ESMTP id E8C3A4829
	for <parisc-linux@lists.parisc-linux.org>; Fri,  9 May 2003 20:16:22 -0600 (MDT)
Received: from [10.0.1.2] (pcp02226300pcs.rte20201.de.comcast.net [68.32.188.79])
	by crypto.hack.co.za (Postfix) with ESMTP id 4682C3FF5
	for <parisc-linux@lists.parisc-linux.org>; Sat, 10 May 2003 04:14:47 +0200 (SAST)
Date: Fri, 09 May 2003 22:16:21 -0400
From: Richard Todd <rtodd@antipentium.com>
To: <parisc-linux@lists.parisc-linux.org>
Message-ID: <BAE1D935.ADA%rtodd@antipentium.com>
Mime-version: 1.0
Content-type: text/plain; charset="US-ASCII"
Subject: [parisc-linux] SMP on J5000
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

Linux k2000 2.4.20-pa32 #1 Sat May 10 00:07:09
Latest gcc
This is a 785/j5000

This is the error we get when trying to compile the SMP kernel





sched.c:93: initializer element is not constant
sched.c:93: (near initialization for `tasklist_lock')
sched.c:93: initializer element is not constant
make[2]: *** [sched.o] Error 1
make[2]: Leaving directory `/usr/src/linux-2.4.20-pa33/kernel'
make[1]: *** [first_rule] Error 2
make[1]: Leaving directory `/usr/src/linux-2.4.20-pa33/kernel'
make: *** [_dir_kernel] Error 2
