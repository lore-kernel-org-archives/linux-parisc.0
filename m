From: Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: parisc: fix mmap(MAP_FIXED|MAP_SHARED) to already mmapped address
Date: Thu, 19 Dec 2013 21:17:51 +0200
Message-ID: <20131219191750.GC2881@blackmetal.musicnaut.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi,

This commit (0576da2c08e3d332f1b0653030d28ab804585ab6) and the current
mainline kernel (3.13-rc4) gives me the following with GLIBC 2.18:

$ localedef -c -i en_US -f UTF-8 en_US.UTF-8
cannot map archive header: Invalid argument

strace looks like this:

mmap2(NULL, 536870912, PROT_NONE, MAP_SHARED, 3, 0) = 0x42f34000
mmap2(0x43000000, 1607632, PROT_READ|PROT_WRITE, MAP_SHARED|MAP_FIXED, 3, 0) = -1 EINVAL (Invalid argument)

With the patch reverted, it works:

mmap2(NULL, 536870912, PROT_NONE, MAP_SHARED, 3, 0) = 0x42d74000
mmap2(0x43000000, 1607632, PROT_READ|PROT_WRITE, MAP_SHARED|MAP_FIXED, 3, 0) = 0x43000000

BTW, note that for GLIBC 2.18 some changes were done regarding this:
https://sourceware.org/bugzilla/show_bug.cgi?id=10283

A.
