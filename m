Received: from palrel3.hp.com (palrel3.hp.com [156.153.255.226])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id HAA01296
	for <parisc-linux@puffin.external.hp.com>; Mon, 4 Dec 2000 07:07:42 -0700
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by palrel3.hp.com (Postfix) with ESMTP id ED9BC363
	for <parisc-linux@puffin.external.hp.com>; Mon,  4 Dec 2000 06:10:15 -0800 (PST)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.3 SMKit7.0) id HAA16995 for parisc-linux@puffin.external.hp.com; Mon, 4 Dec 2000 07:09:01 -0700 (MST)
Date: Mon, 4 Dec 2000 07:09:01 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200012041409.HAA16995@udlkern.fc.hp.com>
To: parisc-linux@puffin.external.hp.com
Subject: Re: pci changes
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

FYI, I couldn't remember where the other stack direction issues were, so
I looked them up. The places where expand_stack() is called in 
mm/memory.c and mm/mmap.c will probably need to be changed for parisc.

John Marvin
jsm@fc.hp.com
