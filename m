Received: from cosrel2.hp.com (cosrel2.hp.com [156.153.255.162])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id CAA10760
	for <parisc-linux@puffin.external.hp.com>; Sat, 27 Jan 2001 02:46:04 -0700
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by cosrel2.hp.com (Postfix) with ESMTP id 8B5CE1AB
	for <parisc-linux@puffin.external.hp.com>; Sat, 27 Jan 2001 02:49:53 -0700 (MST)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.3 SMKit7.0) id CAA00365 for parisc-linux@puffin.external.hp.com; Sat, 27 Jan 2001 02:48:49 -0700 (MST)
Date: Sat, 27 Jan 2001 02:48:49 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200101270948.CAA00365@udlkern.fc.hp.com>
To: parisc-linux@puffin.external.hp.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Usage of __attribute__?
List-ID: <linux-parisc.vger.kernel.org>


As part of my effort to fix the alignment problems in libpthread, I am
creating a type with the aligned attribute. However, I discovered
something strange, which I don't know if it is a bug, or is the expected
behaviour (i.e. I am doing something wrong/don't understand how
__attribute__ works).

If I directly declare the type as follows:

    typedef int _lt_spinlock_t __attribute__((aligned(16)));

then EVERY int that follows has the aligned 16 attribute, e.g. just
declaring "int tmp;" gives tmp a 16 byte alignment. So, is that what
you would expect from my above declaration?

I worked around the problem by declaring the type in two steps:

    typedef int _spin16;
    typedef _spin16 _lt_spinlock_t __attribute__((aligned(16)));

Is there a way of combining the above two into one declaration,
without having the undesired side effect of making every int
aligned to a 16 byte boundary?

John Marvin
jsm@fc.hp.com
