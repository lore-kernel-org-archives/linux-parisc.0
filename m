Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel7.hp.com (atlrel7.hp.com [156.153.255.213])
	by dsl2.external.hp.com (Postfix) with ESMTP id CCAE04829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 28 Oct 2002 17:12:06 -0700 (MST)
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel7.hp.com (Postfix) with ESMTP id 8DF2380522F
	for <parisc-linux@lists.parisc-linux.org>; Mon, 28 Oct 2002 19:12:03 -0500 (EST)
Received: (from jsm@localhost)
	by udlkern.fc.hp.com (8.9.3 (PHNE_18979)/8.9.3 SMKit7.01) id RAA27628
	for parisc-linux@lists.parisc-linux.org; Mon, 28 Oct 2002 17:12:03 -0700 (MST)
Date: Mon, 28 Oct 2002 17:12:03 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200210290012.RAA27628@udlkern.fc.hp.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.19-pa24 (uaccess.h patch)
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

>
> ex_table is used for recovering from a page fault.  i don't see how we
> can take a page fault when copying to kernel ram.
>

Let's wait on removing this support.  This mechanism provides a way of
testing whether or not an address is a valid kernel address (in addition
to range checking the address).  I'd like to consider implementing the
virtual mem map support (currently implemented on ia64) on parisc as an
alternative mechanism (to willy's idea of using kmap/kunmap) for getting
back the 256Mb of memory we currently ignore for Astro based machines with
more than 3.75 Gb of memory.  The virtual mem map code uses this exact
mechanism to determine whether or not a struct page pointer is pointing
into a sparse (unallocated) region of the virtual mem map array (i.e. on
ia64 the ia64_page_valid() routine does a get_user on the first byte and
checks the return from get_user to see if it fails/succeeds).

John
