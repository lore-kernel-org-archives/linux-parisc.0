Received: from www.linux.org.uk (IDENT:root@parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id HAA22378
	for <parisc-linux@puffin.external.hp.com>; Sun, 3 Dec 2000 07:28:51 -0700
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 142ZlE-0003RK-00; Sun, 03 Dec 2000 14:05:00 +0000
Date: Sun, 3 Dec 2000 14:05:00 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Grant Grundler <grundler@cup.hp.com>, parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] 64-bit build broken
Message-ID: <20001203140500.A12912@parcelfarce.linux.theplanet.co.uk>
References: <200012030904.BAA02744@milano.cup.hp.com> <E142YrT-0002i5-00@the-village.bc.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E142YrT-0002i5-00@the-village.bc.nu>; from alan@lxorguk.ukuu.org.uk on Sun, Dec 03, 2000 at 01:07:22PM +0000
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Dec 03, 2000 at 01:07:22PM +0000, Alan Cox wrote:
> > This could be related to willy's changes - I have no idea.
> 
> Yeah there was a bogus unused file called hardware_proc.o. Looks like we 
> forgot to take it out of the 64bit Makefile. Just lose it from there

done.

-- 
Revolutions do not require corporate support.
