Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id AD83A482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 26 Mar 2003 20:54:56 -0700 (MST)
From: Ryan Bradetich <rbradetich@uswest.net>
To: carlos@baldric.uwo.ca
Cc: parisc-linux@lists.parisc-linux.org
Content-Type: multipart/mixed; boundary="=-Lp0P6uaGCXWpVRqCJe3c"
Message-Id: <1048737294.8659.55.camel@beavis.ybsoft.com>
Mime-Version: 1.0
Date: 26 Mar 2003 20:54:55 -0700
Subject: [parisc-linux] FWD: [PATCH] glibc fix for /lib/ld.so.1 (with attachments this
 time)
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

--=-Lp0P6uaGCXWpVRqCJe3c
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello parisc-linux hackers,

Finally tracked down the glibc problem (with help from tausq and others
:)).  I have attached the changelog entry, and the dpatch.  I am
assuming you will push it upstream Carlos?


When working on this problem it caused a gcc ICE.  The gcc ICE has been
reported at:


http://gcc.gnu.org/cgi-bin/gnatsweb.pl?cmd=view%20audit-trail&database=gcc&pr=10215

This is why the ENTRY_POINT macro is uglier than really necessary.

Once this patch is in glibc, then we can remove the RGH_FIX hack
from the 2.4 kernels as well.

oh.  This patch fixes this assert in glibc:

rbrad@vega:~$ /lib/ld.so.1 --verify /bin/sh
Inconsistency detected by ld.so: rtld.c: 879: dl_main: Assertion
`_rtld_local._dl_rtld_map.l_libname' failed!

Thanks!

- Ryan
-- 
Ryan Bradetich <rbradetich@uswest.net>

--=-Lp0P6uaGCXWpVRqCJe3c
Content-Disposition: attachment; filename=changelog.entry
Content-Type: text/plain; name=changelog.entry; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

2003-03-26  Ryan Bradetich  <rbrad@parisc-linux.org>

	* sysdeps/hppa/elf/entry.h: New file.

--=-Lp0P6uaGCXWpVRqCJe3c
Content-Disposition: attachment; filename=hppa-entry.dpatch
Content-Type: text/x-sh; name=hppa-entry.dpatch; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

#! /bin/sh -e

# All lines beginning with `# DP:' are a description of the patch.
# DP: Description: <your description>
# DP: Author:
# DP: Upstream status: [In CVS | Debian-Specific | Pending | Not submitted ]
# DP: Status Details:
# DP: Date:

if [ $# -ne 2 ]; then
    echo >&2 "`basename $0`: script expects -patch|-unpatch as argument"
    exit 1
fi
case "$1" in
    -patch) patch -d "$2" -f --no-backup-if-mismatch -p1 < $0;;
    -unpatch) patch -d "$2" -f --no-backup-if-mismatch -R -p1 < $0;;
    *)
	echo >&2 "`basename $0`: script expects -patch|-unpatch as argument"
	exit 1
esac
exit 0

# append the patch here and adjust the -p? flag in the patch calls.
--- /dev/null	2003-01-25 02:37:00.000000000 -0700
+++ glibc-2.3.1/sysdeps/hppa/elf/entry.h	2003-03-27 03:55:34.000000000 -0700
@@ -0,0 +1,10 @@
+#ifndef __ASSEMBLY__
+extern void _start (void);
+#endif
+
+/* The function's entry point is stored in the first word of the
+   function descriptor (plabel) of _start().  */
+#define ENTRY_POINT ({long int *tmp = (long int *)((long)_start & ~2); tmp[0];})
+
+/* We have to provide a special declaration.  */
+#define ENTRY_POINT_DECL(class) class void _start (void);

--=-Lp0P6uaGCXWpVRqCJe3c--
