Received: from cosrel2.hp.com (cosrel2.hp.com [156.153.255.162])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id CAA17904
	for <parisc-linux@puffin.external.hp.com>; Sun, 3 Dec 2000 02:02:20 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by cosrel2.hp.com (Postfix) with ESMTP id EAB9D3AF
	for <parisc-linux@puffin.external.hp.com>; Sun,  3 Dec 2000 02:04:52 -0700 (MST)
Received: (from grundler@localhost)
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) id BAA02744
	for parisc-linux@puffin.external.hp.com; Sun, 3 Dec 2000 01:04:08 -0800 (PST)
Date: Sun, 3 Dec 2000 01:04:08 -0800 (PST)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200012030904.BAA02744@milano.cup.hp.com>
To: parisc-linux@puffin.external.hp.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] 64-bit build broken
List-ID: <linux-parisc.vger.kernel.org>


This could be related to willy's changes - I have no idea.
After setting CROSS-COMPILE = hppa64-linux-

make distclean
make clean
make oldconfig
make -j4 dep
make -j4 palo
...
hppa64-linux-ld: cannot open hardware_proc.o: No such file or directory
make[1]: *** [kernel.o] Error 1
make[1]: Leaving directory `/linux/pa64/linux/arch/parisc64/kernel'


I was able to build/link stuff on Friday...and it's way past my bedtime now.

grant
