Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id KAA26937
	for <parisc-linux@puffin.external.hp.com>; Thu, 11 Nov 1999 10:32:28 -0700
To: Paul Bame <bame@debian.fc.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] _end symbol in parisc linux? 
Reply-To: law@cygnus.com
In-reply-to: Your message of Thu, 11 Nov 1999 09:14:38 MST.
             <199911111614.JAA19293@debian.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 11 Nov 1999 10:32:26 -0700
Message-ID: <9306.942341546@upchuck>
From: Jeffrey A Law <law@cygnus.com>
List-ID: <linux-parisc.vger.kernel.org>

  In message <199911111614.JAA19293@debian.fc.hp.com>you write:
  > Perhaps you'd be kind enough to write a scrap of assembly magic
  > which performs the subspace trick you mentioned earlier?  Yeah
  > it may be ugly and still language-system dependent, but without access
  > to the SOM header at boot time there's not a prettier option.

	.space $PRIVATE$
	.subspa $AFTERBSS$,QUAD=1,ALIGN=8,ACCESS=31,ZERO,SORT=83
_end:


Or something close to that.

What it does is create a new data section $AFTERBSS$ which has a sort key
greater than $BSS$ ($BSS$'s sort key is 82).  Within that section we define
one symbol "_end".

jeff
