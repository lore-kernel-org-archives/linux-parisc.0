Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from student.cs.ucc.ie (student.cs.ucc.ie [143.239.211.125])
	by dsl2.external.hp.com (Postfix) with ESMTP id 17A87482C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Nov 2001 12:55:09 -0700 (MST)
Received: from localhost (xam@localhost)
	by student.cs.ucc.ie (8.9.3/8.9.3) with ESMTP id TAA13856
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Nov 2001 19:55:28 GMT
Date: Mon, 19 Nov 2001 19:55:28 +0000 (GMT)
From: Markus Grabert <xam@student.cs.ucc.ie>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.OSF.4.41.0111191946450.11606-100000@student.cs.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] gcc-3.x and the kernel
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

I'm a little bit confused.

Some ports (such as parisc, sparc, sparc64 ...) use gcc-3.x in their
distributions, even to compile the linux kernel.
IMHO they use the lastest gcc since it has better support and more recent
bug fixes for the according platforms.
But I've read that gcc-3.0.x is not officially supported as a kernel
compiler, since is still has some bugs. Are these bugs just x86 related
(I doubt it) or do you accept the risk that gcc might produce garbage ?
Does this actually happen ?

greetings max
