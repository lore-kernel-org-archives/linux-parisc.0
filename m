Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id XAA19906
	for <parisc-linux@puffin.external.hp.com>; Mon, 4 Dec 2000 23:18:27 -0700
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id RAA30545;
	Tue, 5 Dec 2000 17:15:53 +1100
Date: Tue, 5 Dec 2000 17:15:53 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Grant Grundler <grundler@cup.hp.com>
cc: parisc-linux@puffin.external.hp.com, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] fault.c b0rken
In-Reply-To: <200012050231.SAA04167@milano.cup.hp.com>
Message-ID: <Pine.LNX.4.21.0012051714420.16721-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Mon, 4 Dec 2000, Grant Grundler wrote:

> fault.c: In function `do_page_fault':
> fault.c:137: warning: passing arg 3 of `find_vma_prev' from incompatible pointer type
> fault.c:181: incompatible types in assignment
> make[2]: *** [fault.o] Error 1
> make[2]: Leaving directory `/linux/pa32/linux/arch/parisc/mm'

I've added the missing `*'

-- 
Linuxcare.  Support for the Revolution.
