From: tausq@debian.org
Subject: [parisc-linux] [hppa-linux, gcc-3.2 regression] structure copy clobbers stores to substructure
Date: Tue, 28 Jan 2003 21:04:20 -0800 (PST)
Message-ID: <20030129050420.E9143CDA56__26691.655527293$1416622156$gmane$org@pippin.tausq.org>
Cc: parisc-linux@lists.parisc-linux.org
To: gcc-gnats@gcc.gnu.org, debian-gcc@lists.debian.org
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

>Submitter-Id:	net
>Originator:	Randolph Chung
>Organization:	Debian
>Confidential:	no
>Synopsis:	Structure copy clobbers subsquent stores to structure
>Severity: serious
>Priority:	medium
>Category:	optimization
>Class:		wrong-code
>Release:	3.2.2 20030124 (Debian prerelease)
>Environment:

System: Linux legolas 2.4.20-pa18 #110 Mon Jan 27 23:44:18 PST 2003 parisc unknown unknown GNU/Linux
Architecture: parisc

        
host: hppa-unknown-linux-gnu
build: hppa-unknown-linux-gnu
target: hppa-unknown-linux-gnu
configured with: ../src/configure -v --enable-languages=c,c++,f77,proto,pascal,objc,ada --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info --with-gxx-include-dir=/usr/include/c++/3.2 --enable-shared --with-system-zlib --enable-nls --without-included-gettext --enable-__cxa_atexit --enable-clocale=gnu --enable-objc-gc hppa-linux
>Description:
	When -O2 is applied, the attach program generates incorrect output.
This test case is extracted from a miscompilation in the linux kernel. 
The code does a structure copy then an assignment to a member of the 
structure. At -O2 (-O1 -fschedule-insns) the assignment is moved before
the structure copy, and subsequently gets clobbered.
>How-To-Repeat:
Compile the following piece of code with gcc-3.2 -O2

/*
** Test to reproduce storing into a substructure getting
** clobbered by a structure copy.
**
** Compile with: gcc -O2 -o pty_test pty_test.c
*/

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

typedef unsigned char cc_t;
typedef unsigned int tcflag_t;
typedef unsigned int __kernel_size_t;
typedef int __kernel_ssize_t;
typedef unsigned short kdev_t;

struct termios {
	tcflag_t c_iflag;
	tcflag_t c_oflag;
	tcflag_t c_cflag;
	tcflag_t c_lflag;
	cc_t c_line;
	cc_t c_cc[19];
};

struct tty_driver {
	int magic;
	const char *driver_name;
	const char *name;
	int name_base;
	short major;
	short minor_start;
        short num;
	short type;
	short subtype;
	struct termios init_termios;
	int flags;
	int *refcount;
};

struct termios tty_std_termios = {1, 2, 3, 4, 5};
static int pty_refcount;
static struct tty_driver pty_driver;

int main(void)
{
        memset(&pty_driver, 0, sizeof(struct tty_driver));
	pty_driver.magic = 0x5402;
	pty_driver.driver_name = "pty_master";

	pty_driver.name = "pty";

	pty_driver.major = 2;
	pty_driver.minor_start = 0;
	pty_driver.num = 256;
	pty_driver.type = 0x0004;
	pty_driver.subtype = 0x0001;

	pty_driver.init_termios = tty_std_termios;
	pty_driver.init_termios.c_iflag = 0;
	pty_driver.init_termios.c_oflag = 0;
	pty_driver.init_termios.c_cflag = 0000017 | 0000060 | 0000200;
	pty_driver.init_termios.c_lflag = 0;

	pty_driver.refcount = &pty_refcount;
	pty_driver.flags = 0x0002 | 0x0004;

	/* clobber the arg registers so the c_lflag value gets reloaded */ 
	close(10);

	printf("pty_driver.init_termios.c_lflag = %d (should be 0)\n", 
		pty_driver.init_termios.c_lflag);

	return 0;
}


>Fix:
	putting a reorder barrier (e.g. asm("")) before the store to 
    c_lflag will workaround the bug
