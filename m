Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id HAA18099
	for <parisc-linux@puffin.external.hp.com>; Thu, 18 May 2000 07:19:36 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 18 May 2000 13:19:42 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id XAA13283;
	Thu, 18 May 2000 23:19:31 +1000
Date: Thu, 18 May 2000 23:19:31 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Philipp Rumpf <prumpf@puffin.external.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] New binutils available from cvs
In-Reply-To: <20000518064806.A17788@puffin.external.hp.com>
Message-ID: <Pine.LNX.4.21.0005182256370.13052-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 18 May 2000, Philipp Rumpf wrote:

> > I'm talking about floating point compare instruction conditions, for
> > example: "fcmp,dbl,!?>= %fr4,%fr5"
> 
> Oh, I see.  (I stupidly only checked the condition codes tables in the
> architecture manual, the floating point conditions were in the FPU
> section).
> 
> So, '!' isn't usable as either line comment or '\n'-equivalent
> character without hacking.  Let's just not use it ?

It works quite OK as a line separator.  The assembler line separator is
not a '\n' equivalent.

-- 
Linuxcare.  Support for the Revolution.
