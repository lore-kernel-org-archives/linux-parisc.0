Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dns2.dot.at (dns2.dot.at [212.9.128.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id AEC934A19
	for <parisc-linux@lists.parisc-linux.org>; Thu,  8 Feb 2001 15:49:21 -0700 (MST)
Received: from dot.at (IDENT:plattner@dot-tc01-005.dot.at [212.9.128.45])
	by dns2.dot.at (8.9.3/8.9.2) with ESMTP id AAA31869
	for <parisc-linux@lists.parisc-linux.org>; Fri, 9 Feb 2001 00:00:21 +0100
Sender: plattner@dns2.dot.at
Message-ID: <3A83226E.A3A77F70@dot.at>
Date: Thu, 08 Feb 2001 23:49:18 +0100
From: Christoph Plattner <christoph.plattner@dot.at>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Initial setup of the `glibc' in the target root file system
List-ID: <linux-parisc.vger.kernel.org>

After the glibc builts perfect, I have a problem in setting up the root
!
How can I install the glibc (/lib) to the root file system.
I tried to do a "perfect copy" of the root via `tar' from
/usr/parisc/hppa-linux 
to /tftpboot/apollo (my nfs mounted root).

But how can I prepare the .../etc/ld.so.cahce file or whatever is
needed.
Using a ldconfig from the host fails, using the -r option for another
root:

	ldconfig -r /tftpboot/apollo

Ldconfig terminates without errors, but the system mounting my NFS-root
crashes
with page fault or with "cannot find libc.6.so". Only the root of the
palinux-0.5
image is working.
Which of the two error reaction occurs depends on the ldconfig and
platform.
I tried ldconfig of RH-6.1 on intel and RH-6.2 on sparc.

Whats the correct way ?

With friendly regards
	Christoph


-- 
-------------------------------------------------------------------------
private:	christoph.plattner@dot.at
company:	christoph.plattner@alcatel.at
