Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id DAA29424
	for <parisc-linux@puffin.external.hp.com>; Fri, 15 Dec 2000 03:10:32 -0700
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel2.hp.com (Postfix) with ESMTP id 7112D1E1
	for <parisc-linux@puffin.external.hp.com>; Fri, 15 Dec 2000 05:13:23 -0500 (EST)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.3 SMKit7.0) id DAA05988 for parisc-linux@puffin.external.hp.com; Fri, 15 Dec 2000 03:12:09 -0700 (MST)
Date: Fri, 15 Dec 2000 03:12:09 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200012151012.DAA05988@udlkern.fc.hp.com>
To: parisc-linux@puffin.external.hp.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] ldcw in __pthread_acquire
List-ID: <linux-parisc.vger.kernel.org>


I just ran into an unaligned data reference in user land.  The problem is
that the routine __pthread_acquire (in libpthread) does a ldcw, but it is
not ensuring that the address it is operating on is 16 byte aligned (it is
operating on the address that was passed in as the first argument).  Some
processors don't require the 16 byte alignment, but many do.

I haven't looked at the source (I just found the location by disassembly),
so I don't know what the root cause is.  The actual ldcw is probably from
an inlined function or macro, e.g. spin_lock().  My first guess would be
that it is using the machine dependent spin_lock macro, but the procedure
which called __pthread_acquire is passing in a structure whose lock field
does not have the aligned(16) attribute.

I don't have time to look at this right now.  Any volunteers?

John Marvin
jsm@fc.hp.com
