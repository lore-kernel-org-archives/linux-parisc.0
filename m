Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: parisc-linux@lists.parisc-linux.org
Message-Id: <20020624150031.4DA034837@dsl2.external.hp.com>
Date: Mon, 24 Jun 2002 09:00:31 -0600 (MDT)
From: grundler@dsl2.external.hp.com (Grant Grundler)
Subject: [parisc-linux] sys/io.h
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

Hi,
I'm trying to build tulip-diag.c from scyld.com and am getting the
following error msg:
gsyprf11:~# gcc -O tulip-diag.c -o tulip-diag
tulip-diag.c:58:20: sys/io.h: No such file or directory
tulip-diag.c:1347:24: warning: multi-line string literals are deprecated

On ia64, sys/io.h comes from
gsyprf3:~# dpkg -S sys/io.h
libc6.1-dev: /usr/include/sys/io.h

But we don't have the equivalent for parisc (hppa).
Ideas?

thanks,
grant
