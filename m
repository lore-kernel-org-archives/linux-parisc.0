Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sources.redhat.com (sources.redhat.com [66.187.233.205])
	by dsl2.external.hp.com (Postfix) with SMTP id EB48F4829
	for <parisc-linux@lists.parisc-linux.org>; Sun, 30 Mar 2003 22:23:01 -0700 (MST)
Date: 31 Mar 2003 05:23:01 -0000
Message-ID: <20030331052301.22572.qmail@sources.redhat.com>
To: gcc-gnats@gcc.gnu.org
Cc: parisc-linux@lists.parisc-linux.org, debian-gcc@lists.debian.org
From: Randolph Chung <tausq@debian.org>
Reply-To: Randolph Chung <tausq@debian.org>
Subject: [parisc-linux] [3.0/3.2/3.3/3.4] Floating point args not correctly loaded for function calls
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

>Category:       target
>Synopsis:       [3.0/3.2/3.3/3.4] Floating point args not correctly loaded for function calls
>Confidential:   no
>Severity:       serious
>Priority:       medium
>Class:          wrong-code
>Submitter-Id:   net
>Originator:     Randolph Chung <tausq@debian.org>
>Release:        3.3 20030309 (Debian prerelease) (Debian testing/unstable) [and others]
>Environment:
System: Linux gsyprf11.external.hp.com 2.4.20-pa18-UP #1 Sat Jan 4 22:06:52 PST 2
003 parisc64 unknown unknown GNU/Linux
Architecture: parisc64

        <machine, os, target, libraries (multiple lines)>
host: hppa-unknown-linux-gnu
build: hppa-unknown-linux-gnu
target: hppa-unknown-linux-gnu
configured with: ../src/configure -v --enable-languages=c,c++,f77,objc,ada,treela
ng --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info --with-gxx-inc
lude-dir=/usr/include/c++/3.3 --enable-shared --with-system-zlib --enable-nls --w
ithout-included-gettext --enable-__cxa_atexit --enable-sjlj-exceptions --enable-c
locale=gnu --enable-debug --enable-objc-gc hppa-linux
>Description:
This one looks similar to 10271, but filing separately because the test case is a bit different. Not sure if it's the same bug or not.

At -O2 the floating point argument is not getting loaded into the right registers to pass to fprintf().
>How-To-Repeat:
$ gcc-3.3 -O2 -o bug bug.c -lm
$ ./bug
-1.488583e+284
$ gcc-3.3 -O1 -o bug bug.c -lm
$ ./bug
nan

-------8< bug.c 8<------------
#include <stdio.h>
#include <math.h>

void doprint(double d)
{
        int i = (int)d;
        if ((double)i == d) {
                fprintf(stdout, "%d\n", i);
        } else {
                fprintf(stdout, "%e\n", d);
        }
}

int main(int argc, char **argv)
{
        doprint(log(-8)); /* nan */
        return 0;
}
>Fix:

>Unformatted:
