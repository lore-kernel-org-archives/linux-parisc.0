Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from the-village.bc.nu (router-100M.swansea.linux.org.uk [194.168.151.17])
	by dsl2.external.hp.com (Postfix) with ESMTP id BC404482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 30 Apr 2001 11:02:00 -0600 (MDT)
Subject: Re: [parisc-linux] Keyboard driver patch proposal
To: andrew@neep.com.au (Andrew Shugg)
Date: Mon, 30 Apr 2001 18:02:31 +0100 (BST)
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20010430102520.D15328@neep.com.au> from "Andrew Shugg" at Apr 30, 2001 10:25:27 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E14uH4E-0008I2-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> Grant Grundler said:
> > BTW, I'm told the '//' comment style is not ok;  "/* ... */" is expected.
> > It's not mentioned in Documentation/CodingStyle so I can't explain it.
> 
> Not all C compilers like C++ comments.  =(  It should be in the
> CodingStyle document.

All compilers suitable for 2.4 building support //. It not the preferred kernel
style but now days its accepted. Its also valid ISO C now (which has a nasty
side effect as it can change the result of a program 8))

	x = 2//**/
		-4;


Alan
