Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id FAA17140
	for <parisc-linux@puffin.external.hp.com>; Sun, 12 Nov 2000 05:06:58 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 12 Nov 2000 12:08:57 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id XAA22592;
	Sun, 12 Nov 2000 23:08:38 +1100
Date: Sun, 12 Nov 2000 23:08:35 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Randolph Chung <randolph@tausq.org>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] glibc question
In-Reply-To: <20001111170429.A29140@tausq.org>
Message-ID: <Pine.LNX.4.21.0011122302590.21707-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Sat, 11 Nov 2000, Randolph Chung wrote:

> I'm working with bdale and taggart to try to get the Debian glibc
> package to compile under hppa. One of the things I saw today while
> playing with this is that the build dies because it tries to link in
> bsd-setjmp.c and bsd-_setjmp.c, which both define setjmp. Can someone
> enlighten me about why this may be happening?

I think bsd-_setjmp.c should define _setjmp, not setjmp.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
