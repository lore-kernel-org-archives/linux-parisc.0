Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 68716482B
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Mar 2003 09:19:16 -0700 (MST)
Received: from ns1.ybsoft.com (ns1.ybsoft.com [10.0.0.2])
	by beavis.ybsoft.com (Postfix) with ESMTP id D24692B101
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Mar 2003 09:19:14 -0700 (MST)
From: Ryan Bradetich <rbradetich@uswest.net>
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain
Message-Id: <1047917954.14507.15.camel@beavis.ybsoft.com>
Mime-Version: 1.0
Date: 17 Mar 2003 09:19:14 -0700
Subject: [parisc-linux] /lib/ld.so.1 (glibc) issues on 2.5 kernel??
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

Got a wierd glibc/kernel problem...

This all started by simply trying to run the ltp tests on the linux 2.5
kernel.  

The ltp tests run the ldd command, which we tracked down to this
final command: /lib/ld.so.1 --verify /bin/sh

Note: The --verify /bin/sh is irrelevant for the purpose of these
errors, /lib/ld.so.1 displays this problem w/o any additional
arguments.  


Linux vega 2.5.64-pa5 #3 Sun Mar 16 23:44:38 MST 2003 parisc unknown
unknown GNU/Linux
rbrad@vega:~$ /lib/ld.so.1 --verify /bin/sh
Inconsistency detected by ld.so: rtld.c: 879: dl_main: Assertion
`_rtld_local._dl_rtld_map.l_libname' failed!
rbrad@vega:~$

With the same system, but running the 2.4 kernel .... everything
seems to work fine.

rbrad@vega:~$ uname -a
Linux vega 2.4.20-pa28 #1 Sun Mar 16 10:13:17 MST 2003 parisc unknown
unknown GNU/Linux
rbrad@vega:~$ /lib/ld.so.1 --verify /bin/sh
rbrad@vega:~$


This box is running a 32-bit kernel and is running almost TOB unstable.

Installed libc6 is:
ii  libc6          2.3.1-14       GNU C Library: Shared libraries and
Timezone

Installed bash is:
ii  bash           2.05b-7        The GNU Bourne Again SHell


What is _really_ strange is that the system works ... even even though
/lib/ld.so.1 is throwing that assert.  I did not notice this
error until trying to run the ltp tests.

Any thoughts?

Thanks,

- Ryan

-- 
Ryan Bradetich <rbradetich@uswest.net>
