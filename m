Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from almso1.proxy.att.com (almso1.att.com [192.128.167.69])
	by dsl2.external.hp.com (Postfix) with ESMTP id A4922482C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 12 Nov 2001 15:18:09 -0700 (MST)
Received: from gab200r1.ems.att.com ([135.37.94.32])
	by almso1.proxy.att.com (AT&T IPNS/MSO-3.0) with ESMTP id fACMHxC29861
	for <parisc-linux@lists.parisc-linux.org>; Mon, 12 Nov 2001 17:17:59 -0500 (EST)
Message-ID: <5360C45FAB301541AEB3C6A45A6B6A0270684F@ocst09.ugd.att.com>
From: "Griffin, Aubrey, BMCIO" <aubreygriffin@att.com>
To: "'Parisc-linux Mailing List'" <parisc-linux@lists.parisc-linux.org>
Date: Mon, 12 Nov 2001 17:16:37 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] Problem compiling GDB
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

All,

I am trying to compile GDB.

I downloaded gdb-20011024 from http://ftp.parisc-linux.org/cvs/

The compilation of gdb failed. There is an undefined constant PT_CR30. This
is used in
gdb/pa-linux-nat.c and gdb/gdb/gdbserver/low-linux.c.

Some PT_ constants are defined in /usr/include/asm/offset.h, but not
PT_CR30.

Should this gdb bundle compile?

Is there another gdb package that compiles on this platform?

All help is appreciated.

Thanks in advance,
Aubrey Griffin
