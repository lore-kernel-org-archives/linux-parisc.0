Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dc-mx10.cluster1.charter.net (dc-mx10.cluster1.charter.net [209.225.8.20])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6092C482B
	for <parisc-linux@lists.parisc-linux.org>; Sat, 24 Aug 2002 11:55:08 -0600 (MDT)
Message-ID: <3D67C8AC.2080309@charter.net>
Date: Sat, 24 Aug 2002 13:55:56 -0400
From: "B. Douglas Hilton" <bdhilton@charter.net>
MIME-Version: 1.0
To: debian-hppa@lists.debian.org
Cc: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] Compiling glide-2001.01.26 on hppa
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

I have received my Voodoo2 board and am now working
on building the glide packages for the hppa architecture.
Working with the Debian source...

dpkg-buildpackage fails with the following line:

cc -O6 -m486 -fomit-frame-pointer -funroll-loops \
-fexpensive-optimizations -ffast-math -DBIG_OPT -I. \
-I/usr/src/glide-2001.01.26/build-tree/glide2x/swlibs/include \
-I/usr/src/glide-2001.01.26/build-tree/glide2x/cvg/include \
-DENDB -DX11 -Wall -fPIC -DPIC -c -o fx64.o fx64.c

cc1: Invalid option `486'


My question is, what incantation should I use on hppa to
replace the '-O6 -m486 -f...' CFLAGS?

Also, a side note, I'm missing the vga pass-through cable
for the Voodoo2. If anybody would be interested in swapping
one of the EVC->VGA dongle cables for an EVC->VGA adapter,
I will kick in $10 to sweeten the deal. The adapter works fine.
