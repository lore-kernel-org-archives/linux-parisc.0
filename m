Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from gwyn.tux.org (gwyn.tux.org [207.96.122.8])
	by dsl2.external.hp.com (Postfix) with ESMTP id AAEDB482C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 20 Nov 2001 14:42:53 -0700 (MST)
Received: (from timball@localhost)
	by gwyn.tux.org (8.9.3/8.9.1) id QAA10910
	for parisc-linux@lists.parisc-linux.org; Tue, 20 Nov 2001 16:42:52 -0500
Date: Tue, 20 Nov 2001 16:42:51 -0500
From: Timothy Ball <timball@tux.org>
To: parics Linux Mailing List <parisc-linux@lists.parisc-linux.org>
Message-ID: <20011120214251.GA5953@gwyn.tux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] make palo error?
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

I do a make palo and I get an error, but the lifimage file is in
../palo/lifimage. Should I be worried about this?

--snip--snip--snip--
./palo/mkbootable ipl/iplelf iplboot
ELF32 executable
entry 0x60000 size 28652
./palo/palo -f /dev/null \
-b iplboot \
-k /usr/src/parisc/linux/vmlinux \
 \
-c "0/vmlinux HOME=/ TERM=linux root=/dev/sda4  " \
        -s lifimage
palo version 0.97 timball@jane Tue Nov 20 16:08:52 EST 2001
ELF32 executable
calculated xsum 0x4e32b74 got 0x0
calculated xsum 0x4e32b74 got 0x0
make[1]: *** [lifimage-only] Error 2
make[1]: Leaving directory `/usr/src/parisc/palo'
make: *** [palo] Error 2
--snip--snip--snip--

--timball

-- 
	GPG key available on pgpkeys.mit.edu
pub  1024D/511FBD54 2001-07-23 Timothy Lu Hu Ball <timball@tux.org>
Key fingerprint = B579 29B0 F6C8 C7AA 3840  E053 FE02 BB97 511F BD54
