Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc3-hem11-4-cust123.bre.cable.ntl.com [213.107.179.123])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4D23C4855
	for <parisc-linux@lists.parisc-linux.org>; Sat, 20 Jul 2002 04:24:15 -0600 (MDT)
Date: Sat, 20 Jul 2002 10:21:54 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20020720092154.GG29996@sleepie.demon.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] initial merge of 2.4 asm-parisc to 2.5 tree
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

I've done an initial merge of 2.4 asm-parisc to 2.5, I wont commit it in
case someone else is doing the same thing.  You can find a tarball at
ftp.p-l.o:src/asm-parisc-2.5.tgz

Basically, I looked at diffs bewteen 2.5.0 and 2.5.26, and between 2.5.26
and 2.5.26-pa0, then copied 2.4 over 2.5, then applied those diffs as I
thought appropriate.  Obviously still doesn't compile or anything, but
it should be a better.

I, or someone else, can apply that tarball if people agree.

Richard
