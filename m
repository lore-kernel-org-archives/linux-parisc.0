Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [156.153.255.205])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0D8724829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 22 Oct 2002 09:24:28 -0600 (MDT)
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel6.hp.com (Postfix) with ESMTP id E71386E6
	for <parisc-linux@lists.parisc-linux.org>; Tue, 22 Oct 2002 11:24:24 -0400 (EDT)
Received: (from jsm@localhost)
	by udlkern.fc.hp.com (8.9.3 (PHNE_18979)/8.9.3 SMKit7.01) id JAA28153
	for parisc-linux@lists.parisc-linux.org; Tue, 22 Oct 2002 09:24:24 -0600 (MDT)
Date: Tue, 22 Oct 2002 09:24:24 -0600 (MDT)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200210221524.JAA28153@udlkern.fc.hp.com>
To: parisc-linux@lists.parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] EWOULDBLOCK vs. EAGAIN
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

I found a bug last night where a program was expecting EWOULDBLOCK, but
we were returning EAGAIN. The kernel returns EAGAIN, which is correct.
However, the Gnu C library says that EWOULDBLOCK should be defined as the
same thing. We didn't do that on parisc linux. Probably because we
borrowed our errno's from HP-UX. But that is wrong.

So, how should we fix this?  I don't think we can avoid breaking binary
compatibility.  The problem is that the kernel returns EWOULDBLOCK in some
cases (I've enclosed a list of files that might affect us below, file
locking and usb being the ones that are most likely to affect us).

I think we should change errno.h to define EWOULDBLOCK as EAGAIN. That
will fix some programs once they are recompiled. Of course, it will
break some others, but they will also be fixed once again once they
are recompiled.

How hard would it be to grep the source of all debian packages, so we
can find which packages should be rebuilt?

John
