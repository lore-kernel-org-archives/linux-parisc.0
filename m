Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp1.xs4all.nl (smtp1.xs4all.nl [194.109.127.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2D269482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 29 Aug 2001 23:33:35 -0600 (MDT)
Received: from rivierenland.xs4all.nl (rivierenland.xs4all.nl [194.109.14.47])
	by smtp1.xs4all.nl (8.9.3/8.9.3) with ESMTP id HAA26934
	for <parisc-linux@lists.parisc-linux.org>; Thu, 30 Aug 2001 07:33:11 +0200 (CEST)
From: thunder7@xs4all.nl
Date: Thu, 30 Aug 2001 07:32:55 +0200
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010830073255.A9044@middle.of.nowhere>
Reply-To: thunder7@xs4all.nl
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [newbie] gcc/glibc problems
List-ID: <linux-parisc.vger.kernel.org>

I installed the 0.9.2 iso on my C200, then proceeded to get some
development tools installed. This seemed to go well, but this simple
test-program:

#include <stdio.h>

int main(void)
{
   printf("int=%d\n", sizeof(int));
   exit(0);
}

didn't compile at all:

In file included from test.c:1:
/usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:37:23: features.h: No such file or directory
In file included from /usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:43,
                 from test.c:1:
/usr/lib/gcc-lib/hppa-linux/3.0.2/include/stddef.h:199: syntax error before "typedef"
In file included from test.c:1:
/usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:45:25: bits/types.h: No such file or directory
/usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:74:19: libio.h: No such file or directory
In file included from test.c:1:
/usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:89: parse error before "fpos_t"
/usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:138:28: bits/stdio_lim.h: No such file or directory
/usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:151: parse error before "__THROW"
/usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:153: parse error before "__THROW"
/usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:158: parse error before "__THROW"
/usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:170: parse error before "__THROW"
/usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:193: parse error before "__THROW"
/usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:195: parse error before "__THROW"
/usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:211: parse error before "__THROW"
/usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:215: parse error before "__THROW"
/usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:263: parse error before "__THROW"
/usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:268: parse error before "__THROW"
/usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:283: parse error before "__THROW"
/usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:285: parse error before "__THROW"
/usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:288: parse error before "__THROW"
/usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:292: parse error before "_G_va_list"
/usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:294: parse error before "_G_va_list"
/usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:298: parse error before "_G_va_list"
/usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:335: parse error before "__THROW"
/usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:337: parse error before "__THROW"
/usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:340: parse error before "__THROW"
/usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:360: parse error before "__THROW"
/usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:361: parse error before "__THROW"
/usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:364: parse error before "__THROW"
/usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:383: parse error before "__THROW"
/usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:384: parse error before "__THROW"
/usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:387: parse error before "__THROW"
/usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:416: parse error before "__THROW"
/usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:426: parse error before "__THROW"
/usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:451: parse error before "__THROW"
/usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:460: parse error before "__THROW"
/usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:464: parse error before "__THROW"
/usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:469: parse error before "__THROW"
/usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:472: parse error before "__THROW"
/usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:484: parse error before "__THROW"
/usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:486: parse error before "__THROW"
/usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:488: parse error before "__THROW"
/usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:504: parse error before "fpos_t"
/usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:507: parse error before '*' token
/usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:540: parse error before "__THROW"
/usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:542: parse error before "__THROW"
/usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:544: parse error before "__THROW"
/usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:555: parse error before "__THROW"
test.c:3: syntax error before "int"

The same source compiles fine on my intel box. 

gcc -v says:

jurriaan@pa8200:~$ gcc -v
Reading specs from /usr/lib/gcc-lib/hppa-linux/3.0.2/specs
Configured with: ../src/configure -v --enable-languages=c,c++,f77,proto,objc --prefix=/usr --infodir=/share/info --mandir=/share/man
--enable-shared --with-gnu-as --with-gnu-ld --with-system-zlib --enable-long-long --enable-nls --without-included-gettext --disable-c
hecking --enable-threads=posix --with-cpp-install-dir=bin hppa-linux
Thread model: posix
gcc version 3.0.2 20010825 (Debian prerelease)
jurriaan@pa8200:~$

which seems recent enough.

Did I miss something? Or is this 'Debian prerelease' not the one I should
get? I used

apt-get update
apt-get upgrade
apt-get install gcc

Pointers to FAQs gratefully accepted, BTW.

Greetings,
Jurriaan
-- 
You can't leave now! You just won!
	DS 9 - Quark
GNU/Linux 2.4.9-ac2 SMP/ReiserFS 2x1402 bogomips load av: 0.04 0.05 0.05
