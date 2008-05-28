From: Kyle McMartin <kyle@mcmartin.ca>
Subject: [bug] gcc-4.[23] miscompiling causing networking to bugger up
Date: Wed, 28 May 2008 15:09:46 -0400
Message-ID: <20080528190946.GA30501@phobos.i.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

So I've narrowed the regression down to a miscompilation (presumably) of
net/ipv4/ip_output.o, in the sense that

	cp linux-2.6-gcc34/net/ipv4/ip_output.o
		linux-2.6-gcc43/net/ipv4/ip_output.o
	touch linux-2.6-gcc43/net/ipv4/ip_output.o
	make vmlinux

fixes the issue.

Unfortunately, the file is basically entirely different when
objdump'd...

The generated assembly is not much more help either.

I'm going to try again with gcc 4.1 & 4.2, and hope they're similar
enough that they generate closer assembly fragments...

but, getting closer to a fix, I hope.
