From: Randolph Chung <tausq@debian.org>
Subject: [3.3 regression] [parisc-linux] ICE when building lesstif1 at -O1/O2
Date: Mon, 17 Mar 2003 21:34:40 -0800
Message-ID: <20030318053440.GO26139__40204.8797499903$1416622296$gmane$org@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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
>Originator:	Randolph Chung <tausq@debian.org>
>Organization:	Debian
>Confidential:	no
>Synopsis:	[3.3 regression] [parisc-linux] ICE when building lesstif1 at -O1/O2
>Severity:	serious
>Priority:	medium
>Category:	optimization
>Class:		ice-on-legal-code
>Release:	3.3 20030309 (Debian prerelease) (Debian testing/unstable)
>Environment:
System: Linux gsyprf11.external.hp.com 2.4.20-pa18-UP #1 Sat Jan 4 22:06:52 PST 2003 parisc64 unknown unknown GNU/Linux
Architecture: parisc64

	<machine, os, target, libraries (multiple lines)>
host: hppa-unknown-linux-gnu
build: hppa-unknown-linux-gnu
target: hppa-unknown-linux-gnu
configured with: ../src/configure -v --enable-languages=c,c++,f77,objc,ada,treelang --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info --with-gxx-include-dir=/usr/include/c++/3.3 --enable-shared --with-system-zlib --enable-nls --without-included-gettext --enable-__cxa_atexit --enable-sjlj-exceptions --enable-clocale=gnu --enable-debug --enable-objc-gc hppa-linux
>Description:
Test program below is extracted from lesstif1 (v0.93.36). 
Compiles fine without -O, but with -O1 or -O2 it aborts. The code 
compiles fine with gcc-3.2.3

bash-2.05b# gcc -O1 -v -c bug.c
Reading specs from /usr/lib/gcc-lib/hppa-linux/3.3/specs
Configured with: ../src/configure -v --enable-languages=c,c++,f77,objc,ada,treelang --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info --with-gxx-include-dir=/usr/include/c++/3.3 --enable-shared --with-system-zlib --enable-nls --without-included-gettext --enable-__cxa_atexit --enable-sjlj-exceptions --enable-clocale=gnu --enable-debug --enable-objc-gc hppa-linux
Thread model: posix
gcc version 3.3 20030309 (Debian prerelease)
 /usr/lib/gcc-lib/hppa-linux/3.3/cc1 -quiet -v -D__GNUC__=3 -D__GNUC_MINOR__=3 -D__GNUC_PATCHLEVEL__=0 bug.c -quiet -dumpbase bug.c -auxbase bug -O1 -version -o /tmp/ccrpBE2v.s
GNU C version 3.3 20030309 (Debian prerelease) (hppa-linux)
        compiled by GNU C version 3.3 20030309 (Debian prerelease).
GGC heuristics: --param ggc-min-expand=30 --param ggc-min-heapsize=4096
ignoring nonexistent directory "/usr/hppa-linux/include"
#include "..." search starts here:
#include <...> search starts here:
 /usr/local/include
 /usr/lib/gcc-lib/hppa-linux/3.3/include
 /usr/include
End of search list.
bug.c: In function `get_modifier_mapping':
bug.c:44: internal compiler error: Aborted
Please submit a full bug report,
with preprocessed source if appropriate.
See <URL:http://www.gnu.org/software/gcc/bugs.html> for instructions.


>How-To-Repeat:
	gcc -O1 -c bug.c

------- 8< bug.c 8<------
typedef struct {
	int max_keypermod;
} XModifierKeymap;

#define XK_Meta_L               0xFFE7  /* Left meta */
#define XK_Meta_R               0xFFE8  /* Right meta */
#define XK_Alt_L                0xFFE9  /* Left alt */
#define XK_Alt_R                0xFFEA  /* Right alt */
#define Mod1Mask            (1<<3)

unsigned int blah(void);

static int
get_modifier_mapping(void *Dsp)
{
    XModifierKeymap *mk;
    unsigned int ModifierKeysym;
    int ModifierSet, SetIndex, SetSize;
    int AltMask = Mod1Mask;

    SetSize = mk->max_keypermod;

    for (ModifierSet = 0; ModifierSet < 8; ModifierSet++)
    {
	for (SetIndex = 0; SetIndex < SetSize; SetIndex++)
	{
	    ModifierKeysym = blah();
	    switch (ModifierKeysym)
	    {
	    case XK_Meta_L:
	    case XK_Meta_R:
		AltMask = 1L << ModifierSet;
		goto bailout;
	    case XK_Alt_L:
	    case XK_Alt_R:
		AltMask = 1L << ModifierSet;
		goto bailout;
	    }
	}
    }

  bailout:
    return AltMask;
}
------- 8< bug.c 8<------

>Fix:
	unknown
