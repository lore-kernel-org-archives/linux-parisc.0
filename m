Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from web12504.mail.yahoo.com (web12504.mail.yahoo.com [216.136.173.196])
	by dsl2.external.hp.com (Postfix) with SMTP id 652194829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  7 Apr 2003 08:43:52 -0600 (MDT)
Message-ID: <20030407144351.44780.qmail@web12504.mail.yahoo.com>
Date: Mon, 7 Apr 2003 07:43:51 -0700 (PDT)
From: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Still having raid issues
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

Ok, still having the same Raid creation issues from last week.  The
only thing I can thing of is that my Make of the new CVS palo is
screwy.  First time outside of class that I've actually had to install
something from source so I included my make below.  What bothers me is
the error that it can't stat iplboot.  I'm assuming that the iplboot
coded isn't getting updated and that's why when I use palo to make my
disk bootable that I keep getting the old 1.0 version of palo written
to my new raid disk.  So if you guys could just let me know how I
screwed up this make (if I did of course), it would be much
appreciated.

green:/tmp# ls -a
.          .X0-lock    file87OL3i    mcop-root        ssh-XXssqJ2K
..         .X11-unix   kde-root      palo             texm9z8I9
.ICE-unix  dcopYtUfU5  ksocket-root  palo-latest.tar  texvdK3FW
green:/tmp# cd palo
green:/tmp/palo# make
cd palo && make
make[1]: Entering directory `/tmp/palo/palo'
gcc -g -O -I../include -I../lib   -c -o diskpart.o ../lib/diskpart.c
gcc -g -O -I../include -I../lib   -c -o elf64.o ../lib/elf64.c
gcc -g -O -I../include -I../lib   -c -o load.o ../lib/load.c
gcc -g -O -I../include -I../lib   -c -o paloio.o paloio.c
gcc -g -O -I../include -I../lib   -c -o elf32.o ../lib/elf32.c
sed 's/.*/"&\\n"/' < usage.txt > usage.h
gcc -g -O -I../include -I../lib   -c -o error.o error.c
gcc -g -O -I../include -I../lib   -c -o palo.o palo.c
ar rv palo.a diskpart.o elf64.o load.o paloio.o elf32.o error.o palo.o
a - diskpart.o
a - elf64.o
a - load.o
a - paloio.o
a - elf32.o
a - error.o
a - palo.o
echo "char *bld_info = \"`whoami`@`hostname` `date`\";" > build.c
gcc -g -O -I../include -I../lib -c -o build.o build.c
rm -f build.c
gcc -g -O -I../include -I../lib  -o palo palo.a build.o
gcc -g -O -I../include -I../lib   -c -o mkbootable.o mkbootable.c
gcc -g -O -I../include -I../lib  -o mkbootable mkbootable.o elf64.o
load.o paloio.o elf32.o error.o
make[1]: Leaving directory `/tmp/palo/palo'
green:/tmp/palo# make  DESTDIR=/ install
cd palo && make
make[1]: Entering directory `/tmp/palo/palo'
make[1]: Nothing to be done for `all'.
make[1]: Leaving directory `/tmp/palo/palo'
gzip -9 < palo.8 > palo.8.gz
gzip -9 < debian/changelog > changelog.gz
install -o root -g root -d //usr/share/doc/palo \
                //etc //sbin \
                //usr/share/palo \
                //usr/share/man/man8
install -o root -g root -m644 palo.conf //usr/share/doc/palo
install -o root -g root palo/palo //sbin
install -o root -g root -m444 iplboot //usr/share/palo
install: cannot stat `iplboot': No such file or directory
make: *** [install] Error 1
green:/tmp/palo# palo -? | grep version
palo version 1.2 root@green Mon Apr  7 08:38:10 CDT 2003

Thanks,
derek


__________________________________________________
Do you Yahoo!?
Yahoo! Tax Center - File online, calculators, forms, and more
http://tax.yahoo.com
