Received: from mailserv2.iuinc.com (mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA16802
	for <parisc-linux@puffin.external.hp.com>; Thu, 21 Dec 2000 17:56:46 -0700
Received: from carmen.fc.hp.com (carmen.fc.hp.com [15.1.51.72])
	by atlrel1.hp.com (Postfix) with ESMTP id 4C1225EA
	for <parisc-linux@thepuffingroup.com>; Thu, 21 Dec 2000 19:59:36 -0500 (EST)
Received: from carmen.fc.hp.com (localhost [127.0.0.1])
	by carmen.fc.hp.com (Postfix) with ESMTP id 798A737C9E
	for <parisc-linux@thepuffingroup.com>; Thu, 21 Dec 2000 13:16:49 -0700 (MST)
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 21 Dec 2000 13:16:49 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20001221201649.798A737C9E@carmen.fc.hp.com>
Subject: [parisc-linux] 64bit xgcc build failing
List-ID: <linux-parisc.vger.kernel.org>

The 64bit cross-gcc build(devel branch) is failing with the following error,

------------------------------------------------------------------------------
gcc -c -DCROSS_COMPILE -DIN_GCC    -g -O2 -W -Wall -Wwrite-strings 
-Wstrict-prototypes -Wmissing-prototypes -Wtraditional -pedantic 
-Wno-long-long  -DHAVE_CONFIG_H    -I. -I. -I/home/al-76/puffin/palinux/gcc/gcc
 -I/home/al-76/puffin/palinux/gcc/gcc/. -I/home/al-76/puffin/palinux/gcc/gcc/co
nfig -I/home/al-76/puffin/palinux/gcc/gcc/../include 
/home/al-76/puffin/palinux/gcc/gcc/varasm.c -o varasm.o
/home/al-76/puffin/palinux/gcc/gcc/varasm.c: In function 
`assemble_trampoline_template':
/home/al-76/puffin/palinux/gcc/gcc/varasm.c:1868: warning: assignment discards 
qualifiers from pointer target type
/home/al-76/puffin/palinux/gcc/gcc/varasm.c: In function `assemble_integer':  
/home/al-76/puffin/palinux/gcc/gcc/varasm.c:1910: parse error before `0'  
/home/al-76/puffin/palinux/gcc/gcc/varasm.c:1910: warning: statement with no 
effect
make[1]: *** [varasm.o] Error 1
make[1]: *** Waiting for unfinished jobs....
make[1]: Leaving directory `/home/al-76/puffin/xc-build/gcc/gcc'
------------------------------------------------------------------------------

Any ideas?

Thanks,

-- 
Matt Taggart
taggart@fc.hp.com
