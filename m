Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel8.hp.com (atlrel8.hp.com [156.153.255.206])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4164D4829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 14 Jan 2003 13:04:31 -0700 (MST)
Received: from xatlrelay2.atl.hp.com (xatlrelay2.atl.hp.com [15.45.89.191])
	by atlrel8.hp.com (Postfix) with ESMTP id EE52AA00C0D
	for <parisc-linux@lists.parisc-linux.org>; Tue, 14 Jan 2003 15:04:30 -0500 (EST)
Received: from xatlbh2.atl.hp.com (xatlbh2.atl.hp.com [15.45.89.187])
	by xatlrelay2.atl.hp.com (Postfix) with ESMTP id EA67B1C00A5A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 14 Jan 2003 15:04:30 -0500 (EST)
Message-ID: <9A0482A7BD2506488AD9417C93F3714F0114AC06@xsp01.brazil.hp.com>
From: "FARINATI,LEANDRO (HP-Brazil,ex1)" <leandro.farinati@hp.com>
To: "Parisc-Linux List (E-mail)" <parisc-linux@lists.parisc-linux.org>
Date: Tue, 14 Jan 2003 15:04:23 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] 64 bit compiler error
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

I am facing some problems to install compile parisc 64 bit code. Could
anybody help me?

I download and installed the following packages:

gcc package: gcc-hppa64_3.0.4ds3-7.1_hppa.deb
libc6 package: libc6_2.3.1-9_hppa.deb
libdb1-compat package: libdb1-compat_2.1.3-7_hppa.deb

the problem is I'm receiving this error message when I try to compile my
code: 
	hppa64-linux/bin/ld: cannot open crt1.o: No such file or directory

When I try to to place this file in the current directory, I receive the
error message:
	crt1.o: file not recognized: File format not recognized
	collect2: ld returned 1 exit status
Regards,

Leandro Farinati
