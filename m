Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel7.hp.com (atlrel7.hp.com [156.153.255.213])
	by dsl2.external.hp.com (Postfix) with ESMTP id 211B54839
	for <parisc-linux@lists.parisc-linux.org>; Tue, 22 Oct 2002 09:35:02 -0600 (MDT)
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel7.hp.com (Postfix) with ESMTP id 02101805163
	for <parisc-linux@lists.parisc-linux.org>; Tue, 22 Oct 2002 11:34:55 -0400 (EDT)
Received: (from jsm@localhost)
	by udlkern.fc.hp.com (8.9.3 (PHNE_18979)/8.9.3 SMKit7.01) id JAA28679
	for parisc-linux@lists.parisc-linux.org; Tue, 22 Oct 2002 09:34:55 -0600 (MDT)
Date: Tue, 22 Oct 2002 09:34:55 -0600 (MDT)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200210221534.JAA28679@udlkern.fc.hp.com>
To: parisc-linux@lists.parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Re: EWOULDBLOCK vs. EAGAIN
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

OK, I should have checked the archives first. It looks like this issue
has already come up. In that case we fixed the app. But I'm not comfortable
with the fact that we are different from every other architecture here.

Yes, to be completely portable across other Unix flavors, you should
check for both EAGAIN and EWOULDBLOCK. But it would appear that
Gnu C library documentation says they should be the same, and they
ARE the same on all other Linux architectures. So, in my opinion,
we are broken, not the apps.

John

P.S. I know most of you don't care, but the broken app in this case is
telnetd. It drops connections if you blast too much to stdout.
