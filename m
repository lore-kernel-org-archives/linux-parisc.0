Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.riverrock.org (rrc.dsl.frii.net [216.17.137.11])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0B52F485E
	for <parisc-linux@parisc-linux.org>; Tue,  2 Oct 2001 08:32:55 -0600 (MDT)
Received: from bame.riverrock.org (bame.riverrock.org [199.254.238.240])
	by www.riverrock.org (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id IAA29398
	for <parisc-linux@parisc-linux.org>; Tue, 2 Oct 2001 08:32:54 -0600
Received: from riverrock.org (really [127.0.0.1]) by bame.riverrock.org
	via smail with esmtp
	id <m15oQbN-000P0fC@bame.riverrock.org> (Debian Smail3.2.0.111)
	for <parisc-linux@parisc-linux.org>; Tue, 2 Oct 2001 08:32:53 -0600 (MDT)
Message-Id: <m15oQbN-000P0fC@bame.riverrock.org>
To: parisc-linux@parisc-linux.org
Date: Tue, 02 Oct 2001 08:32:53 -0600
From: Paul Bame <bame@riverrock.org>
Subject: [parisc-linux] Bug#114145: palo: 1- why on i386?; 2- postinst errors (fwd)
List-ID: <linux-parisc.vger.kernel.org>

Anyone want to handle this packaging-related palo problem?  The x86
package is so we can build debian CDs if I remember correctly.

	-P

------- Forwarded Message

Subject: Bug#114145: palo: 1- why on i386?; 2- postinst errors
Reply-To: Lazarus Long <lazarus@overdue.dhis.net>, 114145@bugs.debian.org
From: Lazarus Long <lazarus@overdue.dhis.net>
To: submit@bugs.debian.org
Message-Id: <20011002002132.263457300D@phoenix.overdue.net>
Date: Tue,  2 Oct 2001 00:21:32 +0000 (UTC)

Package: palo
Version: N/A
Severity: important

First problem:
Why would this package be automatically installed on i386 systems?

 Description: Linux boot loader for parisc/hppa
  This package contains the parisc boot loader itself, plus palo which
  is the boot media management tool as lilo is for i386.

This seems inappropriate to be installed on i386, yet it was automatically
chosen for such.



Second problem:
Postinst errors:

Setting up palo (0.94) ...
cannot open dhelp file '/usr/share/doc/palo/html/.dhelp': at /usr/sbin/install-docs line 559.
dpkg: error processing palo (--configure):
 subprocess post-installation script returned error exit status 2
Errors were encountered while processing:
 palo
E: Sub-process /usr/bin/dpkg returned an error code (1)


- -- System Information
Debian Release: post-2.2
Kernel Version: Linux phoenix 2.4.5 #1 Sun May 27 00:48:35 UTC 2001 i586 unknown

------- End of Forwarded Message
