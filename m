From: Randolph Chung <tausq@debian.org>
Subject: [parisc-linux] target/10272: [3.0/3.2/3.3/3.4] Floating point args not correctly loaded for function calls
Date: 31 Mar 2003 05:23:01 -0000
Message-ID: <20030331052301.22572.qmail__5365.08401060036$1416622346$gmane$org@sources.redhat.com>
Reply-To: Randolph Chung <tausq@debian.org>
Cc: parisc-linux@lists.parisc-linux.org, debian-gcc@lists.debian.org
To: gcc-gnats@gcc.gnu.org
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Resent-Message-ID: <20030331052600.24817.qmail@sources.redhat.com>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

>Number:         10272
>Category:       target
>Synopsis:       [3.0/3.2/3.3/3.4] Floating point args not correctly loaded for function calls
>Confidential:   no
>Severity:       serious
>Priority:       medium
>Responsible:    unassigned
>State:          open
>Class:          wrong-code
>Submitter-Id:   net
>Arrival-Date:   Mon Mar 31 05:26:00 UTC 2003
>Closed-Date:
>Last-Modified:
>Originator:     Randolph Chung <tausq@debian.org>
>Release:        3.3 20030309 (Debian prerelease) (Debian testing/unstable) [and others]
>Organization:
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

>Release-Note:
>Audit-Trail:
>Unformatted:
