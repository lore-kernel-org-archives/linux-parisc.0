Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from student.cs.ucc.ie (student.cs.ucc.ie [143.239.211.125])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2B3A1482C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Nov 2001 12:40:10 -0700 (MST)
Received: from localhost (xam@localhost)
	by student.cs.ucc.ie (8.9.3/8.9.3) with ESMTP id TAA23428
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Nov 2001 19:40:28 GMT
Date: Mon, 19 Nov 2001 19:40:28 +0000 (GMT)
From: Markus Grabert <xam@student.cs.ucc.ie>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.OSF.4.41.0111191911120.11606-100000@student.cs.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] State of official Linux kernel
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

I'm just curious what the state of the PA-RISC support of the
official linux kernel is (2.4.14 from kernel.org).

IMHO I assume that the latest Linux/PA-RISC progress didn't and won't
make it in the official linux kernel tree (at least not soon), am I right ?
(I don't see any hppa changes in the kernel-Changelogs at all)

Probably due to the fact that Linux/PA-RISC is still somewhat
experimental and probably some design issues are not fixed yet.
Are there any plans to integrate the lastest stuff into the
linux main tree (soon) ?

What about gcc, gdb, glibc and binutils ? How long do you think does it
take to get the current fixes/patches into a release ?

AFAIK RedHat/Cygnus supports/maintains gcc, gdb, glibc and binutils.
Are there (usually) any problems to get the patches/fixes (of gcc, gdb,
...) into a official release ? How good is the cooperation with the main
developers of these tools/libraries ? RedHat doesn't seem to be interested
in an Linux/PA-RISC port and debian is something like a competitor ...

Just curious,
  max
