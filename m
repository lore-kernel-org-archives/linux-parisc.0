Received: from palrel3.hp.com (palrel3.hp.com [156.153.255.226])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id XAA11874
	for <parisc-linux@puffin.external.hp.com>; Tue, 9 Jan 2001 23:29:31 -0700
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by palrel3.hp.com (Postfix) with ESMTP id 4320B74B
	for <parisc-linux@puffin.external.hp.com>; Tue,  9 Jan 2001 22:33:03 -0800 (PST)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.3 SMKit7.0) id XAA16714 for parisc-linux@puffin.external.hp.com; Tue, 9 Jan 2001 23:31:49 -0700 (MST)
Date: Tue, 9 Jan 2001 23:31:49 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200101100631.XAA16714@udlkern.fc.hp.com>
To: parisc-linux@puffin.external.hp.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Gnu cpp bug or feature?
List-ID: <linux-parisc.vger.kernel.org>


I just discovered that the gnu cpp doesn't allow * and = to be concatenated.
What I am trying to do is the following:

#ifdef __LP64__
#define ADDIB addib,*
#else
#define ADDIB addib,
#endif

I then would use the above defines throughout some assembly functions, e.g.:

    ADDIB>      -1,%r1,1b
    ADDIB=      -1,%arg3,fdoneloop

If __LP64__ is defined, the above two examples wind up expanding to:

    addib,*>    -1,%r1,1b
    addib,* =   -1,%arg3,fdoneloop

The first example expands as I would expect, but the second example winds
up being a syntax error, because it should have been expanded to:

    addib,*=    -1,%arg3,fdoneloop

Anyway, I prefer to write the code this way rather than sprinkling
#ifdef __LP64__'s throughout the code, or using two different copies
of the functions. I imagine that gnu cpp must be trying to avoid
creating the C *= operator by mistake, but I don't believe there is
any standard that requires this. I know that the above examples work
on HP-UX (not that HP-UX sets the standard).

It just seems strange to me for gnu cpp to special case this particular
sequence.  Is there a good reason for this behaviour, or is this a bug?

John Marvin
jsm@fc.hp.com
