Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id D73E04A1C
	for <parisc-linux@lists.parisc-linux.org>; Wed,  7 Feb 2001 16:14:05 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id KAA19688;
	Thu, 8 Feb 2001 10:08:04 +1100
Date: Thu, 8 Feb 2001 10:08:03 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Christoph Plattner <christoph.plattner@alcatel.at>
Cc: Richard Hirst <rhirst@linuxcare.com>,
	Grant Grundler <grundler@cup.hp.com>,
	"M. Grabert" <xam@deathsdoor.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] //strace// Generic Parisc Linux Kernel Questions
 &  9000/730 success report
In-Reply-To: <3A81005D.393A0AA6@alcatel.at>
Message-ID: <Pine.LNX.4.21.0102080959100.7974-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 7 Feb 2001, Christoph Plattner wrote:

> I was definitly not able to build strace with the current tool chain
> (I have built myself from Jan 13, 2001). The system calls and other
> parts seem not to be compatible any more....

Did you build glibc too?  I should own up to breaking our CVS glibc with

revision 1.3
date: 2001/01/16 14:09:38

and not fixing it until

revision 1.4
date: 2001/02/05 14:58:22

Alan (Embarrassed) Modra
-- 
Linuxcare.  Support for the Revolution.
