Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hptux.heylan (pD9E4A8A7.dip.t-dialin.net [217.228.168.167])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0E0B94829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 20 Sep 2002 10:59:09 -0600 (MDT)
Date: Fri, 20 Sep 2002 18:59:03 +0200
From: Andreas Seltenreich <s_selten@informatik.uni-karlsruhe.de>
To: Petr Vandrovec <VANDROVE@vc.cvut.cz>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: partial success with matroxfb
Message-ID: <20020920165902.GC22068@gate450.dyndns.org>
References: <257F2C27A66@vcnet.vc.cvut.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <257F2C27A66@vcnet.vc.cvut.cz>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

* Petr Vandrovec <VANDROVE@vc.cvut.cz> [2002-09-20 18:12]:
> Can you verify (with lspci -xxx) that PCI dword register 0x40 in
> matroxfb
> configuration space has not set bit 8 (it is lowest bit in register
> 0x41). 0=>disable legacy VGA, 1=>enable legacy VGA. Old Millennium I
> always responded to framebuffer accesses, and it was fixed in
> Millennium II.
> I thought that it was fixed in Mystique too. You can fix it with
> setpci, if matroxfb gets it wrong.

apparently it is set:
40: 00 01 00 5f 00 00 00 00 ff ff ff ff 00 00 00 00

If I modporbe it without setting it, the bit keeps set:
40: 21 4f 09 df 00 3c 00 00 06 ff ff 06 00 00 00 00

after manually setting it to 0 and modprobing matroxfb it kept the zero:
40: 21 4e 09 df 00 3c 00 00 10 ff ff 10 00 00 00 00

but the crash still occured.

> Strange. Stalls it for 5 seconds here, or goes it through immediately?

I can't notice any delay when it passes the second time.

regards
andreas
