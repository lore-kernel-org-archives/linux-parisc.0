Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from droid3.webreklam.hu (para.abs0lut.com [195.56.113.143])
	by dsl2.external.hp.com (Postfix) with ESMTP id 732FB482A
	for <parisc-linux@parisc-linux.org>; Mon,  4 Jun 2001 04:19:03 -0600 (MDT)
Received: from localhost (diab@localhost)
	by droid3.webreklam.hu (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id MAA21589
	for <parisc-linux@parisc-linux.org>; Mon, 4 Jun 2001 12:19:02 +0200
Date: Mon, 4 Jun 2001 12:19:02 +0200 (CEST)
From: diab <diab@diab.rulez.org>
To: parisc-linux@parisc-linux.org
Message-ID: <Pine.LNX.4.21.0106041203450.21361-100000@droid3.webreklam.hu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] dpkg-utils, ./configure --host, mysql3.23
List-ID: <linux-parisc.vger.kernel.org>

just tried to apt-get source wget to make a debianized version of it, but
dpkg-utils (which contains dpkg-source) depends on perl5 which is not
installed. this way it is kind of hard to simply make debs using the
usual apt-get source approach.

anyways i found the older ./configure -s (which displays unknown host
type) will just run fine using --host=hppa-pc-linux-gnu or
hppa-hp-linux-gnu.

still no luck compiling mysql 3.23.38 so far :( i tried with different
options, but in /client (which is quite "far" from the beginning, i mean
lotsa compiling succeeds) i just keep getting:

snowball:/usr/local/src/mysql-3.23.38/client# make
/bin/sh ../libtool --mode=link gcc  -O3 -DDBUG_OFF
-fno-implicit-templates -rdynamic -o mysql  mysql.o readline.o
sql_string.o completion_hash.o -lreadline -lncurses
../libmysql/libmysqlclient.la  -lcrypt -lnsl -lm 
gcc -O3 -DDBUG_OFF -fno-implicit-templates -rdynamic -o .libs/mysql
mysql.o readline.o sql_string.o completion_hash.o -lreadline -lncurses
../libmysql/.libs/libmysqlclient.so -lcrypt -lnsl -lm -lcrypt -lnsl -lm
-Wl,--rpath -Wl,/usr/local/lib/mysql
mysql.o: In function `add_line(String&, char*, char*)':
mysql.o(.text+0x1d50): undefined reference to `std::terminate()'
/usr/bin/ld: mysql.o(.text+0x1d50): cannot find stub entry
00000014__ZSt9terminatev+0
/usr/bin/ld: mysql.o(.text+0x1d50): cannot handle R_PARISC_PCREL17F for
std::terminate()
mysql.o: In function `L948':
mysql.o(.text+0x31e8): undefined reference to `std::terminate()'
/usr/bin/ld: mysql.o(.text+0x31e8): cannot find stub entry
00000014__ZSt9terminatev+0
/usr/bin/ld: mysql.o(.text+0x31e8): cannot handle R_PARISC_PCREL17F for
std::terminate()
collect2: ld returned 1 exit status
make: *** [mysql] Error 1

any1 has an idea what can i do to make it work? i tried --without-readline
(as it seems this error might be around readline) but no luck with the
built in libreadline*so so far.

the other thing is: it seems that this list is rather
hardware/kernel/low level programming oriented, not dealing w/ 
software issues that much.
if this is the case, which is the best list to discuss sw issues?

regards,

--
diab 
		
