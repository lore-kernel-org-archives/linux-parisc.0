Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel8.hp.com (atlrel8.hp.com [156.153.255.206])
	by dsl2.external.hp.com (Postfix) with ESMTP id BAE0B482D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Feb 2003 01:38:21 -0700 (MST)
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel8.hp.com (Postfix) with ESMTP id 313241C00E15
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Feb 2003 03:38:21 -0500 (EST)
Received: (from jsm@localhost)
	by udlkern.fc.hp.com (8.9.3 (PHNE_25184)/8.9.3 SMKit7.01) id BAA07327
	for parisc-linux@lists.parisc-linux.org; Mon, 10 Feb 2003 01:38:20 -0700 (MST)
Date: Mon, 10 Feb 2003 01:38:20 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200302100838.BAA07327@udlkern.fc.hp.com>
To: parisc-linux@lists.parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux grundler
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

> 2.4.20-pa24 PA20 memory ordering
> Kudos to John David Anglin and Carlos O'Donnell for realizing
> PA 2.0 is not strongly ordered like PA1.x is.
> Read appendix G or PA-RISC 2.0 Architecture (Gerry Kane) for
> details on "Memory Ordering Model".

Sorry, this is wrong.  I'm afraid you are wasting your time with all of
these code changes.

The problem is that the Kane book defines the architecture, i.e. it
defines what can be done, not what has been done.  Of course, to know what
has been done you have to read the various processor ERS's, and I'm not
sure we've made any of the PA2.0 chip ERS's available.

Anyway, no PA2.0 processor has implemented the PSW O bit, TLB O bit or
support for the ,o completers (they are just ignored).  All of the PA2.0
processors are strongly ordered, just like the PA1.x processors are.  I
can pretty much guarantee that no future PA processor is going to change
that fact.

John Marvin
jsm@fc.hp.com
