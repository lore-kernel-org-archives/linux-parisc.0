From: Randolph Chung <tausq@debian.org>
Subject: [parisc-linux] [3.0/3.2/3.3/3.4] [HPPA] Floating point args don't get reloaded across function calls at -O2
Date: 31 Mar 2003 05:05:40 -0000
Message-ID: <20030331050540.17826.qmail__7837.4307523065$1416622345$gmane$org@sources.redhat.com>
Reply-To: Randolph Chung <tausq@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
To: gcc-gnats@gcc.gnu.org
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

>Category:       target
>Synopsis:       [3.0/3.2/3.3/3.4] [HPPA] Floating point args don't get reloaded across function calls at -O2
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
When compiling the bug.c code below with -O2, the floating point argument to the fprintf does not get reloaded for the second fprintf() call, so the second call prints junk. At -O1 the arguments (r23/r24) are properly reloaded.
>How-To-Repeat:
Compile with gcc -O2 -o bug bug.c -lm
$ ./bug
nan
1.422968e-309

With -O1
$ ./bug
nan
nan

------8< bug.c 8<--------
#include <stdio.h>
#include <math.h>

void doprint(double dval)
{
        fprintf(stdout, "%e\n", dval);
        fprintf(stdout, "%e\n", dval);
}

int main(int argc, char **argv)
{
        doprint(log(-8)); /* nan */
        return 0;
}
>Fix:

>Unformatted:
