Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id XAA19839
	for <parisc-linux@puffin.external.hp.com>; Sat, 4 Nov 2000 23:14:54 -0700
Received: from gag.com (localhost [127.0.0.1])
	by rover.gag.com (Postfix) with ESMTP id 9FF2835E20
	for <parisc-linux@thepuffingroup.com>; Sat,  4 Nov 2000 23:16:29 -0700 (MST)
To: parisc-linux@thepuffingroup.com
Date: Sat, 04 Nov 2000 23:16:29 -0700
From: Bdale Garbee <bdale@gag.com>
Message-Id: <20001105061629.9FF2835E20@rover.gag.com>
Subject: [parisc-linux] compiler bug?
List-ID: <linux-parisc.vger.kernel.org>

In the build of util-linux, compilation of fdisk/fdiskbsdlabel.c fails as 
shown below.  I have placed "gcc -E" output on pehc in ~bdale/fdiskbsdlabel.E
for reference.  

Hacking the makefiles to remove "-O -O2" allows the compile to complete 
cleanly.  

I assume this means something in the compiler is broken?

Bdale



bdale@j5k:/space/debian/util-linux-2.10o/fdisk $ cc -c -O -O2 -fomit-frame-pointer -I../lib -Wall -Wmissing-prototypes -Wstrict-prototypes -DNCH=1  -DSBINDIR=\"/sbin\" -DUSRSBINDIR=\"/usr/sbin\" -DLOGDIR=\"/var/log\" -DVARPATH=\"/var\" -DLOCALEDIR=\"/usr/share/locale\" fdiskbsdlabel.c -o fdiskbsdlabel.o
/usr/include/linux/string.h:12: parse error before "__extension__"
/usr/include/linux/string.h:12: parse error before '&&' token
/usr/include/linux/string.h:14: parse error before "__extension__"
/usr/include/linux/string.h:14: parse error before '(' token
/usr/include/linux/string.h:15: parse error before "__extension__"
/usr/include/linux/string.h:15: parse error before '&&' token
/usr/include/linux/string.h:24: parse error before "__extension__"
/usr/include/linux/string.h:27: parse error before "__extension__"
/usr/include/linux/string.h:33: parse error before "__extension__"
/usr/include/linux/string.h:36: parse error before "__extension__"
/usr/include/linux/string.h:36: parse error before '&&' token
/usr/include/linux/string.h:36: parse error before '}' token
/usr/include/linux/string.h:36: conflicting declarations of `__result'
/usr/include/linux/string.h:36: `__result' previously declared here
/usr/include/linux/string.h:36: parse error before ')' token
/usr/include/linux/string.h:36: `__s2' undeclared here (not in a function)
/usr/include/linux/string.h:36: parse error before ';' token
/usr/include/linux/string.h:36: conflicting declarations of `__result'
/usr/include/linux/string.h:36: `__result' previously defined here
/usr/include/linux/string.h:36: parse error before '}' token
/usr/include/linux/string.h:36: parse error before '}' token
/usr/include/linux/string.h:36: redefinition of `__result'
/usr/include/linux/string.h:36: `__result' previously defined here
/usr/include/linux/string.h:36: `__s1' undeclared here (not in a function)
/usr/include/linux/string.h:36: parse error before ')' token
/usr/include/linux/string.h:36: parse error before ';' token
/usr/include/linux/string.h:36: conflicting declarations of `__result'
/usr/include/linux/string.h:36: `__result' previously defined here
/usr/include/linux/string.h:36: parse error before '}' token
/usr/include/linux/string.h:39: parse error before "__extension__"
/usr/include/linux/string.h:39: parse error before '&&' token
/usr/include/linux/string.h:39: parse error before '}' token
/usr/include/linux/string.h:39: redefinition of `__result'
/usr/include/linux/string.h:36: `__result' previously defined here
/usr/include/linux/string.h:39: parse error before ')' token
/usr/include/linux/string.h:39: `__s2' undeclared here (not in a function)
/usr/include/linux/string.h:39: parse error before ';' token
/usr/include/linux/string.h:39: conflicting declarations of `__result'
/usr/include/linux/string.h:39: `__result' previously defined here
/usr/include/linux/string.h:39: parse error before '}' token
/usr/include/linux/string.h:39: parse error before '}' token
/usr/include/linux/string.h:39: redefinition of `__result'
/usr/include/linux/string.h:39: `__result' previously defined here
/usr/include/linux/string.h:39: `__s1' undeclared here (not in a function)
/usr/include/linux/string.h:39: parse error before ')' token
/usr/include/linux/string.h:39: parse error before ';' token
/usr/include/linux/string.h:39: conflicting declarations of `__result'
/usr/include/linux/string.h:39: `__result' previously defined here
/usr/include/linux/string.h:39: parse error before '}' token
/usr/include/linux/string.h:45: parse error before "__extension__"
/usr/include/linux/string.h:51: parse error before "__extension__"
/usr/include/linux/string.h:61: parse error before "__extension__"
/usr/include/linux/string.h:61: parse error before '\x0'
/usr/include/linux/string.h:61: parse error before '}' token
fdiskbsdlabel.c: In function `xbsd_zaplabel':
fdiskbsdlabel.c:840: warning: `sector' might be used uninitialized in this function
bdale@j5k:/space/debian/util-linux-2.10o/fdisk $ 
