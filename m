Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from crypto.hack.co.za (h-69-3-43-158.PHLAPAFG.covad.net [69.3.43.158])
	by dsl2.external.hp.com (Postfix) with ESMTP id A3ED1482D
	for <parisc-linux@parisc-linux.org>; Tue, 13 May 2003 07:50:07 -0600 (MDT)
Received: from [10.0.1.3] (pcp02226300pcs.rte20201.de.comcast.net [68.32.188.79])
	by crypto.hack.co.za (Postfix) with ESMTP id CF7C71C8AA
	for <parisc-linux@parisc-linux.org>; Tue, 13 May 2003 15:48:11 +0200 (SAST)
Date: Tue, 13 May 2003 09:50:01 -0400
From: Richard Todd <rtodd@antipentium.com>
To: <parisc-linux@parisc-linux.org>
Message-ID: <BAE67049.B2B%rtodd@antipentium.com>
Mime-version: 1.0
Content-type: text/plain; charset="US-ASCII"
Subject: [parisc-linux] System hanging
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

Hello all,
I am currently running on a J5000
2000 root # uname -a
Linux k2000 2.4.20-pa35 #2 SMP Sat May 10 10:36:26 EDT 2003 parisc unknown
unknown GNU/Linux


Gcc is as follows:
k2000 root # gcc -v
Reading specs from /usr/lib/gcc-lib/hppa2.0-unknown-linux-gnu/3.2.2/specs
Configured with: /var/tmp/portage/gcc-3.2.2/work/gcc-3.2.2/configure
--prefix=/usr --bindir=/usr/hppa2.0-unknown-linux-gnu/gcc-bin/3.2
--includedir=/usr/lib/gcc-lib/hppa2.0-unknown-linux-gnu/3.2.2/include
--datadir=/usr/share/gcc-data/hppa2.0-unknown-linux-gnu/3.2
--mandir=/usr/share/gcc-data/hppa2.0-unknown-linux-gnu/3.2/man
--infodir=/usr/share/gcc-data/hppa2.0-unknown-linux-gnu/3.2/info
--enable-shared --host=hppa2.0-unknown-linux-gnu
--target=hppa2.0-unknown-linux-gnu --with-system-zlib
--enable-languages=c,c++,ada,f77,objc --enable-threads=posix
--enable-long-long --disable-checking --enable-cstdio=stdio
--enable-clocale=generic --enable-__cxa_atexit
--enable-version-specific-runtime-libs
--with-gxx-include-dir=/usr/lib/gcc-lib/hppa2.0-unknown-linux-gnu/3.2.2/incl
ude/g++-v3 --with-local-prefix=/usr/local --enable-shared --enable-nls
--without-included-gettext
Thread model: posix
gcc version 3.2.2


This issue I am having is during compiling andthing big the box has a
tendency to just hang hard meaning power cord reboot. Has anyone seen this
before. I have a gig of ram and it does not seem to be a memory issue. I am
currently compiling KDE and it just hangs the box every now and then...
Anyone ? 
