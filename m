Return-Path: <dave@hiauly1.hia.nrc.ca>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3A3E548A3
	for <parisc-linux@lists.parisc-linux.org>;
	Mon,  5 Jan 2004 11:49:00 -0700 (MST)
Message-Id: <200401051848.i05Imt6p005065@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [Status] hppa's userspace in 2004 (looking back)
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Date: Mon, 5 Jan 2004 13:48:54 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <20040105172146.GE23782@systemhalted> from "Carlos O'Donell" at
	Jan 5, 2004 12:21:46 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> ======
> GNU/cc
> ======
> 
> jda, you're the best person to talk about how gcc is doing. I can build
> kernels with 3.3.3, sadly with the anon cvs down it's messed up my usual
> workflow when it comes to testing.

The PA backend is in fairly reasonable shape.  Most of the remaining
PA bugs are limitations in the current implementation.  We are still
restricted in distance for floating point and branch on bit.  Frame
sizes on hppa64 are limited to < 2**36 bytes.  There is a bug which
causes arguments in const functions to get optimized away.  There is
a bug which affects constant elimination.  On the 64-bit port, constants
don't appear to be substituted/combined properly with if_then_else
insns.  As a result, some if statements don't get simplified.

2004 Projects:

1) Squash remaining bugs and limitations.
2) Finish libffi port.
3) Add PA specific stuff for java.
4) Develop TLS specification and GCC support.
5) Allow small range of floating point registers to be used
   for integer multiplication in kernel.  This should help
   64-bit kernel.
6) Thread support for ada.

As usual, I expect there will be many ups and downs in the process.
So, we won't get as far as we would like.

> jda, you mentioned that the libstdc++ testsuite could be examined in
> order to fix some of our failures.

Yes, these need to be looked at before 3.4 is released.  Some appear
to be related to long double support.  Just guessing, but I think the
rest are locale or glibc related.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
