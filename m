Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7F6D8482A
	for <parisc-linux@parisc-linux.org>; Fri, 19 Apr 2002 16:15:38 -0600 (MDT)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id sowsmaaa for parisc-linux@parisc-linux.org; Fri, 19 Apr 2002 15:14:31 -0700
Date: Fri, 19 Apr 2002 15:16:23 -0700
From: Randolph Chung <tausq@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20020419221623.GG32033@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] gcc-3.2 experimental debs
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

I've uploaded an experimental gcc-3.2 debian package to:

ftp://ftp.parisc-linux.org/unofficial-debs/gcc-3.2_20020417-1_hppa.deb 

for people who feel adventurous and wants to try. As the name suggests
it's built from gcc-3.2 cvs from two days ago. The deb is unfortunately
quite large (26M) because it also contains binutils bits and has
c/c++/fortran/objc compilers enabled.

The regression test results are looking quite good, and at least on the
two cases I've tried the functions-sections problems are fixed.

The package installs into /usr/local, and I want to stress here
that these are only for experimental use and are not part of the
official debian release.

Having said that, try them out and let us know how it works out!

Last but not least, thanks Dave for all your efforts! gcc-3.2 looks
really quite a bit better than 3.0.x

randolph
