Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id PAA02045
	for <parisc-linux@puffin.external.hp.com>; Sun, 28 Jan 2001 15:43:13 -0700
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id JAA15215;
	Mon, 29 Jan 2001 09:45:23 +1100
Date: Mon, 29 Jan 2001 09:45:22 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: John Marvin <jsm@udlkern.fc.hp.com>
cc: parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] Usage of __attribute__?
In-Reply-To: <200101282158.OAA09549@udlkern.fc.hp.com>
Message-ID: <Pine.LNX.4.21.0101290940400.24446-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Sun, 28 Jan 2001, John Marvin wrote:

> OK, I was just writing a test case on my pc and hadn't bothered to test it
> on hppa. The compiler on my PC was version 2.95.2. The problem doesn't
> exist on my native hppa gcc, which is version 2.96. So, although it is

That's good :-)  2.95.2 has other problems with alignment too, if my
faulty memory is correct.  It doesn't propagate the maximum alignment of
fields within a struct to the struct itself, or something like that.

-- 
Linuxcare.  Support for the Revolution.
