Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 536E84A19
	for <parisc-linux@lists.parisc-linux.org>; Fri, 16 Mar 2001 04:56:23 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id C65AEB007; Fri, 16 Mar 2001 11:55:35 +0000 (GMT)
Date: Fri, 16 Mar 2001 11:55:35 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010316115535.X31505@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] New glibc on 715/75
List-ID: <linux-parisc.vger.kernel.org>

I am trying the glibc etc from newcompilers-20010314 on my 715/75.
It seems anything that is dynamically linked hangs on exit.

I am booting with init=/bin/sash, and have static and dynamic
versions of hello-world (in C, not C++), and of gdb.

I can run the static programs ok, but if I run the dynamic hello-world
it outputs HelloWorld and then goes to sleep.  Console still echoes,
but I don't get the sash prompt back.

This isn't a particularly new problem - I havn't had a working 715/75
root fs since the attempt to part-fix libpthread.

Richard
