Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA25164
	for <parisc-linux@puffin.external.hp.com>; Fri, 27 Oct 2000 08:45:27 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 27 Oct 2000 14:47:01 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id BAA22941;
	Sat, 28 Oct 2000 01:46:55 +1100
Date: Sat, 28 Oct 2000 01:46:55 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Grant Grundler <grundler@cup.hp.com>
cc: parisc-linux@thepuffingroup.com, Drepper@milano.cup.hp.com,
        Ulrich@milano.cup.hp.com
Subject: Re: [parisc-linux] __FUNCTION__ revisited
In-Reply-To: <Pine.LNX.4.21.0010280103510.20748-100000@front.linuxcare.com.au>
Message-ID: <Pine.LNX.4.21.0010280140190.20748-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Sat, 28 Oct 2000, Alan Modra wrote:

> shows that __FUNCTION__ is being translated as an empty string.  The
> really weird bit is that if you remove "#include <stdio.h>", everything is
> OK!

Seems to be related to the swag of __inline functions you get from
bits/stdio.h.  Editting a .i to remove them cures the problem.  Gack, yet
another compiler bug - in yesterday's hppa64-hpux CVS gcc from sourceware
too.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
