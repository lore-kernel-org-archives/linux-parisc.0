Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id A30C9482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 26 Mar 2003 20:52:21 -0700 (MST)
From: Ryan Bradetich <rbradetich@uswest.net>
To: carlos@baldric.uwo.ca
Cc: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain
Message-Id: <1048737139.8777.50.camel@beavis.ybsoft.com>
Mime-Version: 1.0
Date: 26 Mar 2003 20:52:20 -0700
Subject: [parisc-linux] [PATCH] glibc fix for /lib/ld.so.1
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
