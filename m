From: Randolph Chung <tausq@debian.org>
Subject: [parisc-linux] c++/10438: [3.3 regression] [hppa] Segfault when building jade
Date: 19 Apr 2003 05:14:31 -0000
Message-ID: <20030419051431.17554.qmail__26619.9195677929$1416622402$gmane$org@sources.redhat.com>
Reply-To: Randolph Chung <tausq@debian.org>
Cc: parisc-linux@lists.parisc-linux.org, debian-gcc@lists.debian.org
To: gcc-gnats@gcc.gnu.org
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Resent-Message-ID: <20030419051601.17719.qmail@sources.redhat.com>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

>Number:         10438
>Category:       c++
>Synopsis:       [3.3 regression] [hppa] Segfault when building jade
>Confidential:   no
>Severity:       serious
>Priority:       medium
>Responsible:    unassigned
>State:          open
>Class:          ice-on-legal-code
>Submitter-Id:   net
>Arrival-Date:   Sat Apr 19 05:16:01 UTC 2003
>Closed-Date:
>Last-Modified:
>Originator:     Randolph Chung <tausq@debian.org>
>Release:        gcc version 3.3 20030412 (Debian prerelease)
>Organization:
>Environment:
tausq@ios:~$ uname -a
Linux ios 2.5.67-pa4 #79 Wed Apr 16 20:16:49 PDT 2003 parisc64 unknown unknown GNU/Linux
tausq@ios:~$ g++ -v
Reading specs from /usr/lib/gcc-lib/hppa-linux/3.3/specs
Configured with: ../src/configure -v --enable-languages=c,c++,f77,objc,ada,treelang --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info --with-gxx-include-dir=/usr/include/c++/3.3 --enable-shared --with-system-zlib --enable-nls --without-included-gettext --enable-__cxa_atexit --enable-sjlj-exceptions --enable-clocale=gnu --enable-debug --enable-objc-gc hppa-linux
Thread model: posix
gcc version 3.3 20030412 (Debian prerelease)
>Description:
Building the code below gives:

tausq@ios:~/debian/jade-1.2.1/jade$ g++ -v -c bug.cxx
Reading specs from /usr/lib/gcc-lib/hppa-linux/3.3/specs
Configured with: ../src/configure -v --enable-languages=c,c++,f77,objc,ada,treelang --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info --with-gxx-include-dir=/usr/include/c++/3.3 --enable-shared --with-system-zlib --enable-nls --without-included-gettext --enable-__cxa_atexit --enable-sjlj-exceptions --enable-clocale=gnu --enable-debug --enable-objc-gc hppa-linux
Thread model: posix
gcc version 3.3 20030412 (Debian prerelease)
 /usr/lib/gcc-lib/hppa-linux/3.3/cc1plus -quiet -v -D__GNUC__=3 -D__GNUC_MINOR__=3 -D__GNUC_PATCHLEVEL__=0 -D_GNU_SOURCE bug.cxx -D__GNUG__=3 -quiet -dumpbase bug.cxx -auxbase bug -version -o /tmp/ccExza7t.s
GNU C++ version 3.3 20030412 (Debian prerelease) (hppa-linux)
        compiled by GNU C version 3.3 20030412 (Debian prerelease).
GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
ignoring nonexistent directory "/usr/hppa-linux/include"
#include "..." search starts here:
#include <...> search starts here:
 /usr/include/c++/3.3
 /usr/include/c++/3.3/hppa-linux
 /usr/include/c++/3.3/backward
 /usr/local/include
 /usr/lib/gcc-lib/hppa-linux/3.3/include
 /usr/include
End of search list.
bug.cxx:14: internal compiler error: Segmentation fault
Please submit a full bug report,
with preprocessed source if appropriate.
See <URL:http://gcc.gnu.org/bugs.html> for instructions.

The code builds fine with g++-3.2.

This test case was extracted from the MifFOTBuilder.cxx file from the jade package.
>How-To-Repeat:
g++ -c bug.cxx

--------------8< bug.cxx 8<----------------
template<class T> class String { };

class MifDoc {
  public:
    struct T_string : public String<char> { };
    typedef T_string        T_tagstring;

    struct TagStream {
        enum TagStreamClass { tsTagStream, tsTextFlow, tsCell, tsPara } TagStreamClass;

        T_tagstring InitialPgfTag;
    };

    struct TextFlow : public TagStream { };
};

>Fix:

>Release-Note:
>Audit-Trail:
>Unformatted:
