Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 07A734829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 13 Dec 2002 15:35:42 -0700 (MST)
Received: from sal.ucc.ie (sal.ucc.ie [143.239.201.201])
	by csmail.ucc.ie (8.11.3/8.11.3/SuSE Linux 8.11.1-0.5) with ESMTP id gBDMaH806588
	for <parisc-linux@lists.parisc-linux.org>; Fri, 13 Dec 2002 22:36:17 GMT
Date: Fri, 13 Dec 2002 22:35:36 +0000 (GMT)
From: "M. Grabert" <xam@cs.ucc.ie>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.44.0212132231260.18468-100000@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] gcc-snapshot (3.3) and linux-2.4.20-pa13
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

Debian's gcc snapshot won't compile the kernel, (probably) due to the
same reason as here:

====
Changes since 1.46: +1 -1 lines
Diff to previous 1.46

2.5.47-pa8: remove reference to $$mulU millicode function for gcc 3.3
=====

at least it's the same error message ('undefined reference ...').

greetings max
