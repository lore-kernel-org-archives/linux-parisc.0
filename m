Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel10.hp.com (palrel10.hp.com [156.153.255.245])
	by dsl2.external.hp.com (Postfix) with ESMTP id 215C4482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 21 May 2002 15:11:43 -0600 (MDT)
Received: from xparelay2.corp.hp.com (xparelay2.corp.hp.com [15.58.137.112])
	by palrel10.hp.com (Postfix) with ESMTP id 0A350C00161
	for <parisc-linux@lists.parisc-linux.org>; Tue, 21 May 2002 14:11:42 -0700 (PDT)
Received: from xpabh1.corp.hp.com (xpabh1.corp.hp.com [15.58.136.191])
	by xparelay2.corp.hp.com (Postfix) with ESMTP id 8295498
	for <parisc-linux@lists.parisc-linux.org>; Tue, 21 May 2002 14:11:37 -0700 (PDT)
Message-ID: <F341E03C8ED6D311805E00902761278C0CD12BEF@xfc04.fc.hp.com>
From: "EVERSON,SETH (HP-Loveland,ex1)" <seth_everson2@hp.com>
To: parisc-linux@lists.parisc-linux.org
Date: Tue, 21 May 2002 14:08:30 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] Sucky I/O IDE Support?
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

Everyone -

There have been a few iterations of kernel hacking since the release notes
for the .93 release,
and I was wondering if anyone has done any work on getting the IDE support
for Sucky I/O going?

I did see a script in CVS that created the special files for IDE, and it
could actually read
CD's on the IDE CD-ROM in my C3600, but sustained transfers always resulted
in an error.

Thanks!

-Seth
