Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id E905C4841
	for <parisc-linux@lists.parisc-linux.org>; Thu,  6 Nov 2003 00:38:54 -0700 (MST)
Date: Thu, 6 Nov 2003 02:34:05 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Randolph Chung <tausq@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20031106073405.GC27772@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] touch fails on hppa because utimes is the devil.
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

r,

touch failing is all about the configure.

readelf -a src/touch | grep utime
00027600  00000581 R_PARISC_IPLT     00000000   utime + 0
     5: 00000000    76 FUNC    GLOBAL DEFAULT  UND utime@GLIBC_2.2 (2)
   123: 00000000    76 FUNC    GLOBAL DEFAULT  UND utime@@GLIBC_2.2
   203: 00014ca0    48 FUNC    GLOBAL DEFAULT   11 utimens

readelf -a /usr/bin/touch | grep utime
000274c0  00000581 R_PARISC_IPLT     00000000   utime + 0
00027500  00000e81 R_PARISC_IPLT     00000000   utimes + 0
     5: 00000000    68 FUNC    GLOBAL DEFAULT  UND utime@GLIBC_2.2 (2)
    14: 00000000   232 FUNC    GLOBAL DEFAULT  UND utimes@GLIBC_2.2 (2)

In the newly built touch we don't use "utimes"
So I dug a bit:

configure:27240: checking determine whether the utimes function works
configure:27282: hppa-linux-gcc -o conftest -g -DSYSLOG_SUCCESS
-DSYSLOG_FAILURE -DSYSLOG_NON_ROOT -O2   conftest.c  >&5
configure:27285: $? = 0
configure:27287: ./conftest
configure:27290: $? = 1
configure: program exited with status 1
configure: failed program was:
...
configure:27304: result: no

Sombody should sick themselves on this failure? Takers? :)

c.
