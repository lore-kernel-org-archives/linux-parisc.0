Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id UAA05184
	for <parisc-linux@puffin.external.hp.com>; Wed, 29 Nov 2000 20:39:43 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 30 Nov 2000 03:42:09 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id OAA14336;
	Thu, 30 Nov 2000 14:41:48 +1100
Date: Thu, 30 Nov 2000 14:41:48 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] XFree status
In-Reply-To: <E141Jcg-0006je-00@the-village.bc.nu>
Message-ID: <Pine.LNX.4.21.0011301412580.5672-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 30 Nov 2000, Alan Cox wrote:

> Also is this bad ?
> 
> /usr/bin/ld: lbxdix.o(.text+0x6fc): fixing R_PARISC_DPREL21L

No.

It's a symptom of a variable's "constness" being declared differently from
the way the variable is defined.  For instance, referring to "extern int foo"
in one object with foo defined as "const int foo" in another.  I'll be
removing the linker warning at some stage.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
