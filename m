Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id 97F5A4A19
	for <parisc-linux@lists.parisc-linux.org>; Wed, 21 Feb 2001 23:37:56 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id RAA26724
	for <parisc-linux@lists.parisc-linux.org>; Thu, 22 Feb 2001 17:37:55 +1100
Date: Thu, 22 Feb 2001 17:37:55 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: parisc-linux@lists.parisc-linux.org
In-Reply-To: <Pine.LNX.4.21.0102100106450.27808-100000@front.linuxcare.com.au>
Message-ID: <Pine.LNX.4.21.0102221609360.14557-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Re: pipes
List-ID: <linux-parisc.vger.kernel.org>

I had another look at the fixincludes problem, and found the following:

14:36:08 write(5, "cd /scsi/tmp\nfile=sys/stat.h\nif ( test  -r types/vxTypesOld.h ) > /dev/null 2>&1\nthen echo TRUE\nelse echo FALSE\nfi\n\necho\necho ShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n", 158) = 158
14:36:08 alarm(10)                      = 0
14:36:08 read(6, "FALSE\n", 4096)       = 6
14:36:08 alarm(10)                      = 10
14:36:08 read(6, "FALSE\nShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n", 4096) = -512
14:36:18 --- SIGALRM (Alarm clock) ---
14:36:18 read(6, "FALSE\nShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n", 4096) = -512
14:36:28 --- SIGINT (Interrupt) ---
14:36:28 +++ killed by SIGINT +++

fd 5 and 6 are pipes to a /bin/sh.  -512 is ERESTARTSYS.  ERESTARTSYS
shouldn't happen, and is why fixincludes is bombing.

Nothing suspicious in previous rt_sigaction calls as far as I could see,
and putting in a debugging printk in do_sigaction shows sa_flags is being
set correctly, to 0x40.

Ideas?
