Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id FAA16573
	for <parisc-linux@puffin.external.hp.com>; Thu, 18 May 2000 05:09:23 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 18 May 2000 11:09:29 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id VAA11150;
	Thu, 18 May 2000 21:09:09 +1000
Date: Thu, 18 May 2000 21:09:09 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Philipp Rumpf <prumpf@puffin.external.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] New binutils available from cvs
In-Reply-To: <20000518045138.C14031@puffin.external.hp.com>
Message-ID: <Pine.LNX.4.21.0005182055320.6449-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 18 May 2000, Philipp Rumpf wrote:

> > Using `!' for comments
> > a) breaks fp condition codes.
> 
> No, it doesn't.  The condition code for fp "not equal" is "<>", not "!=".

I'm talking about floating point compare instruction conditions, for
example: "fcmp,dbl,!?>= %fr4,%fr5"

-- 
Linuxcare.  Support for the Revolution.
