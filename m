Received: from cosrel1.hp.com (cosrel1.hp.com [156.153.255.170])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id BAA10020
	for <parisc-linux@puffin.external.hp.com>; Thu, 23 Nov 2000 01:28:57 -0700
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by cosrel1.hp.com (Postfix) with ESMTP id CBB186BC
	for <parisc-linux@puffin.external.hp.com>; Thu, 23 Nov 2000 01:31:25 -0700 (MST)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.3 SMKit7.0) id BAA07840 for parisc-linux@puffin.external.hp.com; Thu, 23 Nov 2000 01:29:55 -0700 (MST)
Date: Thu, 23 Nov 2000 01:29:55 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200011230829.BAA07840@udlkern.fc.hp.com>
To: parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] CONFIG_DMB_TRAP diff
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Alan Modra wrote:
>
> gdb will eventually want to use this trap too.
>

Cool! However, data memory break traps for user translations are a little
tougher. There are some small modifications in the machine dependent code
that I can make to make sure the B bit stays set during most VM operations
on a page. However, since the machine independent part of the VM system
doesn't know anything about this bit (nor should it), it won't be preserved
if the page is paged out (and subsequently paged back in). This could
be fixed fairly easily with some changes to the machine independent code,
but I don't think that would be appropriate.

Some potential solutions (each has its problems):

1) Just document the fact that the feature may not work on systems with
low memory. It's a parisc only feature, so perhaps we could live with that.

2) Lock the page in memory (using the mlock interface) when we set the B
bit on a page.


Just some thoughts on the subject.

John Marvin
jsm@fc.hp.com
