Received: from the-village.bc.nu (lightning.swansea.linux.org.uk [194.168.151.1])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id GAA20641
	for <parisc-linux@puffin.external.hp.com>; Sun, 3 Dec 2000 06:14:35 -0700
Subject: Re: [parisc-linux] 64-bit build broken
To: grundler@cup.hp.com (Grant Grundler)
Date: Sun, 3 Dec 2000 13:07:22 +0000 (GMT)
Cc: parisc-linux@puffin.external.hp.com
In-Reply-To: <200012030904.BAA02744@milano.cup.hp.com> from "Grant Grundler" at Dec 03, 2000 01:04:08 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E142YrT-0002i5-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> This could be related to willy's changes - I have no idea.

Yeah there was a bogus unused file called hardware_proc.o. Looks like we 
forgot to take it out of the 64bit Makefile. Just lose it from there
