Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA23652
	for <parisc-linux@puffin.external.hp.com>; Fri, 22 Sep 2000 19:44:48 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 23 Sep 2000 01:45:27 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id MAA00448;
	Sat, 23 Sep 2000 12:40:37 +1100
Date: Sat, 23 Sep 2000 12:40:37 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Grant Grundler <grundler@cup.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] internal error in tc-hppa.c? 
In-Reply-To: <200009221900.MAA14390@milano.cup.hp.com>
Message-ID: <Pine.LNX.4.21.0009231204130.31535-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Fri, 22 Sep 2000, Grant Grundler wrote:

> Could someone who has a clue about tc-hppa.c improve the
> error reporting for this case?
> I'm certain we are going to see this again...

OK, it's fairly easy to make gas report symbols associated with fixups
that it doesn't understand.  I'll look at it in a few hours - I'm off to
pick up a new car :)

This sort of bug is due to gas originally being written just to process
gcc output.  ie. gas lays no claim to being a general purpose assembler.
x86 gas had the same sort of behaviour a few years ago, and you might be
surprised to know I met with some resistance to making x86 gas more
general purpose.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
