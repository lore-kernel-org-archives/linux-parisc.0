Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id VAA08885
	for <parisc-linux@puffin.external.hp.com>; Sat, 19 Aug 2000 21:07:47 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 20 Aug 2000 03:07:34 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id NAA26705;
	Sun, 20 Aug 2000 13:07:13 +1000
Date: Sun, 20 Aug 2000 13:07:13 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: David Huggins-Daines <dhd@linuxcare.com>
cc: parisc-linux@thepuffingroup.com, parisc@lists.linuxcare.com
Subject: Re: Incompatibility of PIC and non-PIC
In-Reply-To: <87r97kzzbe.fsf@linuxcare.com>
Message-ID: <Pine.LNX.4.21.0008201303120.26467-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On 19 Aug 2000, David Huggins-Daines wrote:

> This chunk needs to also check for undefined symbols, it seems.
> Here's a better one:

cvs update.  I think I've done things properly this time, although you'll
no doubt find some silly bugs left when you actually run code on real
hardware.

BTW, Adding "-p" to your diff options would be a good idea.

Regards, Alan
-- 
Linuxcare.  Support for the Revolution.
